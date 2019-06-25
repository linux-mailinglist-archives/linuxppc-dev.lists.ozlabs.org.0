Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8E54EDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 14:29:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y58B3NtbzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y55N2TC0zDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 22:27:17 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 9D66168B05; Tue, 25 Jun 2019 14:26:41 +0200 (CEST)
Date: Tue, 25 Jun 2019 14:26:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Greer <mgreer@animalcreek.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Dale Farnsworth <dale@farnsworth.org>
Subject: DMA coherency in drivers/tty/serial/mpsc.c
Message-ID: <20190625122641.GA4421@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.17 (2007-11-01)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paul, Dale and Mark (I hope this reaches the right Mark),

I've started auditing all users of DMA_ATTR_NON_CONSISTENT ot prepare
for major API improvements in that area.

One of the odd users is the mpsc ѕerial driver, which allocates DMA
memory with the above flag, and then actually properly calls
dma_cache_sync.  So far, so good.  But it turns out it also has
"#if defined(CONFIG_PPC32) && !defined(CONFIG_NOT_COHERENT_CACHE)"
ifdef blocks next to the dma_cache_sync calls that perform cache
maintainance for platforms that according to the ifdef claim to
be cache coherent.  According to the Kconfig the driver can
only build if the MV64X60 symbol is set, which is a ppc embedded 6xx
SOC, which appears to be configurable as either cache coherent, or
not.  But according to the code in the driver at least this device
always is not cache coherent.

It seems like we need to always mark that platform as potentially
not coherent, and then use the per-device flag to mark all device
except for this one as coherent.  Or did I miss anything?  Maybe
all this is actually dead code and can go away?


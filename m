Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8891F3A62
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 14:06:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h84H1ZzlzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 22:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h81m2ClVzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 22:04:42 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6E0DE68AFE; Tue,  9 Jun 2020 14:04:37 +0200 (CEST)
Date: Tue, 9 Jun 2020 14:04:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: ipr crashes due to NULL dma_need_drain since cc97923a5bcc
 ("block: move dma drain handling to scsi")
Message-ID: <20200609120437.GB2140@lst.de>
References: <87zh9cftj0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zh9cftj0.fsf@mpe.ellerman.id.au>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, brking@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 09, 2020 at 08:00:35PM +1000, Michael Ellerman wrote:
> Hi all,
> 
> I'm seeing crashes on powerpc with the ipr driver, which I'm fairly sure
> are due to dma_need_drain being NULL.

Ooops, my changes completely forgot about SAS attached ATAPI devices.
I'll cook up a fix in a bit.

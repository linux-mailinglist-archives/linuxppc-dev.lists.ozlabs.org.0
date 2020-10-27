Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD929A9BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 11:34:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CL7P5008kzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 21:34:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CL7MB6xTRzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 21:32:54 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B264A67373; Tue, 27 Oct 2020 09:36:47 +0100 (CET)
Date: Tue, 27 Oct 2020 09:36:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/2] powerpc/dma: Fallback to dma_ops when
 persistent memory present
Message-ID: <20201027083647.GA24318@lst.de>
References: <20201021032026.45030-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021032026.45030-1-aik@ozlabs.ru>
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
Cc: linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 21, 2020 at 02:20:24PM +1100, Alexey Kardashevskiy wrote:
> This allows mixing direct DMA (to/from RAM) and
> IOMMU (to/from apersistent memory) on the PPC64/pseries
> platform. This was supposed to be a single patch but
> unexpected move of direct DMA functions happened.
> 
> This is based on sha1
> 7cf726a59435 Linus Torvalds "Merge tag 'linux-kselftest-kunit-5.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest".
> 
> Please comment. Thanks.

I really don't like your revert.  I'm almost ready to kill of
dma-direct.h, and I really want it private in kernel/dma/, as people
keep adding abuses to drivers.

We have two options here:

 (1) duplicate the code in arch/powerpc/
 (2) add a hook to kernel/dma/

I've not been a fan of (2) in the past, but now that the code is out
of line, and we could make it dependent on a config option only set by
powerpc, I see it as the lesser evil now.

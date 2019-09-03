Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD5A69ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N7HM2rHhzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 23:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N7BX1KQrzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 23:30:59 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 571B8227A8A; Tue,  3 Sep 2019 15:30:51 +0200 (CEST)
Date: Tue, 3 Sep 2019 15:30:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] powerpc/powernv: fix a W=1 compilation warning
Message-ID: <20190903133051.GA23985@lst.de>
References: <1558541369-8263-1-git-send-email-cai@lca.pw>
 <1567517354.5576.45.camel@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567517354.5576.45.camel@lca.pw>
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 09:29:14AM -0400, Qian Cai wrote:
> I saw Christ start to remove npu-dma.c code [1]
> 
> [1] https://lore.kernel.org/linuxppc-dev/20190625145239.2759-4-hch@lst.de/
> 
> Should pnv_npu_dma_set_32() be removed too?
> 
> It was only called by pnv_npu_try_dma_set_bypass() but the later is not used
> anywhere in the kernel tree. If that is a case, I don't need to bother fixing
> the warning here.

Yes, pnv_npu_try_dma_set_bypass and pnv_npu_dma_set_32 should go away
as well as they are unused.  Do you want to send a patch or should I
prepare one?

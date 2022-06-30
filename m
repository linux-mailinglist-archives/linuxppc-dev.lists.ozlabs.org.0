Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276056193F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 13:31:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYblB0Z0Rz3drv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 21:31:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kflvoIVQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kflvoIVQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYbkc3z75z3blb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 21:31:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6D72AB82A2E;
	Thu, 30 Jun 2022 11:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9886C34115;
	Thu, 30 Jun 2022 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656588675;
	bh=3Qju4ra8mIgPc4sJgCZMUzFsVmDwFqohz+hKY9A/4fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kflvoIVQctbhBY/HIGks5hmJHXqhLRq+cE7jgcinVlokJLaaDw6jt7Ox7qyDQyTmV
	 9paBBZ94Bz2+gnrfuFnXPPhYP0owmvO1r3MAluX3f+HLsU4EZvnwWi9c1s5ofq/nf3
	 KlrC2dWkK98rY+3HDlNLBBbxdJZ5nSPx50byKuEY=
Date: Thu, 30 Jun 2022 13:31:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v5.18] powerpc/ftrace: Remove ftrace init tramp once
 kernel init is complete
Message-ID: <Yr2Je34UxKYTg6fC@kroah.com>
References: <20220627173930.133620-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220627173930.133620-3-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627173930.133620-3-naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 27, 2022 at 11:09:29PM +0530, Naveen N. Rao wrote:
> commit 84ade0a6655bee803d176525ef457175cbf4df22 upstream.
> 
> Stop using the ftrace trampoline for init section once kernel init is
> complete.
> 
> Fixes: 67361cf8071286 ("powerpc/ftrace: Handle large kernel configs")
> Cc: stable@vger.kernel.org # v4.20+
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/20220516071422.463738-1-naveen.n.rao@linux.vnet.ibm.com
> ---
>  arch/powerpc/include/asm/ftrace.h  |  4 +++-
>  arch/powerpc/kernel/trace/ftrace.c | 15 ++++++++++++---
>  arch/powerpc/mm/mem.c              |  2 ++
>  3 files changed, 17 insertions(+), 4 deletions(-)

All now queued up, thanks.

greg k-h

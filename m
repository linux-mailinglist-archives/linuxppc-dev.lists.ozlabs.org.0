Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEAA7CD8EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 12:15:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cfKz3ud3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9RYx0n0gz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 21:15:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cfKz3ud3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9RY20Q7mz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 21:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697624081;
	bh=LktSjS3vmBsejeAGSRajlqWTMErsGc7cXIChHwpvG88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cfKz3ud3bKFejTLx8Q3tfNH802VNJNHcs4R8ZouktGijeMuAEpdumsrCSv5sutEie
	 7ykNAuDfpc3TbMHjP+G7kmZdZ6b/qFxy/Byeoct5kOQ2mjI+JPu5Qz7hx+BLSpiu7U
	 29bk1pKTBbT4x/CTVblg9M987HuNoiuDTRQOKE8XU9JQ0mq9fSNEYDYqEXqEAt0ZsG
	 JiG0C9D6088Y1fEVJkMzljhFeuGKZJk0w/YVllB8ERqD5w3gCC4KzvjV5l2lN5s1cM
	 cO3jy8b6b8LrmPlStkYW/CLF4MyYpuqRwNlPcBv37cW2wIFsE7rJxc/ByHlEbmL2Mu
	 NXftgmsA0Dycw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9RXx0xcsz4wcf;
	Wed, 18 Oct 2023 21:14:41 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vas: Limit open window failure messages in log
 bufffer
In-Reply-To: <20231018044308.880705-1-haren@linux.ibm.com>
References: <20231018044308.880705-1-haren@linux.ibm.com>
Date: Wed, 18 Oct 2023 21:14:36 +1100
Message-ID: <87fs286xv7.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> The VAS open window call prints error message and returns -EBUSY
> after the migration suspend event initiated and until the resume
> event completed on the destination system. It can cause the log
> buffer filled with these error messages if the user space issues
> continuous open window calls.  Similar case even for DLPAR CPU
> remove event when no credits are available until the credits are
> freed or with the other DLPAR CPU add event.

This should probably have a Fixes: tag so it gets backported.

> So changes in the patch to use pr_err_ratelimited() instead of
> pr_err() to display open window failure and not-available credits
> error messages.
>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/book3s/vas-api.c | 4 ++--
>  arch/powerpc/platforms/pseries/vas.c    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
> index 77ea9335fd04..203cfc2fb8ff 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -311,8 +311,8 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
>  	txwin = cp_inst->coproc->vops->open_win(uattr.vas_id, uattr.flags,
>  						cp_inst->coproc->cop_type);
>  	if (IS_ERR(txwin)) {
> -		pr_err("%s() VAS window open failed, %ld\n", __func__,
> -				PTR_ERR(txwin));
> +		pr_err_ratelimited("%s() VAS window open failed, %ld\n",
> +				__func__, PTR_ERR(txwin));

Rather than using __func__ which is a bit over specific for a user
visible error, I'd prefer something like "vas: window open failed rc = %ld".

Probably vas-api.c should use pr_fmt so that all the messages have a
consistent prefix.

cheers

>  		return PTR_ERR(txwin);
>  	}
>  
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index b86f0db08e98..7259e6676503 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -341,7 +341,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>  
>  	if (atomic_inc_return(&cop_feat_caps->nr_used_credits) >
>  			atomic_read(&cop_feat_caps->nr_total_credits)) {
> -		pr_err("Credits are not available to allocate window\n");
> +		pr_err_ratelimited("Credits are not available to allocate window\n");
>  		rc = -EINVAL;
>  		goto out;
>  	}
> @@ -439,7 +439,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>  
>  	put_vas_user_win_ref(&txwin->vas_win.task_ref);
>  	rc = -EBUSY;
> -	pr_err("No credit is available to allocate window\n");
> +	pr_err_ratelimited("No credit is available to allocate window\n");
>  
>  out_free:
>  	/*
> -- 
> 2.26.3

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A11803602
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 15:06:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HmjIo0Rq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkQT91CWwz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 01:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HmjIo0Rq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkQSH6VKyz3cST
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 01:06:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E6396117B;
	Mon,  4 Dec 2023 14:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4B0C433C7;
	Mon,  4 Dec 2023 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701698765;
	bh=kq45xZBDIhTMwKyVhS3gYuQevtdcWxtrpi1YvwxZAZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HmjIo0Rq7laiyuq+ixPPuYFoLP8pzRWKqq5lkxYByP0Jc08T0Qngau/odx0bBAuXo
	 ClGcvDjCjsywohWDBiqREQjdkSF7dP42x6BSVi3pqLQrILj7fUHJ1lWE2n8vaTkAJT
	 j/7im5iHePFmry0dccY9C64xuhV56Q2L6+aIYbYchu3UJVoJTrPqLU40JwoRbTHWH0
	 tKMyQLMWn6Lnh0nVoI20GnfzSlxACpzR9aUDe90JIkRgEQWEgeAgN1KaciL1ouT78s
	 aS6cgxBEwGWcSwiCeP5HlNovDglm28VPgClNzww3Tv1Y4ElhhVgfliTBblSbZz3OE6
	 jD4fAKt8T7eUw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <20231203020115.860099-1-haren@linux.ibm.com>
References: <20231203020115.860099-1-haren@linux.ibm.com>
Date: Mon, 04 Dec 2023 19:35:59 +0530
Message-ID: <87r0k283lk.fsf@kernel.org>
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

> VAS allocate, modify and deallocate HCALLs returns
> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
> delay and expects OS to reissue HCALL after that delay. But using
> msleep() will often sleep at least 20 msecs even though the
> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
> The open and close VAS window functions hold mutex and then issue
> these HCALLs. So these operations can take longer than the
> necessary when multiple threads issue open or close window APIs
> simultaneously.
>
> So instead of msleep(), use usleep_range() to ensure sleep with
> the expected value before issuing HCALL again.
>

Can you summarize if there an user observable impact for the current
code? We have other code paths using msleep(get_longbusy_msec()). Should
we audit those usages?


>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> ---
> v1 -> v2:
> - Use usleep_range instead of using RTAS sleep routine as
>   suggested by Nathan
> v2 -> v3:
> - Sleep 10MSecs even for HCALL delay > 10MSecs and the other
>   commit / comemnt changes as suggested by Nathan and Ellerman.
> ---
>  arch/powerpc/platforms/pseries/vas.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 71d52a670d95..5cf81c564d4b 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -38,7 +38,30 @@ static long hcall_return_busy_check(long rc)
>  {
>  	/* Check if we are stalled for some time */
>  	if (H_IS_LONG_BUSY(rc)) {
> -		msleep(get_longbusy_msecs(rc));
> +		unsigned int ms;
> +		/*
> +		 * Allocate, Modify and Deallocate HCALLs returns
> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
> +		 * for the long delay. So the sleep time should always
> +		 * be either 1 or 10msecs, but in case if the HCALL
> +		 * returns the long delay > 10 msecs, clamp the sleep
> +		 * time to 10msecs.
> +		 */
> +		ms = clamp(get_longbusy_msecs(rc), 1, 10);
> +
> +		/*
> +		 * msleep() will often sleep at least 20 msecs even
> +		 * though the hypervisor suggests that the OS reissue
> +		 * HCALLs after 1 or 10msecs. Also the delay hint from
> +		 * the HCALL is just a suggestion. So OK to pause for
> +		 * less time than the hinted delay. Use usleep_range()
> +		 * to ensure we don't sleep much longer than actually
> +		 * needed.
> +		 *
> +		 * See Documentation/timers/timers-howto.rst for
> +		 * explanation of the range used here.
> +		 */
> +		usleep_range(ms * 100, ms * 1000);
>  		rc = H_BUSY;
>  	} else if (rc == H_BUSY) {
>  		cond_resched();
> -- 
> 2.26.3

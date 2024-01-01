Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4D4821328
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jan 2024 07:17:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oKwc8dTk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T3QkM62Hxz3cRk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jan 2024 17:17:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oKwc8dTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T3QjT6w5gz2xcq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jan 2024 17:16:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7CE00CE0189;
	Mon,  1 Jan 2024 06:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD3EC433C8;
	Mon,  1 Jan 2024 06:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704089783;
	bh=bsGfePthO4Z/FIhuYRNDfI4ZJBRj0mHe0IJzowOgWbA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oKwc8dTkUD8LE+ydT0yhTBbQYW15z/GWv4YMtMQIhmcJMoHFd9smh4vEbcKLnGRhb
	 yCXjtwnGC3UNUEHVnR9PPr0IOVu/bK/dTfXNV34nJe4mEKXpg9QNA+Q7YyBrjP/5AE
	 gFgeWo1l1T6ru2xKZtw/qDIBkdfQDolG09Q0+w/q9BpHKIqycrO6MJIrlxi4d2FB1z
	 J+TH0pmJVNgt2DffzBc/8yNq1L0YNMarrLpH9ARLC/zdOcFsxWyRci0nq++Q6CqAhK
	 NCj/QZZKKslnHhkyShT+IqJlJ6tz4U+8GpF9EzUldqIubO8ANdaSP0AILNFsgKdpUN
	 NGyNraagLimLA==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <20231227083401.2307526-1-haren@linux.ibm.com>
References: <20231227083401.2307526-1-haren@linux.ibm.com>
Date: Mon, 01 Jan 2024 11:46:17 +0530
Message-ID: <87il4do9xq.fsf@kernel.org>
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
Cc: nathanl@linux.ibm.com, haren@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:

> VAS allocate, modify and deallocate HCALLs returns
> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
> delay and expects OS to reissue HCALL after that delay. But using
> msleep() will often sleep at least 20 msecs even though the
> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
>
> The open and close VAS window functions hold mutex and then issue
> these HCALLs. So these operations can take longer than the
> necessary when multiple threads issue open or close window APIs
> simultaneously, especially might affect the performance in the
> case of repeat open/close APIs for each compression request.
> On the large machine configuration which allows more simultaneous
> open/close windows (Ex: 240 cores provides 4800 VAS credits), the
> user can observe hung task traces in dmesg due to mutex contention
> around open/close HCAlls.
>
> So instead of msleep(), use usleep_range() to ensure sleep with
> the expected value before issuing HCALL again.
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
> v4 -> v3:
> - More description in the commit log with the visible impact for
>   the current code as suggested by Aneesh
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
>

Is there more details on this range? (ms *100, ms * 1000)

can we use USEC_PER_MSEC instead of 1000.



>  		rc = H_BUSY;
>  	} else if (rc == H_BUSY) {
>  		cond_resched();


It would be good to convert this to a helper and switch rtas_busy_delay
to use this new helper. One question though is w.r.t the clamp values.
Does that need to be specific to each hcall? Can we make it generic?

rtas_busy_delay() expliclity check for 20msec. Any reason to do that?
timers-howto.rst suggest > 10msec to use msleep. 

if (ms <= 20)
	usleep_range(ms * 100, ms * 1000);
else
	msleep(ms);

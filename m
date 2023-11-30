Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE77FE67C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:08:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QUU4St7E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgfkb6ZMTz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:08:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QUU4St7E;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgfjm2GTBz2xVW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:08:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701310082;
	bh=aN/xoZpS6LqQUoIKhHtH74g454pmPRHktKkj0ZPwnjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QUU4St7EnPkQF4axR/KI/4fEjrKRhwhoKBu2jJ7Qd+sVQJScYL0Zz3XYv08ak8bOy
	 VBeketPPCTsG5cL7SrUmoRVne/ooBkOw6da4l8TZLBl/3qH2R/Xqh95GIC33E2k5Rl
	 Q0wPdH6ArnhK/lFRQY1qG6gAaHIo1YeKYbIrvJYyov0sW5JgDO2RzM6WCu77Wtm180
	 hdaAM+TSb4ltXWlxHdXStUB68CDtKoIIZ4u1UzmZSMfw5quKyP6JxJZWQ2LGIqzQjt
	 NnTUclag/jDSY6HsBFzj56usPcrTLT8kHriwpkzSJWJ8SSOBsfenRrgQ+AyFehBMId
	 t+2RmdSq+qdXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgfjZ3YZ0z4x5q;
	Thu, 30 Nov 2023 13:08:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <20231129075424.240653-1-haren@linux.ibm.com>
References: <20231129075424.240653-1-haren@linux.ibm.com>
Date: Thu, 30 Nov 2023 13:07:59 +1100
Message-ID: <871qc82dts.fsf@mail.lhotse>
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
> hypervisor expects to reissue these HCALLs after 1 or 10msecs.
> It might cause these HCALLs takes longer when multiple threads
> issue open or close VAS windows simultaneously.
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
> ---
>  arch/powerpc/platforms/pseries/vas.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 71d52a670d95..bade4402741f 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -36,9 +36,31 @@ static bool migration_in_progress;
>  
>  static long hcall_return_busy_check(long rc)
>  {
> +	unsigned int ms;
> +
>  	/* Check if we are stalled for some time */
>  	if (H_IS_LONG_BUSY(rc)) {
> -		msleep(get_longbusy_msecs(rc));
> +		ms = get_longbusy_msecs(rc);
> +		/*
> +		 * Allocate, Modify and Deallocate HCALLs returns
> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
> +		 * for the long delay. So the delay should always be 1
> +		 * or 10msecs, but sleeps 1msec in case if the long
> +		 * delay is > H_LONG_BUSY_ORDER_10_MSEC.
> +		 */
> +		if (ms > 10)
> +			ms = 1;
 
I don't understand this. The hypervisor asked you to sleep for more than
10 milliseconds, so instead you sleep for 1?

I can understand that we don't want to usleep() for the longer durations
that could be returned, but so shouldn't the code be using msleep() for
those values?

Sleeping for a very short duration definitely seems wrong.


> +		/*
> +		 * msleep() will often sleep at least 20 msecs even
> +		 * though the hypervisor expects to reissue these
 
That makes it sound like the hypervisor is reissuing the hcalls.

Better would be "the hypervisor suggests the kernel should reissue the
hcall after ...".

> +		 * HCALLs after 1 or 10msecs. So use usleep_range()
> +		 * to sleep with the expected value.
> +		 *
> +		 * See Documentation/timers/timers-howto.rst on using
> +		 * the value range in usleep_range().
> +		 */
> +		usleep_range(ms * 100, ms * 1000);

If ms == 1, then that's 100 usecs, which is not 1 millisecond?

Please use USEC_PER_MSEC.

>  		rc = H_BUSY;
>  	} else if (rc == H_BUSY) {
>  		cond_resched();

cheers

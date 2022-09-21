Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAC5BF4CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 05:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXPCj3Kb4z3cBV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 13:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sholland.org header.i=@sholland.org header.a=rsa-sha256 header.s=fm3 header.b=IzY6CcTo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aUoCDUJs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sholland.org (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=samuel@sholland.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sholland.org header.i=@sholland.org header.a=rsa-sha256 header.s=fm3 header.b=IzY6CcTo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aUoCDUJs;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXPBx0tygz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 13:33:28 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 880345C0183;
	Tue, 20 Sep 2022 23:33:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 20 Sep 2022 23:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1663731203; x=
	1663817603; bh=+SC0n2EuUOG/Owl/UMK6+vkcSU62E8PVCjRDviLT1Oo=; b=I
	zY6CcToQ9apVLxH3OPXTSG71SvKqkoA4Veof2T9xb4Pg6yzvcNs8FCm9fX6OPLCX
	Bfu70qyFYyImeT0tGtB5hx1tOhXhI61s3kD7NbhrDlS9Y1A308FpDn95yjCiXSUB
	QmWjj6GJTcN8KcyDUJYktGkKaeCFoE2NweaiMd7w+aMRxJRmiGP06H35OTtgiVGH
	EdlhsC42dKbx16txwKd0KpX6gEQez4pe6xJQXJqiieit/K5OKHHlElZhi7NP75Vn
	mtyYRWh+ScWGutEBUiIyZfzoCIyYfM+fKO1SR9FQwy0tWJJcHkWIqapZ8RqPt0aX
	hF6Qi4Yv5YscKsDSSrQBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663731203; x=
	1663817603; bh=+SC0n2EuUOG/Owl/UMK6+vkcSU62E8PVCjRDviLT1Oo=; b=a
	UoCDUJsWsoskuRXEW5d0vydO18vF75STEDKYataplk2klQ7qdMjXx/xzCn3H3j27
	8k+nvRqew03Qo70EL83jdGSWo5jSJOevqBD3StJE+QVW+2v/T3keZxuNtDSMI2t2
	b4/XIuFgbubSOBAR2LTTAxD3xCFlEpbWUs/iEiu91UTqvk/aCeb4ZUZMskyR3VEx
	+XZ/Mxw7KOvJ8aTxLbVIsfAQGMoVC/x43/Z8m0bN8ht6d/y6P7Ig9ot6gDLGDULE
	YcXoDGaQalO/JZgZ85t6RvZqZdFl+QRCfZVaJFkJNNHaBX/yiRdypTyHW0pxAjbT
	NkbolVpBvDtzy57p7m0Tg==
X-ME-Sender: <xms:A4YqY1cwh2RBlLkfJOUj4uNvSIWnmcq8bZm0aIpyO85UBg1BspzgJw>
    <xme:A4YqYzPbJ40aY1MLI3457cos3sSfE1JCx7-aYR9-wtmhyi2rXCewXJeHaE_4ZUKpA
    dkl86-OmLT9ln6UKA>
X-ME-Received: <xmr:A4YqY-h-TC3hbfFXbA2upaQQzshXgv3sqYECazJSBnSpvA5k5sYFGlcJrV7pJ3aHzlTqSQ-yHqdtGEZTtwf3KNTHnVLNlgdcRI2tk1W2J-4p3KZqAUe5KbqnUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeffgfeghfevudfgvdfhgeeuvdeiudehgedujeeikeelueduhfef
    vdevueeghedvjeenucffohhmrghinhepphhofigvrhejrdhssgenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:A4YqY-_kWXb3LunqtAvtos0OIrx1hTOAKd3XRH3fVPGGRNMEpjn5Hg>
    <xmx:A4YqYxv4jLJGsoJVWlJQ6ShM4k0M3-p4zw7cc1VCbEfvUzNKra3Cjg>
    <xmx:A4YqY9GBuFBMTY2jWmFaptrJGxMBYlYt-6CNSifvsfNitPENHrLZsg>
    <xmx:A4YqY1hZjcdCjDeIGOth_fffJ3qQ6qseAoGxWbXCVVQmn7ohQ77MDw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 23:33:22 -0400 (EDT)
Message-ID: <01281a29-5dff-8868-a1c3-4c4978dca346@sholland.org>
Date: Tue, 20 Sep 2022 22:33:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
 <87h713leu8.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
In-Reply-To: <87h713leu8.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/19/22 07:37, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 16/09/2022 à 07:05, Samuel Holland a écrit :
>>> With CONFIG_PREEMPT=y (involuntary preemption enabled), it is possible
>>> to switch away from a task inside copy_{from,to}_user. This left the CPU
>>> with userspace access enabled until after the next IRQ or privilege
>>> level switch, when AMR/IAMR got reset to AMR_KU[AE]P_BLOCKED. Then, when
>>> switching back to the original task, the userspace access would fault:
>>
>> This is not supposed to happen. You never switch away from a task 
>> magically. Task switch will always happen in an interrupt, that means 
>> copy_{from,to}_user() get interrupted.
> 
> Unfortunately this isn't true when CONFIG_PREEMPT=y.
> 
> We can switch away without an interrupt via:
>   __copy_tofrom_user()
>     -> __copy_tofrom_user_power7()
>        -> exit_vmx_usercopy()
>           -> preempt_enable()
>              -> __preempt_schedule()
>                 -> preempt_schedule()
>                    -> preempt_schedule_common()
>                       -> __schedule()
> 
> I do some boot tests with CONFIG_PREEMPT=y, but I realise now those are
> all on Power8, which is a bit of an oversight on my part.
> 
> And clearly no one else tests it, until now :)
> 
> I think the root of our problem is that our KUAP lock/unlock is at too
> high a level, ie. we do it in C around the low-level copy to/from.
> 
> eg:
> 
> static inline unsigned long
> raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> {
> 	unsigned long ret;
> 
> 	allow_write_to_user(to, n);
> 	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
> 	prevent_write_to_user(to, n);
> 	return ret;
> }
> 
> There's a reason we did that, which is that we have various different
> KUAP methods on different platforms, not a simple instruction like other
> arches.
> 
> But that means we have that exit_vmx_usercopy() being called deep in the
> guts of __copy_tofrom_user(), with KUAP disabled, and then we call into
> the preempt machinery and eventually schedule.
> 
> I don't see an easy way to fix that "properly", it would be a big change
> to all platforms to push the KUAP save/restore down into the low level
> asm code.
> 
> But I think the patch below does fix it, although it abuses things a
> little. Namely it only works because the 64s KUAP code can handle a
> double call to prevent, and doesn't need the addresses or size for the
> allow.
> 
> Still I think it might be our best option for an easy fix.
> 
> Samuel, can you try this on your system and check it works for you?

It looks like your patch works. Thanks for the correct fix!

I replaced my patch with the one below, and enabled
CONFIG_PPC_KUAP_DEBUG=y, and I was able to do several kernel builds
without any crashes or splats in dmesg.

I suppose the other calls to exit_vmx_usercopy() in copyuser_power7.S
would not cause a crash, because there is no userspace memory access
afterward, but couldn't they still leave KUAP erroneously unlocked?

Regards,
Samuel

> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index 97a77b37daa3..c50080c6a136 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -432,6 +432,7 @@ int speround_handler(struct pt_regs *regs);
>  /* VMX copying */
>  int enter_vmx_usercopy(void);
>  int exit_vmx_usercopy(void);
> +void exit_vmx_usercopy_continue(void);
>  int enter_vmx_ops(void);
>  void *exit_vmx_ops(void *dest);
>  
> diff --git a/arch/powerpc/lib/copyuser_power7.S b/arch/powerpc/lib/copyuser_power7.S
> index 28f0be523c06..77804860383c 100644
> --- a/arch/powerpc/lib/copyuser_power7.S
> +++ b/arch/powerpc/lib/copyuser_power7.S
> @@ -47,7 +47,7 @@
>  	ld	r15,STK_REG(R15)(r1)
>  	ld	r14,STK_REG(R14)(r1)
>  .Ldo_err3:
> -	bl	exit_vmx_usercopy
> +	bl	exit_vmx_usercopy_continue
>  	ld	r0,STACKFRAMESIZE+16(r1)
>  	mtlr	r0
>  	b	.Lexit
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index f76a50291fd7..78a18b8384ff 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/uaccess.h>
>  #include <linux/hardirq.h>
> +#include <asm/kup.h>
>  #include <asm/switch_to.h>
>  
>  int enter_vmx_usercopy(void)
> @@ -34,12 +35,19 @@ int enter_vmx_usercopy(void)
>   */
>  int exit_vmx_usercopy(void)
>  {
> +	prevent_user_access(KUAP_READ_WRITE);
>  	disable_kernel_altivec();
>  	pagefault_enable();
>  	preempt_enable();
>  	return 0;
>  }
>  
> +void exit_vmx_usercopy_continue(void)
> +{
> +	exit_vmx_usercopy();
> +	allow_read_write_user(NULL, NULL, 0);
> +}
> +
>  int enter_vmx_ops(void)
>  {
>  	if (in_interrupt())
> 


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84405BB9F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 20:46:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVKfK23Ldz3bhf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 04:46:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sholland.org header.i=@sholland.org header.a=rsa-sha256 header.s=fm3 header.b=mF4888kZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kqMOQmeb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sholland.org (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=samuel@sholland.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sholland.org header.i=@sholland.org header.a=rsa-sha256 header.s=fm3 header.b=mF4888kZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kqMOQmeb;
	dkim-atps=neutral
X-Greylist: delayed 462 seconds by postgrey-1.36 at boromir; Sun, 18 Sep 2022 04:45:54 AEST
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVKdZ5Ps6z2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 04:45:54 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 181F43200A19;
	Sat, 17 Sep 2022 14:38:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 17 Sep 2022 14:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1663439885; x=
	1663526285; bh=jHHLXpWPtd6zlE9ADGiuOsDT6ny/BGJfLNQ5Ar/S0Ug=; b=m
	F4888kZcFaMWN2coxV2NEX+LfS/DstXM457voerhN9UVqFGfuArfSkquG8oB45a0
	URCY88XoBHjiXv+tWp9eOTHAC/i3lLiYa2CAJo/GP8Abhqh9eDiUi09bDuixBF/9
	sPccxbOFoqNR3bXMc4HWQKR8AEXPP+xIc85KAADEh7xtVym9jN98GdwOlk2IFWr+
	ZbMUzc1Qeh6sqWaWkmrRAu+aJuAydm1WMD1/0gCkOmy3Qfc+kCSVX/w0doCu+1Jn
	ldEtY8gTSIW3Rw1MA1R0lC3sCEm0xIGVMoxa1AyOUIhM3fVlZlOSu6sWNy/A35te
	eI3BZGrn1INt8G6UV7QSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663439885; x=
	1663526285; bh=jHHLXpWPtd6zlE9ADGiuOsDT6ny/BGJfLNQ5Ar/S0Ug=; b=k
	qMOQmebyncMIvKhK0Q78RlPwuId6hcXn6Hhu5ySsot2AZcYsTk+XD8TKpizA3H44
	GEHTm7CK2OhJSZA94M+LJC8KchiQAVQc3hYyGMBn+YbIKL+INQZCyJ2BdJy2xWdm
	4kNSNkhmEOxhaaSZmf4+lxeqX2lc82K8Z7l5hmLrtcA01A+8kG2G+tRECok5GjDR
	WReXl67mzLWiK9c9xwU+47Z90YoeNkQ0+AULmmjvXiHLhuDjdUlqyYHoo+HoDKPC
	To0zdTRIzTSHQundtQJNk7l3kvfgjva6hYMddftjUjow3hC/qEJnunZTRJAnY51k
	QizmC6hO+n80U83/A1Mww==
X-ME-Sender: <xms:DBQmY1P7jnLypib1ofmkRo4BIxz4tdD4Qvy4bgsMMqTrzXns19JWUQ>
    <xme:DBQmY3-wJy_noARqfUsFGwHxxEBfJCpZu5OT_Dr4HyQKxDGh-iC45EUn8JdBRPypg
    Q1OKxBOll9oui0xgw>
X-ME-Received: <xmr:DBQmY0SY7Iq1dZyivlcRzdNWwT-nH8NzJuBss2HN-oX9_N9ujRmnWp5JiP6KFPQDkf7qF5tdAbv9lF4Xi4sUPvzzYz0uTjbmVrbmSieWns615H6NQAWHKvNXjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvvddgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepgeeikeeufedvvdeuteeivdeiffdtgfdtfeejgfetfeefgeff
    gfdvffehjedvueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:DBQmYxtZHVPA_SPjoe6Z5Ag5MwjZHjjaouBtc4eM3NY5oKqk-bO5Qw>
    <xmx:DBQmY9f2tIxbrXTTFFQ7M4KMJ6wkcJfrqqqH-nm3YM_Y-6CFJ40DdQ>
    <xmx:DBQmY93f7P_wn6xfFmm2nbrWZo6qnaKrLMyIlG3pTlo8FKaX8juWRQ>
    <xmx:DRQmY1TbTeFz6w3euZsHjRQ2liLAzelc2S0ZhQAaZA5XRbmQoPF5qg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Sep 2022 14:38:04 -0400 (EDT)
Message-ID: <aebab2f0-a962-68ed-b655-84a3e87f2c7d@sholland.org>
Date: Sat, 17 Sep 2022 13:38:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
In-Reply-To: <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
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

On 9/17/22 03:16, Christophe Leroy wrote:
> Le 16/09/2022 à 07:05, Samuel Holland a écrit :
>> With CONFIG_PREEMPT=y (involuntary preemption enabled), it is possible
>> to switch away from a task inside copy_{from,to}_user. This left the CPU
>> with userspace access enabled until after the next IRQ or privilege
>> level switch, when AMR/IAMR got reset to AMR_KU[AE]P_BLOCKED. Then, when
>> switching back to the original task, the userspace access would fault:
> 
> This is not supposed to happen. You never switch away from a task 
> magically. Task switch will always happen in an interrupt, that means 
> copy_{from,to}_user() get interrupted.

That makes sense, the interrupt handler is responsible for saving the
KUAP status. It looks like neither DEFINE_INTERRUPT_HANDLER_RAW nor any
of its users (performance_monitor_exception(), do_slb_fault()) do that.
Yet they still call one of the interrupt_return variants, which restores
the status from the stack.

> Whenever an interrupt is taken, kuap_save_amr_and_lock() macro is used 
> to save KUAP status into the stack then lock KUAP access. At interrupt 
> exit, kuap_kernel_restore() macro or function is used to restore KUAP 
> access from the stack. At the time the task switch happens, KUAP access 
> is expected to be locked. During task switch, the stack is switched so 
> the KUAP status is taken back from the new task's stack.

What if another task calls schedule() from kernel process context, and
the scheduler switches to a task that had been preempted inside
copy_{from,to}_user()? Then there is no interrupt involved, and I don't
see where kuap_kernel_restore() would get called.

> Your fix suggests that there is some path where the KUAP status is not 
> properly saved and/or restored. Did you try running with 
> CONFIG_PPC_KUAP_DEBUG ? It should warn whenever a KUAP access is left 
> unlocked.
> 
>>
>>    Kernel attempted to write user page (3fff7ab68190) - exploit attempt? (uid: 65536)
>>    ------------[ cut here ]------------
>>    Bug: Write fault blocked by KUAP!
>>    WARNING: CPU: 56 PID: 4939 at arch/powerpc/mm/fault.c:228 ___do_page_fault+0x7b4/0xaa0
>>    CPU: 56 PID: 4939 Comm: git Tainted: G        W         5.19.8-00005-gba424747260d #1
>>    NIP:  c0000000000555e4 LR: c0000000000555e0 CTR: c00000000079d9d0
>>    REGS: c00000008f507370 TRAP: 0700   Tainted: G        W          (5.19.8-00005-gba424747260d)
>>    MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28042222  XER: 20040000
>>    CFAR: c000000000123780 IRQMASK: 3
>>    NIP [c0000000000555e4] ___do_page_fault+0x7b4/0xaa0
>>    LR [c0000000000555e0] ___do_page_fault+0x7b0/0xaa0
>>    Call Trace:
>>    [c00000008f507610] [c0000000000555e0] ___do_page_fault+0x7b0/0xaa0 (unreliable)
>>    [c00000008f5076c0] [c000000000055938] do_page_fault+0x68/0x130
>>    [c00000008f5076f0] [c000000000008914] data_access_common_virt+0x194/0x1f0
>>    --- interrupt: 300 at __copy_tofrom_user_base+0x9c/0x5a4
> 
> ...
> 
>>
>> Fix this by saving and restoring the kernel-side AMR/IAMR values when
>> switching tasks.
> 
> As explained above, KUAP access should be locked at that time, so saving 
> and restoring it should not have any effect. If it does, it means 
> something goes wrong somewhere else.
> 
>>
>> Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>> I have no idea if this is the right change to make, and it could be
>> optimized, but my system has been stable with this patch for 5 days now.
>>
>> Without the patch, I hit the bug every few minutes when my load average
>> is <1, and I hit it immediately if I try to do a parallel kernel build.
> 
> Great, then can you make a try with CONFIG_PPC_KUAP_DEBUG ?

Yes, I will try this out in the next few days.

Regards,
Samuel


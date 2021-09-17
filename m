Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6F40F3B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 10:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9mg34ZBrz2ypJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 18:03:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=gOgFekj2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=gOgFekj2; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9mfM0Fbtz2yJ9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 18:03:04 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id w7so8832385pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=F5LdGTojih2Mc9qSmXv5ONSympP9xKi3sLGrLFi+yzk=;
 b=gOgFekj2lvWmEwLRxLyVCPqRF9r1OQF6l575N3C9OXIFLvIZaAMiV0aNpRE7b+41mi
 sJoDmghGgPqLFIt3NibqOoxb+zL0KBbAj6lumtqMTUMD1d/PyRCD27ui0SNlw430v94h
 AXprAqATqRevW7DgHSZ9jc/RmOihB+bwBbyr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=F5LdGTojih2Mc9qSmXv5ONSympP9xKi3sLGrLFi+yzk=;
 b=8BDJ/RJA/FpzLr9EOWSs0LUH7DMtfUXCBOlaxGx/MZ32K3Klcy3oj5ZVXgRK0Hi67F
 9V/8I/uxJ6O6+f4o7vu3Ip4MYxQCaffmKiYWunYKvcN0OHh7fTlxLpCFrxDmvJIBDEnm
 6daQah913sgusfmMh7tEOrY65sYOHZOMkVJXs+UwnPDwomOzdo/cZWcSMJJ9Q3CpZrdC
 te/ntHpVWe/DktcFXAn4Ky8qp9KVr5+UOH48U3RZvw2zxbpmdOnqepZAOswbORH3EMPY
 9uPLwRu5SSL9OBw/zk+HVA5tdly1OwrgG9aknjBFKc0WM3ITrox7di77NCqsPBK8f40F
 EirQ==
X-Gm-Message-State: AOAM530fqt4AI74gZxoTJGgci2sSnoPvJix5i21EIIWzieIZWDSiwMch
 vkK6LDTqImvVA1vhIkttVVDJRQ==
X-Google-Smtp-Source: ABdhPJzOkw+0F7WSnznscTnJ/cH5+aC6jY0pVEvMB51WiRscz24cZIrYjX6+6+kBATbnK/yq6NE54A==
X-Received: by 2002:a63:5d5f:: with SMTP id o31mr8769726pgm.56.1631865781230; 
 Fri, 17 Sep 2021 01:03:01 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:f1a1:4b0:6139:723d])
 by smtp.gmail.com with ESMTPSA id 126sm6213924pgi.86.2021.09.17.01.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 01:03:00 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/2] powerpc/64s: system call rfscv workaround for TM
 bugs
In-Reply-To: <20210908101718.118522-1-npiggin@gmail.com>
References: <20210908101718.118522-1-npiggin@gmail.com>
Date: Fri, 17 Sep 2021 18:02:57 +1000
Message-ID: <87ilyz8w9a.fsf@linkitivity.dja.id.au>
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
Cc: Eirik Fuller <efuller@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The rfscv instruction does not work correctly with the fake-suspend mode
> in POWER9, which can end up with the hypervisor restoring an incorrect
> checkpoint.

If I understand correctly from commit 4bb3c7a0208f ("KVM: PPC: Book3S
HV: Work around transactional memory bugs in POWER9"), this is because
rfscv does not cause a soft-patch interrupt in the way that rfid etc do.
So we need to avoid calling rfscv if we are in fake-suspend state -
instead we must call something that does indeed get soft-patched - like
rfid.

> Work around this by setting the _TIF_RESTOREALL flag if a system call
> returns to a transaction active state, causing rfid to be used instead
> of rfscv to return, which will do the right thing. The contents of the
> registers are irrelevant because they will be overwritten in this case
> anyway.

I can follow that this will indeed cause syscall_exit_prepare to return
non-zero and therefore we should take the
syscall_vectored_*_restore_regs path which does an RFID_TO_USER rather
than a RFSCV_TO_USER. My only question/concern is:

.Lsyscall_vectored_\name\()_exit:
	addi	r4,r1,STACK_FRAME_OVERHEAD
	li	r5,1 /* scv */
	bl	syscall_exit_prepare            <-------- we get r3 != 0  here
	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
.Lsyscall_vectored_\name\()_rst_start:
	lbz	r11,PACAIRQHAPPENED(r13)
	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
	bne-	syscall_vectored_\name\()_restart <-- can we end up taking
	                                              this branch?

Are there any circumstances that would take us down the _restart path,
and if so, will we still go through the correct RFID_TO_USER branch
rather than the RFSCV_TO_USER branch?

Apart from that this looks good to me, although with the heavy
disclaimer that I only learned about fake suspend for the first time
while reviewing the patch.

Kind regards,
Daniel

>
> Reported-by: Eirik Fuller <efuller@redhat.com>
> Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/interrupt.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index c77c80214ad3..917a2ac4def6 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -139,6 +139,19 @@ notrace long system_call_exception(long r3, long r4, long r5,
>  	 */
>  	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
>  
> +	/*
> +	 * If system call is called with TM active, set _TIF_RESTOREALL to
> +	 * prevent RFSCV being used to return to userspace, because POWER9
> +	 * TM implementation has problems with this instruction returning to
> +	 * transactional state. Final register values are not relevant because
> +	 * the transaction will be aborted upon return anyway. Or in the case
> +	 * of unsupported_scv SIGILL fault, the return state does not much
> +	 * matter because it's an edge case.
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> +			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
> +		current_thread_info()->flags |= _TIF_RESTOREALL;
> +
>  	/*
>  	 * If the system call was made with a transaction active, doom it and
>  	 * return without performing the system call. Unless it was an
> -- 
> 2.23.0

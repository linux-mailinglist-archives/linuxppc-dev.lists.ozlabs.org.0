Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305A354FA5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF1zC0JN8z304X
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:13:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ASr6lrMh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ASr6lrMh; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF1yn2bfYz302H
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:13:04 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id b17so6252021pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+sEVBBSuWNs/g5ES1WsOPuwnovbDnsX7rU8dGfE75jE=;
 b=ASr6lrMhVwEyt1dRdBZM8goeMuWfjNwWs1g6hwP8bmK6FjLOEyJ9oqHEPv5ONj9qpe
 +9pnunw9lMC4/66DP7AfkT0qAzgmMOTcMBVnUUzg1blFeS1cZoX943B6aRdGVPHMHeHL
 0HlXPFHWSW71PuQnu7kWekJJom8a9qPVAbdm15qNRr5PPM/LLw37JjPzYiD1tmq8XKXB
 bg9MkgKamSfhkuHXdvWxpAJgPhJr1yICd6ksRdT6zdd+z3sZepiyF/vuWQoyNjiq/0zB
 kk2qYrmmwD1FUyFzCVHYPks81SbvhHbJjc3ZxbFmcbqnuERbckESiIXa3gt4DpZkhg1l
 A8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+sEVBBSuWNs/g5ES1WsOPuwnovbDnsX7rU8dGfE75jE=;
 b=oAWc3sJt9XZSCRFfQliyEGWKU1QuFCdNZmNWF+6FaFA5O+tmxf15Svh7J2sZpQTYJy
 quiuvoytYsnxeKsJCNDoeUqAIRL6kGjyOgMOvIMOVH1Z2x1Z09Gt8XKLYoQ8+o1xv7Hg
 CGDQVq/OVRQnSj/khcvt8gdyBYRhXj3Isk/6cT10lLYkX6VNESnxRt56xCBHakpFEVLT
 NMJ6JtFnVz+ns4wXFWfbdJxpTX2WaTUXACyPEt/Jt8+7i6xjj0tfJCX+myaw8xhgpgS+
 71Sp3uCI7AJJV4+dWwSzcwgF2uUdiWJXlCYhi8R37mzos9IO9VGucn40fnXnKtz+/Xlh
 27Jw==
X-Gm-Message-State: AOAM5321P1vjgWDVu+dz/LcgXtviq7bUKFOjTUSbS/S3DKXb5lSDr8S0
 4EjmJR8Z0QQrbvj61KGIJY0=
X-Google-Smtp-Source: ABdhPJyLjq/drp4oaTK2ikg1i4xGymHRvPHPd4h7OTyYr/NuCGJ4pq6ZbxtKe5lSuPD9wtHGDZelDw==
X-Received: by 2002:a63:a42:: with SMTP id z2mr4928591pgk.52.1617700382086;
 Tue, 06 Apr 2021 02:13:02 -0700 (PDT)
Received: from localhost ([1.132.177.104])
 by smtp.gmail.com with ESMTPSA id bj15sm1719558pjb.9.2021.04.06.02.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:13:01 -0700 (PDT)
Date: Tue, 06 Apr 2021 19:12:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 30/48] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-31-npiggin@gmail.com>
 <YGwNRUahuv42VZPR@thinks.paulus.ozlabs.org>
In-Reply-To: <YGwNRUahuv42VZPR@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1617699912.sfw989xp02.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of April 6, 2021 5:27 pm:
> On Mon, Apr 05, 2021 at 11:19:30AM +1000, Nicholas Piggin wrote:
>> Almost all logic is moved to C, by introducing a new in_guest mode for
>> the P9 path that branches very early in the KVM interrupt handler to
>> P9 exit code.
>>=20
>> The main P9 entry and exit assembly is now only about 160 lines of low
>> level stack setup and register save/restore, plus a bad-interrupt
>> handler.
>>=20
>> There are two motivations for this, the first is just make the code more
>> maintainable being in C. The second is to reduce the amount of code
>> running in a special KVM mode, "realmode". In quotes because with radix
>> it is no longer necessarily real-mode in the MMU, but it still has to be
>> treated specially because it may be in real-mode, and has various
>> important registers like PID, DEC, TB, etc set to guest. This is hostile
>> to the rest of Linux and can't use arbitrary kernel functionality or be
>> instrumented well.
>>=20
>> This initial patch is a reasonably faithful conversion of the asm code,
>> but it does lack any loop to return quickly back into the guest without
>> switching out of realmode in the case of unimportant or easily handled
>> interrupts. As explained in previous changes, handling HV interrupts
>> in real mode is not so important for P9.
>>=20
>> Use of Linux 64s interrupt entry code register conventions including
>> paca EX_ save areas are brought into the KVM code. There is no point
>> shuffling things into different paca save areas and making up a
>> different calling convention for KVM.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> [snip]
>=20
>> +/*
>> + * Took an interrupt somewhere right before HRFID to guest, so register=
s are
>> + * in a bad way. Return things hopefully enough to run host virtual cod=
e and
>> + * run the Linux interrupt handler (SRESET or MCE) to print something u=
seful.
>> + *
>> + * We could be really clever and save all host registers in known locat=
ions
>> + * before setting HSTATE_IN_GUEST, then restoring them all here, and se=
tting
>> + * return address to a fixup that sets them up again. But that's a lot =
of
>> + * effort for a small bit of code. Lots of other things to do first.
>> + */
>> +kvmppc_p9_bad_interrupt:
>> +	/*
>> +	 * Set GUEST_MODE_NONE so the handler won't branch to KVM, and clear
>> +	 * MSR_RI in r12 ([H]SRR1) so the handler won't try to return.
>> +	 */
>> +	li	r10,KVM_GUEST_MODE_NONE
>> +	stb	r10,HSTATE_IN_GUEST(r13)
>> +	li	r10,MSR_RI
>> +	andc	r12,r12,r10
>> +
>> +	/*
>> +	 * Clean up guest registers to give host a chance to run.
>> +	 */
>> +	li	r10,0
>> +	mtspr	SPRN_AMR,r10
>> +	mtspr	SPRN_IAMR,r10
>> +	mtspr	SPRN_CIABR,r10
>> +	mtspr	SPRN_DAWRX0,r10
>> +BEGIN_FTR_SECTION
>> +	mtspr	SPRN_DAWRX1,r10
>> +END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
>> +	mtspr	SPRN_PID,r10
>> +
>> +	/*
>> +	 * Switch to host MMU mode
>> +	 */
>> +	ld	r10, HSTATE_KVM_VCPU(r13)
>> +	ld	r10, VCPU_KVM(r10)
>> +	lwz	r10, KVM_HOST_LPID(r10)
>> +	mtspr	SPRN_LPID,r10
>> +
>> +	ld	r10, HSTATE_KVM_VCPU(r13)
>> +	ld	r10, VCPU_KVM(r10)
>> +	ld	r10, KVM_HOST_LPCR(r10)
>> +	mtspr	SPRN_LPCR,r10
>> +
>> +	/*
>> +	 * Go back to interrupt handler
>> +	 */
>> +	ld	r10,HSTATE_SCRATCH0(r13)
>> +	cmpwi	r10,BOOK3S_INTERRUPT_MACHINE_CHECK
>> +	beq	machine_check_common
>> +
>> +	ld	r10,HSTATE_SCRATCH0(r13)
>> +	cmpwi	r10,BOOK3S_INTERRUPT_SYSTEM_RESET
>> +	beq	system_reset_common
>> +
>> +	b	.
>=20
> So you only handle machine check and system reset here?  I would think
> that program check would also be useful, for the cases where people
> put BUG_ON in sensitive places (see below).  DSI and ISI could also be
> useful for the null pointer dereference cases, I would think.

Those ones have their own stack, so a bit simpler to run them (and
they obviously have to be handled as they are NMIs). I'll see if we
can do something to improve the others a bit. Maybe just call program
check for any other exception might work, making sure that it'll use
the emergency stack rather than something that looks like a kernel
stack but is a guest value, I'll see what we can get to work.

>> +static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
>> +{
>> +	BUG_ON((slbee & 0xfff) !=3D idx);
>> +
>> +	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
>> +}
>=20
> Using BUG_ON here feels dangerous, and the condition it is testing is
> certainly not one where the host kernel is in such trouble that it
> can't continue to run.  If the index was wrong then at worst the guest
> kernel would be in trouble.  So I don't believe BUG_ON is appropriate.

Yeah good point, some of it was a bit of development paranoia but I=20
do have to go through and tighten these up.

>> +
>> +/*
>> + * Malicious or buggy radix guests may have inserted SLB entries
>> + * (only 0..3 because radix always runs with UPRT=3D1), so these must
>> + * be cleared here to avoid side-channels. slbmte is used rather
>> + * than slbia, as it won't clear cached translations.
>> + */
>> +static void radix_clear_slb(void)
>> +{
>> +	u64 slbee, slbev;
>> +	int i;
>> +
>> +	for (i =3D 0; i < 4; i++) {
>> +		mfslb(i, &slbee, &slbev);
>> +		if (unlikely(slbee || slbev)) {
>> +			slbee =3D i;
>> +			slbev =3D 0;
>> +			mtslb(i, slbee, slbev);
>> +		}
>> +	}
>=20
> Are four slbmfee + slbmfev really faster than four slbmte?

I'd thought yes if they behaved similarly to mfspr, but from the look of=20
some workbooks it doesn't look like it's quite that simple.

I'll have to measure it.

Thanks,
Nick

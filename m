Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858C3E2889
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 12:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh1q00kYSz3dDw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 20:26:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gq4wjpiU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gq4wjpiU; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh1pV1gb8z3cJt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 20:25:54 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so22120881pjs.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vHll5hrt3Tfly15sgVwP9BPUg47NmiSrfXLIjuKEQUM=;
 b=gq4wjpiUFInOKrTRlCcgF6CknZ3cxsY70MMCFtuxK0AhApZXWjrTPNZ47uBAvZeINN
 zJ8jtDZCQt/nHqROQ6zHxypX9H+rVCQFpRfGZedLoN0M4/an3nRVMPwPLmLpCvPytqiq
 E5DKxuYFNDNkIftQBOFVtlylSMzrkS51tBRsr+G34l0P0may2EDba6TuV3ZDYko41TCu
 9g4yAs7hQel73gtcnDL1bKXzqICCX06knQRlX15qj4FVNPYsXR8MPCuJBm2wnVEwG0YW
 VsC1etPm46U1y4FaX3H1PwZszyDbG9F0hCSv2GIn71IkQDKEuzhjNK4tIjXnCigijiRL
 NtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vHll5hrt3Tfly15sgVwP9BPUg47NmiSrfXLIjuKEQUM=;
 b=tCkBpD9yOVlZOfyoNYdtDEPmRzsVSIVX+iaAH59fHDoMkqVmzb6J2PQM/7q7F+25P9
 b0qP2opirPiNrP5OBmsuy+UE7H46/1vpvxa32U6bNXu568xBUPtNGFMs+6ZDeLLtgIFl
 ae3T462/XyL9xmmdQx1ugjY2XL9nWtJ8jE+cwRIoPc79jO6axQKvfgG090NGWatODLXt
 PDfEYsLC231/2VVT8fblsUaVn8MCwXcAuZdiq3YnkEiZeSPwkbBx/k6k1PLYOG2NjUJG
 5Y+ZnLRznppXZD80mrSOfyiNaEQrz0DsqNEkr6yNHuIBu26oS4YgJL8MIm/XAFXkbJC7
 uGbg==
X-Gm-Message-State: AOAM533jlH544Axkeum5n1Bdr18/UgGWfJMtg1ordUt1dANqu5UPN+AE
 ymeJHHe5eM62Po27RRSpo6A=
X-Google-Smtp-Source: ABdhPJzIe0qERi8yRm9ql31ipjDJSifEYxG6SeBMdDKSp1TntY2Li7isVSW/J9ygD35MG7BuKiQ0XA==
X-Received: by 2002:a63:171d:: with SMTP id x29mr127688pgl.418.1628245550936; 
 Fri, 06 Aug 2021 03:25:50 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id p2sm10259487pfn.141.2021.08.06.03.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:25:50 -0700 (PDT)
Date: Fri, 06 Aug 2021 20:25:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 02/55] KVM: PPC: Book3S HV P9: Fixes for TM softpatch
 interrupt
To: kvm-ppc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-3-npiggin@gmail.com>
 <87a6lvnzin.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6lvnzin.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1628244726.vqhkwwlqv7.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of August 6, 2021 11:16 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> The softpatch interrupt sets HSRR0 to the faulting instruction +4, so
>> it should subtract 4 for the faulting instruction address. Also have it
>> emulate and deliver HFAC interrupts correctly, which is important for
>> nested HV and facility demand-faulting in future.
>=20
> The nip being off by 4 sounds bad. But I guess it's not that big a deal
> because it's only used for reporting the instruction address?

Yeah currently I think so. It's not that bad of a bug.

>=20
> Would also be good to have some more explanation of why it's OK to
> change from illegal to HFAC, which is a guest visible change.

Good point. Again for now it doesn't really matter because the HFAC
handler turns everything (except msgsndp) into a sigill anyway, so
becomes important when we start using HFACs. Put that way I'll probably
split it out.

>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_h=
v_tm.c
>> index cc90b8b82329..e4fd4a9dee08 100644
>> --- a/arch/powerpc/kvm/book3s_hv_tm.c
>> +++ b/arch/powerpc/kvm/book3s_hv_tm.c
>> @@ -74,19 +74,23 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>>  	case PPC_INST_RFEBB:
>>  		if ((msr & MSR_PR) && (vcpu->arch.vcore->pcr & PCR_ARCH_206)) {
>>  			/* generate an illegal instruction interrupt */
>> +			vcpu->arch.regs.nip -=3D 4;
>>  			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
>>  			return RESUME_GUEST;
>>  		}
>>  		/* check EBB facility is available */
>>  		if (!(vcpu->arch.hfscr & HFSCR_EBB)) {
>> -			/* generate an illegal instruction interrupt */
>> -			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
>> -			return RESUME_GUEST;
>> +			vcpu->arch.regs.nip -=3D 4;
>> +			vcpu->arch.hfscr &=3D ~HFSCR_INTR_CAUSE;
>> +			vcpu->arch.hfscr |=3D (u64)FSCR_EBB_LG << 56;
>> +			vcpu->arch.trap =3D BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
>> +			return -1; /* rerun host interrupt handler */
>=20
> This is EBB not TM. Probably OK to leave it in this patch as long as
> it's mentioned in the change log?

It is, but you can get a softpatch interrupt on rfebb changing TM state.=20
Although I haven't actually tested to see if you get a softpatch when
HFSCR disables EBB or the hardware just gives you the HFAC. For that=20
matter, same for all the other facility tests.

Thanks,
Nick

>=20
>>  		}
>>  		if ((msr & MSR_PR) && !(vcpu->arch.fscr & FSCR_EBB)) {
>>  			/* generate a facility unavailable interrupt */
>> -			vcpu->arch.fscr =3D (vcpu->arch.fscr & ~(0xffull << 56)) |
>> -				((u64)FSCR_EBB_LG << 56);
>> +			vcpu->arch.regs.nip -=3D 4;
>> +			vcpu->arch.fscr &=3D ~FSCR_INTR_CAUSE;
>> +			vcpu->arch.fscr |=3D (u64)FSCR_EBB_LG << 56;
>=20
> Same.
>=20
>=20
> cheers
>=20

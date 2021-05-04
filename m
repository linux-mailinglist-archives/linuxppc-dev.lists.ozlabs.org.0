Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D337274D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 10:36:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZCqZ3BWRz3017
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 18:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oW0knTSs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oW0knTSs; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZCq60mL5z2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 18:35:59 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id 10so6745471pfl.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fe0GYzmRD8PfrD3V//nnvca5ULVgNGmjTaoUcBDPjV8=;
 b=oW0knTSst+xrwj3UsFwCiSF9NMWQWxdHf1LdLMEWMWXeItaXrJadvh747e7jHLL7qr
 Ji1DL21kDw6J20GTZ4vg2Q1D7+C1/7Xc2TX4s3vTxmaxf+L3HYgJ77D9YEBiGOOTfOYm
 b5S1ktsn+bA2Pk528rw6jVg1zs3FzEjeE1g9q9JTMdMoi4qn2AQF+1u9DY6WSpEdvsT8
 lyrLgJ79c3PU1Bbaf7KaCrrYwFA96Cn9cktqKJxbcxq1xoIgK3vhxMV6RXeBYatfbTJF
 ELXumCWkp25Y/i2pjtn2y7IXgEMAhJ+vGuIXX6H8g68hJvpNaCa0HBZRZZ6iwfiyAKaf
 olpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fe0GYzmRD8PfrD3V//nnvca5ULVgNGmjTaoUcBDPjV8=;
 b=O6P+Ewur0OYEGjBED2gRjPrCU4vyYR7OGCUGNmw8tG+YDXu0on8Aika6o3SZZ44VR8
 w33TOUhRrRxpPg12SuK4xp+ECQVPRPrGK0fkgCAnDrttQ43cYLUG2da0t/ehp8zfdxlO
 Exka44cCAxrqW73eLq8Op2aqEQmwq+HbIkw1sMqY4m8zAeR34hjHRs9zLJ85sJH4JYbL
 oftD8dFRDSRsA1nNfzhjA5wHZ97AyRlmUz6CZ/ce4ebPW9Wy0GzoTT7ydBQKMszIdXMG
 QAJPmCMcW1pjO4jcElk+3OSVAK4nIqsjd4iqrWLrdD4aeRrXTWIYgQgHpXbgWsNZFIGI
 XXRA==
X-Gm-Message-State: AOAM531mvQF4xKhHbU/0t/vNDfARaDJDvl383hBV/dilPceoIezFa1dM
 R+ZdnbSXmVuGFtpeveg5OtA=
X-Google-Smtp-Source: ABdhPJzS7ydTnIjlR4inzDAp/PB437ZMKezcifConOgZ2NskEP4neLXMEN297DDCkkmKjdAEC8ivoA==
X-Received: by 2002:a17:90a:77c8:: with SMTP id
 e8mr3816034pjs.69.1620117354391; 
 Tue, 04 May 2021 01:35:54 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id f201sm11579402pfa.133.2021.05.04.01.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:35:54 -0700 (PDT)
Date: Tue, 04 May 2021 18:35:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] KVM: PPC: Book3S HV: Sanitise vcpu registers in
 nested path
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210415230948.3563415-1-farosas@linux.ibm.com>
 <20210415230948.3563415-2-farosas@linux.ibm.com>
 <1619833560.k4eybr40bg.astroid@bobo.none>
 <YJDNbFQlB9DHnI6Z@thinks.paulus.ozlabs.org>
 <1620105163.ok9nw6k5yz.astroid@bobo.none>
 <YJD5lwY4JXyS1VgH@thinks.paulus.ozlabs.org>
In-Reply-To: <YJD5lwY4JXyS1VgH@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1620115928.pogd4nj1qc.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of May 4, 2021 5:36 pm:
> On Tue, May 04, 2021 at 03:26:24PM +1000, Nicholas Piggin wrote:
>> Excerpts from Paul Mackerras's message of May 4, 2021 2:28 pm:
>> > On Sat, May 01, 2021 at 11:58:36AM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Fabiano Rosas's message of April 16, 2021 9:09 am:
>> >> > As one of the arguments of the H_ENTER_NESTED hypercall, the nested
>> >> > hypervisor (L1) prepares a structure containing the values of vario=
us
>> >> > hypervisor-privileged registers with which it wants the nested gues=
t
>> >> > (L2) to run. Since the nested HV runs in supervisor mode it needs t=
he
>> >> > host to write to these registers.
>> >> >=20
>> >> > To stop a nested HV manipulating this mechanism and using a nested
>> >> > guest as a proxy to access a facility that has been made unavailabl=
e
>> >> > to it, we have a routine that sanitises the values of the HV regist=
ers
>> >> > before copying them into the nested guest's vcpu struct.
>> >> >=20
>> >> > However, when coming out of the guest the values are copied as they
>> >> > were back into L1 memory, which means that any sanitisation we did
>> >> > during guest entry will be exposed to L1 after H_ENTER_NESTED retur=
ns.
>> >> >=20
>> >> > This patch alters this sanitisation to have effect on the vcpu->arc=
h
>> >> > registers directly before entering and after exiting the guest,
>> >> > leaving the structure that is copied back into L1 unchanged (except
>> >> > when we really want L1 to access the value, e.g the Cause bits of
>> >> > HFSCR).
>> >> >=20
>> >> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> >> > ---
>> >> >  arch/powerpc/kvm/book3s_hv_nested.c | 55 ++++++++++++++++++-------=
----
>> >> >  1 file changed, 34 insertions(+), 21 deletions(-)
>> >> >=20
>> >> > diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm=
/book3s_hv_nested.c
>> >> > index 0cd0e7aad588..270552dd42c5 100644
>> >> > --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> >> > +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> >> > @@ -102,8 +102,17 @@ static void save_hv_return_state(struct kvm_vc=
pu *vcpu, int trap,
>> >> >  {
>> >> >  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
>> >> > =20
>> >> > +	/*
>> >> > +	 * When loading the hypervisor-privileged registers to run L2,
>> >> > +	 * we might have used bits from L1 state to restrict what the
>> >> > +	 * L2 state is allowed to be. Since L1 is not allowed to read
>> >> > +	 * the HV registers, do not include these modifications in the
>> >> > +	 * return state.
>> >> > +	 */
>> >> > +	hr->hfscr =3D ((~HFSCR_INTR_CAUSE & hr->hfscr) |
>> >> > +		     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
>> >> > +
>> >> >  	hr->dpdes =3D vc->dpdes;
>> >> > -	hr->hfscr =3D vcpu->arch.hfscr;
>> >> >  	hr->purr =3D vcpu->arch.purr;
>> >> >  	hr->spurr =3D vcpu->arch.spurr;
>> >> >  	hr->ic =3D vcpu->arch.ic;
>> >>=20
>> >> Do we still have the problem here that hfac interrupts due to bits cl=
eared
>> >> by the hfscr sanitisation would have the cause bits returned to the L=
1,
>> >> so in theory it could probe hfscr directly that way? I don't see a go=
od
>> >> solution to this except either have the L0 intercept these faults and=
 do
>> >> "something" transparent, or return error from H_ENTER_NESTED (which w=
ould
>> >> also allow trivial probing of the facilities).
>> >=20
>> > It seems to me that there are various specific reasons why L0 would
>> > clear HFSCR bits, and if we think about the specific reasons, what we
>> > should do becomes clear.  (I say "L0" but in fact the same reasoning
>> > applies to any hypervisor that lets its guest do hypervisor-ish
>> > things.)
>> >=20
>> > 1. Emulating a version of the architecture which doesn't have the
>> > feature in question - in that case the bit should appear to L1 as a
>> > reserved bit in HFSCR (i.e. always read 0), the associated facility
>> > code should never appear in the top 8 bits of any HFSCR value that L1
>> > sees, and any HFU interrupt received by L0 for the facility should be
>> > changed into an illegal instruction interrupt (or HEAI) forwarded to
>> > L1.  In this case the real HFSCR should always have the enable bit for
>> > the facility set to 0.
>> >=20
>> > 2. Lazy save/restore of the state associated with a facility - in this
>> > case, while the system is in the "lazy" state (i.e. the state is not
>> > that of the currently running guest), the real HFSCR bit for the
>> > facility should be 0.  On an HFU interrupt for the facility, L0 looks
>> > at L1's HFSCR value: if it's 0, forward the HFU interrupt to L1; if
>> > it's 1, load up the facility state, set the facility's bit in HFSCR,
>> > and resume the guest.
>> >=20
>> > 3. Emulating a facility in software - in this case, the real HFSCR
>> > bit for the facility would always be 0.  On an HFU interrupt, L0 reads
>> > the instruction and emulates it, then resumes the guest.
>> >=20
>> > One thing this all makes clear is that the IC field of the "virtual"
>> > HFSCR value seen by L1 should only ever be changed when L0 forwards a
>> > HFU interrupt to L1.
>> >=20
>> > In fact we currently never do (1) or (2), and we only do (3) for
>> > msgsndp etc., so this discussion is mostly theoretical.
>>=20
>> Yeah it's somewhat theoretical, and I guess I mostly agree with you.
>>=20
>> Missing is the case where the L0 does not implement a feature at all.
>> Let's say TM is broken so it disables it, or nobody uses TAR so it=20
>> doesn't bother to switch it.
>=20
> I think that's the same as my case (1), where L0 is presenting an
> architecture to L1 that doesn't implement the feature.  (Unless you
> mean that L0 is running on a machine that has features that didn't
> exist at the time that L0's code was written; to handle that, L0
> should clear all HFSCR bits that it doesn't know about, and map any
> unknown HFSCR[IC] code into illegal interrupt/HEAI.)

I don't think it's quite either of those. There is no ISA v3.0 where the
target address register facility does not exist, and the L0 is not going
to emulate it, for argument's sake.

>> In those cases what do you tell the L1 if it enables a bit that you
>> don't support at all, and it takes a fault?
>=20
> Illegal instruction interrupt, or HEAI.

Okay, so that's just a roundabout way to tell the nested HV "this=20
feature doesn't exist", asynchronously at some point when its guest
tries to use the facility. It's contrary to the architecture it
expected (maybe wrongly because it didn't query the right capability)
but it set HFSCR for the facility so it thought it should work.

>> I guess the right thing to do is advertise that to the guest by some
>> other means, and expect it does the right thing. And you could have
>> the proviso in the nested HV specification that the returned IC field
>> might trip for a feature you enabled in the L1 HFSCR.
>=20
> I think that is confusing; better to return illegal instruction/HEAI.

I think both are more confusing than returning error from the hcall.

>=20
>> >=20
>> >> Returning an hfac interrupt to a hypervisor that thought it enabled t=
he=20
>> >> bit would be strange. But so does appearing to modify the register=20
>> >> underneath it and then returning a fault.
>> >=20
>> > I don't think we should ever do either of those things.  The closest
>> > would be (1) above, but in that case the fault has to be either an
>> > illegal instruction type program interrupt, or a HEAI.
>> >=20
>> >> I think the sanest thing would actually be to return failure from the=
=20
>> >> hcall.
>> >=20
>> > I don't think we should do that either.
>>=20
>> I still think it's preferable for case 4. No point waiting for the
>> guest to boot and some user program eventually hits a bad instruction,
>> even if it was due to some host vs guest configuration problem.
>=20
> If you let it boot to userspace, the administrator has a better chance
> of recovering the situation.

Maybe. What about if it runs userspace until something executes
pthread_mutex_lock

An error message when you try to start the nested guest telling you
pass -machine cap-htm=3Doff would be better... I guess that should
really all work with caps etc today though so TM's a bad example.
But assume we don't have a cap for the bit we disable? Maybe we
should have caps for all HFSCR bits, or I'm just worried about
something not very important.

Thanks,
Nick

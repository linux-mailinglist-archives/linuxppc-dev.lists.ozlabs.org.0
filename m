Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE4812250
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 00:00:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uvDTFbVs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9tR4BmSz3cYQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uvDTFbVs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3rjd6zqykdm8dzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9sQ4cbPz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:59:21 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dbcd8f64549so982830276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 14:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702508358; x=1703113158; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+J5uhAeT04KXTELzQDOfFmLaVLnZ2vRpEsBsoOgLL4=;
        b=uvDTFbVs1+0k9sH6luuKgzGH30hiuVLUNBXdMs1mPQ6cKp7gQoe4zEy7agyQMEvxP2
         gUJCeiLsgvOEgGsQFRwitp2an+nzdC2ainNZLdiL+lHHX7a7yyesXoCWencZwr67RkX+
         G/bMAZXsMUeDTSc3EEz8un0Lk0OGLtCrDJ0OgD+pz4OMHtI/pW9fZL4nvlJPvQsSw/+J
         IrqnPwnkTvmZX7E9gQVteUwlmRen++eJ2lycKILlP168JIeInQX3IJK8xsBAFzCZ+7d2
         WOSn0dqok2ms7tApkREHIYtkuQapBZuZwsTQ6tclSJcsEEtje4IZjcf2plOzFaxONT8L
         VzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702508358; x=1703113158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P+J5uhAeT04KXTELzQDOfFmLaVLnZ2vRpEsBsoOgLL4=;
        b=a3BqXXr0UjIRLnhq6OGQ20xmF3JrRK9HBNBj4NODS8kUUAfuLrh2pJxsvnt8Lq7Ruq
         6RWmLW/hHPHVLBuswGemXRquV4bYwyz9rAbcazGjaS1cZmboQqgyTuA918qKwYDo6ZFz
         oLbCZB34M1vi86/GOa3+7APAO3HTQ7RI57yEl5UtksXfb1PdhnwcVIg+h8P9yFSWZpDE
         cH1pw3CkdqkxKBuCXZipdpxfLMLPsZrHXAtXvQrSMwuWyOvkFbTBG53l3e/WRzyZ2/NC
         tLowlKJHYGW19D9UYky037MU1cCUFXp4wYrqUgI1+y4L7vrbB4QeDm3BJcqcNjMnAs7r
         UFxg==
X-Gm-Message-State: AOJu0YyzxMaNTpXYTNWD0EIHqP9uhIWoFF5V+Cmq6w69QSSsZJ5QAAHc
	MCElhqvKouPHYryQgK6iYb0nD9KNV6g=
X-Google-Smtp-Source: AGHT+IF/2tOKGAnp02CUAmcGGknds7jEyZkdjWAgG3ZJhjWlZQOPu75oZHl38j1efeikxZ9gYUCkkMb1/cI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a28c:0:b0:dbc:d4c4:15d3 with SMTP id
 c12-20020a25a28c000000b00dbcd4c415d3mr27833ybi.5.1702508358541; Wed, 13 Dec
 2023 14:59:18 -0800 (PST)
Date: Wed, 13 Dec 2023 14:59:16 -0800
In-Reply-To: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
 <ZXh8Nq_y_szj1WN0@google.com> <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Message-ID: <ZXo3REB8g-ZecT2U@google.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, david@redhat.com, atishp@atishpatra.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, paul.walmsley@sifive.com, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023, Maxim Levitsky wrote:
> On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> > On Sun, Dec 10, 2023, Jim Mattson wrote:
> > > On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > > Doh.  We got the less obvious cases and missed the obvious one.
> > > >=20
> > > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interr=
upt().  That
> > > > thing should really be folded into vmx_has_nested_events().
> > > >=20
> > > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing becau=
se that
> > > > specifically checks if L1 interrupts are blocked.
> > > >=20
> > > > Compile tested only, and definitely needs to be chunked into multip=
le patches,
> > > > but I think something like this mess?
> > >=20
> > > The proposed patch does not fix the problem. In fact, it messes thing=
s
> > > up so much that I don't get any test results back.
> >=20
> > Drat.
> >=20
> > > Google has an internal K-U-T test that demonstrates the problem. I
> > > will post it soon.
> >=20
> > Received, I'll dig in soonish, though "soonish" might unfortunately mig=
ht mean
> > 2024.
> >=20
>=20
> Hi,
>=20
> So this is what I think:
>=20
> KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
> to check if nested APICv has a pending interrupt before halting.

For all intents and purposes, so was nested_ops->has_events().  I don't see
any reason to have two APIs that do the same thing, and the call to
kvm_guest_apic_has_interrupt() is wrong in that it doesn't verify that IRQs=
 are
enabled for _L2_.  That's why my preference is to fold the two together.

> However the problem is bigger - with APICv we have in essence 2 pending
> interrupt bitmaps - the PIR and the IRR, and to know if the guest has a
> pending interrupt one has in theory to copy PIR to IRR, then see if the m=
ax
> is larger then the current PPR.

Yeah, this is what my untested hack-a-patch tried to do.

> Since we don't want to write to guest memory,

The changelog is misleading/wrong.  Writing guest memory is ok, what isn't =
safe
is blocking or sleeping, i.e. KVM must not trigger a host page fault due to
accessing a page that's been swapped out.  Read vs. write doesn't matter.

So KVM can safely read and write guest memory so long as it already mapped =
by=20
kvm_vcpu_map() (or I suppose if we wrapped an access with pagefault_disable=
(),
but I can't think of a sane reason to do that).  E.g. nVMX can access a vCP=
U's
PID mapping, but synthesizing a nested VM-Exit will cause explosions on nSV=
M.

> and the IRR here resides in the guest memory, I guess we have to do a
> 'dry-run' version of 'vmx_complete_nested_posted_interrupt' and call it f=
rom
> kvm_guest_apic_has_interrupt().

nested_ops->has_events() is the much better fit, e.g. the naming won't get =
weird
and we can gate the whole thing on is_guest_mode().  Though we probably nee=
d a
wrapper to handle any commonalities between nVMX and nSVM.

> What do you think? I can prepare a patch for this.

As above, this is what I tried to do, sort of.  Though it's obviously broke=
n.  We
don't need a full dry-run because KVM only needs to detect events that are =
unique
to L2, e.g. nVMX's preemption timer, MTF, and pending virtual interrupts (h=
mm,
I suspect nSVM's vNMI is broken too).  Things like INIT and SMI don't requi=
re
nested virtualization awareness because the event itself is tracked for the=
 vCPU
as a whole.

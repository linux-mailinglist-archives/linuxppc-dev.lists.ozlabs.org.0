Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F0812190
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:35:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3ZMa644B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9LB5BPbz3dWr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:35:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3ZMa644B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=jmattson@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9Fp6SN2z3cXb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:31:58 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so4886a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702506714; x=1703111514; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PgJaJWhApgF9FmIhLYdcKhchOF9hVT1X2VoAnpn0Ao=;
        b=3ZMa644BQl0yWlsr87FQDBnPcX1LVCnTghiT1SJZGn/3csEbcSf9xrBX0hgtoCx8+Z
         mm5mwoI5NN4iz0TkvVBn71XOmGIEuEyQT6QuuV4OZYlVzHhQFlCbP5SWM+rsSY7yOMlg
         aJq/SqB36APrZF5hWls+qZfv9PY0sTTEYID6GxD070zuuYzXYW/pVY2jXa0WIuEaD2MH
         3+oEgpgKLvf4mPnB0VNeRtcRK7O8BupqBBT+GwnV74P5MmzuUpny/fm7Sv1BVRJJvUPk
         1d878NV/0WwXHjITqBE/0OA4ywHLbCLfcVc/b0c7URWYPa/9QGoOJAvry1hWmDP6OqQv
         sOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506714; x=1703111514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PgJaJWhApgF9FmIhLYdcKhchOF9hVT1X2VoAnpn0Ao=;
        b=I+GgTv9LKoadggrUUvM+aVvBoFTrMQVSjgfjcpPEERd4AWCTwpwmNRzWEIYRBEVQD+
         pF4E1DLU32vP2GwFS/22K2UdghiKBg8bOv76MADK6UwoVJYLdjOfLlPZcK9vLFcYRRpW
         K3siTgz7LTfpiJ9HueF2B42WrZ9zzap50z3OtocM/LRnd1BZ4aA2ZtnPBLFjplVnuncA
         xX3vUTqUM+8nWAzfWDSeAq1yNteJG3iXxEFxWmusaP3ekZVBCrdfZbc24ncHXjRp56FY
         JT+Y9blFUtL5OKHvbW4xCAROj69QYGwa/+E3qwwmnQC50iROLnRRuIwItMOkVBX0w1SQ
         i1ug==
X-Gm-Message-State: AOJu0Yyk3SHarisppFdjMbDIBJKfFd/+Hb9p3+vpTLyBJ2HUSkAyHXlX
	3nI9DHo2HH1Pso9wizno5Rf+fmxOnjnHcVTDl6XWPQ==
X-Google-Smtp-Source: AGHT+IETGng/qZp64XWpPY6SM575xAjiFlUFwCCdv1u6UWr+/vXroByM0/GH9N8F8x7DGSWZmaydB5N9a7FN1v/1FZ8=
X-Received: by 2002:a05:6402:35c5:b0:551:9870:472 with SMTP id
 z5-20020a05640235c500b0055198700472mr314909edc.1.1702506714443; Wed, 13 Dec
 2023 14:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
 <ZXh8Nq_y_szj1WN0@google.com> <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
In-Reply-To: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 13 Dec 2023 14:31:40 -0800
Message-ID: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, david@redhat.com, atishp@atishpatra.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, paul.walmsley@sifive.com, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 13, 2023 at 2:25=E2=80=AFPM Maxim Levitsky <mlevitsk@redhat.com=
> wrote:
>
> On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> > On Sun, Dec 10, 2023, Jim Mattson wrote:
> > > On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > > Doh.  We got the less obvious cases and missed the obvious one.
> > > >
> > > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interr=
upt().  That
> > > > thing should really be folded into vmx_has_nested_events().
> > > >
> > > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing becau=
se that
> > > > specifically checks if L1 interrupts are blocked.
> > > >
> > > > Compile tested only, and definitely needs to be chunked into multip=
le patches,
> > > > but I think something like this mess?
> > >
> > > The proposed patch does not fix the problem. In fact, it messes thing=
s
> > > up so much that I don't get any test results back.
> >
> > Drat.
> >
> > > Google has an internal K-U-T test that demonstrates the problem. I
> > > will post it soon.
> >
> > Received, I'll dig in soonish, though "soonish" might unfortunately mig=
ht mean
> > 2024.
> >
>
> Hi,
>
> So this is what I think:
>
>
> KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
> to check if nested APICv has a pending interrupt before halting.
>
>
> However the problem is bigger - with APICv we have in essence 2 pending i=
nterrupt
> bitmaps - the PIR and the IRR, and to know if the guest has a pending int=
errupt
> one has in theory to copy PIR to IRR, then see if the max is larger then =
the current PPR.
>
> Since we don't want to write to guest memory, and the IRR here resides in=
 the guest memory,
> I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_=
interrupt' and call
> it from  kvm_guest_apic_has_interrupt().
>
> What do you think? I can prepare a patch for this.
>
> Can you share a reproducer or write a new one that can be shared?

See https://lore.kernel.org/kvm/20231211185552.3856862-1-jmattson@google.co=
m/.

> Best regards,
>         Maxim Levitsky
>

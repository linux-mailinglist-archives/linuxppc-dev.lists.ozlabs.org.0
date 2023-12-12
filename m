Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9780F0D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 16:29:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K/YBQJSN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqMx44sLRz3cV1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 02:29:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K/YBQJSN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3n3x4zqykdeqykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqMwH0Blfz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 02:29:01 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5e1b9b10dc0so13156837b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 07:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702394936; x=1702999736; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESTPXNxaOVzfRXXRx0Fvol8yzry2uxBEEuLKqef2q4U=;
        b=K/YBQJSNUdoEScEmzo3yOC+8yzKhthy590tOqmKlo/4C/5LuRJZ95FFux5GjOuPWTS
         afszLfW1i6JlhbwT8yGHftc8guETFXYLrEyxLtAsvEJ+24x7X8lpQg7FElwKGrtpyPvY
         E7GLdsYHP0EyXVDpV4CPtvYWm75NgNiN0s7VUVcW+Eh8MtPKjrmyALh7qYzNCFWpnxIJ
         8JGQ9aasswqwCtSv7d0KFoktlDao1xheq1JnfsGBCkY5pR0tfb96b49TmoHG/lxP/sex
         62myLqfrAenzxymR0VRd2GLFsu5lxV1r5R17hBwGk15xs1t/DR37hi3axgjQGc0Dfsm3
         cOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394936; x=1702999736;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ESTPXNxaOVzfRXXRx0Fvol8yzry2uxBEEuLKqef2q4U=;
        b=nVZLfrbv9Tg9hqXG/N73mWYw1jb5mznpfoUFEkyjo1GQ0rSWYBSSMlaGvkSjwIiBeJ
         QJuGwL7/deKCzbpfWU01OcFKU9OTbzAa0gfi8D8GcYHn6vJbCb0oAHV/vaArjLl2hqck
         LRwznIVF9jqNmi3oDQw4AMGRASeo7CMtyYORz/NhNFJJw1tK5E4MAzjQIW93Yo5bkD6x
         KTl2UADOXwCnvI0Hw9Q0m1+/eFcQbVQr5vYfXe4sY1dGimQ71HjpeiOPTf9p3j3RQUiy
         U1d4ZCAAWFbvIKNAy9DTF7pHmAzZS+HXuA4rGZpoyBlGOKldAeo/fONmdSFdKVdSwzMr
         b4bg==
X-Gm-Message-State: AOJu0YyaofFvCcGQkpkk/AzQDZZaAkuxbzxJmZgtqJ+owWdHQk80t5E7
	vbqEnXBu1/mo7Av4uydOOQikd0Sy/Qo=
X-Google-Smtp-Source: AGHT+IHBX6jt6VDhWuABWGol0Nx+Ii84S8r8nT9g/gNamSIHnZwQhzhs+bFmpCR2BuKO/hKALNdpvESE74w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:db94:0:b0:db4:7ac:fea6 with SMTP id
 g142-20020a25db94000000b00db407acfea6mr41805ybf.7.1702394935890; Tue, 12 Dec
 2023 07:28:55 -0800 (PST)
Date: Tue, 12 Dec 2023 07:28:54 -0800
In-Reply-To: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Message-ID: <ZXh8Nq_y_szj1WN0@google.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, atishp@atishpatra.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, mlevitsk@redhat.com, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, paul.walmsley@sifive.com, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 10, 2023, Jim Mattson wrote:
> On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> > Doh.  We got the less obvious cases and missed the obvious one.
> >
> > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt(=
).  That
> > thing should really be folded into vmx_has_nested_events().
> >
> > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because t=
hat
> > specifically checks if L1 interrupts are blocked.
> >
> > Compile tested only, and definitely needs to be chunked into multiple p=
atches,
> > but I think something like this mess?
>=20
> The proposed patch does not fix the problem. In fact, it messes things
> up so much that I don't get any test results back.

Drat.

> Google has an internal K-U-T test that demonstrates the problem. I
> will post it soon.

Received, I'll dig in soonish, though "soonish" might unfortunately might m=
ean
2024.

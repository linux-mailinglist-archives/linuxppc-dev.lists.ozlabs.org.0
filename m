Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5281082D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 03:22:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pjdRffJw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqfQh4XkNz3bsX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 13:22:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pjdRffJw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3srv5zqykdio6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqfPr0yzqz3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 13:22:06 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-28ae055169eso111586a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 18:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702434122; x=1703038922; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3dbLwG3pwrVNc+flPqWL0ROEahdeYkxOItBObS2igQ=;
        b=pjdRffJwjugT+tlgaE1SE+3qb3h44q6XLCeUscKsqyMusP8qKln4mfLW9ib6uEOzeC
         eOmZGVGkivT4SRK5vodO/kE7Mgm31Fk3FwUVYrBp1xhCdVTtENAN0nFXB3KmnXGkgToN
         mWRYjPKKXX56K1FKtM0DetdU3UzYtF7pwFhjUPCh0ZPBA5JuebSasF20Qgbba5K+nlB8
         ywToeQOVSDL8wpTIyTDkhEkBNzeiLOsrGATZb9yWgXNQjVOV82gjQBLmqoAbrKbLwe7G
         iYFZrqhurZhg3RGw4jAvKWwVLymfLStpmnXHpQSzffMZx+76ujdqtaTbA8T3DTXUtsgu
         I1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702434122; x=1703038922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3dbLwG3pwrVNc+flPqWL0ROEahdeYkxOItBObS2igQ=;
        b=CWBPNShM+IAgQJLeF5t6dn0zrVCnJzbLkSLBlejP1ykzaZINwzU17Tb1mdv+Wxe64y
         L64rFoGJJ8P9mFufmiHGg4Ub7sbmWGrByfqKe+HuAZG7LD5DJYzgrT+Ld2hgs9+PNbsQ
         PqBeC4X/85SLDlMw8hoxw1pNO60ACFzVT0ngTo0sjz6eC4+yEl//7/KxAMcEwVvOl3ei
         lrPQ1F/ZMAXFpYAw2ZDeFhOVuYD3TCHE3Jp/JS8fMippmpyHllyC3CrJyFHfhETZsrXu
         ZVo0+btrfInmfy5YmAHarIjAdML+WDlkD2sHLFgtmdtiCKqopsjqaCKXnNQ4fl1SOM6K
         m45A==
X-Gm-Message-State: AOJu0Yxb7rWJ88l+/+mcJguptUxSIs6IE2k/90D9dfgG9emLgXdEB4hB
	lPnXqa05Rt01R1rnwKtY6ZPiHHR8Pb4=
X-Google-Smtp-Source: AGHT+IEMdNbXZWy9ISUMeWXjYiRzXRSqXuBEtLtB2quA6rPLGk41btEuk2vriof3H/B+MEphfzV6B3hdgbQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c9:b0:1d0:cd87:64dd with SMTP id
 u9-20020a17090341c900b001d0cd8764ddmr52067ple.3.1702434121579; Tue, 12 Dec
 2023 18:22:01 -0800 (PST)
Date: Tue, 12 Dec 2023 18:22:00 -0800
In-Reply-To: <20231203140756.GI1489931@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca> <ZQhxpesyXeG+qbS6@google.com>
 <20230918160258.GL13795@ziepe.ca> <ZWp_q1w01NCZi8KX@google.com> <20231203140756.GI1489931@ziepe.ca>
Message-ID: <ZXkVSKULLivrMkBl@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 03, 2023, Jason Gunthorpe wrote:
> On Fri, Dec 01, 2023 at 04:51:55PM -0800, Sean Christopherson wrote:
> 
> > There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
> > of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
> > still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
> > into freed code.  To fix that, KVM would also need to pass along a module pointer :-(
> 
> Maybe we should be refcounting the struct file not the struct kvm?
> 
> Then we don't need special helpers and it keeps the module alive correctly.

Huh.  It took my brain a while to catch up, but this seems comically obvious in
hindsight.  I *love* this approach, both conceptually and from a code perspective.

Handing VFIO (and any other external entities) a file makes it so that KVM effectively
interacts with users via files, regardless of whether the user lives in userspace
or the kernel.  That makes it easier to reason about the safety of operations,
e.g. in addition to ensuring KVM-the-module is pinned, having a file pointer allows
KVM to verify that the incoming pointer does indeed represent a VM.  Which isn't
necessary by any means, but it's a nice sanity check.

From a code perspective, it's far cleaner than manually grabbing module references,
and having only a file pointers makes it a wee bit harder for non-KVM code to
poke into KVM, e.g. keeps us honest.

Assuming nothing blows up in testing, I'll go this route for v2.

Thanks!

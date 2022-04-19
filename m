Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB656507214
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 17:46:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjSpS60s3z2xBv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 01:46:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nllDsrmM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=nllDsrmM; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjSnm5Mtcz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 01:46:02 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id l127so6951893pfl.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hcC70nEaEjCrZOBwR+bHJFoY8sXKM5tdaihGvVikeUA=;
 b=nllDsrmMLB7AAvdsCYhHwzGAwZygD09xcbijCyvxam19T71okMswczeidyoTR5SpG0
 rh2btGFKQ8mFqLW0jb05ZgH7OBBqFC3qd+RSoYqhjbcOEfsOApUER19sCRfFMfoBIpEI
 yKTQvKsy4m5GlAWzFu8NEv3LhxslcTTwe6M8afBDFsE8xE+g+gSVzSH2Y6X7wQTu3bZ0
 kdi4zB98HqqFf25muMksptD1m9ilqCPvrI6q21hqYsF4bYqxNptCkUe1YhNdH7I5dLV1
 d2lkK/LTT2KCvd4gEIWUsK4t0WNBMIpaja6VIf/jz4mIVCTT2/Ja8zo91SL4YY1Ex4Nu
 siWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hcC70nEaEjCrZOBwR+bHJFoY8sXKM5tdaihGvVikeUA=;
 b=XwpRLaHL1slU8jboBcMl1891ET0HTC3DTZJFsiUzahrU7EKeKR5Ry/CvNDY1l4isSI
 SsRDSewTD7vCCqkbnvEURQdCvmkKFI//yHWnMxBqgGnOEabHHw4Hx9RsfBFlac/i3lHI
 su6fZTWzuL/H7rZmgULDTPP+uv3t8XgFK7PP+yNqxEz9dxhs0ruwWLunDaxjcXRbQItl
 vi0yaLrMH1nFsvKz17fYIK4q+F3qwjefzO7xOjNF2N1CzhJt2mdY163WUHUOFhL7v1NH
 mhLN1xtPmcnBk8K+LNI8uuZV00FmeGmJMjzGlpaBGQknp/81MR4bac3ufu7qkR67sTD5
 0Bwg==
X-Gm-Message-State: AOAM530fOEDS8I3Oatvx7tvBy2n8uBGm4wlaV1Z5MmDd6aDQPOYOc8Lj
 s9LuNAhfWmApOus1+qfVqqTumQ==
X-Google-Smtp-Source: ABdhPJxyLXIANNTGiAZfsu1/QG9UANwG5wKin3TjbnrIzeNo7+Th34xV36A6olC5ZeEiVQzlg55+OQ==
X-Received: by 2002:a05:6a00:b4d:b0:509:1ed1:570e with SMTP id
 p13-20020a056a000b4d00b005091ed1570emr18500672pfo.19.1650383157493; 
 Tue, 19 Apr 2022 08:45:57 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 z4-20020a17090a66c400b001d0e448810asm13613064pjl.36.2022.04.19.08.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:45:56 -0700 (PDT)
Date: Tue, 19 Apr 2022 15:45:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 3/3] KVM: Add helpers to wrap vcpu->srcu_idx and yell if
 it's abused
Message-ID: <Yl7ZMJ/takmHh7tY@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-4-seanjc@google.com>
 <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Wanpeng Li <wanpengli@tencent.com>,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Joerg Roedel <joro@8bytes.org>, Atish Patra <atishp@atishpatra.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 19, 2022, Maxim Levitsky wrote:
> On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> > Add wrappers to acquire/release KVM's SRCU lock when stashing the index
> > in vcpu->src_idx, along with rudimentary detection of illegal usage,
> > e.g. re-acquiring SRCU and thus overwriting vcpu->src_idx.  Because the
> > SRCU index is (currently) either 0 or 1, illegal nesting bugs can go
> > unnoticed for quite some time and only cause problems when the nested
> > lock happens to get a different index.
> > 
> > Wrap the WARNs in PROVE_RCU=y, and make them ONCE, otherwise KVM will
> > likely yell so loudly that it will bring the kernel to its knees.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---

...

> Looks good to me overall.
> 
> Note that there are still places that acquire the lock and store the idx into
> a local variable, for example kvm_xen_vcpu_set_attr and such.
> I didn't check yet if these should be converted as well.

Using a local variable is ok, even desirable.  Nested/multiple readers is not an
issue, the bug fixed by patch 1 is purely that kvm_vcpu.srcu_idx gets corrupted.

In an ideal world, KVM would _only_ track the SRCU index in local variables, but
that would require plumbing the local variable down into vcpu_enter_guest() and
kvm_vcpu_block() so that SRCU can be unlocked prior to entering the guest or
scheduling out the vCPU.

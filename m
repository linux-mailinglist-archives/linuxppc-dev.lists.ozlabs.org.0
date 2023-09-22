Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E37AB3B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 16:31:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RH5RhQAG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsZTJ41jxz3ckj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 00:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RH5RhQAG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3d6unzqykdl4wierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsZSN2TYjz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 00:30:42 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c40ac5b6e7so17775075ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 07:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695393040; x=1695997840; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KA5pwz3/DRQHr6a2ee4M3bjnbEYA57TwsoBM67hI6zU=;
        b=RH5RhQAG1t6V79vFQ8evay7v83cOPwdLthgeNEoQMqKoQSnEUSg5JFjgtrQgw3Bjku
         qBhZBukfBeL8QuD1DgocUxz6Cb6AhYDF/34ImFRsjwtCRiBdr44jXFb3jVakxN+/eXEn
         cg2KTseNljg/wbOby6a/6cMIj7fcz/tg56hXo8k93Y0daICnRTYhrsPyOSlPwuBLQZFZ
         3Keh7iSMmtxNI/Ggvpf/r6EeqCea22YxUJqn1iZk06CaOkwl/WuyV9OLFnCsirmEWqlv
         57TUmU+0y//X30/39QTez1pw7bdEWCS91OkuHhtR6+Qd8SssUXdRwGBvStAUQVSGFQ/c
         d1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695393040; x=1695997840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KA5pwz3/DRQHr6a2ee4M3bjnbEYA57TwsoBM67hI6zU=;
        b=k/OObnDALy+CRuEhvRdZGyPx5qRQKx1YdTyfgXni3Ezb46kPyTzWFvPgRlXjd+1AiL
         Dz4J6/3H6/WTDUV0NZBB1+ESgvZOf9gP8FPI1f2qAMuDQNVNcgX0ZuS3Z+52mnwNnOQW
         fTu93trW50TdWrwXqagGbvB/E1BuIk4XjakFw8hW0MiAmPUJ9Lq41jOolgnVt82K82Km
         xKi+CYT1BJDt+3e4FIK6tlXPqda1qTFWhoEReQ1VO4WM7YqMGzgpYzsdav57eJBbpR8+
         Rxtj9cKkcefJv7B3djpAwn07UddEml5q4Nx9BZqqCvjcocehM3c/bCCieorExisFxViB
         qePg==
X-Gm-Message-State: AOJu0YxFuw39EdgJAeV2cHyfNQgP5HIQ2LgsyyIg74oV1XlHuD4CfizL
	ccdll60aeAL1srNuiMQdWy5Muni7Mlo=
X-Google-Smtp-Source: AGHT+IE7TdAMSox3QZ9i3XY42vmW+YqwJtHLDXCrkzOQDSyIHqr/K/m4w9DaaKuedrPKXRX2zXN/sfp+lRA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:1cf:b0:1b9:df8f:888c with SMTP id
 e15-20020a17090301cf00b001b9df8f888cmr102903plh.8.1695393039713; Fri, 22 Sep
 2023 07:30:39 -0700 (PDT)
Date: Fri, 22 Sep 2023 07:30:38 -0700
In-Reply-To: <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com>
Message-ID: <ZQ2lDk3iOEz8NNg0@google.com>
Subject: Re: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023, Xiaoyao Li wrote:
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> > 
> > Add a new KVM exit type to allow userspace to handle memory faults that
> > KVM cannot resolve, but that userspace *may* be able to handle (without
> > terminating the guest).
> > 
> > KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
> > conversions between private and shared memory.  With guest private memory,
> > there will be  two kind of memory conversions:
> > 
> >    - explicit conversion: happens when the guest explicitly calls into KVM
> >      to map a range (as private or shared)
> > 
> >    - implicit conversion: happens when the guest attempts to access a gfn
> >      that is configured in the "wrong" state (private vs. shared)
> > 
> > On x86 (first architecture to support guest private memory), explicit
> > conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
> 
> side topic.
> 
> Do we expect to integrate TDVMCALL(MAPGPA) of TDX into KVM_HC_MAP_GPA_RANGE?

Yes, that's my expectation.

> > but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
> > as there is (obviously) no hypercall, and there is no guarantee that the
> > guest actually intends to convert between private and shared, i.e. what
> > KVM thinks is an implicit conversion "request" could actually be the
> > result of a guest code bug.
> > 
> > KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
> > be implicit conversions.
> > 
> > Place "struct memory_fault" in a second anonymous union so that filling
> > memory_fault doesn't clobber state from other yet-to-be-fulfilled exits,
> > and to provide additional information if KVM does NOT ultimately exit to
> > userspace with KVM_EXIT_MEMORY_FAULT, e.g. if KVM suppresses (or worse,
> > loses) the exit, as KVM often suppresses exits for memory failures that
> > occur when accessing paravirt data structures.  The initial usage for
> > private memory will be all-or-nothing, but other features such as the
> > proposed "userfault on missing mappings" support will use
> > KVM_EXIT_MEMORY_FAULT for potentially _all_ guest memory accesses, i.e.
> > will run afoul of KVM's various quirks.
> 
> So when exit reason is KVM_EXIT_MEMORY_FAULT, how can we tell which field in
> the first union is valid?
> 
> When exit reason is not KVM_EXIT_MEMORY_FAULT, how can we know the info in
> the second union run.memory is valid without a run.memory.valid field?

I'll respond to this separately with a trimmed Cc list.  I suspect this will be
a rather lengthy conversation, and it has almost nothing to do with guest_memfd.

> > +Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
> > +accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
> > +or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
> > +kvm_run.exit_reason is stale/undefined for all other error numbers.
> > +
> 
> Initially, this section is the copy of struct kvm_run and had comments for
> each field accordingly. Unfortunately, the consistence has not been well
> maintained during the new filed being added.
> 
> Do we expect to fix it?

AFAIK, no one is working on cleaning up this section of the docs, but as always,
patches are welcome :-)

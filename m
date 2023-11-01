Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990037DE572
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 18:37:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KF63XbBN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLDjd3wp8z3cTT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 04:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KF63XbBN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3syxczqykdayykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLDhk2DqDz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 04:36:52 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da03ef6fc30so5047276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698860210; x=1699465010; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5pPv4/g+I3C3eNDgudVhrFstr6S8Xmtwrf0OlljDI=;
        b=KF63XbBNyBeFoxA9ahqEkDM2XPg7vs3nkktkVRtyAScvCj4RBMgzGNqKbq/LJeuquC
         pmNjssciaOSs659CT4IYAtg11oclMCNcaCiCGE+K07dNuGgcEZ+Ouo7KAOTDSCTn//o3
         uDRBhP4nVp8WPlMso6uNqoKaQwhdPC6nscVJRW+3NIGtFWcSZK7d89PPS3sxoYJ/5wew
         u05tzgez0I5uXp+4T5NkqiXLyV6702DnJDOrf1N1XvkCTF2g6wRyBeMujy15Drg+SfG3
         81KwT3Jo7KAn9EJHDUxEGpw/LnrjeokOdhQgUwD3BMfpUkNZQWp6rcnfRWREcqu/ECFc
         9RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698860210; x=1699465010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5pPv4/g+I3C3eNDgudVhrFstr6S8Xmtwrf0OlljDI=;
        b=Z5dYE2pgIaby9F8Adb92QlAAggtCVQgcwtVvr5eA1jlBsel5cabfqTv/1jyJbLn89/
         xmVwWGPdZG//Zdq7SWfa4OqIrhJFoP0rd5fmI6sEOHB3u3zJxGejJbuomjfAYLOj79BL
         u/+MKL9goTaobcroPpK8tOhXJBlqp3MRohzb6BXwyYRcrikvvDL/C+nn3G37fogy0zb2
         jauJlS6NMSYzvgNkItuWr7/lWw5gdaY9CL93Pt81zhTOj/VSKVnKiSfi9Axqv9SVRiW8
         HE/cH2SGLWVS1J/llnWOzbYuhAS0bv+aXM2vEkNMnYU7N4lZXMp86VXYIqlOuWq+RvsL
         Gfpg==
X-Gm-Message-State: AOJu0YykZfjrF9/sBvb2CjN6gOLZv25R4VATWRb1gpgLY9wPYRvZMjaN
	pJyPTYHulmFjCQhWtHSGSXgQfWYKDp0=
X-Google-Smtp-Source: AGHT+IG/a6Sj0mASs5/8PEJQnR69sSphX+9SHKWYEjRPOLGEF4l6c52AgzjYtmdhHr7JL68mzkGP7JI8NEg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:168c:b0:da0:3e46:8ba5 with SMTP id
 bx12-20020a056902168c00b00da03e468ba5mr304342ybb.8.1698860209654; Wed, 01 Nov
 2023 10:36:49 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:36:48 -0700
In-Reply-To: <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
Message-ID: <ZUKMsOdg3N9wmEzy@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "willy@infradead.org" <willy@infradead.org>, Wei W Wang <wei.w.wang@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "michael.roth@amd.com" <michael.roth@amd.com>, "ackerleytng@google.com" <ackerleyt
 ng@google.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "mic@digikod.net" <mic@digikod.net>, "tabba@google.com" <tabba@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, "brauner@kernel.org" <brauner@kernel.org>, "qperret@google.com" <qperret@google.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "dmatlack@google.com" <dmatlack@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "amoorthy@google.com" <amoorthy@google.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, "linuxppc-dev@list
 s.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Yilun Xu <yilun.xu@intel.com>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 01, 2023, Kai Huang wrote:
> 
> > +7.34 KVM_CAP_MEMORY_FAULT_INFO
> > +------------------------------
> > +
> > +:Architectures: x86
> > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > +
> > +The presence of this capability indicates that KVM_RUN will fill
> > +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
> > +there is a valid memslot but no backing VMA for the corresponding host virtual
> > +address.
> > +
> > +The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
> > +an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
> > +to KVM_EXIT_MEMORY_FAULT.
> 
> IIUC returning -EFAULT or whatever -errno is sort of KVM internal
> implementation.

The errno that is returned to userspace is ABI.  In KVM, it's a _very_ poorly
defined ABI for the vast majority of ioctls(), but it's still technically ABI.
KVM gets away with being cavalier with errno because the vast majority of errors
are considered fatal by userespace, i.e. in most cases, userspace simply doesn't
care about the exact errno.

A good example is KVM_RUN with -EINTR; if KVM were to return something other than
-EINTR on a pending signal or vcpu->run->immediate_exit, userspace would fall over.

> Is it better to relax the validity of kvm_run.memory_fault when
> KVM_RUN returns any -errno?

Not unless there's a need to do so, and if there is then we can update the
documentation accordingly.  If KVM's ABI is that kvm_run.memory_fault is valid
for any errno, then KVM would need to purge kvm_run.exit_reason super early in
KVM_RUN, e.g. to prevent an -EINTR return due to immediate_exit from being
misinterpreted as KVM_EXIT_MEMORY_FAULT.  And purging exit_reason super early is
subtly tricky because KVM's (again, poorly documented) ABI is that *some* exit
reasons are preserved across KVM_RUN with vcpu->run->immediate_exit (or with a
pending signal).

https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com

> [...]
> 
> 
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
> >  /* Max number of entries allowed for each kvm dirty ring */
> >  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
> >  
> > +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > +						 gpa_t gpa, gpa_t size)
> > +{
> > +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> > +	vcpu->run->memory_fault.gpa = gpa;
> > +	vcpu->run->memory_fault.size = size;
> > +
> > +	/* Flags are not (yet) defined or communicated to userspace. */
> > +	vcpu->run->memory_fault.flags = 0;
> > +}
> > +
> 
> KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
> <asm/kvm_host.h>?

I'd prefer to keep it in generic code, as it's highly likely to end up there
sooner than later.  There's a known use case for ARM (exit to userspace on missing
userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.

[*] https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com

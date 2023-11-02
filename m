Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD17DF730
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 16:57:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wyj2cOzU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLpRg4RkSz3dHR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 02:57:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wyj2cOzU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3vmzdzqykdik5rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLpQm34Q6z3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 02:56:48 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da1aa98ec19so1349587276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698940605; x=1699545405; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYwIeNUmcSQVXWofeU45UHS4WNGoW8dkX+AiEs9OLu8=;
        b=Wyj2cOzUANgXy4q6LVAN27yM+elGFARnCrTBLUVbAfiXhO2m9J++oBN2qtHS2oNvW6
         gRUpHfMZRaY8sFwonkhTaxDlNr4in5dkLS4GMI/zID1Obza7B0kBBzq4qfG2bkYs0kUt
         KAiW8Dav89diIARDOWFr7CgK5+YSgO6QhzDirzbKl5cnXhZuOtjYUbsehS5x5E3sU9GL
         HwHdohwm/xb1FL1oWu2j4Ad0HEX7G2LA13vxgYoW5AsNKsceT7LC5wyH/u/WlhxDrUIR
         LyM+aiONNbQ8P8vK7/u190Erp/Z9QgwP4sZiTqGxSGjkqGpA5n6rYTTPkhyvlWgjkd1U
         yK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940605; x=1699545405;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sYwIeNUmcSQVXWofeU45UHS4WNGoW8dkX+AiEs9OLu8=;
        b=kFPYV8yuw8SFgHnKBWqdddiiqO8oNNBOwvhWFYiBJ/H3HaHNXG39l/a8h4mGio8JX0
         f1UEVI4y6dOFW8m9iYtMASCW3e7zbzyMRWAAOy+0Y6ayQZgCcAvQVJ5+C2+FmWRzvG6j
         NLNz96EmpAXzt+hL9YjC6O991Hhn0emrAFio5l7KcjI18Nk6dtFv3XZELVEyakggMF7p
         EG/x4I3Uw7s4RPQeJMdRGFi/DD9dy6roEMfl0riBrlI6sjSkkesTbUup6KP1aiua2Sdp
         HRSiuDadlQnjeBeZ0L4596SsAMlg2bUI8TeWJjHs4OjcF8EJn/oq3Xr5NnLPglvCgIY7
         NtLA==
X-Gm-Message-State: AOJu0YzzlD2VNUEMuIBP28XObilFsE+CcdaDbT/GPhlZbvDT6kbOWylk
	PFsiYEBlv34j33+wWMlhcxOhEHoMsks=
X-Google-Smtp-Source: AGHT+IGZwkk8ZQOm5+11CB83zMzVhzLYncHDWYhyGGxNXJ5R5wT9b6yT+r/XAOkVnZeNHiaSF1GNxI0NkwA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:aae7:0:b0:da0:5a30:6887 with SMTP id
 t94-20020a25aae7000000b00da05a306887mr349504ybi.4.1698940604877; Thu, 02 Nov
 2023 08:56:44 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:56:43 -0700
In-Reply-To: <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Message-ID: <ZUPGu6jroYv3KFPv@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "mic@digikod.net" <mic@digikod.net>, "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "willy@infradead.org" <willy@infradead.org>, Wei W Wang <wei.w.wang@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "michael.roth@amd.com" <michael.roth@amd.com>, "ackerleytng@google.com" <ackerleytng@g
 oogle.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tabba@google.com" <tabba@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, "brauner@kernel.org" <brauner@kernel.org>, "qperret@google.com" <qperret@google.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "dmatlack@google.com" <dmatlack@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.
 com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Yilun Xu <yilun.xu@intel.com>, "amoorthy@google.com" <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, Kai Huang wrote:
> On Wed, 2023-11-01 at 10:36 -0700, Sean Christopherson wrote:
> > On Wed, Nov 01, 2023, Kai Huang wrote:
> > >=20
> > > > +7.34 KVM_CAP_MEMORY_FAULT_INFO
> > > > +------------------------------
> > > > +
> > > > +:Architectures: x86
> > > > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > > > +
> > > > +The presence of this capability indicates that KVM_RUN will fill
> > > > +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-E=
xit, e.g. if
> > > > +there is a valid memslot but no backing VMA for the corresponding =
host virtual
> > > > +address.
> > > > +
> > > > +The information in kvm_run.memory_fault is valid if and only if KV=
M_RUN returns
> > > > +an error with errno=3DEFAULT or errno=3DEHWPOISON *and* kvm_run.ex=
it_reason is set
> > > > +to KVM_EXIT_MEMORY_FAULT.
> > >=20
> > > IIUC returning -EFAULT or whatever -errno is sort of KVM internal
> > > implementation.
> >=20
> > The errno that is returned to userspace is ABI.  In KVM, it's a _very_ =
poorly
> > defined ABI for the vast majority of ioctls(), but it's still technical=
ly ABI.
> > KVM gets away with being cavalier with errno because the vast majority =
of errors
> > are considered fatal by userespace, i.e. in most cases, userspace simpl=
y doesn't
> > care about the exact errno.
> >=20
> > A good example is KVM_RUN with -EINTR; if KVM were to return something =
other than
> > -EINTR on a pending signal or vcpu->run->immediate_exit, userspace woul=
d fall over.
> >=20
> > > Is it better to relax the validity of kvm_run.memory_fault when
> > > KVM_RUN returns any -errno?
> >=20
> > Not unless there's a need to do so, and if there is then we can update =
the
> > documentation accordingly.  If KVM's ABI is that kvm_run.memory_fault i=
s valid
> > for any errno, then KVM would need to purge kvm_run.exit_reason super e=
arly in
> > KVM_RUN, e.g. to prevent an -EINTR return due to immediate_exit from be=
ing
> > misinterpreted as KVM_EXIT_MEMORY_FAULT.  And purging exit_reason super=
 early is
> > subtly tricky because KVM's (again, poorly documented) ABI is that *som=
e* exit
> > reasons are preserved across KVM_RUN with vcpu->run->immediate_exit (or=
 with a
> > pending signal).
> >=20
> > https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com
> >=20
> >=20
>=20
> Agreed with not to relax to any errno.  However using -EFAULT as part of =
ABI
> definition seems a little bit dangerous, e.g., someone could accidentally=
 or
> mistakenly return -EFAULT in KVM_RUN at early time and/or in a completely
> different code path, etc. =C2=A0-EINTR has well defined meaning, but -EFA=
ULT (which
> is "Bad address") seems doesn't but I am not sure either. :-)

KVM has returned -EFAULT since forever, i.e. it's effectively already part =
of the
ABI.  I doubt there's a userspace that relies precisely on -EFAULT, but use=
rspace
definitely will be confused if KVM returns '0' where KVM used to return -EF=
AULT.
And so if we want to return '0', it needs to be opt-in, which means forcing
userspace to enable a capability *and* requires code in KVM to conditionall=
y return
'0' instead of -EFAULT/-EHWPOISON.

> One example is, for backing VMA with VM_IO | VM_PFNMAP, hva_to_pfn() retu=
rns
> KVM_PFN_ERR_FAULT when the kernel cannot get a valid PFN (e.g. when SGX v=
epc
> fault handler failed to allocate EPC) and kvm_handle_error_pfn() will jus=
t
> return -EFAULT.  If kvm_run.exit_reason isn't purged early then is it pos=
sible
> to have some issue here?

Well, yeah, but that's exactly why this series has a patch to reset exit_re=
ason.
The solution to "if KVM is buggy then bad things happen" is to not have KVM=
 bugs :-)

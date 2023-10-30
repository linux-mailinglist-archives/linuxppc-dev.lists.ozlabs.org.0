Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF27DBD88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 17:11:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=W32ZIfAp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJyvJ6Tg7z3cb6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 03:11:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=W32ZIfAp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3idu_zqykdgqugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJytR34b7z2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 03:10:53 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da033914f7cso3990933276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698682249; x=1699287049; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/eJ4eIlm/QBKFGigGc88HjjNKR0Bxic1+CMFaJ9ygg=;
        b=W32ZIfApkxl6emJTjs+meBoDMF/VTfA9jKsoJCqXzzDBBdK6g/u8axvtfC14izkwXp
         ISXNrUv/Jz2qrMquD7uqcieMAP2Se0PyPXI+VyJZCb0uCFLolVfJa/W8U8YeAJEYIzfX
         PpkZszS/7lVjsYaNTU4vqnty4Q6yAx5s83I3yZnav2GH18e9g72+tqERcY+so1vDHiqr
         FdZSVTWywPczyPc4eUb3si9x+p1CV+KMJwqVrHorsE3ZJM8P5qMKKEl3ykIaQPL0Gi5t
         xaXyf/6yIzSisB6b6FMPyMxF4pfYlkqdTGOSCNSfshP7IauZeUQlEh1IH+O6iEp7vGM4
         YDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682249; x=1699287049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/eJ4eIlm/QBKFGigGc88HjjNKR0Bxic1+CMFaJ9ygg=;
        b=GD68pblgtvNAOjbEwEsKd4fSuAXWF+6n2jBcCuoR4V/4QMqiu71CCjNXKmpyuErstj
         JJaEMpBIF2sxv4wAKYERs+WvArONit2hJp9w9IXlnvk4XOg1PwOnJJg3sReUSbumz0a4
         2e9w7YBr6VNLcQeNTAm8jtxsUcRu+8qPd0mSJ/gkB69CytR8Vn0fRJS4TdtLP7NrUvA1
         7cSreyR5cXkjTYZ+nNBYg+0fCmjBFIdMTaw6SazeKD8+HZ8SPPkArIIJ35den+RfKH6Q
         cOcMc4Zzj4SAkBww203p1dmtySF1eyP6sV9k+5PYWUWCKuirtm573YgcH8ZZqYXYZyz/
         Vc+w==
X-Gm-Message-State: AOJu0Yyl7a6yXZ+06JkCxJeICMyqEONh6Q3moHcdMeLe9zpK/x+egl0C
	vestiDO4CE3K8rDABUUsvM5JUky5KhY=
X-Google-Smtp-Source: AGHT+IG/nj4LaX3JPzHZqsehR5FWhArOOi7E0ApKeqEkunCLK98IonUlxUU55c5VBDsNlZFSGb1icvfnahw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr243782ybu.7.1698682249642; Mon, 30 Oct
 2023 09:10:49 -0700 (PDT)
Date: Mon, 30 Oct 2023 16:10:48 +0000
In-Reply-To: <ZT9lQ9c7Bik6FIpw@chao-email>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-14-seanjc@google.com>
 <ZT9lQ9c7Bik6FIpw@chao-email>
Message-ID: <ZT_ViJOW1p4TN_fI@google.com>
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023, Chao Gao wrote:
> On Fri, Oct 27, 2023 at 11:21:55AM -0700, Sean Christopherson wrote:
> >From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> >In confidential computing usages, whether a page is private or shared is
> >necessary information for KVM to perform operations like page fault
> >handling, page zapping etc. There are other potential use cases for
> >per-page memory attributes, e.g. to make memory read-only (or no-exec,
> >or exec-only, etc.) without having to modify memslots.
> >
> >Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> >userspace to operate on the per-page memory attributes.
> >  - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> >    a guest memory range.
> 
> >  - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> >    memory attributes.
> 
> This ioctl() is already removed. So, the changelog is out-of-date and needs
> an update.

Doh, I lost track of this and the fixup for KVM_CAP_MEMORY_ATTRIBUTES below.

> >+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> >+:Architectures: x86
> >+:Type: vm ioctl
> >+:Parameters: struct kvm_memory_attributes(in)
> 
> 					   ^ add one space here?

Ah, yeah, that does appear to be the standard.
> 
> 
> >+static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> >+					  struct kvm_gfn_range *range)
> >+{
> >+	/*
> >+	 * Unconditionally add the range to the invalidation set, regardless of
> >+	 * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> >+	 * if KVM supports RWX attributes in the future and the attributes are
> >+	 * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> >+	 * adding the range allows KVM to require that MMU invalidations add at
> >+	 * least one range between begin() and end(), e.g. allows KVM to detect
> >+	 * bugs where the add() is missed.  Rexlaing the rule *might* be safe,
> 
> 					    ^^^^^^^^ Relaxing
> 
> >@@ -4640,6 +4850,17 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> > 	case KVM_CAP_BINARY_STATS_FD:
> > 	case KVM_CAP_SYSTEM_EVENT_DATA:
> > 		return 1;
> >+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> >+	case KVM_CAP_MEMORY_ATTRIBUTES:
> >+		u64 attrs = kvm_supported_mem_attributes(kvm);
> >+
> >+		r = -EFAULT;
> >+		if (copy_to_user(argp, &attrs, sizeof(attrs)))
> >+			goto out;
> >+		r = 0;
> >+		break;
> 
> This cannot work, e.g., no @argp in this function and is fixed by a later commit:
> 
> 	fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")

I'll post a fixup patch for all of these, thanks much!

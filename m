Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D97DCECE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 15:10:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=szmtZSAN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKX9Y2Blmz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 01:10:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=szmtZSAN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3wgpbzqykda05rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKX8k1ZRCz2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 01:10:12 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b0e9c78309so36495267b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761410; x=1699366210; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qnQOjymnTrZBwkJL50GP/1+n+ilT5bo3LZ+viwIL69A=;
        b=szmtZSANeLgEQgNVSNmjd6Qc2fLRkHpYWwSJ7ThX/aIQKaH1C1I4jk89krwFNFEBVK
         fIXO9O1soLLzlyuP1LUIrjrCG+1+3wKoT8zRyPEzZ/pOuQJi3VY/4Z7xiwhPyiPkpsml
         N+PyjCBkmpOMBi7OD0lW144hvE7UOuz+VQqW7TpEsjgoSBxnNd8zrYZa9qdd7Y6HORbn
         1aDp3z+dJ+pbzkKHnSjcWef8kD0SUVhTvfnWA04FeQ4Sel487RFLYq4c6b6Mm7j+2sjb
         JqqxxujpR7lB+7l+YBpIzJc8ZVxxHr2lgk0GUvbaod6z45E/JVg+YnEce1QM8/n2AzwX
         iJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761410; x=1699366210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnQOjymnTrZBwkJL50GP/1+n+ilT5bo3LZ+viwIL69A=;
        b=HxM6yiqCuh3deeZEYgaJFCkay8DENmyiPFqBqj2fBi03zr4obq8nCosX0uzkWmg8EG
         BCwxornHthpPNiIcS8AbEKHpNCZdpz7JB1SwMKWjNSeA4Immstp4pYbVFbrjeKRWzJAB
         ecyKzfR61v/I2xpivmvO68cWd4SAMgg3ZDgLPu1+p6DjaX/y4q1G0LCk1PtOFkDqnplK
         0BL6ZsfxLjydqtgeRzTpw45vAbZJKLFHyijTh20NmnwUk4vFLd5SgJgAc9DnD+wDxhCu
         uNVFRipf6d22lIugn090saewU+tMGyFLfHa2KcOnu9wKCFwkRcSPnlhixwza03+82qyd
         w5AQ==
X-Gm-Message-State: AOJu0YwsWIH+aP1vizM6b8OpnG7MLq+oIQl/xSOZKn9+LRHD7iBJC+6L
	doB6syS08fN+sFYH25Z49xtpjZ4HhaM=
X-Google-Smtp-Source: AGHT+IHZDXQi7UJsz3IrNX3ZHQxUCVwQKR+0lKBMLeJ46WZVaPkGJ08yzTLT3JODvkoGCJ0IGZA0c9r9iJw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a14c:0:b0:59b:eea4:a5a6 with SMTP id
 y73-20020a81a14c000000b0059beea4a5a6mr274540ywg.0.1698761410163; Tue, 31 Oct
 2023 07:10:10 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:10:08 -0700
In-Reply-To: <ZUCe/PGL2Q4OzDOX@chao-email>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUCe/PGL2Q4OzDOX@chao-email>
Message-ID: <ZUEKwOQoibAEWAzU@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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

On Tue, Oct 31, 2023, Chao Gao wrote:
> >+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> >+{
> >+	loff_t size = args->size;
> >+	u64 flags = args->flags;
> >+	u64 valid_flags = 0;
> >+
> >+	if (flags & ~valid_flags)
> >+		return -EINVAL;
> >+
> >+	if (size < 0 || !PAGE_ALIGNED(size))
> >+		return -EINVAL;
> 
> is size == 0 a valid case?

Nope, this is a bug.

> >+	if (!xa_empty(&gmem->bindings) &&
> >+	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> >+		filemap_invalidate_unlock(inode->i_mapping);
> >+		goto err;
> >+	}
> >+
> >+	/*
> >+	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
> >+	 * be see either a NULL file or this new file, no need for them to go
> >+	 * away.
> >+	 */
> >+	rcu_assign_pointer(slot->gmem.file, file);
> >+	slot->gmem.pgoff = start;
> >+
> >+	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
> >+	filemap_invalidate_unlock(inode->i_mapping);
> >+
> >+	/*
> >+	 * Drop the reference to the file, even on success.  The file pins KVM,
> >+	 * not the other way 'round.  Active bindings are invalidated if the
> >+	 * file is closed before memslots are destroyed.
> >+	 */
> >+	fput(file);
> >+	return 0;
> >+
> >+err:
> >+	fput(file);
> >+	return -EINVAL;
> 
> The cleanup, i.e., filemap_invalidate_unlock() and fput(), is common. So, I think it
> may be slightly better to consolidate the common part e.g.,

I would prefer to keep this as-is.  Only goto needs the unlock, and I find it easier
to understand the success vs. error paths with explicit returns.  But it's not a
super strong preference.

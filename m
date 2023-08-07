Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D33807735A9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 03:06:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BwuvQdbC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKZky5K4wz3bdm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BwuvQdbC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3b3nrzaskdgwkmuobvoidxqqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX572McNz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:06:49 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-569e7aec37bso43922757b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691449607; x=1692054407;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7A5aUX2ecj7Bbl/7ce/OdAJyafyQZh2jovAmUQfIOU=;
        b=BwuvQdbCy2eUR+bp2NSDknEVbKVENYiDa6uZlyXUwJVmlF4iKp7HjX09JvbwikelLF
         rKNAwCIOjLOCd9hfp54t7rYGOQkDWMmLVeB7tC4wNPL/xp+tqM5HxKngfQKLrmiljVMH
         iSIS4pBQ45QD1qQyRXNJtH27IiaYgguvgYTqI/+bBLhU+TqFpp7Sutp2QK2jo2kiAyxG
         IG//K3Uxz4ck43yxOcKsJnHFISIoIpmEz14csW59Ae6FEeel85qKxKoUZusz6vFuY6is
         pXI++E1KnyDArrSs+pWezCptJywjGpfbd67K7HxwhlAzqazZgZUp2EXPv3WY6f0/mDR8
         iGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449607; x=1692054407;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h7A5aUX2ecj7Bbl/7ce/OdAJyafyQZh2jovAmUQfIOU=;
        b=STIMZLDRNnDebvJBTcg6iFhXPu2idE9JaFhTgOW1kY/hKHlWeYFqNw1m7YlA2sNzrE
         rZyqg614ymgKqqEe0dUAv9ksk+u4qmCq5FUtQYIN5Oej3nNVelptNz1YS86wXSoEIDsT
         Z7xpDkiw4tk3oNhPZ9yZdpVR1Zk3P6w2yfR8uluKABNqSvrzKzTNtu2YIYm43V1EnJhM
         0U+6ypfINBdTHNwjSBUMkGG+Co7AVAcUFrBf/4myWkMcfzbazTS0CtOOo5DOUo9Dyi3z
         D2+xxAckZY+JK5mYgxMUYWDw1jsPVEH1x3Ygu8Jhqv+W4OUtedtnWJs+ADeQKFvEEx3O
         K0Sg==
X-Gm-Message-State: AOJu0YzYgOOmYQ3KFk+70tmfo6FySRaRty6MXx3+ERav9Hx/w0im0WRE
	UAVfvY5XaMIvvE+jIu3Jg3aLwwMcicgnC25J2A==
X-Google-Smtp-Source: AGHT+IGQixIKGybe4T+GVPibQ4+cbo9epXOA0dv0EjBAf7syaC6i5AoszZ6gyEUK9SdsuOsgoX+oe0ThmUR8eGJG6g==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:dbcf:0:b0:d01:60ec:d0e with SMTP
 id g198-20020a25dbcf000000b00d0160ec0d0emr68969ybf.9.1691449607047; Mon, 07
 Aug 2023 16:06:47 -0700 (PDT)
Date: Mon, 07 Aug 2023 23:06:45 +0000
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:44:55 -0700)
Mime-Version: 1.0
Message-ID: <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Aug 2023 11:05:33 +1000
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

>   <snip>

> +static int kvm_gmem_release(struct inode *inode, struct file *file)
> +{
> +	struct kvm_gmem *gmem =3D file->private_data;
> +	struct kvm_memory_slot *slot;
> +	struct kvm *kvm =3D gmem->kvm;
> +	unsigned long index;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	/*
> +	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
> +	 * reference to the file and thus no new bindings can be created, but
> +	 * dereferencing the slot for existing bindings needs to be protected
> +	 * against memslot updates, specifically so that unbind doesn't race
> +	 * and free the memslot (kvm_gmem_get_file() will return NULL).
> +	 */
> +	mutex_lock(&kvm->slots_lock);
> +
> +	xa_for_each(&gmem->bindings, index, slot)
> +		rcu_assign_pointer(slot->gmem.file, NULL);
> +
> +	synchronize_rcu();
> +
> +	/*
> +	 * All in-flight operations are gone and new bindings can be created.
> +	 * Zap all SPTEs pointed at by this file.  Do not free the backing
> +	 * memory, as its lifetime is associated with the inode, not the file.
> +	 */
> +	kvm_gmem_invalidate_begin(gmem, 0, -1ul);
> +	kvm_gmem_invalidate_end(gmem, 0, -1ul);
> +
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	list_del(&gmem->entry);
> +
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	xa_destroy(&gmem->bindings);
> +	kfree(gmem);
> +
> +	kvm_put_kvm(kvm);
> +
> +	return 0;
> +}
> +

> <snip>

> +
> +int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> +		  unsigned int fd, loff_t offset)
> +{
> +	loff_t size =3D slot->npages << PAGE_SHIFT;
> +	unsigned long start, end, flags;
> +	struct kvm_gmem *gmem;
> +	struct inode *inode;
> +	struct file *file;
> +
> +	BUILD_BUG_ON(sizeof(gfn_t) !=3D sizeof(slot->gmem.pgoff));
> +
> +	file =3D fget(fd);
> +	if (!file)
> +		return -EINVAL;
> +
> +	if (file->f_op !=3D &kvm_gmem_fops)
> +		goto err;
> +
> +	gmem =3D file->private_data;
> +	if (gmem->kvm !=3D kvm)
> +		goto err;
> +
> +	inode =3D file_inode(file);
> +	flags =3D (unsigned long)inode->i_private;
> +
> +	/*
> +	 * For simplicity, require the offset into the file and the size of the
> +	 * memslot to be aligned to the largest possible page size used to back
> +	 * the file (same as the size of the file itself).
> +	 */
> +	if (!kvm_gmem_is_valid_size(offset, flags) ||
> +	    !kvm_gmem_is_valid_size(size, flags))
> +		goto err;
> +
> +	if (offset + size > i_size_read(inode))
> +		goto err;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	start =3D offset >> PAGE_SHIFT;
> +	end =3D start + slot->npages;
> +
> +	if (!xa_empty(&gmem->bindings) &&
> +	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> +		filemap_invalidate_unlock(inode->i_mapping);
> +		goto err;
> +	}
> +
> +	/*
> +	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
> +	 * be see either a NULL file or this new file, no need for them to go
> +	 * away.
> +	 */
> +	rcu_assign_pointer(slot->gmem.file, file);
> +	slot->gmem.pgoff =3D start;
> +
> +	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	/*
> +	 * Drop the reference to the file, even on success.  The file pins KVM,
> +	 * not the other way 'round.  Active bindings are invalidated if the
> +	 * file is closed before memslots are destroyed.
> +	 */
> +	fput(file);
> +	return 0;
> +
> +err:
> +	fput(file);
> +	return -EINVAL;
> +}
> +

I=E2=80=99d like to propose an alternative to the refcounting approach betw=
een
the gmem file and associated kvm, where we think of KVM=E2=80=99s memslots =
as
users of the gmem file.

Instead of having the gmem file pin the VM (i.e. take a refcount on
kvm), we could let memslot take a refcount on the gmem file when the
memslots are configured.

Here=E2=80=99s a POC patch that flips the refcounting (and modified selftes=
ts in
the next commit):
https://github.com/googleprodkernel/linux-cc/commit/7f487b029b89b9f3e9b094a=
721bc0772f3c8c797

One side effect of having the gmem file pin the VM is that now the gmem
file becomes sort of a false handle on the VM:

+ Closing the file destroys the file pointers in the VM and invalidates
  the pointers
+ Keeping the file open keeps the VM around in the kernel even though
  the VM fd may already be closed.

I feel that memslots form a natural way of managing usage of the gmem
file. When a memslot is created, it is using the file; hence we take a
refcount on the gmem file, and as memslots are removed, we drop
refcounts on the gmem file.

The KVM pointer is shared among all the bindings in gmem=E2=80=99s xarray, =
and we can enforce that a gmem file is used only with one VM:

+ When binding a memslot to the file, if a kvm pointer exists, it must
  be the same kvm as the one in this binding
+ When the binding to the last memslot is removed from a file, NULL the
  kvm pointer.

When the VM is freed, KVM will iterate over all the memslots, removing
them one at a time and eventually NULLing the kvm pointer.

I believe the =E2=80=9CKVM=E2=80=99s memslots using the file=E2=80=9D appro=
ach is also simpler
because all accesses to the bindings xarray and kvm pointer can be
serialized using filemap_invalidate_lock(), and we are already using
this lock regardless of refcounting approach. This serialization means
we don=E2=80=99t need to use RCU on file/kvm pointers since accesses are al=
ready
serialized.

There=E2=80=99s also no need to specially clean up the associated KVM when =
the
file reference close, because by the time the .release() handler is
called, any file references held by memslots would have been dropped,
and so the bindings would have been removed, and the kvm pointer would
have been NULLed out.

The corollary to this approach is that at creation time, the file won=E2=80=
=99t
be associated with any kvm, and we can use a system ioctl instead of a
VM-specific ioctl as Fuad brought up [1] (Association with kvm before
the file is used with memslots is possible would mean more tracking so
that kvm can close associated files when it is closed.)

One reason for binding gmem files to a specific VM on creation is to
allow (in future) a primary VM to control permissions on the memory for
other files [2]. This permission control can still be enforced with the
=E2=80=9CKVM=E2=80=99s memslots using the file=E2=80=9D approach. The enfor=
cement rules will
just be delayed till the first binding between a VM and a gmem file.

Could binding gmem files not on creation, but at memslot configuration
time be sufficient and simpler?

[1] https://lore.kernel.org/lkml/CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQC=
kdvYaX6Eg@mail.gmail.com/
[2] https://lore.kernel.org/lkml/ZMKlo+Fe8n%2FeLQ82@google.com/

> <snip>

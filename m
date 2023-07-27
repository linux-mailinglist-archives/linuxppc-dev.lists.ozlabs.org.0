Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07E7659C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:14:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=uR617wLp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBcp05yQmz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 03:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=uR617wLp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3paxczaykdcgwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBcmC5b2sz3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 03:13:13 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bbb34b091dso8228825ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690477989; x=1691082789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7oDMpfc0bW6NSyfuHNNNYlN2HFPFEuCSHvjU51+NBs=;
        b=uR617wLpg6qNB677nCTpj/mRcHCn7jeMQ6T975dwFWafb05LBOA5GXBHggNBovfIzX
         O/7M392ccdTOGZqesE1qC7szLmXDUVbpTkdUSAnDKesUZGTHf6YrHw7iRdcLemcslWSD
         KrRYixDmKkhke5BhBNDcGGoexHbctICnVSugeNNjkFTNcd3g+7vTx3m4xPX98nUwGt3/
         mWhf+uFvINzhg7lFN3O3GR8jmx04AReHHh1Ek1sP09ZwG+oxGwlWe7n39MiREf5a36wi
         QECqs1dJt2n4+euTMFmAQH0Oiz0RKLy4HgS6MVL8RVa78gxf6JRosPxL/mvaakJouVeF
         ho3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690477989; x=1691082789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7oDMpfc0bW6NSyfuHNNNYlN2HFPFEuCSHvjU51+NBs=;
        b=iAq8GxUB1jOHdgFWJvOih3E7CMF7TlK1whiMQqVnb+XZN9omttPmHKhVMZeJKB5L1R
         FwVaOjSvRbki7XG91G7ry/9OrGRTLrpdx7tUNWEZqZFSnCd6ivFA/M/vhxwyTuL6g8/N
         vbonYzQqi4+TwFkAYTbOAjDlZ9+16qzjuSm3uKDfMuld5azt/E15wGAWtZV2bpMHN+gL
         ECjNI747csLuU7Y0vugrxKG1S0G4rKwSBnZfEPsjxuNHVCJocpRHdYqzACtE/YkYqas5
         uWVQgicXG2NEiAbQX3+S+EydmJy/jy7H9S7UYF8u6J+UlOEXoxI2oKpUi9yBR8A22y8E
         ntFw==
X-Gm-Message-State: ABy/qLahSQf97g0zhpZ/+fdha2EPBntvY8iJPO1vbtYaRRbwMDY3L9g4
	bKSdxLGykdjzpo7V4nqNepERgLuZj9k=
X-Google-Smtp-Source: APBJJlEiCX9DyxliShqr2xPxTiyej7fUi+PkS+4LO77eNeghg1Fiv4b0fvD5YH2w9mP2/cy4q9w9vNXHRRI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:22c6:b0:1b5:2b14:5f2c with SMTP id
 y6-20020a17090322c600b001b52b145f2cmr24803plg.4.1690477989357; Thu, 27 Jul
 2023 10:13:09 -0700 (PDT)
Date: Thu, 27 Jul 2023 10:13:07 -0700
In-Reply-To: <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
Message-ID: <ZMKlo+Fe8n/eLQ82@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>
 , linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 27, 2023, Fuad Tabba wrote:
> Hi Sean,
> 
> <snip>
> ...
> 
> > @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
> >         case KVM_GET_STATS_FD:
> >                 r = kvm_vm_ioctl_get_stats_fd(kvm);
> >                 break;
> > +       case KVM_CREATE_GUEST_MEMFD: {
> > +               struct kvm_create_guest_memfd guest_memfd;
> > +
> > +               r = -EFAULT;
> > +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> > +                       goto out;
> > +
> > +               r = kvm_gmem_create(kvm, &guest_memfd);
> > +               break;
> > +       }
> 
> I'm thinking line of sight here, by having this as a vm ioctl (rather
> than a system iocl), would it complicate making it possible in the
> future to share/donate memory between VMs?

Maybe, but I hope not?

There would still be a primary owner of the memory, i.e. the memory would still
need to be allocated in the context of a specific VM.  And the primary owner should
be able to restrict privileges, e.g. allow a different VM to read but not write
memory.

My current thinking is to (a) tie the lifetime of the backing pages to the inode,
i.e. allow allocations to outlive the original VM, and (b) create a new file each
time memory is shared/donated with a different VM (or other entity in the kernel).

That should make it fairly straightforward to provide different permissions, e.g.
track them per-file, and I think should also avoid the need to change the memslot
binding logic since each VM would have it's own view/bindings.

Copy+pasting a relevant snippet from a lengthier response in a different thread[*]:

  Conceptually, I think KVM should to bind to the file.  The inode is effectively
  the raw underlying physical storage, while the file is the VM's view of that
  storage. 
  
  Practically, I think that gives us a clean, intuitive way to handle intra-host
  migration.  Rather than transfer ownership of the file, instantiate a new file
  for the target VM, using the gmem inode from the source VM, i.e. create a hard
  link.  That'd probably require new uAPI, but I don't think that will be hugely
  problematic.  KVM would need to ensure the new VM's guest_memfd can't be mapped
  until KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM (which would also need to verify the
  memslots/bindings are identical), but that should be easy enough to enforce.
  
  That way, a VM, its memslots, and its SPTEs are tied to the file, while allowing
  the memory and the *contents* of memory to outlive the VM, i.e. be effectively
  transfered to the new target VM.  And we'll maintain the invariant that each
  guest_memfd is bound 1:1 with a single VM.
  
  As above, that should also help us draw the line between mapping memory into a
  VM (file), and freeing/reclaiming the memory (inode).
  
  There will be extra complexity/overhead as we'll have to play nice with the
  possibility of multiple files per inode, e.g. to zap mappings across all files
  when punching a hole, but the extra complexity is quite small, e.g. we can use
  address_space.private_list to keep track of the guest_memfd instances associated
  with the inode.
  
  Setting aside TDX and SNP for the moment, as it's not clear how they'll support
  memory that is "private" but shared between multiple VMs, I think per-VM files
  would work well for sharing gmem between two VMs.  E.g. would allow a give page
  to be bound to a different gfn for each VM, would allow having different permissions
  for each file (e.g. to allow fallocate() only from the original owner).

[*] https://lore.kernel.org/all/ZLGiEfJZTyl7M8mS@google.com

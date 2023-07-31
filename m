Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7124B769802
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 15:48:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=u9OhuV2W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF01w2bmyz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 23:48:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=u9OhuV2W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF0112dBvz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 23:47:32 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-63d058b9cafso30656856d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 06:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690811247; x=1691416047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysw1GJ5iZ7+m9LB1vMcTeerNVDEGAKXkHz9rft3ciOM=;
        b=u9OhuV2WeoVUb538U+P/2QFmsHVbKcdA/KLYVytDxihcyMcOvBA0XVLiSr5cHMTN7D
         ikj7mVuN1iyhE73lkkm8FfLEjE5ponkqPZ1y3+LCm2IQAtu7oocrn6C54yzZ80W11Wvd
         rTxv00vYMpAR9z70F7m74ztY1F98dotGILfOawWW2zQkC0L0yO2AbJIKpEccIjfjgMtN
         rNOX3yDynA64SAgdgBRMMmYQcMR8X+2qNSp+2Yj5dtqRRJG2EoqS4Y/SRDVJ6nLIVtfR
         4bdQAAHnMSoPJgm+FGVRTm8lI3EITt2Y96aOx0NZdkMIARTZMJb3A2kQXkT2avpiLvYZ
         6BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811247; x=1691416047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysw1GJ5iZ7+m9LB1vMcTeerNVDEGAKXkHz9rft3ciOM=;
        b=Yiab99aSVBofMixf7UOqr+fSKI+Vo9/WqnDEgN6IPsL6tTYwf61muN+i9Q/aYRk62E
         ylWRDO7h1bYXCCW6NcLe5k2LWV6d7lhF8ZGkSpwL8Cs0eK7/XYugyXkl0ccRnQgHQuAe
         jKD5smvuTK351cjd42AQZTpYeIrU6Oi78sHzn1mNfiKQobyeYbv9fVZ4jTczstDP6c5E
         SgHblmeUvDRXGxnZwMUakngNaldQhvk9jRSyBeuIR47F5qPN+qfHK9eHFphURpCRTCei
         mnPQu0OFj7gHwzoxz68wQqNqsF9PnSPEO7ZT2X5/K8TjvefPS8OeznyTJpRElSnWIPrk
         91AA==
X-Gm-Message-State: ABy/qLZbemQGRnNtePhefDSVxWUEh1ENNSI/dw9SkMovkeF+UIAJ9nKd
	dCJAdx0KQQJvN24ltOk8w0C4r6lDcICX7HZ0ZiCkng==
X-Google-Smtp-Source: APBJJlF7tr3MB9wkYayUG07mtX0571x6EwPIiCT72OesCKkjWW/DHZdN3DzN9958IW7gK2WOAN/2LmnIZ4GFimGLnSQ=
X-Received: by 2002:ad4:5884:0:b0:632:2e63:d34b with SMTP id
 dz4-20020ad45884000000b006322e63d34bmr9450921qvb.14.1690811246768; Mon, 31
 Jul 2023 06:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com> <ZMKlo+Fe8n/eLQ82@google.com>
In-Reply-To: <ZMKlo+Fe8n/eLQ82@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 31 Jul 2023 14:46:50 +0100
Message-ID: <CA+EHjTzySXapdQbv8ocueboBR4LnM9WGV4bLOAfipB1saQ6OjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>
 , linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Thu, Jul 27, 2023 at 6:13=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Jul 27, 2023, Fuad Tabba wrote:
> > Hi Sean,
> >
> > <snip>
> > ...
> >
> > > @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
> > >         case KVM_GET_STATS_FD:
> > >                 r =3D kvm_vm_ioctl_get_stats_fd(kvm);
> > >                 break;
> > > +       case KVM_CREATE_GUEST_MEMFD: {
> > > +               struct kvm_create_guest_memfd guest_memfd;
> > > +
> > > +               r =3D -EFAULT;
> > > +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_m=
emfd)))
> > > +                       goto out;
> > > +
> > > +               r =3D kvm_gmem_create(kvm, &guest_memfd);
> > > +               break;
> > > +       }
> >
> > I'm thinking line of sight here, by having this as a vm ioctl (rather
> > than a system iocl), would it complicate making it possible in the
> > future to share/donate memory between VMs?
>
> Maybe, but I hope not?
>
> There would still be a primary owner of the memory, i.e. the memory would=
 still
> need to be allocated in the context of a specific VM.  And the primary ow=
ner should
> be able to restrict privileges, e.g. allow a different VM to read but not=
 write
> memory.
>
> My current thinking is to (a) tie the lifetime of the backing pages to th=
e inode,
> i.e. allow allocations to outlive the original VM, and (b) create a new f=
ile each
> time memory is shared/donated with a different VM (or other entity in the=
 kernel).
>
> That should make it fairly straightforward to provide different permissio=
ns, e.g.
> track them per-file, and I think should also avoid the need to change the=
 memslot
> binding logic since each VM would have it's own view/bindings.
>
> Copy+pasting a relevant snippet from a lengthier response in a different =
thread[*]:
>
>   Conceptually, I think KVM should to bind to the file.  The inode is eff=
ectively
>   the raw underlying physical storage, while the file is the VM's view of=
 that
>   storage.

I'm not aware of any implementation of sharing memory between VMs in
KVM before (afaik, since there was no need for one). The following is
me thinking out loud, rather than any strong opinions on my part.

If an allocation can outlive the original VM, then why associate it
with that (or a) VM to begin with? Wouldn't it be more flexible if it
were a system-level construct, which is effectively what it was in
previous iterations of this? This doesn't rule out binding to the
file, and keeping the inode as the underlying physical storage.

The binding of a VM to a guestmem object could happen implicitly with
KVM_SET_USER_MEMORY_REGION2, or we could have a new ioctl specifically
for handling binding.

Cheers,
/fuad


>   Practically, I think that gives us a clean, intuitive way to handle int=
ra-host
>   migration.  Rather than transfer ownership of the file, instantiate a n=
ew file
>   for the target VM, using the gmem inode from the source VM, i.e. create=
 a hard
>   link.  That'd probably require new uAPI, but I don't think that will be=
 hugely
>   problematic.  KVM would need to ensure the new VM's guest_memfd can't b=
e mapped
>   until KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM (which would also need to verify=
 the
>   memslots/bindings are identical), but that should be easy enough to enf=
orce.
>
>   That way, a VM, its memslots, and its SPTEs are tied to the file, while=
 allowing
>   the memory and the *contents* of memory to outlive the VM, i.e. be effe=
ctively
>   transfered to the new target VM.  And we'll maintain the invariant that=
 each
>   guest_memfd is bound 1:1 with a single VM.
>
>   As above, that should also help us draw the line between mapping memory=
 into a
>   VM (file), and freeing/reclaiming the memory (inode).
>
>   There will be extra complexity/overhead as we'll have to play nice with=
 the
>   possibility of multiple files per inode, e.g. to zap mappings across al=
l files
>   when punching a hole, but the extra complexity is quite small, e.g. we =
can use
>   address_space.private_list to keep track of the guest_memfd instances a=
ssociated
>   with the inode.
>
>   Setting aside TDX and SNP for the moment, as it's not clear how they'll=
 support
>   memory that is "private" but shared between multiple VMs, I think per-V=
M files
>   would work well for sharing gmem between two VMs.  E.g. would allow a g=
ive page
>   to be bound to a different gfn for each VM, would allow having differen=
t permissions
>   for each file (e.g. to allow fallocate() only from the original owner).
>
> [*] https://lore.kernel.org/all/ZLGiEfJZTyl7M8mS@google.com
>

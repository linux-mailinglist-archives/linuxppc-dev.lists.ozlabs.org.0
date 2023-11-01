Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC257DE11F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 13:51:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hY9LBBZh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL6Mp0HT6z3cQ7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 23:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hY9LBBZh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL6Lz1Zfbz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 23:51:06 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0252578aso43233006d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698843062; x=1699447862; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DytdUoCbq8poGHKLHOEtAO0D5dohgKyWvCysCxFt+wY=;
        b=hY9LBBZhWyrSrBbY80hgMFWtOTNFIoZFpyhnzjBMk2AaD3tiZixu7UzJL7b7/2KS3I
         8j/bdgw2Namo/RP/QNr9VsoSBrvXDDVYgWhUjIQKnuVf27arryviWMNTzlnQonNQ5TTJ
         tkoeasAST5MD8Yt8dQ2/iWsDYBbwABwhPUZQd4sv1UKkPKTDKEL8PIr4V2FgA3xaq9NC
         8w1uQ7BDy9PjrWJMTcK2LVLZzThaAnnYNGudSSP9GfoaclUUFGloVFxcvjLEK6d08skn
         iON+me527mxo3WD+sURuvMz5oOY4xqfLHmVRGjdOwcsG/RW83NGQBMDhjjirjqLJpTEh
         rPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698843062; x=1699447862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DytdUoCbq8poGHKLHOEtAO0D5dohgKyWvCysCxFt+wY=;
        b=QSSJsMvFSaRu9CCMnND9WZaZ+Pg44HCqQZcfLwrOqYrOIk72PXOF8SrQRQ2XnVfx6y
         5zRgpcC7ahc0AXtzIZI6cbyHCsEI6cHQ4zeP/BZaNINcUbGOD0mdpUkhZC3EBQEEVv7R
         YmJzfZ8muQRJzwPaG0YNEvnj2Wfv8kqhDSjHKB2I4/arYVmPIfnJEAgupfqoizAz+Y0r
         MLLr7BhUOcOK/SsHbOBV5IHs6xKjyakhYfhbrnl5ZiDF2COsEvoj7w3t9DuHgCCc4Z/M
         2KkxzoVgvoJ7uKzLl7/ey+/rdPUiodoEbHzluv6iCL+xF2L+l03ytELi8XvDHd2Y4uo/
         NJVQ==
X-Gm-Message-State: AOJu0YzdJQvdba4dyoJxoDAaIPQ0ZS+oBMUEF90ta0EHUgKCEGvDIU5q
	r8TAMuH2Z+awCMnPyoD8L2p9jkPRrybZwzzB2+dk2w==
X-Google-Smtp-Source: AGHT+IF4xR6L8cVnqFnyZjdEh5XAFhWOV7M0s6Xt9NyBBttGvtAf21ACAZmexGcVd+eTPklAY7PiFjol+SoHUZLf4NM=
X-Received: by 2002:a05:6214:262e:b0:66f:bd35:e889 with SMTP id
 gv14-20020a056214262e00b0066fbd35e889mr16003984qvb.60.1698843062295; Wed, 01
 Nov 2023 05:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-5-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-5-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:50:26 +0000
Message-ID: <CA+EHjTxW3P+_fejO6emoZ1=c9EkWJUH63-ffmSumh=6P6MbTqQ@mail.gmail.com>
Subject: Re: [PATCH v13 04/35] KVM: WARN if there are dangling MMU
 invalidations at VM destruction
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add an assertion that there are no in-progress MMU invalidations when a
> VM is being destroyed, with the exception of the scenario where KVM
> unregisters its MMU notifier between an .invalidate_range_start() call an=
d
> the corresponding .invalidate_range_end().
>
> KVM can't detect unpaired calls from the mmu_notifier due to the above
> exception waiver, but the assertion can detect KVM bugs, e.g. such as the
> bug that *almost* escaped initial guest_memfd development.
>
> Link: https://lore.kernel.org/all/e397d30c-c6af-e68f-d18e-b4e3739c5389@li=
nux.intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  virt/kvm/kvm_main.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 1a577a25de47..4dba682586ee 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1356,9 +1356,16 @@ static void kvm_destroy_vm(struct kvm *kvm)
>          * No threads can be waiting in kvm_swap_active_memslots() as the
>          * last reference on KVM has been dropped, but freeing
>          * memslots would deadlock without this manual intervention.
> +        *
> +        * If the count isn't unbalanced, i.e. KVM did NOT unregister its=
 MMU
> +        * notifier between a start() and end(), then there shouldn't be =
any
> +        * in-progress invalidations.
>          */
>         WARN_ON(rcuwait_active(&kvm->mn_memslots_update_rcuwait));
> -       kvm->mn_active_invalidate_count =3D 0;
> +       if (kvm->mn_active_invalidate_count)
> +               kvm->mn_active_invalidate_count =3D 0;
> +       else
> +               WARN_ON(kvm->mmu_invalidate_in_progress);
>  #else
>         kvm_flush_shadow_all(kvm);
>  #endif
> --
> 2.42.0.820.g83a721a137-goog
>

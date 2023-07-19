Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458C75A089
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yA9Vox81;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5pkk3d1gz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 07:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yA9Vox81;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=vannapurve@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5jLC6pxcz2ytf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:22:10 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991ef0b464cso230299966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689787326; x=1692379326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muf27eIntjXr3Sa3gdcQLPN4y9AYfVWt2TffDnLSMcw=;
        b=yA9Vox816zD+aJ/FVd+gHS1eUUrpLebV0UPRWoTOQXRhwbDjiEzKfZKLt7ZPO+mtvH
         SaibLGPqQv8DRVnknibkmwFWbPPfcXmr6c+ujgDGBFuCW/F/BitDoK4IVXsvCkVTbM2a
         UUXFrIHyb9EtmF0G0jSo223YyW0H9eb4QyBBeSzBXy3UqItMc2tyGgaUGUFrdupt+8A5
         dLZgmELLzzoUW2SKSL+4MBdgHsq0BaZC4v7p3QuLBtrY+JwzHEa0w4RaSfJgn6bTpTvs
         oKq8cg7sWg40yA0HzTTcfPzlRvV46kkywbP49vwd3eHSPLgVvqkoTlu6Tp2eaYz6GzrZ
         sQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689787326; x=1692379326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muf27eIntjXr3Sa3gdcQLPN4y9AYfVWt2TffDnLSMcw=;
        b=FaG36zfptmZEylayEVtpv2uGwv8twpAEg5Qo0MTLDt9H5IYf9uRLqNldQ89DYVLAhE
         ++pHIf7hRaAixLHol7kBEUUjVhd7UvCB3Ld//PTe/t/BDiNJRUq2oZagVLtlthYVDNJS
         gBaVFuDValN80HVKJ8x/HowtrvXqc/a6QsHFoABzSOqm5ZCe4H+sIvaBfLPlQj0spp7c
         Dw9cbcrhLBtYvc4ckz0FmsD+yAdx0zw1jXhYPdAqq0hloqXwqIhrE75dlF4A2nSD62I+
         d2i1lk3ynGHI8ZQRBQSiRHiAAWs00syuxUOjZNkUP+Aj6l138KobnBHqdN/+uMB9iPPB
         xBBA==
X-Gm-Message-State: ABy/qLb5PXJJUh/VHJzM61pKatIKiNCd4Jt1UqBGVD6eW7BzPZ7goaxh
	w+r/FOS9pTa+FFifCelfztAFS4YyTABhhXh97AsItA==
X-Google-Smtp-Source: APBJJlHLONYvTW7m5Fbx16RlTb/fOqinzIvyTzihLXJQXLhrTmtvBuSogp90ZclD7PbARqJZdKXYR/WVY9tuMb+Y5tE=
X-Received: by 2002:a17:906:292:b0:97e:17cc:cc95 with SMTP id
 18-20020a170906029200b0097e17cccc95mr3045374ejf.36.1689787326540; Wed, 19 Jul
 2023 10:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 19 Jul 2023 10:21:55 -0700
Message-ID: <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 Jul 2023 07:24:07 +1000
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 4:49=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> ...
> +static int kvm_gmem_error_page(struct address_space *mapping, struct pag=
e *page)
> +{
> +       struct list_head *gmem_list =3D &mapping->private_list;
> +       struct kvm_memory_slot *slot;
> +       struct kvm_gmem *gmem;
> +       unsigned long index;
> +       pgoff_t start, end;
> +       gfn_t gfn;
> +
> +       filemap_invalidate_lock_shared(mapping);
> +
> +       start =3D page->index;
> +       end =3D start + thp_nr_pages(page);
> +
> +       list_for_each_entry(gmem, gmem_list, entry) {
> +               xa_for_each_range(&gmem->bindings, index, slot, start, en=
d - 1) {
> +                       for (gfn =3D start; gfn < end; gfn++) {
> +                               if (WARN_ON_ONCE(gfn < slot->base_gfn ||
> +                                               gfn >=3D slot->base_gfn +=
 slot->npages))
> +                                       continue;
> +
> +                               /*
> +                                * FIXME: Tell userspace that the *privat=
e*
> +                                * memory encountered an error.
> +                                */
> +                               send_sig_mceerr(BUS_MCEERR_AR,
> +                                               (void __user *)gfn_to_hva=
_memslot(slot, gfn),
> +                                               PAGE_SHIFT, current);

Does it make sense to replicate what happens with MCE handling on
tmpfs backed guest memory:
1) Unmap gpa from guest
2) On the next guest EPT fault, exit to userspace to handle/log the
mce error for the gpa.

IIUC, such MCEs could be asynchronous and "current" might not always
be the intended recipient of this signal.

> +                       }
> +               }
> +       }
> +
> +       filemap_invalidate_unlock_shared(mapping);
> +
> +       return 0;
> +}
> +

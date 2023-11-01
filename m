Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E47DE11B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 13:48:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3HbEpV+T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL6Hj1XFYz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 23:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3HbEpV+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL6GJ2zvLz3cQT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 23:47:04 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d13ac2796so43405046d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698842822; x=1699447622; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1rvjvqySA8gfoAJ2h4xCVn6r+FVikEwY0ryqbt6qgE=;
        b=3HbEpV+Tc0Pu8GSVVi9PRoSI/w5nj4YdFw/KNd/hJkJapebw0/ieZBLhhkYDbgiBYT
         HSMoI6lCOP94AZxeWBYZDUqwssg4S68vLmXIzp4A6R538inD6hLxT7SoFmemttttBUGs
         N1pk0MpH5qM4v0IFHCr+ECopwu50OyYvlmVxSuRW3imnjNBdyYULuWoUL6KbPybGNteh
         5Z+kHR5Jvgev+YInWPxD/fQFzBnNMJDUQcKiPCNGtlDK9AHifXh7pOoRwNl03b9ZFf4Y
         IR1X4rwPv77QjajUAwCmwlxCuS+AP8Swq8XWWaF+OWPiCt4AuzXCsZFwzrBzCuW4wqGV
         2BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842822; x=1699447622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1rvjvqySA8gfoAJ2h4xCVn6r+FVikEwY0ryqbt6qgE=;
        b=H2MvCU8iwISMsjuNa4hPVFS3dX/0fpn47jmothc2TcisvnQj99Vm9Bm3OJPwKJW6Z9
         4255aBYwPhJXKh+HTA7Nc4me7aFbg1fMFN7PN+mWhTEK6I4YULFCsuOWznwyDGwH8Vwy
         OO2XY5k25rn10ZRg5MtdmDX93TW7dZPNKTXCnSXlfBlXUJLCCVBDOQFYtPTPB4WCH5+i
         cLJfrEC4WLMhEqwlUPoxBe48PEdaDcojfVh9g+uTTj7lk22ETUFI262k5oDqs/RyocLY
         zCd6WZEJ86djoPxXMVhbkeesvQkA4QKv6ZHIlkCLo8O8ByDe8GOp6M4B+xH/+Qj3HIh+
         APmw==
X-Gm-Message-State: AOJu0Yyy45dupCKLV8cvnUcufNJYngGur6aquvozgDT4TVSNCe3zX5mp
	YDVGGrH95q54mSEYvHagRtZixe6OT3cyTiyQTCTLdQ==
X-Google-Smtp-Source: AGHT+IEwNefwVjOpplfsdA5Dp0BgUdMFZ8Gr0x2pIdj0EOquTk7Lrcu3yjtemmSczlmcSeWnvG38gd5iU/oYIFP7LzQ=
X-Received: by 2002:ad4:5de9:0:b0:65d:31e:b810 with SMTP id
 jn9-20020ad45de9000000b0065d031eb810mr19758846qvb.34.1698842821613; Wed, 01
 Nov 2023 05:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-3-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-3-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:46:25 +0000
Message-ID: <CA+EHjTycVAL11xCKQAfm-q4NGbgSH7yMswu+c1XaJdyhUh61zw@mail.gmail.com>
Subject: Re: [PATCH v13 02/35] KVM: Assert that mmu_invalidate_in_progress
 *never* goes negative
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
> Move the assertion on the in-progress invalidation count from the primary
> MMU's notifier path to KVM's common notification path, i.e. assert that
> the count doesn't go negative even when the invalidation is coming from
> KVM itself.
>
> Opportunistically convert the assertion to a KVM_BUG_ON(), i.e. kill only
> the affected VM, not the entire kernel.  A corrupted count is fatal to th=
e
> VM, e.g. the non-zero (negative) count will cause mmu_invalidate_retry()
> to block any and all attempts to install new mappings.  But it's far from
> guaranteed that an end() without a start() is fatal or even problematic t=
o
> anything other than the target VM, e.g. the underlying bug could simply b=
e
> a duplicate call to end().  And it's much more likely that a missed
> invalidation, i.e. a potential use-after-free, would manifest as no
> notification whatsoever, not an end() without a start().
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  virt/kvm/kvm_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 0524933856d4..5a97e6c7d9c2 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -833,6 +833,7 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned=
 long start,
>          * in conjunction with the smp_rmb in mmu_invalidate_retry().
>          */
>         kvm->mmu_invalidate_in_progress--;
> +       KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
>  }
>
>  static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *m=
n,
> @@ -863,8 +864,6 @@ static void kvm_mmu_notifier_invalidate_range_end(str=
uct mmu_notifier *mn,
>          */
>         if (wake)
>                 rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
> -
> -       BUG_ON(kvm->mmu_invalidate_in_progress < 0);
>  }
>
>  static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
> --
> 2.42.0.820.g83a721a137-goog
>

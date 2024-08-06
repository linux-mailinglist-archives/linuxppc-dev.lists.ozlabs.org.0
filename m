Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED05894941F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 17:04:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Q9oB3Qlm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdc6W6CwHz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 01:04:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Q9oB3Qlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdc5p2902z2ysc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 01:04:13 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-81fd9251d99so28540039f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2024 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956651; x=1723561451; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nqpVJEa3gF+vLMgvdD8twTbWevyBd39Y3ES27W51MM=;
        b=Q9oB3QlmapmJ14oaSYjXyjcjVpRLVxy5WfbGE2n5DxDjtUrzHZGQ5rZWVCN4vxeizk
         OzksJK3ayEGA0a1SmTdgLqnBenI6BDct6s1Ycmlr3fN4ZM3JL7gJw5lpny864rRUskDs
         j3ZJRhKm6cE9I3r5S6Pjnwz0791ioE1s+mUdqZNz+71qMlfklgWnACxWq8xgjVyX9cTd
         U/OQsddvOOs95k6uUGawZ995ENoSju5OIdJtRtms2/1wj1BhS2fSf1SiesdymBgM2bEn
         FUD4RT8ScdEaKCC0VB+k8J9Xxd9yzFRRTPR+nq207Avp+wIOV3/dyFg2Q6DpgM344b7A
         GBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956651; x=1723561451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nqpVJEa3gF+vLMgvdD8twTbWevyBd39Y3ES27W51MM=;
        b=Rsy0/WOsMnf5J4JAu9PRh68hGh5zaczl8oIYP0FyReYAAlqM5tG1h/sCQGYokOxirW
         RTHjMQ3zgJeXso5U23eDS8VD34R+CsjPWUyNbKQ4h41XDy3F5LG4mWeUNJb/ymlxn+Wd
         Zr2KDtOcwQSj4GQ4y3MHU7s0uJLtzn+gA3NF8Tj8VRhbW0Iu5DnEQJR/3VSoZ+/qIQND
         /L7UKYV/C956OL3zifGsGQMokZ7HK/hZkmRqvQxowH6bsv0l8ZVhdTuOdhNzGbsRpg1S
         0FVg6+E1A/yY9+j/TUyk0rseo6mrbuuefjDQWdVBSJo53Zhobi9F++rTNZMelEkaiqya
         MSVg==
X-Forwarded-Encrypted: i=1; AJvYcCXl/gFlNL50R2hyeS5Lrn7AEPuReBG3RhKzkJKXCQbA4V7+XXJoFhn6VVi3Zho0d5iRFgaIBouoYy+9YMWZEOTtozLa4w6P+zW6eLAThg==
X-Gm-Message-State: AOJu0YxNbD1oiyfnsTwnBb6MfPKp0HICmCB7EeBRL7pObpSldEK4mf6Y
	fiBcq3K9sVLkxRssP0VU+eIjr1khQBGf6PVyUOTDW2VwAjwATkcqDsGrI39agQMKb4E6zI9g5Z1
	P8kcdEIXeqzqTkZ0oQh7agvaZpiuYbQO8B8lqvA==
X-Google-Smtp-Source: AGHT+IE5dkU8O3hsRzTzR3mqE211YMexCU92LD+ZH2mO65SVdE7w+UZ8Equ/sKTPvXFYaRtJg+9DX/UprpD7ulXsS18=
X-Received: by 2002:a92:d64d:0:b0:397:d9a9:8769 with SMTP id
 e9e14a558f8ab-39b1fc37fe5mr152610645ab.24.1722956650868; Tue, 06 Aug 2024
 08:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-57-seanjc@google.com>
In-Reply-To: <20240726235234.228822-57-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:33:59 +0530
Message-ID: <CAAhSdy1DvkU_C2jmtA1SBNfjp1gxu_6RhFKbf-hkhSNQeTXwwA@mail.gmail.com>
Subject: Re: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff
 a stage-2 PTE is installed
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 27, 2024 at 5:24=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Don't mark pages dirty if KVM bails from the page fault handler without
> installing a stage-2 mapping, i.e. if the page is guaranteed to not be
> written by the guest.
>
> In addition to being a (very) minor fix, this paves the way for convertin=
g
> RISC-V to use kvm_release_faultin_page().
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  arch/riscv/kvm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b63650f9b966..06aa5a0d056d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 goto out_unlock;
>
>         if (writable) {
> -               kvm_set_pfn_dirty(hfn);
>                 mark_page_dirty(kvm, gfn);
>                 ret =3D gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHI=
FT,
>                                       vma_pagesize, false, true);
> @@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 kvm_err("Failed to map in G-stage\n");
>
>  out_unlock:
> +       if ((!ret || ret =3D=3D -EEXIST) && writable)
> +               kvm_set_pfn_dirty(hfn);
> +
>         spin_unlock(&kvm->mmu_lock);
>         kvm_set_pfn_accessed(hfn);
>         kvm_release_pfn_clean(hfn);
> --
> 2.46.0.rc1.232.g9752f9e123-goog
>

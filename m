Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A389642E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:38:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fn4iFeNP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8YSp0k0dz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:38:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fn4iFeNP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8YS55SRqz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 16:37:56 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-607c5679842so49164177b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122674; x=1712727474; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7ujj04+OlaPcvnr/mU1u92sbiZXtwW3xdBUhXyZWrg=;
        b=fn4iFeNPQBSW+pMxg/RNeuB0eM3pkZf2saLh30pXXA4IR9+tXDpq8kh0a8Lw6U1BME
         sB8uEd4zX40pvmp5EPItFIZElUaNkH7s/dFzK2QpN4MR7eH8+3Ua/ftTQC3/D7V35kvC
         61kboc3OXi65diGWixpsJqPXHHnAyslVSKRZ8W5rTjZHJ9JHtqvMtEKOl9LMBnKzY9T0
         mm48ZKAr8P2byJr3pxvM6AD2XTf2SVIrH8Db1b18HwhV5XRCWz0bCknkidAvS0yl96Xx
         EDUbf2qXT7gH02Om4rQcMiBcpA2AzlDcygjFffkLF+IpDr3aJzq7kT7ItrDbeaje4dX3
         Pi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122674; x=1712727474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7ujj04+OlaPcvnr/mU1u92sbiZXtwW3xdBUhXyZWrg=;
        b=VoYLwxt3TscvRliKxD3KWNVuIymE+6n43wAq17qwfhpRxt2nAfpAhzN3zvTZ+phD8M
         Q/w734+JdWq/4PfMYJkSmf7lhFzP/vRvsDTAPo+mF+hxwY0LqIaxV7UsWUTXymHyCE9H
         basdYRzABZKS3MjLwpHuq62pIVoySRbcbYc5yUm1BkMrU593KvDw9Ryc0Z8GJiqawn1K
         /kuKpM225lZWPCygemFTDbvk3wpAgAIrQywXjNe3KK7lXdK6EB3sOubjrDr7NO5TQHWX
         RtS3J2bO+84HQY2KHGkXPPeSojUFfmAEKjTXq37IYmZiE9aNGEt5CfbwlpO5LhPUdLII
         bwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsDYT0FcCdFUHMPbx/Qw566VT2Tz3MrRuWKxk5F3ykyDoqEnaJK4IsTrDUW+vj+44ibHFAIstYRlk0FJ5ukj5/Nmm/LzfzXORojctrGA==
X-Gm-Message-State: AOJu0YyrFZdl0a+oMq2ARJtu47+hIn53mq8BU93URufouHY83/BEMzu1
	NQOZ8NooGRy9n/wrRebwZ5W0zxbK0LTFRMVds7KYCBPQikJ30+xo45QKfd0eowQffKeQiKYOu8G
	ujbDIZoKNMVtJKH2KMfM5T49YMB+NYTpSnlN7
X-Google-Smtp-Source: AGHT+IHpjlrFXGBHC8xjiSR2pkdos7fU1V4MIpNPbQfj0CNzmJ1GKeTFoSnYGK3QnW6iiu8Gm/GTnJLLIVUWpqvl8zo=
X-Received: by 2002:a25:bfc5:0:b0:dc6:bbeb:d889 with SMTP id
 q5-20020a25bfc5000000b00dc6bbebd889mr12522955ybm.52.1712122673515; Tue, 02
 Apr 2024 22:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-6-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-6-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:37:42 -0700
Message-ID: <CAJuCfpGa746Fn+i=M0oDEGMEJYTJhZ3m-paZ6k3tbZs+yJgu8g@mail.gmail.com>
Subject: Re: [PATCH 5/7] riscv: mm: accelerate pagefault when badaccess
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: x86@kernel.org, linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Andy Lutomirski <luto@kernel.org>, akpm@linux-foundation.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 2, 2024 at 12:53=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
>
> The vm_flags of vma already checked under per-VMA lock, if it is a
> bad access, directly handle error and return, there is no need to
> lock_mm_and_find_vma() and check vm_flags again.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  arch/riscv/mm/fault.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 3ba1d4dde5dd..b3fcf7d67efb 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -292,7 +292,10 @@ void handle_page_fault(struct pt_regs *regs)
>
>         if (unlikely(access_error(cause, vma))) {
>                 vma_end_read(vma);
> -               goto lock_mmap;
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +               tsk->thread.bad_cause =3D SEGV_ACCERR;
> +               bad_area_nosemaphore(regs, code, addr);
> +               return;
>         }
>
>         fault =3D handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK,=
 regs);
> --
> 2.27.0
>

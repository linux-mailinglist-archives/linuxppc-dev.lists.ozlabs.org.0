Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF389640A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:31:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pLMpO/3T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8YK82F6yz3vXp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:31:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pLMpO/3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8YHs403vz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 16:30:49 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso5556293276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 22:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122246; x=1712727046; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FGC0ogSAewDWnDccn9HyW8lHJXe75+YXBIJHLHFGHI=;
        b=pLMpO/3TwRtCdJl0+1/tZ+tn0LiXWTOnrPKsoPKfnemEiKZj8BcNnUlowdYatJVZge
         3SQ0lgQvRkwRQANem0muGmv7Mi2s5wQ8mzZyEd0yfAdpi9RCJxLqarcWiiAR8HiI0cQO
         SGTb9peiijMoPnpQzMcILqRwIL3nxMltag7l7xTyKhioZNwgNQJyK8MTY55FYd7z6vjo
         J/w4a0Rg+anuM+V1zOLObe8n0386T5sMZ0jVqgdnQMwKz29gQ+wjF7APrrH61jG5qO21
         Zjn19WNXSN4M2hYC/yvbUKa9PSQ7EblxSV0wvVcGvixZEHIgcn+JLfUmT6+BR/DnQhpr
         U0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122246; x=1712727046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FGC0ogSAewDWnDccn9HyW8lHJXe75+YXBIJHLHFGHI=;
        b=WbqXzxd1C51IZifoc8WOLnWcuv1PoZF8BjO6k6uwFgvhZOQKz3k9UbVM/gWirZFwj6
         BeAnXDiI4+SndzcjxPGcGI5k9FyycL5LP1712GvzaNsl4pvkJj7Xdo/tOo3mHupcqD6i
         RgqM8LsdYD/sXut3/TceFDdWPKySYPx/vUp+1PgUgET7ZKVPOO6vvXtTD2WbtuMeESKc
         6HO/L82FsQXwEr312KOejzY/RpaZyBZPcaCYM9FJgn8U2LNCFeJM5DNCHzzB8QH6ezJa
         iLcE5tE8Q2WHv/tSadHw3y5+g1fpwhbEm8cGF9bPu0C61A+0lT47lLlVQJ0pq/0RYVgn
         YSmA==
X-Forwarded-Encrypted: i=1; AJvYcCW3NRTPBMuQk9zJ4ehO1O7/xthkGa/nTgoqrMnbOMjNAz9sFG/ZLtaH2Cv15JTljF5u5eoGP27hHmnfSQH8VKeDpcxwodO87WAO1O65iw==
X-Gm-Message-State: AOJu0YyzaefVqW8U6Dc9u+fnbcnrFFVsMgmJ4A/E5HeqDo4QgmPlzRZH
	jBOOrxwZbloT/Tw8xzfS6b7CZPSPRrxS/yHQqFhm3Itz9QjV2VASXt/qLSSSqQFdH5DYxNJAZHu
	iolp1hQKLf//IpaQvTXSQs1Wejuk71tLmdOp9
X-Google-Smtp-Source: AGHT+IERcF+ZJQdvucNfySTOQI0rZqXN5JPmGGJueefxP3/c8KUs6v78wwHnFWFD/9UuBTtutSqFi5LiGSrexLI5jh0=
X-Received: by 2002:a25:ce10:0:b0:dcc:cadf:3376 with SMTP id
 x16-20020a25ce10000000b00dcccadf3376mr13231486ybe.18.1712122245862; Tue, 02
 Apr 2024 22:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-4-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-4-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:30:34 -0700
Message-ID: <CAJuCfpE7txgXZQG=xvzKYtKUs=3V5C9pe7OOzf71BGPfb+Qqxw@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm: mm: accelerate pagefault when VM_FAULT_BADACCESS
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
> bad access, directly set fault to VM_FAULT_BADACCESS and handle error,
> so no need to lock_mm_and_find_vma() and check vm_flags again.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>



> ---
>  arch/arm/mm/fault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index 439dc6a26bb9..5c4b417e24f9 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -294,7 +294,9 @@ do_page_fault(unsigned long addr, unsigned int fsr, s=
truct pt_regs *regs)
>
>         if (!(vma->vm_flags & vm_flags)) {
>                 vma_end_read(vma);
> -               goto lock_mmap;
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +               fault =3D VM_FAULT_BADACCESS;
> +               goto bad_area;
>         }
>         fault =3D handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK,=
 regs);
>         if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> --
> 2.27.0
>

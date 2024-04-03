Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 365198963E0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:12:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0YmsKiuQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Xv96dDhz3vXC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:12:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0YmsKiuQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8XtT1S6Vz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 16:12:16 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so5689807276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712121131; x=1712725931; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxRG9lv5n8fexIxo+XXVWIBRdafbxcACyQss08DTFqc=;
        b=0YmsKiuQiBgDdfYYGTuX7a4mHLcevl60GnsKF6SHV3xlv0G5asnRcV8NZHZQPaniZi
         0LBhB1AzELEJ0k6UE74coJSmf87a3X9ZNLWRLWLdrX+THqIPwd7RhzAvjPymlBsUhk8m
         uLzUiOt6KhtS/eZFFmdYAKmfvrtTm23iVG4tSaVmWj9oBIsmfCCzdBGIoUiiITk4aPqg
         YI/HMfynxYuPW+Fqw5jlliL7FBQyAWE9VDQp48YVb5FBnmOFT8l36hC1yCOfM5mAe3Kq
         81B6b+wAHU9VKgJgst4X7djDOHhWE5Cu9D/zw1yUtVnrNvLETbLTNklDhCWu7HJCaXk6
         2LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712121131; x=1712725931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxRG9lv5n8fexIxo+XXVWIBRdafbxcACyQss08DTFqc=;
        b=lGYXWCaitkItmXG4oN0pjSAiyaDqFLqTiZ7DG8wq+9u17bHeNMS7a4asg+JVLPnxM+
         lE/lHtbmadPopdVcr5I+UHQJ8djBUcPlgvHlQTAP9IwdHovxa/XbEpN5J6rYfntJHHBv
         wBMnIIUj3k9ggGg0DN8HDzC0JDAq3j49YiyjUMUPmjSo2RqdII+ohQ/F7G6Htv9ah8CO
         FRWQ9mDDWGe6MvTRGUeqbsohEW/hZIbI+pPRNF09VRWn8JkoidE3NUrNqFQt68smCAyF
         9PlOv0hrNu5hN/aEHzSEzDW58McroKfIiqHOFC8pLPDI9q/Frh2+LGb/+OIdCO00xPhi
         CwlA==
X-Forwarded-Encrypted: i=1; AJvYcCWqjsaXlRANh6WBB0ny74VYjNtH919ARE6pqOubXJN345IiFw2eMVhQ+CbJcL++iDJ2Sa/73RTiUyjDUOf/WrBmlFg+4prR29lOoTCnhw==
X-Gm-Message-State: AOJu0YxgezM3u/+yN2W6+xUcE/wBd+Koa/YIfFm7to+YRWlca0hqig9/
	3BNCQfxrAg6zmZiR9UvPpIA10rDfPFZtRCDwBnNL7rUVIW8oKO8ba3qFvMBPNe9ib6T9C4tncTR
	D+tXP40w8t0XirvU+JyotQgkgMcSVy+Jpq9S/
X-Google-Smtp-Source: AGHT+IHv6JffsEzPnx5KbInGZZ0OL1jobKmTWbbhcnG9zLMw35NFD69tvdQCf9596q687XkaokyV8L2kfkQddNDCMI0=
X-Received: by 2002:a25:ef46:0:b0:dc7:4067:9f85 with SMTP id
 w6-20020a25ef46000000b00dc740679f85mr12942760ybm.58.1712121130607; Tue, 02
 Apr 2024 22:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-2-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:11:57 -0700
Message-ID: <CAJuCfpHkqx7yWgN0yXVqtThrNCV07=9AdhTtc5mi=skMXmZRKg@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: mm: cleanup __do_page_fault()
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
> The __do_page_fault() only check vma->flags and call handle_mm_fault(),
> and only called by do_page_fault(), let's squash it into do_page_fault()
> to cleanup code.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  arch/arm64/mm/fault.c | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 8251e2fea9c7..9bb9f395351a 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -486,25 +486,6 @@ static void do_bad_area(unsigned long far, unsigned =
long esr,
>         }
>  }
>
> -#define VM_FAULT_BADMAP                ((__force vm_fault_t)0x010000)
> -#define VM_FAULT_BADACCESS     ((__force vm_fault_t)0x020000)
> -
> -static vm_fault_t __do_page_fault(struct mm_struct *mm,
> -                                 struct vm_area_struct *vma, unsigned lo=
ng addr,
> -                                 unsigned int mm_flags, unsigned long vm=
_flags,
> -                                 struct pt_regs *regs)
> -{
> -       /*
> -        * Ok, we have a good vm_area for this memory access, so we can h=
andle
> -        * it.
> -        * Check that the permissions on the VMA allow for the fault whic=
h
> -        * occurred.
> -        */
> -       if (!(vma->vm_flags & vm_flags))
> -               return VM_FAULT_BADACCESS;
> -       return handle_mm_fault(vma, addr, mm_flags, regs);
> -}
> -
>  static bool is_el0_instruction_abort(unsigned long esr)
>  {
>         return ESR_ELx_EC(esr) =3D=3D ESR_ELx_EC_IABT_LOW;
> @@ -519,6 +500,9 @@ static bool is_write_abort(unsigned long esr)
>         return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
>  }
>
> +#define VM_FAULT_BADMAP                ((__force vm_fault_t)0x010000)
> +#define VM_FAULT_BADACCESS     ((__force vm_fault_t)0x020000)
> +
>  static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>                                    struct pt_regs *regs)
>  {
> @@ -617,7 +601,10 @@ static int __kprobes do_page_fault(unsigned long far=
, unsigned long esr,
>                 goto done;
>         }
>
> -       fault =3D __do_page_fault(mm, vma, addr, mm_flags, vm_flags, regs=
);
> +       if (!(vma->vm_flags & vm_flags))
> +               fault =3D VM_FAULT_BADACCESS;
> +       else
> +               fault =3D handle_mm_fault(vma, addr, mm_flags, regs);
>
>         /* Quick path to respond to signals */
>         if (fault_signal_pending(fault, regs)) {
> --
> 2.27.0
>

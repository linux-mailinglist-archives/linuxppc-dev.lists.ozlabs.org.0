Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06519896407
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:31:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BGHuiIW+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8YJM5Lxmz3dVw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BGHuiIW+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8YHd633fz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 16:30:36 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso5611821276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 22:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122234; x=1712727034; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjRwXgIYbHI7/EpaeeNofMhLW0PpQjYXqswpkTDILa4=;
        b=BGHuiIW+t9hAguNV/0GemvKN2JOBx6rQcibMPRRtTV4MXYXczc4rHGzquUTfuH5uz5
         Gw2c1G5zi2SHlH70bUT1BrLXcqWVeXDtAHOEdgEaEnybDZTI+fFJUZdHztOKR6R5LbrS
         N/5gBVBbkKE+a3SV8+YG/GScYfQmc/JFLitjW5KrQvC9APBfGmaEncK8hdHBULP2wT7v
         1mxS7CYTbAZ5nWtiRFosD2MKfcWR21IYfI7UTUPB4qNuJecLyUYLGmB35c1Nl4BzrtFO
         r+arm4daFfGa+53FVxSUsTGNFyj1yZRtKC16oqlMbko4J5y1uIDTvrcXVZqsKGWvS4FP
         XOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122234; x=1712727034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjRwXgIYbHI7/EpaeeNofMhLW0PpQjYXqswpkTDILa4=;
        b=RjWY/fS2HROEhmgtjHjHuc52GMVMdY3l1WiDqVfIEB6eiYcHinwOy7NUa2rRJmyOIO
         GnKHHej9XbryPUfEEdaMzikTwlD/hLKp7fDkgxAjxsokXyNscbg0qp/mGGN19FEjy+HO
         ao5HV/AptqF4WtOegLin6SOYGWIMMzmEfj7uqA+RqSOASsjUCc6N9efC/R4y0mp3ZRhu
         AMe/Cwz4uV8qxz+iyKbjHhd9TSyHOaqgbGoxMY/l47omNVHwpkcxnU/lkAUnfrGSnAw3
         dXrW9vy7OwrHHmM7mBzuB5tUhEJ+mqLJnyDl93zPQYSr1M/7JqtfXskTtQfN28McMu/8
         GgYw==
X-Forwarded-Encrypted: i=1; AJvYcCWBJRW+jBAirr5F8Jf/fRyKCGAsML57myXZJ4GztsiTgI4QA1C4JV8dys0xhIbywFFQ6o12qbYGs/qlKkihQCKpgWzESczgg2/SYO+Dfw==
X-Gm-Message-State: AOJu0YzZuiUvsVX9CZtNBnFoaK4tH/mST2Lk5c3wTBoQ9GKlOyUcBtKr
	rJhtkh4pRsi9jmm5Jal9TB2WkjG0gmS6hAxacix8RjnQmuK7K7a0wrWBBuPLASWUqJQM1peBIos
	iuw7VE2NvyKEw4Tpa/FM3HsL8dwOpu3jk+I3q
X-Google-Smtp-Source: AGHT+IHl066AzoRG0Gr5vc7GBxoJormNnixyz6sWIm+hB6NrOtXc39rqcc9VFrh3aZ6js3Cc4KaQDJiExFMSumaxlsk=
X-Received: by 2002:a05:6902:82:b0:dcc:140a:a71f with SMTP id
 h2-20020a056902008200b00dcc140aa71fmr12187579ybs.60.1712122234350; Tue, 02
 Apr 2024 22:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-3-wangkefeng.wang@huawei.com> <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
In-Reply-To: <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:30:23 -0700
Message-ID: <CAJuCfpHkrwPp0X65BuYS2SKAkWPJDMNWYPDO+Jr4SmuxoCEsZg@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
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

On Tue, Apr 2, 2024 at 10:19=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Apr 2, 2024 at 12:53=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huaw=
ei.com> wrote:
> >
> > The vm_flags of vma already checked under per-VMA lock, if it is a
> > bad access, directly set fault to VM_FAULT_BADACCESS and handle error,
> > no need to lock_mm_and_find_vma() and check vm_flags again, the latency
> > time reduce 34% in lmbench 'lat_sig -P 1 prot lat_sig'.
>
> The change makes sense to me. Per-VMA lock is enough to keep
> vma->vm_flags stable, so no need to retry with mmap_lock.
>
> >
> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>
> > ---
> >  arch/arm64/mm/fault.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index 9bb9f395351a..405f9aa831bd 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -572,7 +572,9 @@ static int __kprobes do_page_fault(unsigned long fa=
r, unsigned long esr,
> >
> >         if (!(vma->vm_flags & vm_flags)) {
> >                 vma_end_read(vma);
> > -               goto lock_mmap;
> > +               fault =3D VM_FAULT_BADACCESS;
> > +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>
> nit: VMA_LOCK_SUCCESS accounting here seems correct to me but
> unrelated to the main change. Either splitting into a separate patch
> or mentioning this additional fixup in the changelog would be helpful.

The above nit applies to all the patches after this one, so I won't
comment on each one separately. If you decide to split or adjust the
changelog please do that for each patch.

>
> > +               goto done;
> >         }
> >         fault =3D handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_=
LOCK, regs);
> >         if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> > --
> > 2.27.0
> >

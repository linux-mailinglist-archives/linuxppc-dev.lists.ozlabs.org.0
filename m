Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BD897273
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 16:24:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IOBPWrZa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8n7Q6W9Xz3vj0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:24:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IOBPWrZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8n6g1KkYz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 01:23:38 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dcc73148611so6609825276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712154216; x=1712759016; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwJNuwyQp3Yvzu+935Rba/rHkgr+XgKaeFBH6ggamVo=;
        b=IOBPWrZaiIcAgPIIwm5F28YKml+QH/GcWAiuGohXc/MXRBeFZRP+lB9R2bgGz9Xjl7
         op2FJLu/PkRNOQbPO8G4ykS+XMcTf/QmwIObrTSreXRQqCQYmev7UQ5f2cKRHWJ8+YIx
         fPnnobSZUDngL/Q2wmxJNu1ZHrk0Fxt1/IfGp6lEZgNUCnmhkwM9xaplMqG/jYx2tE+r
         KVV2PUI6V2+btpcaeKMYpUnB2TxXa0KZeaJsXlfdis5oUMFSuqr68ddebKvHWHRk6XVL
         92DKn4TjN9zOf1IBgdPEiooLnqZpk5vxlgzZm72ZX27YUrE4cR1tLr0zXKWUsBkJd3Xb
         LvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154216; x=1712759016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwJNuwyQp3Yvzu+935Rba/rHkgr+XgKaeFBH6ggamVo=;
        b=eUQE2FFR6gvUHsCHfMKyb12BUA7v6vhYtN4qKI4WaeNgBqfabrOzQ/suE1WSSmSRKh
         biyUW5+RT7/FTeBhbkn6ksn571UKyVtAyi7GtqqFSbJqf63uGVGzs6DGqAzFPEA3C9Yh
         z5bEDdSZYzIdTGsNUckU+K5FyI2VUdgkPw4qBRh5fCWGn1t0YIBdUEyg0HF5yFA9Ijij
         uSqeR74uj5yCwhSsOlqOV1sWC6XIAh5xztDw4+aq40BasYt9PznG9IWT/tIjmInQPydH
         G1eraOEL7Ti0A/dtygkVM7SvaV6wpBBug5mfDRYtBA/vesvqTICwZQ+pMpUY3uzTS+AV
         3CjA==
X-Forwarded-Encrypted: i=1; AJvYcCVAlhzMhsZHlHEWP2tt0cKhwH5jF46Lh787+m44R08ed8ir3JWlHp3aU8OryxWLQmNrK0F19iRHYUVPG7GBWoKhRijADZi4F6HOYjSYPQ==
X-Gm-Message-State: AOJu0YyrzDzn2A9S0RpSWvt0i871dXunoKCmpvbhFrugMcMycHany+LF
	aAykTwPcxdnpfXZgD3H+5AbQMZrEdgawaFiM18PdEbkEW26egWoT/ORBpD9Ek8jiZMwdjdwik2V
	rDgfz8FzTOMpjvwD00x5mgqgFZMZOcfGT/c60
X-Google-Smtp-Source: AGHT+IHARpbXZVqsZEoa5xySsc3G5/CcR814bUWxWQ15mbjsPwETu+5wjQAHS1k9Hq1FLB9FQjXK6aME+vDVPH/zVfk=
X-Received: by 2002:a25:ab41:0:b0:dcf:a52d:6134 with SMTP id
 u59-20020a25ab41000000b00dcfa52d6134mr2682792ybi.26.1712154215477; Wed, 03
 Apr 2024 07:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-8-wangkefeng.wang@huawei.com> <CAJuCfpFoxP78+P1+4WQcCqMzGv7jpC9V8pR_-R8t8zPUg-t+aA@mail.gmail.com>
 <d5177b0f-db4e-4c78-81f1-5761f08f076d@huawei.com>
In-Reply-To: <d5177b0f-db4e-4c78-81f1-5761f08f076d@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Apr 2024 07:23:23 -0700
Message-ID: <CAJuCfpEKg1wxNwhu9JOsvq9kZM9WUA2MNfH_jb6ZQ0jpGJzEdw@mail.gmail.com>
Subject: Re: [PATCH 7/7] x86: mm: accelerate pagefault when badaccess
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

On Wed, Apr 3, 2024 at 12:58=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
>
>
>
> On 2024/4/3 13:59, Suren Baghdasaryan wrote:
> > On Tue, Apr 2, 2024 at 12:53=E2=80=AFAM Kefeng Wang <wangkefeng.wang@hu=
awei.com> wrote:
> >>
> >> The vm_flags of vma already checked under per-VMA lock, if it is a
> >> bad access, directly handle error and return, there is no need to
> >> lock_mm_and_find_vma() and check vm_flags again.
> >>
> >> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >
> > Looks safe to me.
> > Using (mm !=3D NULL) to indicate that we are holding mmap_lock is not
> > ideal but I guess that works.
> >
>
> Yes, I will add this part it into change too,
>
> The access_error() of vma already checked under per-VMA lock, if it
> is a bad access, directly handle error, no need to retry with mmap_lock
> again. In order to release the correct lock, pass the mm_struct into
> bad_area_access_error(), if mm is NULL, release vma lock, or release
> mmap_lock. Since the page faut is handled under per-VMA lock, count it
> as a vma lock event with VMA_LOCK_SUCCESS.

The part about passing mm_struct is unnecessary IMHO. It explains "how
you do things" but changelog should describe only "what you do" and
"why you do that". The rest we can see from the code.

>
> Thanks.
>
>
> > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> >
> >> ---
> >>   arch/x86/mm/fault.c | 23 ++++++++++++++---------
> >>   1 file changed, 14 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> >> index a4cc20d0036d..67b18adc75dd 100644
> >> --- a/arch/x86/mm/fault.c
> >> +++ b/arch/x86/mm/fault.c
> >> @@ -866,14 +866,17 @@ bad_area_nosemaphore(struct pt_regs *regs, unsig=
ned long error_code,
> >>
> >>   static void
> >>   __bad_area(struct pt_regs *regs, unsigned long error_code,
> >> -          unsigned long address, u32 pkey, int si_code)
> >> +          unsigned long address, struct mm_struct *mm,
> >> +          struct vm_area_struct *vma, u32 pkey, int si_code)
> >>   {
> >> -       struct mm_struct *mm =3D current->mm;
> >>          /*
> >>           * Something tried to access memory that isn't in our memory =
map..
> >>           * Fix it, but check if it's kernel or user first..
> >>           */
> >> -       mmap_read_unlock(mm);
> >> +       if (mm)
> >> +               mmap_read_unlock(mm);
> >> +       else
> >> +               vma_end_read(vma);
> >>
> >>          __bad_area_nosemaphore(regs, error_code, address, pkey, si_co=
de);
> >>   }
> >> @@ -897,7 +900,8 @@ static inline bool bad_area_access_from_pkeys(unsi=
gned long error_code,
> >>
> >>   static noinline void
> >>   bad_area_access_error(struct pt_regs *regs, unsigned long error_code=
,
> >> -                     unsigned long address, struct vm_area_struct *vm=
a)
> >> +                     unsigned long address, struct mm_struct *mm,
> >> +                     struct vm_area_struct *vma)
> >>   {
> >>          /*
> >>           * This OSPKE check is not strictly necessary at runtime.
> >> @@ -927,9 +931,9 @@ bad_area_access_error(struct pt_regs *regs, unsign=
ed long error_code,
> >>                   */
> >>                  u32 pkey =3D vma_pkey(vma);
> >>
> >> -               __bad_area(regs, error_code, address, pkey, SEGV_PKUER=
R);
> >> +               __bad_area(regs, error_code, address, mm, vma, pkey, S=
EGV_PKUERR);
> >>          } else {
> >> -               __bad_area(regs, error_code, address, 0, SEGV_ACCERR);
> >> +               __bad_area(regs, error_code, address, mm, vma, 0, SEGV=
_ACCERR);
> >>          }
> >>   }
> >>
> >> @@ -1357,8 +1361,9 @@ void do_user_addr_fault(struct pt_regs *regs,
> >>                  goto lock_mmap;
> >>
> >>          if (unlikely(access_error(error_code, vma))) {
> >> -               vma_end_read(vma);
> >> -               goto lock_mmap;
> >> +               bad_area_access_error(regs, error_code, address, NULL,=
 vma);
> >> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> >> +               return;
> >>          }
> >>          fault =3D handle_mm_fault(vma, address, flags | FAULT_FLAG_VM=
A_LOCK, regs);
> >>          if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> >> @@ -1394,7 +1399,7 @@ void do_user_addr_fault(struct pt_regs *regs,
> >>           * we can handle it..
> >>           */
> >>          if (unlikely(access_error(error_code, vma))) {
> >> -               bad_area_access_error(regs, error_code, address, vma);
> >> +               bad_area_access_error(regs, error_code, address, mm, v=
ma);
> >>                  return;
> >>          }
> >>
> >> --
> >> 2.27.0
> >>

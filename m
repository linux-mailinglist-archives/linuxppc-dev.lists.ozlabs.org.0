Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CBA8FC116
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:07:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LTPDJtfH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8TF1vR2z3dKC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LTPDJtfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv8SV3GCpz3d8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 11:07:06 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6f4603237e0so246855b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 18:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717549624; x=1718154424; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8MODctVo107maa3kheuMwZfqqB2xVY67/KYlMCAoSw=;
        b=LTPDJtfH/6DrOjLAhnznBSeAxVrwxh/uLZuiXhF8kTKA5kRW24z88hMIcqJ0rQwpxn
         PZQ1jY+7ssmwQRAlFx6NdQBUpvBcHb3i3pKI4k18EEKAZHw0KrPGHa2lVUp0lcKQnmp+
         0/UpoxlSl9mfM6LX/gEYc+A/bhJfXR9u2bbBMT1QilrdnEdoGjg81upF4tboJE1Xv3W4
         FO1+bEeDXJAeOW9TBhE7bWRhUwBsC81bQ5k2FzvLMhtz3K8UMCglWBV46mbNT0QuEcXe
         rS21g4aoyAFQE6gL+TRb6VYnjjX9ILpaOBEOMWINKaDbl8A1FsgQtKC4htDdlMcrMdkE
         a1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717549624; x=1718154424;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8MODctVo107maa3kheuMwZfqqB2xVY67/KYlMCAoSw=;
        b=pfcceP2x9aoAaDxcVh+2Mh0YuHHyKSPTWdQrAVksiJDSXIdH81ZRbSDl3N8YanO2gL
         a5xBJ6V4aWLiWKIXyIB68Ia9fqcrfbCdaUW59H4kHT+a+LT5K6aKn62vLiETXzZKLc/Y
         sH+REbRu9WRIx/3yx3AB1ujmIrXCMZKbW1IvzW9liO7GktDHZI8AMR7n9GbJ5llCUxA2
         xrUo1On4KaqnX4AR1nnlI38M9pl3M1AjwV6zXxAXaQdGS6uC70OqbFPI+mplVq2c8hub
         sqOLwInkGAjZdU4nmCwE+h/Dqoatx7HQoUeNIoXUrMErp4pOXZx+loUyuhkLSt8kEmcT
         XlHg==
X-Forwarded-Encrypted: i=1; AJvYcCV1HjGJq2aFos8PAuti4lRuu22PIUJxTHQR9NcrLgfATdoL+3klf10Tro73Lmju5yQcdiP5/dHrV9DovPLCm9pBqOPCtmkfcpU/dD3xmQ==
X-Gm-Message-State: AOJu0YzQ5a+wzzsSjhTAWjrT5/J39t2btdTv0fTCH9tVqCj8ocLu9RlV
	U7Xf/KeHDEIfrXvm6gx7Ix50FEijwSbGBWFUFdyD6OVbo+PsUot5ervipw==
X-Google-Smtp-Source: AGHT+IGcG8O833Adzt4vsnj+C3YmsA8Iu1/Gu6CWDfChhSH0dDkTcL5xCJL4A1hk35HmWo4c67BAfg==
X-Received: by 2002:a05:6a00:3cd6:b0:6f3:eb71:af90 with SMTP id d2e1a72fcca58-703e4b9bdbdmr1726526b3a.4.1717549623706;
        Tue, 04 Jun 2024 18:07:03 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7024967ae05sm7161080b3a.157.2024.06.04.18.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 18:07:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 11:06:57 +1000
Message-Id: <D1ROIXQIHXJV.38DLKI4T392V5@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 22/31] powerpc: Add MMU support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-23-npiggin@gmail.com>
 <75adb602-7ccc-4dcd-916e-5f79fcd1cdd3@redhat.com>
In-Reply-To: <75adb602-7ccc-4dcd-916e-5f79fcd1cdd3@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 5:30 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > Add support for radix MMU, 4kB and 64kB pages.
> >=20
> > This also adds MMU interrupt test cases, and runs the interrupts
> > test entirely with MMU enabled if it is available (aside from
> > machine check tests).
> >=20
> > Acked-by: Andrew Jones <andrew.jones@linux.dev> (configure changes)
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> ...
> > diff --git a/lib/ppc64/mmu.c b/lib/ppc64/mmu.c
> > new file mode 100644
> > index 000000000..5307cd862
> > --- /dev/null
> > +++ b/lib/ppc64/mmu.c
> > @@ -0,0 +1,281 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Radix MMU support
> > + *
> > + * Copyright (C) 2024, IBM Inc, Nicholas Piggin <npiggin@gmail.com>
> > + *
> > + * Derived from Linux kernel MMU code.
> > + */
> > +#include <asm/mmu.h>
> > +#include <asm/setup.h>
> > +#include <asm/smp.h>
> > +#include <asm/page.h>
> > +#include <asm/io.h>
> > +#include <asm/processor.h>
> > +#include <asm/hcall.h>
> > +
> > +#include "alloc_page.h"
> > +#include "vmalloc.h"
> > +#include <asm/pgtable-hwdef.h>
> > +#include <asm/pgtable.h>
> > +
> > +#include <linux/compiler.h>
> > +
> > +static pgd_t *identity_pgd;
> > +
> > +bool vm_available(void)
> > +{
> > +	return cpu_has_radix;
> > +}
> > +
> > +bool mmu_enabled(void)
> > +{
> > +	return current_cpu()->pgtable !=3D NULL;
> > +}
> > +
> > +void mmu_enable(pgd_t *pgtable)
> > +{
> > +	struct cpu *cpu =3D current_cpu();
> > +
> > +	if (!pgtable)
> > +		pgtable =3D identity_pgd;
> > +
> > +	cpu->pgtable =3D pgtable;
> > +
> > +	mtmsr(mfmsr() | (MSR_IR|MSR_DR));
> > +}
> > +
> > +void mmu_disable(void)
> > +{
> > +	struct cpu *cpu =3D current_cpu();
> > +
> > +	cpu->pgtable =3D NULL;
> > +
> > +	mtmsr(mfmsr() & ~(MSR_IR|MSR_DR));
> > +}
> > +
> > +static inline void tlbie(unsigned long rb, unsigned long rs, int ric, =
int prs, int r)
> > +{
> > +	asm volatile(".machine push ; .machine power9; ptesync ; tlbie %0,%1,=
%2,%3,%4 ; eieio ; tlbsync ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "=
i"(ric), "i"(prs), "i"(r) : "memory");
>
> That's a very long line, please split it up after every assembly instruct=
ion=20
> (using \n for new lines).
>
> > +}
> ...
> > diff --git a/powerpc/mmu.c b/powerpc/mmu.c
> > new file mode 100644
> > index 000000000..fef790506
> > --- /dev/null
> > +++ b/powerpc/mmu.c
> > @@ -0,0 +1,283 @@
> > +/* SPDX-License-Identifier: LGPL-2.0-only */
> > +/*
> > + * MMU Tests
> > + *
> > + * Copyright 2024 Nicholas Piggin, IBM Corp.
> > + */
> > +#include <libcflat.h>
> > +#include <asm/atomic.h>
> > +#include <asm/barrier.h>
> > +#include <asm/processor.h>
> > +#include <asm/mmu.h>
> > +#include <asm/smp.h>
> > +#include <asm/setup.h>
> > +#include <asm/ppc_asm.h>
> > +#include <vmalloc.h>
> > +#include <devicetree.h>
> > +
> > +static inline void tlbie(unsigned long rb, unsigned long rs, int ric, =
int prs, int r)
> > +{
> > +	asm volatile(".machine push ; .machine power9; ptesync ; tlbie %0,%1,=
%2,%3,%4 ; eieio ; tlbsync ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "=
i"(ric), "i"(prs), "i"(r) : "memory");
> > +}
>
> Same function again? Maybe it could go into mmu.h instead?
>
> > +static inline void tlbiel(unsigned long rb, unsigned long rs, int ric,=
 int prs, int r)
> > +{
> > +	asm volatile(".machine push ; .machine power9; ptesync ; tlbiel %0,%1=
,%2,%3,%4 ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs)=
, "i"(r) : "memory");
> > +}
>
> Please also split up the above long line.

I'll try to improve the lines.

> It would also be cool if you could get one of the other ppc guys at IBM t=
o=20
> review this patch, since I don't have a clue about this MMU stuff at all.

It would be.

Thanks,
Nick

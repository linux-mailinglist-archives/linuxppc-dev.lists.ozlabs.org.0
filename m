Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F081D2342
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 01:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ms5b745PzDqKL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 09:56:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SC3LabVm; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ms3r1VHkzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 09:55:02 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id r25so23070917oij.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59CnFVjzCbJJohtpXzF6uDmxVkSM8k14bGazprRjUSA=;
 b=SC3LabVmGp5VCvVIdOtTw+7OFVIpNmZU4f3WDQ65cP5mhYp6hBvbug2jWUwzgevJDc
 /rcpXTqEuas+RDIzBK32gXCTF9w59qZgJDPZkgDx/PJVORJCGI+jLviVQxZidWcFcPz0
 POcblYGuSl7DAYg3lgHQQvsLUomxCobiWAUhjnXG21Wg5gu/+licHtVfByU5Aa9RPlAg
 2Bsl4xGEmSuc9uEXhAAz7PNnMCwsg3X9kEcCZmBlGJtjzA/JxV8VzXj9YnOO1DdEhm9g
 mheU2B35kcYjDlXJc+I4ViAeUjn4/K2K4o8+LrDe49fe5TN/UIMkvEEaX6bDgQk8V3Vu
 FVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59CnFVjzCbJJohtpXzF6uDmxVkSM8k14bGazprRjUSA=;
 b=PS2f/9EK5+QEB+FUkq5gMazhq+bOZM67IBwHbjBAwTf8ivTJCERx2IzAeri+5r7ZIa
 vVOAUeg+c5oGC2zBdL34qBoyXlPbVu3Kx1HG0rSyEK1eA+sqMauldNLRJVYLrh93Q5cF
 /Eih35/S2vGoO56dmo5ajHqPFatT9ZKubeEv74+3ggDbyYC3Oq9Q7qRqqG6NsLr4aVe6
 1fVM/BmlsQz3C9jvO0gL8+jJkPHnDSWE5tGWm23c+2LGsCSoZMrlzcksob5W2BwIYalM
 1wzcPdL2KRzTCqF+a2qsAxsrT3w4Spldu1OMK4+bQ0sNzYH8f1UKWqLo3WHZzzrySp85
 xkUA==
X-Gm-Message-State: AGi0PuaGp0Am+ew9txxX/9dzQeNXV6+VduxKbUXOCMRO2X+s7xDT32by
 ZL2dZ2j3HYhsIhn0O4rp/+2tP6ZX4xGLoB0KfL0=
X-Google-Smtp-Source: APiQypK6Fy7+pWDJ3+U10IWg4xElk250bh/egF3APu3vqAiqWD9aFQbe0AX7AxN33StoZBamZY62Ivfd7At35a1n7iY=
X-Received: by 2002:a05:6808:3d5:: with SMTP id
 o21mr30283632oie.40.1589414099427; 
 Wed, 13 May 2020 16:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-17-jniethe5@gmail.com>
 <878shvc40x.fsf@mpe.ellerman.id.au>
In-Reply-To: <878shvc40x.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 14 May 2020 09:54:48 +1000
Message-ID: <CACzsE9od2GFXBiy5imy_dGutx7POOnCx7+k-Ynx+UMcNzyTsTw@mail.gmail.com>
Subject: Re: [PATCH v8 16/30] powerpc: Define and use __get_user_instr{,
 inatomic}()
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 14, 2020 at 12:17 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > Define specific __get_user_instr() and __get_user_instr_inatomic()
> > macros for reading instructions from user space.
>
> At least for fix_alignment() we could be coming from the kernel, not
> sure about the other cases.
>
> I can tweak the change log.
>
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> > index 2f500debae21..c0a35e4586a5 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -105,6 +105,11 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
> >  #define __put_user_inatomic(x, ptr) \
> >       __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> >
> > +#define __get_user_instr(x, ptr) \
> > +     __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> > +
> > +#define __get_user_instr_inatomic(x, ptr) \
> > +     __get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
>
> I'm not super keen on adding new __ versions, which lack the access_ok()
> check, but I guess we have to.
>
> > diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
> > index 3dd70eeb10c5..60ed5aea8d4e 100644
> > --- a/arch/powerpc/kernel/vecemu.c
> > +++ b/arch/powerpc/kernel/vecemu.c
> > @@ -266,7 +266,7 @@ int emulate_altivec(struct pt_regs *regs)
> >       unsigned int va, vb, vc, vd;
> >       vector128 *vrs;
> >
> > -     if (get_user(instr.val, (unsigned int __user *)regs->nip))
> > +     if (__get_user_instr(instr, (void __user *)regs->nip))
> >               return -EFAULT;
>
> That drops the access_ok() check, which is not OK, at least without a
> reasonable justification.
>
> Given it's regs->nip I guess it should be safe, but it should still be
> called out. Or preferably switched to __get_user() in a precursor patch.
Or should I add a get_user_instr() that includes the check?
>
> cheers

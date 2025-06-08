Return-Path: <linuxppc-dev+bounces-9205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D830AD11BC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jun 2025 11:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFVXn3HcNz306d;
	Sun,  8 Jun 2025 19:45:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749375929;
	cv=none; b=S9Ntw08jijQZ8HJLUs6EQ3u2tTAvycM/we4iwLy8sLSk4rYDcsNaIojtmooGYFE3M2jCCrZQsO7iQNcaxC1iLw2A4Pilm88cRvEKixvf+uKhQVrsqSfcAyJU6rybh2wf2A1z37tjukVz6M5WQr/N2iq1j8g9SZkit4pTU2TFV2XRIBcVxDHF0ahpPjBZa6ola5E/dZd5ZBWzpDwaX8rUXsXAERBxc1zQILug0JQD6fxOK6BJ4ZxTllJdquUMzyoojTtRdkRmNLiBLdUv3mX5kN0UjyufOMeqMJRUnqH2HRwPu/FTrMWbMl6+MaYNxWURsv176iZNMqbi8zi0nVRpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749375929; c=relaxed/relaxed;
	bh=PEIWuLmQRMVnfGdgxWwMM+uZrcmSfOPwu48WTLXFYZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iO0PDPowesnQ0zctDSWJ8sdoG1bajVxtZInhdr2W61hdW/k5gDDexgUaSmfCSJq9+7uqRwRzbK7r5kDhmJUtHDvnG5diotEYWUcZ6NfSnqwlu+W8CyJND2J1FPGips+RT3Bc0tYZNtAzzQwZP9H1UKtkwZYOAScccvKCtGuw8TKUh8+h7qpZ89UpC9uRtouHRFPyAkbHk2u1AAtJlZK+J7nqqV1WVVR9OZO0qmJ4xFui0c0rbnYCKv5KkaGpKuNtky3NHAOWpexY46TAxCNa0K3EUvWbrYMCURweHA/o2001O5zIYiBkF6ta8Qd2kNDPSCPoolLZovyMiFSchCpKcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFVXm00Z7z305n
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 19:45:27 +1000 (AEST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-606668f8d51so2119044eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jun 2025 02:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749375925; x=1749980725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEIWuLmQRMVnfGdgxWwMM+uZrcmSfOPwu48WTLXFYZc=;
        b=Zlji/T9LworYOccMTcYBJrf7EIbVBwvTF2R+sJ6Fip8ezES116MFu3M/jI+K2U8LVw
         goeUSCYT5wfWUUPXlVrHqq0sfVmjQxumb6D3yhzQ2/znVMznHLvlDKzpeFQdj0eZopyp
         EK6CPiEK2SwL0OqYExtM5MPbuEhJBWry4bd3UfuIaFQdmmryN/SaFCpqq0ckPg/UZyN3
         Un0G9PXdKtSaSRxmSnBRJ3bfpV4ToAq0KejNA6IJGImWc7ngyWM4XuLlnemgKIdXgpmJ
         JerFPYhezCgrLGsbo+cCBJH4zTU2RcERHOJTlcYyd6DG/vcxJGLs8euJfSJFl9TfgB4j
         T+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrIsLn0HlSVOY5LGoOB+EwrhYnUBlTIavE8tg2mBsG8xggR+MuIoJpoaN44tbpz/BICMbjxkdbs5wxhA4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMMijxkAxji5AwbIz3S9nMJJYJFfm5TamHogwMoU6a/4sZMb2Y
	5fLiGA4fHInkNHTT0K1bVOg04hyIFTNWIHEtJPMzOMsa2IOXTXWGfZAtOjYMb8zn
X-Gm-Gg: ASbGnctXVy/HjLDgaTgb9/kf2ZSA7Dvj3ABXWAwvZD2iuMmXta8Y+BivTIaLA0qsaeo
	Tuj2zsmKiLKNAi4TZo6V30vYTbMOBsgSmlNNPdghk4K293SXpN87hy5uTIwmTr3tyVQqDJ+iQ+x
	mu4DbIUS7icByXcyZqopcBQfITdy6HVnpQ5nxiQ0wNNzbnzRU9kXHsz18u27jjNXjIvf5RolXaZ
	nT7bXsdD9ZiqI1q/PKB6y5LEOZXdh+UApOcgH7vUGVJGK/M1QDe2Arj0lRay7ggIDiwaSWpp/RZ
	A38xYUFZ+3BIAziP8w8Q44CGlqNcNAJbomhwUd4rcmSJehZACn/n8g92qSV2hnWfEQqI82zM0yM
	HlqoCyFJyZdRm+yxzymVFwiYZ
X-Google-Smtp-Source: AGHT+IHMN94InuYKS8D0hOKY5jl2DwRh86vx9Fm8iSukBSAAYMQsEskuUzX/ysMD5kgvJqT7mxHAdg==
X-Received: by 2002:a05:6820:215:b0:60a:26f:ad8d with SMTP id 006d021491bc7-60f3d56e8dcmr5722924eaf.0.1749375924597;
        Sun, 08 Jun 2025 02:45:24 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60f3e66fc6fsm905357eaf.17.2025.06.08.02.45.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 02:45:24 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-730580b0de8so2601133a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jun 2025 02:45:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCa+Kzg+CuOjZUEMJLavgLrKQkjqJYQ5P/jNlCIcMoF4kq+gPvvGc7UW68DcUomzmI20a7taWwsHd+L5U=@lists.ozlabs.org
X-Received: by 2002:a05:6102:12c7:b0:4e1:ec70:536 with SMTP id
 ada2fe7eead31-4e784052d39mr1902461137.4.1749375601424; Sun, 08 Jun 2025
 02:40:01 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250315105907.1275012-1-arnd@kernel.org> <20250315105907.1275012-3-arnd@kernel.org>
 <6c7770dd1c216410fcff3bf0758a45d5afcb5444.camel@physik.fu-berlin.de>
In-Reply-To: <6c7770dd1c216410fcff3bf0758a45d5afcb5444.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 8 Jun 2025 11:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeTWSU64jQt+nybsSBOpBEu_zO0WmE5FK1PnA3YkALUQ@mail.gmail.com>
X-Gm-Features: AX0GCFt4vabIohtnnm_mFUKWYT8sgcrvXqd5vSNi-se7k7UhxzRe5PjaG9sA3nI
Message-ID: <CAMuHMdXeTWSU64jQt+nybsSBOpBEu_zO0WmE5FK1PnA3YkALUQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] sh: remove duplicate ioread/iowrite helpers
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Julian Vetter <julian@outer-limits.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Adrian,

On Sat, 7 Jun 2025 at 14:08, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Sat, 2025-03-15 at 11:59 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The ioread/iowrite functions on sh only do memory mapped I/O like the
> > generic verion, and never map onto non-MMIO inb/outb variants, so they
> > just add complexity. In particular, the use of asm-generic/iomap.h
> > ties the declaration to the x86 implementation.
> >
> > Remove the custom versions and use the architecture-independent fallback
> > code instead. Some of the calling conventions on sh are different here,
> > so fix that by adding 'volatile' keywords where required by the generic
> > implementation and change the cpg clock driver to no longer depend on
> > the interesting choice of return types for ioread8/ioread16/ioread32.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> Those are quite a number of changes that I would like to test on real hardware
> first before merging them into the kernel.
>
> @Geert: Could you test it on your SH-7751 LANDISK board as well?

Already done for a while, as this patch is commit 2494fce26e434071 ("sh:
remove duplicate ioread/iowrite helpers") in v6.15-rc1 ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


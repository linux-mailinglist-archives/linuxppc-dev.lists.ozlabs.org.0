Return-Path: <linuxppc-dev+bounces-4402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337B09FA436
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 07:07:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YG9fh5q0Mz2yVb;
	Sun, 22 Dec 2024 17:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734847644;
	cv=none; b=muMCO+cgEwv0nA7J1jfJuoO2IH+/SadkM9mCJojMJFJnb7nWcZsCzcLNj4KabAep0Gc6XX3cmh1keU8BH47Jg/Pd3ZpR2H6Fboj7tdni3fWz4uj3YKe/SAAbyNl8huzn7lSb26OtAdmJ+S7tSSxLhT5tXZHuWoztzc343yWs9VdKFy3xMYNLVA1/1X4CNVfUNMsZvvfbXgJ43O2SPfrHThQcarNcNbg8szeksb80HBmDgNqq0nnvkODkRkS0sbGUnGyNLicPtUz/I2g8FBmGVPdQ1Nr4+BG50ogBpRvTPAIg5bqvx+nF3705xfhWtKletlNtDfQlrGkU5oUiIZXBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734847644; c=relaxed/relaxed;
	bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTVgq6sTphDiy8M8SHLKsMV8dRDcVeApSMhqsbwMoA1zPXssVry/UkMH7soMN6LBR+BVydXm8WKh935JsihkaP7KBElw9xdwBW2yOZ3Xcf1hnEBq2jjIQkdWE4/lsUDLeR/oY1OqzzCR0q43XqKEP7LsbSi46uHY38pkCyxlTrWTSibvAdmwzUvfEHN3UvGM4I/0zJVOTW2aKl3CJmzcLJl7P/eWuB+pcOb33cvZ7RLkMU1mn6MOKHQ2AJSvbKd47xSmF0kJmTyS0FQtswRaV8oPwo32v27DrodVvUNFdfIzHId2O7Wiru56tlAyRAMGFvWcBybfZbbzsoA/iJ9Z0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KOMvkQYX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KOMvkQYX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YG9fg1cZgz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 17:07:21 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so3434400276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 22:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734847639; x=1735452439; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
        b=KOMvkQYX33TJWyGGjx6ODdEP5vXtfjTq4PsBIPTCfFBKjB9U/273qg+xRIdTdsLUtc
         22xK3XG6+CbXq9hZxtNtU9NszB26G1LxgQWJJ6uoDNzaQ7WW08GujUkB5Ua3jBfVAKvl
         r8t7Uqk0qQnd1GOYsiSwCpsUKNpYSJTe1La0AwpAcenNLuR3yCA5sf3bjCS7GYQi4lIJ
         nxuS3FT8OJb7pIYRtUcKaWvRKw7gm2AnIubQF0DY45RFguzyuHzVkj/K+Z5blXgN0bSX
         7sBoG68MyugYadyIXK5Z99ABXUxtHPrE3h1g0L0QZY4qMw2MFE9mX76of5Aazwkvv8K3
         f7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734847639; x=1735452439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
        b=j4X6Io2lMPpkAmiK5d6gHVbnjjVRyA7Zzn1zOE5r9qArR5SaKnuum6fHzecRA+qH0z
         0GDV2DHnNmCHl+sU/gAvIcOK8ymsINNL4zdyXPiFKFDZg4LkNou+Svrpx1UdPcVOB6aZ
         92vbPrXnTiMsOX0n0v4bstJSomCyCX4RuiW85WhcPh38cZKp/kuaW0A9vYfxUYrKlbOC
         0rYZAhyVB0zno7n3kH61jUzm/Whi6XrrDX7+vLbdIdRhxuX8tc4QfX0eR4qoaoMnTLo5
         D+hhA9T0EovUW0imIw4u+N2Oe2sw79zb1oeJgYBHx/SdIBa+fcEKsLlX94UQTF4D22D4
         0RYw==
X-Forwarded-Encrypted: i=1; AJvYcCWVkghwLPY91LhURnWgqfyfRbXMWsNMe8VxgrSGpFRlZrPl181LPLDQCu5tfMg2u9NSBM1bv0+Infzm68s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0qNQOkuzR/ANAYIjsXjZL0MxaHqemNh3CMp41SG9kXhyVL3vf
	p4xEUtNoJsXtaCNmFAdq4wjLfjIIVqXW4TBayYaG9nurDNC4hpVB0Ny3ykESbVbAPhOIJ/gU0/0
	MfkiFF0OqoVo8J1ysj9mShxn7HLo=
X-Gm-Gg: ASbGncsO0vWXKHxuShFZ3lB82hLQID9IlkZxJeP8ZPVo9I1A4Li7YvoXbwtQRzCskJv
	Yu1EeZQbGugBBlD4xtx2bVHzw1v3SgCoh0VLWG6U=
X-Google-Smtp-Source: AGHT+IHTObibTWvFBx2RCqB+bk/1ZpT+xydtv33cOquvAas7ggMPQiaYSrqKqDsv5/UZU90VEPoAsSH6qDx1lw2KYn4=
X-Received: by 2002:a05:690c:6908:b0:664:74cd:5548 with SMTP id
 00721157ae682-6f3e2a65668mr105552167b3.1.1734847638651; Sat, 21 Dec 2024
 22:07:18 -0800 (PST)
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
MIME-Version: 1.0
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com> <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
In-Reply-To: <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 14:07:09 +0800
Message-ID: <CAOm6qnk0KYJXuCLU=7Y10wjMjWnUQ+n_RDsJZv5rAqBmq9bkug@mail.gmail.com>
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
To: Xi Ruoyao <xry111@xry111.site>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Xi Ruoyao <xry111@xry111.site> wrote on Sunday, 22 December 2024 13:51:
>
> On Sun, 2024-12-22 at 13:43 +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > ---
>
>
> Please try to avoid bumping the patch revision number so quickly.
>
you are right,  I'll pay more attention to this in the future.
> And if you must do it, you should embed a ChangeLog of your patch (below
> this "---" line) so people can know what has been changed.
>
The update was indeed due to my problem. CI prompted me that there
were some compilation warnings that needed to be dealt with, so this
update was to fix the CI warnings. Refer to this:
- https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/

> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University


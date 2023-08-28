Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8531B78A9A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 12:10:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LVg55P2e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ5s62S4Kz3c5P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 20:10:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LVg55P2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=schmitzmic@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ38J2l1Tz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 18:08:00 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c0bae4da38so19223505ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 01:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693210077; x=1693814877;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnrE6dyfVAprK/xFUC60jFewyVljQRt3NNtTMulp0V0=;
        b=LVg55P2ejT0BJXH9H1+hgJHcBL2A+IF5g+KpwZsnJ2WoqXmcrL9ZfEfa3T6fNEdxE+
         ga2nqaZ+gZjmffBcNuVnaXDtmvodkJeUEflTba5i6j/rIlhBduWdBgZRPVnHwy+erFMo
         Q2sF5ZgAuDt+03EKZEd8qEogPdBU5cTg8EccDlTx6cSnC2QLYfomUfDCZyZGJl19L0Ry
         zfDO9BgqWN0KlkikpK3fWA7KZvQWChySAj+L6JXiUhVTo7xH2gRnW3f4Al2lAGJTZzAW
         5ZruNkogVGDYB3ptB7Tk7PeewBGyh+fZdTDyBJ7/jPzoGq3RnYeGV17VCUydj0j+5OXO
         MJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693210077; x=1693814877;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pnrE6dyfVAprK/xFUC60jFewyVljQRt3NNtTMulp0V0=;
        b=YwU/QClC4a6c3HSR+pS2RN7ipu9m2gc4Iji59BAWUCsFJLBpdqJxRh8HilWcAp30fL
         /n3WqZjICNy9IuM0/gO/lXrcYqWrtsRqsSb4cCC8HW35X7eXof8SYGZYyHzU7rNI+4LH
         XL1Z+RI4/5qnmIuvtC8mlP3I4TB4ejCWyRQfngvGfJDVUOOrYjqVXELpyg9k+Q+DayGw
         wAOXDHww80HdAbKLFyN63BTYY3DFz3FL9FzzFffAWVcE6s2YtSNsQbqcwX9kYdGkoF4m
         YRCnzsIOmtujwNEPRJTlz1WNnrGzDoAzDnuvZscf8FDpP2gTcrWGAI1e4CdiVvryM7jJ
         rCLQ==
X-Gm-Message-State: AOJu0YwmGUDx6tLX2z/G/ZCXGFt5/Z62Y/Oo4g0h2hL3+W2R3wp3Zcfs
	ep2+0U+Ya4BM39yjGFg0BuU=
X-Google-Smtp-Source: AGHT+IHEN6rjlzubXIy3DuU1iYHuYGfJmUDj7MCrRMJIjxExjNAtfO/xrf/2cugqJ3sCcKtAmuhffg==
X-Received: by 2002:a17:903:41d1:b0:1bf:193a:70b6 with SMTP id u17-20020a17090341d100b001bf193a70b6mr38374653ple.5.1693210077452;
        Mon, 28 Aug 2023 01:07:57 -0700 (PDT)
Received: from [10.1.1.24] (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902ea9300b001bc445e2497sm6610519plb.79.2023.08.28.01.07.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2023 01:07:57 -0700 (PDT)
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
 <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
 <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
 <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <dbed3311-6b8e-a396-7e9e-2747902c5d6a@gmail.com>
Date: Mon, 28 Aug 2023 20:07:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Aug 2023 20:08:51 +1000
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-block@vger.kernel.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-snps-arc@lists.infradead.org, linux-scsi@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>
 , Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-openrisc@vger.kernel.org, linux-pci@vger.kernel.org, linux-s390@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Andrew Morton <ak
 pm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

Am 28.08.2023 um 18:42 schrieb Geert Uytterhoeven:
> On Sat, Aug 26, 2023 at 12:44 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> (Incidentally - did you ever publish the m68k full history tree anywhere
>> in git?)
>
> You mean the gitified version of the Linux/m68k CVS tree Ralf created
> for me because my machine wasn't powerful enough?

The very same ...

> No, and I should look into doing that...

No pressure!

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>

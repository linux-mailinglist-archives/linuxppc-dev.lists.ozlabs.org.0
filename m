Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA06FC01B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 09:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFq3g4YRzz3bkk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20221208.gappssmtp.com header.i=@rivosinc-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=fZP2GHn4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20221208.gappssmtp.com header.i=@rivosinc-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=fZP2GHn4;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFq2q14Qsz3bbP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 17:06:41 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30771c68a9eso4722816f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683615995; x=1686207995;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=useBAoxrYFwGHlGULbrUpovVaQLb6iywksro7xdg1q0=;
        b=fZP2GHn4DPbtLB9U9ddJiVCa5mTnlQNHnfLoeLLIICTFhTP6H3OheMCsLlesKdlSjE
         oxU7n/iEvpzCiIYBayhdlJx0vjcsF5ikFN4zXIwD296y1TGVXwz9lO9zjYppSVQl+nN0
         xgd6JUvZ32UxidXxTPFEPDuxgQ/X2ydDOHmPHO9scxbna8W/NFSPeDJtdXIHo3ymexpI
         ep52vrhEvlYwUgGOx/cdDvX1kJfm5x5sc2koohyYVOeWf/Q5Mxww/sb06tbAL+q/sPNa
         0eFClRmYTi0tn/TtP8PBkUEdMFbpiX+WXktTpdlFF9cnNJVnyawqlUi+NQlMXW1WKr0u
         tKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615995; x=1686207995;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=useBAoxrYFwGHlGULbrUpovVaQLb6iywksro7xdg1q0=;
        b=S8YJke2u78vRUjH8Xc+R18F6yfnqA6I/8Ffs9Zekk0s/OztOAjNdeN3mWOU0i7kvN/
         njdow0g+zqWpKkh+uGfdKFSl4CcnMxIkt+KTcD3nyTZw49dSPYwh9OptcEn2uJj0XZ6+
         m1nbya8zc1fijkmMsSDXZkZfcqe2OE/jrEXVFjkR8QirRdd8hnDsPFbRK9lqQ4bj0X80
         MqkUoMQ7uKuLaZ9Qvbq/o1BnLm5QvPl/qmfsAmSlihYFXug0Y6vvEjBBJoV4PcIIsWVl
         QHDRS0y/y5s9WyEVOqtB6SM19nGcPuvgXb9rK0Hk0jlsn6h5YXVX4RuHy+j3x7iZOGBT
         dhdg==
X-Gm-Message-State: AC+VfDzpfB+ueaYcYnBO3VJZemWNv16kEJdDARzH0DC8kAG77K4boKPv
	bJDS16QMeHv8r6asjhvqc6Q9VK90AAk54E2POzsHvQ==
X-Google-Smtp-Source: ACHHUZ48BETwgkFEHm8YnNvXMQpcpYVDJsRZesFXjLdWUvDZRdq9TUHfydeR5bG1gLliOkfOUxpETfIXCAorTp5K1Pw=
X-Received: by 2002:a5d:6a47:0:b0:306:2d16:9b4f with SMTP id
 t7-20020a5d6a47000000b003062d169b4fmr9470428wrw.9.1683615995449; Tue, 09 May
 2023 00:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 9 May 2023 09:06:23 +0200
Message-ID: <CAHVXubjRtto_omfz_NsLcKkJniciX0ShNxcX5vBqnGFQLpB4ug@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] Remove COMMAND_LINE_SIZE from uapi
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Mar 6, 2023 at 11:05=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> maximum length of /proc/cmdline and userspace could staticly rely on
> that to be correct.
>
> Usually I wouldn't mess around with changing this sort of thing, but
> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> increasing, but they're from before the UAPI split so I'm not quite sure
> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> asm-generic/setup.h.").
>
> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> part of the uapi to begin with, and userspace should be able to handle
> /proc/cmdline of whatever length it turns out to be.  I don't see any
> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> search, but that's not really enough to consider it unused on my end.
>
> This issue was already considered in s390 and they reached the same
> conclusion in commit 622021cd6c56 ("s390: make command line
> configurable").
>
> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> shouldn't be part of uapi, so this now touches all the ports.  I've
> tried to split this all out and leave it bisectable, but I haven't
> tested it all that aggressively.
>
> Changes since v4 <https://lore.kernel.org/all/20230302093539.372962-1-ale=
xghiti@rivosinc.com/>:
> * Add my own SoB as suggested by Geert
> * Add riscv patches as suggested by Bj=C3=B6rn
> * Remove "WITH Linux-syscall-note" from new setup.h not in uapi/, as
>   suggested by Greg KH, his quoted answer below:
>
> "The "syscall note" makes no sense at all for any files not in the uapi/
> directory, so you can remove it just fine as that WITH doesn't mean
> anything _UNLESS_ the file is in the uapi directory."
>
> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-ale=
xghiti@rivosinc.com/>:
> * Added RB/AB
> * Added a mention to commit 622021cd6c56 ("s390: make command line
>   configurable") in the cover letter
>
> Changes since v2 <https://lore.kernel.org/all/20221211061358.28035-1-palm=
er@rivosinc.com/>:
> * Fix sh, csky and ia64 builds, as reported by kernel test robot
>
> Changes since v1 <https://lore.kernel.org/all/20210423025545.313965-1-pal=
mer@dabbelt.com/>:
> * Touches every arch.
>
> base-commit-tag: next-20230207
>
> Alexandre Ghiti (2):
>   riscv: Remove COMMAND_LINE_SIZE from uapi
>   riscv: Remove empty <uapi/asm/setup.h>
>
> Palmer Dabbelt (24):
>   alpha: Remove COMMAND_LINE_SIZE from uapi
>   arm64: Remove COMMAND_LINE_SIZE from uapi
>   arm: Remove COMMAND_LINE_SIZE from uapi
>   ia64: Remove COMMAND_LINE_SIZE from uapi
>   m68k: Remove COMMAND_LINE_SIZE from uapi
>   microblaze: Remove COMMAND_LINE_SIZE from uapi
>   mips: Remove COMMAND_LINE_SIZE from uapi
>   parisc: Remove COMMAND_LINE_SIZE from uapi
>   powerpc: Remove COMMAND_LINE_SIZE from uapi
>   sparc: Remove COMMAND_LINE_SIZE from uapi
>   xtensa: Remove COMMAND_LINE_SIZE from uapi
>   asm-generic: Remove COMMAND_LINE_SIZE from uapi
>   alpha: Remove empty <uapi/asm/setup.h>
>   arc: Remove empty <uapi/asm/setup.h>
>   m68k: Remove empty <uapi/asm/setup.h>
>   arm64: Remove empty <uapi/asm/setup.h>
>   microblaze: Remove empty <uapi/asm/setup.h>
>   sparc: Remove empty <uapi/asm/setup.h>
>   parisc: Remove empty <uapi/asm/setup.h>
>   x86: Remove empty <uapi/asm/setup.h>
>   xtensa: Remove empty <uapi/asm/setup.h>
>   powerpc: Remove empty <uapi/asm/setup.h>
>   mips: Remove empty <uapi/asm/setup.h>
>   s390: Remove empty <uapi/asm/setup.h>
>
>  .../admin-guide/kernel-parameters.rst         |  2 +-
>  arch/alpha/include/asm/setup.h                |  4 +--
>  arch/alpha/include/uapi/asm/setup.h           |  7 -----
>  arch/arc/include/asm/setup.h                  |  1 -
>  arch/arc/include/uapi/asm/setup.h             |  6 -----
>  arch/arm/include/asm/setup.h                  |  1 +
>  arch/arm/include/uapi/asm/setup.h             |  2 --
>  arch/arm64/include/asm/setup.h                |  3 ++-
>  arch/arm64/include/uapi/asm/setup.h           | 27 -------------------
>  arch/ia64/include/asm/setup.h                 | 10 +++++++
>  arch/ia64/include/uapi/asm/setup.h            |  6 ++---
>  arch/loongarch/include/asm/setup.h            |  2 +-
>  arch/m68k/include/asm/setup.h                 |  3 +--
>  arch/m68k/include/uapi/asm/setup.h            | 17 ------------
>  arch/microblaze/include/asm/setup.h           |  2 +-
>  arch/microblaze/include/uapi/asm/setup.h      | 20 --------------
>  arch/mips/include/asm/setup.h                 |  3 ++-
>  arch/mips/include/uapi/asm/setup.h            |  8 ------
>  arch/parisc/include/{uapi =3D> }/asm/setup.h    |  2 +-
>  arch/powerpc/include/asm/setup.h              |  2 +-
>  arch/powerpc/include/uapi/asm/setup.h         |  7 -----
>  arch/riscv/include/asm/setup.h                |  7 +++++
>  arch/riscv/include/uapi/asm/setup.h           |  8 ------
>  arch/s390/include/asm/setup.h                 |  1 -
>  arch/s390/include/uapi/asm/setup.h            |  1 -
>  arch/sh/include/asm/setup.h                   |  2 +-
>  arch/sparc/include/asm/setup.h                |  6 ++++-
>  arch/sparc/include/uapi/asm/setup.h           | 16 -----------
>  arch/x86/include/asm/setup.h                  |  2 --
>  arch/x86/include/uapi/asm/setup.h             |  1 -
>  arch/xtensa/include/{uapi =3D> }/asm/setup.h    |  2 +-
>  include/asm-generic/Kbuild                    |  1 +
>  include/{uapi =3D> }/asm-generic/setup.h        |  0
>  include/uapi/asm-generic/Kbuild               |  1 -
>  34 files changed, 40 insertions(+), 143 deletions(-)
>  delete mode 100644 arch/alpha/include/uapi/asm/setup.h
>  delete mode 100644 arch/arc/include/uapi/asm/setup.h
>  delete mode 100644 arch/arm64/include/uapi/asm/setup.h
>  create mode 100644 arch/ia64/include/asm/setup.h
>  delete mode 100644 arch/m68k/include/uapi/asm/setup.h
>  delete mode 100644 arch/microblaze/include/uapi/asm/setup.h
>  delete mode 100644 arch/mips/include/uapi/asm/setup.h
>  rename arch/parisc/include/{uapi =3D> }/asm/setup.h (63%)
>  delete mode 100644 arch/powerpc/include/uapi/asm/setup.h
>  create mode 100644 arch/riscv/include/asm/setup.h
>  delete mode 100644 arch/riscv/include/uapi/asm/setup.h
>  delete mode 100644 arch/s390/include/uapi/asm/setup.h
>  delete mode 100644 arch/sparc/include/uapi/asm/setup.h
>  delete mode 100644 arch/x86/include/uapi/asm/setup.h
>  rename arch/xtensa/include/{uapi =3D> }/asm/setup.h (84%)
>  rename include/{uapi =3D> }/asm-generic/setup.h (100%)
>
> --
> 2.37.2
>

I don't see this series in 6.4-rc1, I don't mean to bother you, I just
want to make sure it did not get lost :)

Thanks,

Alex

Return-Path: <linuxppc-dev+bounces-5325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF81A13139
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 03:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYRR20P5Kz2ywC;
	Thu, 16 Jan 2025 13:20:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736994013;
	cv=none; b=dwViou8RptsylUsdEfBN1axYEZ8Kg1befJhiYYCPJcCa7jDcIsWlEMXy/z/x0fWv8Rk1WsW1zdI20/pGWWsnqJdBLlE5zYfr6wgUybTbJDmz4KNqHQ4OABWygKlUY62k7LkFNXdG+34DhwYDFP4yYnCTdddvyLtrl8MjmSzATUK71XTwwrNTb7/4Dys9FJqs1ufqbnTDQH1aEQBMJW+diYZEDWdeZ8xrk7oCC1l2A3E+dpnR5r6rLb/COvzgI0gs5FZ2DPmR7ueSpyXj2AwSznIxzSgTIAdxlffUg6r2v/aDkjwE9q+cKz40VSRxMaKecEKu7IBq6Mxxc9qLCuvDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736994013; c=relaxed/relaxed;
	bh=0fSeCZdQhm9gsDo9x4mCdX/gIYtNCLSrunBW4bVeNiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv+DlIbyWWgQqFN2Yk5pCWbKqlYd6pXwp4teXorYzOU+l/H1/az4taio0BENP8LTVQiu7U8ikDrh9x6ZSb9MA1BBgz1719ehCXdjoOXjeMw3krU9pUKc0ilFVpZc+tSfI0IeXlr7Aim84xNl9yISc6dJjCmQQP3OowBk5OKsozN3oakEJU/3YG4WjB3yRA3DLKSHXLlr5E48CAxU8bZm9FB09uXvsgUgza8MsvNYIaUZyqb0czpXDjZ8zB/VMImERigN0/WWtsa77W8RFcllTUnCpp2hvW+WxlA+MiLt4txA7ACKw2742V8ighfYPSLXztxu/Ak685S2HKwI8TGkxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ERCF0E0g; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ERCF0E0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYRQz2hTBz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 13:20:10 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21bc1512a63so6977905ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736994007; x=1737598807; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fSeCZdQhm9gsDo9x4mCdX/gIYtNCLSrunBW4bVeNiY=;
        b=ERCF0E0g5dOogxJP9QCj1x62UivqNSlB1YddAtwlZ5uhHe4cBK1kGzG7hsQU83UqIa
         lG6jzwLxYNOh6KOcWOfF+jZOw/m+5QeqZ3mNVasTGDL3nYEdSYYDg5lUtFKuNf7ptCtB
         RZkeF/86CaiMWwd+677POvXDG4N/SdwDC1MGhyYwX9tPjtUdc7Y6Utq5NUARopye4Xp4
         NO8DuVOtTJGDp/8EFdjI63CDKbI2dHVPb3lUtp5kw8gVE4Epb6wZfK12LxLtj44dwwGh
         mwtGjcsjqh3ZESj4WIFFlwp5E8wkgp7HqQxWkxv7Ly7MDqw6ZjK7w060eJvh1dHWUT6l
         nrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736994007; x=1737598807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fSeCZdQhm9gsDo9x4mCdX/gIYtNCLSrunBW4bVeNiY=;
        b=VzFOrME0PAtjW6IQqKX3zivh2lRqK0zwR+xXXMb1VxaWavWph/nVINNZUDhsjzr+bZ
         PweQ009snZJntW5P6xtph11++MIWCIaRdau/iInadQ+2F4oN35zaO5ihoIZQaGnKrLRS
         pcPsonNTRYtoOPHAjJCO4dpBGD1Rbh8xGqNajvGWyh+TBtKlz+Ca9Fi5TgxHRKcMoQTk
         fl03AhRO2fDzKYludDiZn2hVkZfPzGsNrsf8gSXoEz4VsByzdrE9bh1ZgNAtcc4pNfgo
         zNfbycUTkSNVAYs6MbJiWtPDlAOcKEf2U9Uou9wMHraIkwMmEfkbH7qhykvMvSMpQ8/8
         8GfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpkAmtcqeWeterMgbgI1ziiw9A3N7t2F82GhE3/JMXmQc58KVXWCFi23sIGjq1zAodoM64Yu9X0pObbDw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywg4hrS31NWCWoHTY3fGoyWxxIoWweBDZdDAGx6iS0grNxyNV3v
	juMnXRNEy036RUw8UYCpSLsDgYI4CPPf3A+tgVDyGAhsh58hfiO+4ViBtDCQKT4=
X-Gm-Gg: ASbGncu1RjgTb2/Xe1XXijcW0NJjmd3wY2wyemnFB7cKa6ql7WYiYiDhsL4NdZ+Zfdz
	Ss5e3LpHfivk/4snUvG2zU1Mg+qzRtGRogCsx+tbSA9vdFh47IZCAyCBl5c7pwIQv8ODw/une33
	d/JrgSd3C2CzcGJB6VyETtc3mMBiOmiJwfE9vk+OsRoyEZcbFFAaGTv4IQ1iOK8lUcz95dQUtUF
	4jSBJB6KIw5KFO5KrcGXqgxNXFbdV/KOfnhgzXI5zc6oS0=
X-Google-Smtp-Source: AGHT+IG2iJViDjIXN/MIil+T+MrVrX+exq0uA4y6qY7j2BWAir2l1c6Zqr9kSueuyp3qmDsRK279Sw==
X-Received: by 2002:a17:903:41c3:b0:216:3732:ade3 with SMTP id d9443c01a7336-21a83fc3c07mr485898695ad.35.1736994006875;
        Wed, 15 Jan 2025 18:20:06 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10def6sm89028935ad.38.2025.01.15.18.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 18:20:06 -0800 (PST)
Date: Wed, 15 Jan 2025 18:20:01 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 3/7] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
Message-ID: <Z4hs0X8RhGTuevnn@ghost>
References: <20250113170925.GA392@strace.io>
 <20250113171140.GC589@strace.io>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113171140.GC589@strace.io>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 07:11:40PM +0200, Dmitry V. Levin wrote:
> These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
> 
> This partially reverts commit 7962c2eddbfe ("arch: remove unused
> function syscall_set_arguments()") by reusing some of old
> syscall_set_arguments() implementations.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
> 
> Note that I'm not a MIPS expert, I just added mips_set_syscall_arg() by
> looking at mips_get_syscall_arg() and the result passes tests in qemu on
> mips O32, mips64 O32, mips64 N32, and mips64 N64.
> 
>  arch/arc/include/asm/syscall.h        | 14 +++++++++++
>  arch/arm/include/asm/syscall.h        | 13 ++++++++++
>  arch/arm64/include/asm/syscall.h      | 13 ++++++++++
>  arch/csky/include/asm/syscall.h       | 13 ++++++++++
>  arch/hexagon/include/asm/syscall.h    | 14 +++++++++++
>  arch/loongarch/include/asm/syscall.h  |  8 ++++++
>  arch/mips/include/asm/syscall.h       | 32 ++++++++++++++++++++++++
>  arch/nios2/include/asm/syscall.h      | 11 ++++++++
>  arch/openrisc/include/asm/syscall.h   |  7 ++++++
>  arch/parisc/include/asm/syscall.h     | 12 +++++++++
>  arch/powerpc/include/asm/syscall.h    | 10 ++++++++
>  arch/riscv/include/asm/syscall.h      |  9 +++++++
>  arch/s390/include/asm/syscall.h       | 12 +++++++++
>  arch/sh/include/asm/syscall_32.h      | 12 +++++++++
>  arch/sparc/include/asm/syscall.h      | 10 ++++++++
>  arch/um/include/asm/syscall-generic.h | 14 +++++++++++
>  arch/x86/include/asm/syscall.h        | 36 +++++++++++++++++++++++++++
>  arch/xtensa/include/asm/syscall.h     | 11 ++++++++
>  include/asm-generic/syscall.h         | 16 ++++++++++++
>  19 files changed, 267 insertions(+)
> 
> diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
> index 9709256e31c8..89c1e1736356 100644
> --- a/arch/arc/include/asm/syscall.h
> +++ b/arch/arc/include/asm/syscall.h
> @@ -67,6 +67,20 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	}
>  }
>  
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      unsigned long *args)
> +{
> +	unsigned long *inside_ptregs = &regs->r0;
> +	unsigned int n = 6;
> +	unsigned int i = 0;
> +
> +	while (n--) {
> +		*inside_ptregs = args[i++];
> +		inside_ptregs--;
> +	}
> +}
> +
>  static inline int
>  syscall_get_arch(struct task_struct *task)
>  {
> diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
> index fe4326d938c1..21927fa0ae2b 100644
> --- a/arch/arm/include/asm/syscall.h
> +++ b/arch/arm/include/asm/syscall.h
> @@ -80,6 +80,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->ARM_r0 + 1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->ARM_r0, args, 6 * sizeof(args[0]));
> +	/*
> +	 * Also copy the first argument into ARM_ORIG_r0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->ARM_ORIG_r0 = regs->ARM_r0;
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	/* ARM tasks don't change audit architectures on the fly. */
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index ab8e14b96f68..76020b66286b 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -73,6 +73,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->regs[0], args, 6 * sizeof(args[0]));
> +	/*
> +	 * Also copy the first argument into orig_x0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->orig_x0 = regs->regs[0];
> +}
> +
>  /*
>   * We don't care about endianness (__AUDIT_ARCH_LE bit) here because
>   * AArch64 has the same system calls both on little- and big- endian.
> diff --git a/arch/csky/include/asm/syscall.h b/arch/csky/include/asm/syscall.h
> index 0de5734950bf..30403f7a0487 100644
> --- a/arch/csky/include/asm/syscall.h
> +++ b/arch/csky/include/asm/syscall.h
> @@ -59,6 +59,19 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      const unsigned long *args)
> +{
> +	memcpy(&regs->a0, args, 6 * sizeof(regs->a0));
> +	/*
> +	 * Also copy the first argument into orig_x0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->orig_a0 = regs->a0;
> +}
> +
>  static inline int
>  syscall_get_arch(struct task_struct *task)
>  {
> diff --git a/arch/hexagon/include/asm/syscall.h b/arch/hexagon/include/asm/syscall.h
> index f6e454f18038..1024a6548d78 100644
> --- a/arch/hexagon/include/asm/syscall.h
> +++ b/arch/hexagon/include/asm/syscall.h
> @@ -33,6 +33,13 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &(&regs->r00)[0], 6 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	memcpy(&(&regs->r00)[0], args, 6 * sizeof(args[0]));
> +}
> +
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> @@ -45,6 +52,13 @@ static inline long syscall_get_return_value(struct task_struct *task,
>  	return regs->r00;
>  }
>  
> +static inline void syscall_set_return_value(struct task_struct *task,
> +					    struct pt_regs *regs,
> +					    int error, long val)
> +{
> +	regs->r00 = (long) error ?: val;
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_HEXAGON;
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
> index e286dc58476e..ff415b3c0a8e 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -61,6 +61,14 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(&args[1], &regs->regs[5], 5 * sizeof(long));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	memcpy(&regs->regs[5], &args[1], 5 * sizeof(long));
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_LOONGARCH64;
> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index 2f85f2d8f754..3163d1506fae 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -76,6 +76,23 @@ static inline void mips_get_syscall_arg(unsigned long *arg,
>  #endif
>  }
>  
> +static inline void mips_set_syscall_arg(unsigned long *arg,
> +	struct task_struct *task, struct pt_regs *regs, unsigned int n)
> +{
> +#ifdef CONFIG_32BIT
> +	switch (n) {
> +	case 0: case 1: case 2: case 3:
> +		regs->regs[4 + n] = *arg;
> +		return;
> +	case 4: case 5: case 6: case 7:
> +		*arg = regs->pad0[n] = *arg;
> +		return;
> +	}
> +#else
> +	regs->regs[4 + n] = *arg;
> +#endif
> +}
> +
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> @@ -122,6 +139,21 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  		mips_get_syscall_arg(args++, task, regs, i++);
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	unsigned int i = 0;
> +	unsigned int n = 6;
> +
> +	/* O32 ABI syscall() */
> +	if (mips_syscall_is_indirect(task, regs))
> +		i++;
> +
> +	while (n--)
> +		mips_set_syscall_arg(args++, task, regs, i++);
> +}
> +
>  extern const unsigned long sys_call_table[];
>  extern const unsigned long sys32_call_table[];
>  extern const unsigned long sysn32_call_table[];
> diff --git a/arch/nios2/include/asm/syscall.h b/arch/nios2/include/asm/syscall.h
> index fff52205fb65..526449edd768 100644
> --- a/arch/nios2/include/asm/syscall.h
> +++ b/arch/nios2/include/asm/syscall.h
> @@ -58,6 +58,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	*args   = regs->r9;
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +	struct pt_regs *regs, const unsigned long *args)
> +{
> +	regs->r4 = *args++;
> +	regs->r5 = *args++;
> +	regs->r6 = *args++;
> +	regs->r7 = *args++;
> +	regs->r8 = *args++;
> +	regs->r9 = *args;
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_NIOS2;
> diff --git a/arch/openrisc/include/asm/syscall.h b/arch/openrisc/include/asm/syscall.h
> index 903ed882bdec..e6383be2a195 100644
> --- a/arch/openrisc/include/asm/syscall.h
> +++ b/arch/openrisc/include/asm/syscall.h
> @@ -57,6 +57,13 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	memcpy(args, &regs->gpr[3], 6 * sizeof(args[0]));
>  }
>  
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      const unsigned long *args)
> +{
> +	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_OPENRISC;
> diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
> index 00b127a5e09b..b146d0ae4c77 100644
> --- a/arch/parisc/include/asm/syscall.h
> +++ b/arch/parisc/include/asm/syscall.h
> @@ -29,6 +29,18 @@ static inline void syscall_get_arguments(struct task_struct *tsk,
>  	args[0] = regs->gr[26];
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *tsk,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	regs->gr[21] = args[5];
> +	regs->gr[22] = args[4];
> +	regs->gr[23] = args[3];
> +	regs->gr[24] = args[2];
> +	regs->gr[25] = args[1];
> +	regs->gr[26] = args[0];
> +}
> +
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 422d7735ace6..521f279e6b33 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -114,6 +114,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	}
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
> +
> +	/* Also copy the first argument into orig_gpr3 */
> +	regs->orig_gpr3 = args[0];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	if (is_tsk_32bit_task(task))
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce..8d389ba995c8 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	args++;
> +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +}

Looks good for riscv.

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com

> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  #ifdef CONFIG_64BIT
> diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> index 27e3d804b311..b3dd883699e7 100644
> --- a/arch/s390/include/asm/syscall.h
> +++ b/arch/s390/include/asm/syscall.h
> @@ -78,6 +78,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	args[0] = regs->orig_gpr2 & mask;
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	unsigned int n = 6;
> +
> +	while (n-- > 0)
> +		if (n > 0)
> +			regs->gprs[2 + n] = args[n];
> +	regs->orig_gpr2 = args[0];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  #ifdef CONFIG_COMPAT
> diff --git a/arch/sh/include/asm/syscall_32.h b/arch/sh/include/asm/syscall_32.h
> index d87738eebe30..cb51a7528384 100644
> --- a/arch/sh/include/asm/syscall_32.h
> +++ b/arch/sh/include/asm/syscall_32.h
> @@ -57,6 +57,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	args[0] = regs->regs[4];
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->regs[1] = args[5];
> +	regs->regs[0] = args[4];
> +	regs->regs[7] = args[3];
> +	regs->regs[6] = args[2];
> +	regs->regs[5] = args[1];
> +	regs->regs[4] = args[0];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	int arch = AUDIT_ARCH_SH;
> diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
> index 20c109ac8cc9..62a5a78804c4 100644
> --- a/arch/sparc/include/asm/syscall.h
> +++ b/arch/sparc/include/asm/syscall.h
> @@ -117,6 +117,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	}
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 6; i++)
> +		regs->u_regs[UREG_I0 + i] = args[i];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  #if defined(CONFIG_SPARC64) && defined(CONFIG_COMPAT)
> diff --git a/arch/um/include/asm/syscall-generic.h b/arch/um/include/asm/syscall-generic.h
> index 172b74143c4b..2984feb9d576 100644
> --- a/arch/um/include/asm/syscall-generic.h
> +++ b/arch/um/include/asm/syscall-generic.h
> @@ -62,6 +62,20 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	*args   = UPT_SYSCALL_ARG6(r);
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	struct uml_pt_regs *r = &regs->regs;
> +
> +	UPT_SYSCALL_ARG1(r) = *args++;
> +	UPT_SYSCALL_ARG2(r) = *args++;
> +	UPT_SYSCALL_ARG3(r) = *args++;
> +	UPT_SYSCALL_ARG4(r) = *args++;
> +	UPT_SYSCALL_ARG5(r) = *args++;
> +	UPT_SYSCALL_ARG6(r) = *args;
> +}
> +
>  /* See arch/x86/um/asm/syscall.h for syscall_get_arch() definition. */
>  
>  #endif	/* __UM_SYSCALL_GENERIC_H */
> diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
> index 7c488ff0c764..b9c249dd9e3d 100644
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -90,6 +90,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	args[5] = regs->bp;
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->bx = args[0];
> +	regs->cx = args[1];
> +	regs->dx = args[2];
> +	regs->si = args[3];
> +	regs->di = args[4];
> +	regs->bp = args[5];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_I386;
> @@ -121,6 +133,30 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	}
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +# ifdef CONFIG_IA32_EMULATION
> +	if (task->thread_info.status & TS_COMPAT) {
> +		regs->bx = *args++;
> +		regs->cx = *args++;
> +		regs->dx = *args++;
> +		regs->si = *args++;
> +		regs->di = *args++;
> +		regs->bp = *args;
> +	} else
> +# endif
> +	{
> +		regs->di = *args++;
> +		regs->si = *args++;
> +		regs->dx = *args++;
> +		regs->r10 = *args++;
> +		regs->r8 = *args++;
> +		regs->r9 = *args;
> +	}
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	/* x32 tasks should be considered AUDIT_ARCH_X86_64. */
> diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
> index 5ee974bf8330..f9a671cbf933 100644
> --- a/arch/xtensa/include/asm/syscall.h
> +++ b/arch/xtensa/include/asm/syscall.h
> @@ -68,6 +68,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  		args[i] = regs->areg[reg[i]];
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	static const unsigned int reg[] = XTENSA_SYSCALL_ARGUMENT_REGS;
> +	unsigned int i;
> +
> +	for (i = 0; i < 6; ++i)
> +		regs->areg[reg[i]] = args[i];
> +}
> +
>  asmlinkage long xtensa_rt_sigreturn(void);
>  asmlinkage long xtensa_shmat(int, char __user *, int);
>  asmlinkage long xtensa_fadvise64_64(int, int,
> diff --git a/include/asm-generic/syscall.h b/include/asm-generic/syscall.h
> index 5a80fe728dc8..0f7b9a493de7 100644
> --- a/include/asm-generic/syscall.h
> +++ b/include/asm-generic/syscall.h
> @@ -117,6 +117,22 @@ void syscall_set_return_value(struct task_struct *task, struct pt_regs *regs,
>  void syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  			   unsigned long *args);
>  
> +/**
> + * syscall_set_arguments - change system call parameter value
> + * @task:	task of interest, must be in system call entry tracing
> + * @regs:	task_pt_regs() of @task
> + * @args:	array of argument values to store
> + *
> + * Changes 6 arguments to the system call.
> + * The first argument gets value @args[0], and so on.
> + *
> + * It's only valid to call this when @task is stopped for tracing on
> + * entry to a system call, due to %SYSCALL_WORK_SYSCALL_TRACE or
> + * %SYSCALL_WORK_SYSCALL_AUDIT.
> + */
> +void syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +			   const unsigned long *args);
> +
>  /**
>   * syscall_get_arch - return the AUDIT_ARCH for the current system call
>   * @task:	task of interest, must be blocked
> -- 
> ldv


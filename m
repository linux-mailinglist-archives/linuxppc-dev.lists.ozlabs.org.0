Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6730913D0A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 19:11:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SHcWkbRT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6d0k2fkzz3cbd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 03:11:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SHcWkbRT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6d023DpBz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 03:10:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6CF662558
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 17:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D4EC4AF13
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719162640;
	bh=aosSO/S+etUamgM4SS3mlQ3heoMUr6FZbeXpiXEovy0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SHcWkbRTRysffowmKeNtbvp9bhDl+zoDvjEJ2fFDHg7LSDrwqFsJdD9YYXV4Vr+sp
	 2E8pAnecGBkfcW3fYWlLjSsfPlPKcXnQ8nJbcMvEmYSYZS0YcgH+rt/qDOrTB8Gvu+
	 agZuIo6AmTpr2D4xK4pBnUswovpS9ueZT7VqTzkz0VoNehsJKjKIbT7Hxbmzrk7px2
	 nKkeeohgJbLaTj1UD/4bc2iBlfTD7iIkm5ON/CNdK03bV+FGcWIvguDXvdHM+5cgLf
	 OB8EHfsL2MFz6vrCmyH5CregCIOmWkoz7MbvmFg/cF39yMwxMHUAlyiXqW1imSaGS0
	 Nv1EJ4Jnnv/6A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso40653691fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 10:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgZYPwosLPjwpcmEeFYD0pHFldvgfs8V0PQNA//Mf+t1VPkolOZRFVCHZomO/G26HSIIY/kAJlan/bb2/OEH7L+vDfhpsiYpYsyz3fIw==
X-Gm-Message-State: AOJu0YxLSlIIg462P36IK+UYOn8YQUsZJNgdxT4k++y5uILRn/XVJkH5
	RCupI4Cm3NSgL5b22Cl5YP3fV+45fSIdvOgMSy4BqP8yuqZDO5SxpTgktrfkpOjUTgecsAh1B1+
	OXYPcBKHeg8OylmEYsC0TnuEtHJ0=
X-Google-Smtp-Source: AGHT+IHxMABTsjE/bTBoMOuJE1ctF+u0ZebsEtw1bh3nJ1bb3woGpWj5W/Pz1qQmYslYoKzzGRd0eu1pNlr+yN6Ofzo=
X-Received: by 2002:a2e:3101:0:b0:2ec:1cf1:b74c with SMTP id
 38308e7fff4ca-2ec594cfe8fmr16740431fa.32.1719162638077; Sun, 23 Jun 2024
 10:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240620162316.3674955-1-arnd@kernel.org> <20240620162316.3674955-11-arnd@kernel.org>
In-Reply-To: <20240620162316.3674955-11-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Jun 2024 01:10:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS9xKLSbSN2Scs016Boxzr6TdNxVLr2TYEfbJ0KqSgppw@mail.gmail.com>
Message-ID: <CAJF2gTS9xKLSbSN2Scs016Boxzr6TdNxVLr2TYEfbJ0KqSgppw@mail.gmail.com>
Subject: Re: [PATCH 10/15] csky, hexagon: fix broken sys_sync_file_range
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, linux-mips@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 12:24=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Both of these architectures require u64 function arguments to be
> passed in even/odd pairs of registers or stack slots, which in case of
> sync_file_range would result in a seven-argument system call that is
> not currently possible. The system call is therefore incompatible with
> all existing binaries.
>
> While it would be possible to implement support for seven arguments
> like on mips, it seems better to use a six-argument version, either
> with the normal argument order but misaligned as on most architectures
> or with the reordered sync_file_range2() calling conventions as on
> arm and powerpc.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/include/uapi/asm/unistd.h    | 1 +
>  arch/hexagon/include/uapi/asm/unistd.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/csky/include/uapi/asm/unistd.h b/arch/csky/include/uapi=
/asm/unistd.h
> index 7ff6a2466af1..e0594b6370a6 100644
> --- a/arch/csky/include/uapi/asm/unistd.h
> +++ b/arch/csky/include/uapi/asm/unistd.h
> @@ -6,6 +6,7 @@
>  #define __ARCH_WANT_SYS_CLONE3
>  #define __ARCH_WANT_SET_GET_RLIMIT
>  #define __ARCH_WANT_TIME32_SYSCALLS
> +#define __ARCH_WANT_SYNC_FILE_RANGE2
For csky part.
Acked-by: Guo Ren <guoren@kernel.org>

>  #include <asm-generic/unistd.h>
>
>  #define __NR_set_thread_area   (__NR_arch_specific_syscall + 0)
> diff --git a/arch/hexagon/include/uapi/asm/unistd.h b/arch/hexagon/includ=
e/uapi/asm/unistd.h
> index 432c4db1b623..21ae22306b5d 100644
> --- a/arch/hexagon/include/uapi/asm/unistd.h
> +++ b/arch/hexagon/include/uapi/asm/unistd.h
> @@ -36,5 +36,6 @@
>  #define __ARCH_WANT_SYS_VFORK
>  #define __ARCH_WANT_SYS_FORK
>  #define __ARCH_WANT_TIME32_SYSCALLS
> +#define __ARCH_WANT_SYNC_FILE_RANGE2
>
>  #include <asm-generic/unistd.h>
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren

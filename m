Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B39114A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 23:30:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oX/IYGzf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4tvH2Wf8z3cYV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:30:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oX/IYGzf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 377 seconds by postgrey-1.37 at boromir; Fri, 21 Jun 2024 07:29:55 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ttW3lp1z3cWZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 07:29:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718918983; x=1719523783; i=deller@gmx.de;
	bh=6VCd1TqwAbp3zAEcjaKM6L/q747d5LQnckUw8HW0fKQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oX/IYGzfrJY9ES+GynYA8HkzEn+07QrsvwlPGflmhrtb1RvhlUuhzK58+wJyOAjA
	 MReqGDf/uYmKk7UX5VIPUOJ32nYABGaUYUKY0kkZ7ASAYcocHcWsmAA0dL76z0p2X
	 Q63gLE7b/fJOWTF8bRIBbYUjd2DCYz2d2Ifvhw4pyTxxxDGlRkmpy3m2hdhbw1Eyd
	 lgSd8aJVLLkx15VCTyMThsNvKvt4bs+6iavbXWMUaPxBd2GeXpDibpaluZJw/keG8
	 e8aHuar/fzCUGOV1JMsBa3uwR158ExGthMnR97gPvlDzNbIO/qXDXmU4i8EKPbHPE
	 7Cgmo0ixtnSHBou9Tg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.133]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmKh-1s5LBS43M9-00LsXl; Thu, 20
 Jun 2024 23:22:04 +0200
Message-ID: <e80809ba-ee81-47a5-9b08-54b11f118a78@gmx.de>
Date: Thu, 20 Jun 2024 23:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] parisc: use generic sys_fanotify_mark
 implementation
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-8-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240620162316.3674955-8-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cTOmKaZgB4+8zdTJJh1n5TDacfeJ38i7AgNBdwGwc4CoHa/X8U4
 bE+1vJy0vhvQ2uWD+vixAMUbThDwHKmI1c65UoVWRiM/nQoMEdjbqq1otbBNx+OGkFQx4fn
 mgJ5rTZYpK+2fKlwVnN5rHKZd/pen/VHbL9pcK3jqJcyR3UYVt4o8k+0GGaMmIGz+hI3M7M
 mxH58vLwhXQKSSi6vLPJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5gun6er7/eE=;VkXY/vFnKhYrF972T/q99GCGFyb
 g9JcAUNRRs7lHDdsFkSbIamScJkxC4VRcLiTbGPPI8T326Q+Rm6ozZiPY8+MbwY6/ije6NsSp
 l1MlHfl9AJBryS8F9kH+wAD+vqTbL5UEJlB4025N0yi3g0zbwV4Qw9H4aezmf+xmMmQgDGdRe
 EJUtE031Ujmwlph8oDbLJUG3p/PCiUKk7v76l5kvxuCEtIEAoFKYREKsBX/pqE8+7sE/6L5Y5
 G47ndGeXPaExjFWWZpW+PgGep5Tyl0ZUXd5TPSRjTBp1ks0hqBfcAyIuYpZvLmatN74fM1RKH
 z4fv5oAE4ntPGkg0VEBcy9iL/AEN9zb3zWbwtpzLRGTQ1a0I7rxNFmF3zfuchXyWsX6MPTU9z
 U86O7DmEATeOh5TCbXGv216ZXh75lZpTxesgu5DFuK+GJVsrONbHbVu3wvlIkje42BxPt1a1s
 LKqhXT53esXczubYX1xEDr9McgmnaxpO5vpowVfIXJdh62AXBSICW6YHXc4UOY/gzmCnmYKIb
 zki9+/GAf8qdsSR5A32g5QDqoj2h+jgi2QWKsU8aIE3ZfdeRPcTXr0eU01OmkAt7vRWV+SzD/
 XOzg4U6CUXP0rDA3HeHKkcqdNDG7C0VzZ4sg1iOJCDFlULN+/gYFqZdmSEUGygyQA8JARJ0vI
 FnVC1prLCmk8eZwKorncCuQtxpw42O4KwWnW2Wr4VeZawQcE8oCV8EXr4oFMLeI98e2bLA1pd
 UrXrYSxodkRDX9DeQpvP1NP8UriBsI26O2wDb82g+v4+YQkoxCATCFeCDhwFoLNbEk4A5w97o
 8+hVTbN2XeSjMfZlBldso3omRvAQ/19QNeYOj3/xbsrsQ=
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Adhemerval Zanella <adhemerval.zanella@linaro.org>, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/20/24 18:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The sys_fanotify_mark() syscall on parisc uses the reverse word order
> for the two halves of the 64-bit argument compared to all syscalls on
> all 32-bit architectures. As far as I can tell, the problem is that
> the function arguments on parisc are sorted backwards (26, 25, 24, 23,
> ...) compared to everyone else,

r26 is arg0, r25 is arg1, and so on.
I'm not sure I would call this "sorted backwards".
I think the reason is simply that hppa is the only 32-bit big-endian
arch left...

> so the calling conventions of using an
> even/odd register pair in native word order result in the lower word
> coming first in function arguments, matching the expected behavior
> on little-endian architectures. The system call conventions however
> ended up matching what the other 32-bit architectures do.
>
> A glibc cleanup in 2020 changed the userspace behavior in a way that
> handles all architectures consistently, but this inadvertently broke
> parisc32 by changing to the same method as everyone else.

I appreciate such cleanups to make arches consistent.
But it's bad if breakages aren't noticed or reported then...

> The change made it into glibc-2.35 and subsequently into debian 12
> (bookworm), which is the latest stable release. This means we
> need to choose between reverting the glibc change or changing the
> kernel to match it again, but either hange will leave some systems
> broken.
>
> Pick the option that is more likely to help current and future
> users and change the kernel to match current glibc.

Agreed (assuming we have really a problem on parisc).

> This also
> means the behavior is now consistent across architectures, but
> it breaks running new kernels with old glibc builds before 2.35.
>
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Dd1501=
81d73d9
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.gi=
t/commit/arch/parisc/kernel/sys_parisc.c?h=3D57b1dfbd5b4a39d
> Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I found this through code inspection, please double-check to make
> sure I got the bug and the fix right.

The patch looks good at first sight.
I'll pick it up in my parisc git tree and will do some testing the
next few days and then push forward for 6.11 when it opens....

Thank you!!

Helge

> The alternative is to fix this by reverting glibc back to the
> unusual behavior.
> ---
>   arch/parisc/Kconfig                     | 1 +
>   arch/parisc/kernel/sys_parisc32.c       | 9 ---------
>   arch/parisc/kernel/syscalls/syscall.tbl | 2 +-
>   3 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index daafeb20f993..dc9b902de8ea 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -16,6 +16,7 @@ config PARISC
>   	select ARCH_HAS_UBSAN
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_NO_SG_CHAIN
> +	select ARCH_SPLIT_ARG64 if !64BIT
>   	select ARCH_SUPPORTS_HUGETLBFS if PA20
>   	select ARCH_SUPPORTS_MEMORY_FAILURE
>   	select ARCH_STACKWALK
> diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_=
parisc32.c
> index 2a12a547b447..826c8e51b585 100644
> --- a/arch/parisc/kernel/sys_parisc32.c
> +++ b/arch/parisc/kernel/sys_parisc32.c
> @@ -23,12 +23,3 @@ asmlinkage long sys32_unimplemented(int r26, int r25,=
 int r24, int r23,
>       	current->comm, current->pid, r20);
>       return -ENOSYS;
>   }
> -
> -asmlinkage long sys32_fanotify_mark(compat_int_t fanotify_fd, compat_ui=
nt_t flags,
> -	compat_uint_t mask0, compat_uint_t mask1, compat_int_t dfd,
> -	const char  __user * pathname)
> -{
> -	return sys_fanotify_mark(fanotify_fd, flags,
> -			((__u64)mask1 << 32) | mask0,
> -			 dfd, pathname);
> -}
> diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kerne=
l/syscalls/syscall.tbl
> index 39e67fab7515..66dc406b12e4 100644
> --- a/arch/parisc/kernel/syscalls/syscall.tbl
> +++ b/arch/parisc/kernel/syscalls/syscall.tbl
> @@ -364,7 +364,7 @@
>   320	common	accept4			sys_accept4
>   321	common	prlimit64		sys_prlimit64
>   322	common	fanotify_init		sys_fanotify_init
> -323	common	fanotify_mark		sys_fanotify_mark		sys32_fanotify_mark
> +323	common	fanotify_mark		sys_fanotify_mark		compat_sys_fanotify_mark
>   324	32	clock_adjtime		sys_clock_adjtime32
>   324	64	clock_adjtime		sys_clock_adjtime
>   325	common	name_to_handle_at	sys_name_to_handle_at


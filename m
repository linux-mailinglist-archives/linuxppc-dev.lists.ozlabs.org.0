Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C47A22A7F9D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 14:24:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRkkd5T1FzDqK1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 00:24:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=UfhQY0yc; 
 dkim-atps=neutral
X-Greylist: delayed 346 seconds by postgrey-1.36 at bilbo;
 Fri, 06 Nov 2020 00:21:03 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRkg3253qzDqw1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 00:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604582454;
 bh=hvl3a/DWoP3yKdUCuEnO965iNCdGwTGX9IdgK9GEq0c=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=UfhQY0yc4uDMlbWSIYRWKG8hA07aQS19pVHxCOLZ0uyRmwtZ7grXdHdivnfjqZLO4
 mozg27jHPUI3kE44SYuTNUabKvQzAfL6FObwhKAH9qlbGfsXa6GEKob2MFMlyUDcts
 aIq97NhouVI03xT4XXycLRw/J8n9HuA0I1hMj2yM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.156.55]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wLT-1kgPSP0uoV-007U0t; Thu, 05
 Nov 2020 14:14:22 +0100
Subject: Re: [PATCH seccomp 2/8] parisc: Enable seccomp architecture tracking
To: YiFei Zhu <zhuyifei1999@gmail.com>, containers@lists.linux-foundation.org
References: <cover.1604410035.git.yifeifz2@illinois.edu>
 <9bb86c546eda753adf5270425e7353202dbce87c.1604410035.git.yifeifz2@illinois.edu>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <8d86100a-a3d6-d3bd-856c-38d17f363864@gmx.de>
Date: Thu, 5 Nov 2020 14:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9bb86c546eda753adf5270425e7353202dbce87c.1604410035.git.yifeifz2@illinois.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1QVEQuqTmgX7JJqdEkHcs098MrIPbhiET1stBdJlwnGaXA8bIuH
 tW64Kumdb/ZadHYHAmwWlDtRvnkZLheeVmHw0n+SNEN6lO0J+uCOH9+wGGTIeuYOSc6tkD+
 poAVk3TTqwiGNkfCAafeLOV5nxm9gzXgw5FNQM0x8N/zUaa4fR3cbkwefeor/CrqpGOfxfy
 T4uZ6SGJcO+c06shUWGlA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3/+1N45Qd+s=:xSa5x5nabVk5Vp+Mc9uw53
 6dv/KNDVOUuaH9jGsr8YPdTXnLyWLwfQWEZR2NBIrjiGFVMnT4BMUu73tDl8n7RXgqSoU6fbJ
 pg0WNJf8XZIXtO5O01tyo1L3CD2IMj6CrRVTOsM5UGCrbfTcC6HT3WaThaEFkMxOyhD22m04N
 L73wOJf6CzWANUVg/PYdf+Yb2HLxLHBD9s/wiyJ7EH26NGwBEpRSE41O7qseEfWHi4Aps8ZOf
 Q9BxbEdoRPd7q/Jh6ZhnZaaYtPalsyFw9F+TBI/k1BmSwWWRbTcF5fJZTLvOxIJd3nxySBIjy
 M/XttWzkB4Bd2fy9rj0svojBUC7OKnnux3urZ8wG43NPREPlJtrCspU1UycqLgLowNf/YfuMa
 /Eyh1jNLL0XWrnTZHV1H+IsKBd4UzxqohLaoHIMMSLJ1VXHBuwmv+TGCvGiVO1EF5NSJWE1Xw
 U0BKEd7hA2kWNy2a84+AnSa6zr1O2qVe/O7M5tK6lP6IWd8OLk2NxffSC937NsZxFU7iyt3h0
 TUoKvKLYnTZ/rvoWuTjJ+dbuTMM/2xLGQ+eC6zXyAm2flFMa5mE2fOrJ3jwd928heoOE4+719
 75WdJrdxouyy8SG7wT43KlFIYQWkv3m+eXL6vfWRmGIxYHk/OtN99tVheqJmkrQPcWWsZULA7
 facqy/2MJEwcc4GMjHVQ533G1/Ya6xFh34ZDucDBsdK6g0VRc5mICHyo88I1qqam8FufbShg+
 ELQ57m0SdE+oBoIXJHppAazPiNt92NcXqe5EkkHBVAcc/uSugiSBZHL4puQDMAEK+FOzd7FRQ
 quL23p2ZTOGVOJyxrZ2buCKji6gTG02GnKp2gx9udo0yTPar5sXJZHTCreJqeNMwHyQlU+X18
 dq/VTEjdmavzUGiscqGA==
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/3/20 2:42 PM, YiFei Zhu wrote:
> From: YiFei Zhu <yifeifz2@illinois.edu>
>
> To enable seccomp constant action bitmaps, we need to have a static
> mapping to the audit architecture and system call table size. Add these
> for parisc.
> > Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>

I did compile- and boot-tested it, works on 32- and 64-bit parisc kernel.
I don't know how to test it actually, but anyway:

Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge

> ---
>  arch/parisc/include/asm/Kbuild    |  1 -
>  arch/parisc/include/asm/seccomp.h | 22 ++++++++++++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 arch/parisc/include/asm/seccomp.h
>
> diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kb=
uild
> index e3ee5c0bfe80..f16c4db80116 100644
> --- a/arch/parisc/include/asm/Kbuild
> +++ b/arch/parisc/include/asm/Kbuild
> @@ -5,5 +5,4 @@ generated-y +=3D syscall_table_c32.h
>  generic-y +=3D kvm_para.h
>  generic-y +=3D local64.h
>  generic-y +=3D mcs_spinlock.h
> -generic-y +=3D seccomp.h
>  generic-y +=3D user.h
> diff --git a/arch/parisc/include/asm/seccomp.h b/arch/parisc/include/asm=
/seccomp.h
> new file mode 100644
> index 000000000000..b058b2220322
> --- /dev/null
> +++ b/arch/parisc/include/asm/seccomp.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_SECCOMP_H
> +#define _ASM_SECCOMP_H
> +
> +#include <asm-generic/seccomp.h>
> +
> +#ifdef CONFIG_64BIT
> +# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_PARISC64
> +# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +# define SECCOMP_ARCH_NATIVE_NAME	"parisc64"
> +# ifdef CONFIG_COMPAT
> +#  define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_PARISC
> +#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
> +#  define SECCOMP_ARCH_COMPAT_NAME	"parisc"
> +# endif
> +#else /* !CONFIG_64BIT */
> +# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_PARISC
> +# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +# define SECCOMP_ARCH_NATIVE_NAME	"parisc"
> +#endif
> +
> +#endif /* _ASM_SECCOMP_H */
>


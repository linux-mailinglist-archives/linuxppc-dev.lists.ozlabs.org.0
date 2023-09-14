Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC37A116D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:09:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rYiR5HRf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmtL64M8gz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:09:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rYiR5HRf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmc5N0LGJz3bhp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 22:27:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694694421;
	bh=IKd/xoLaYMNT3G43ojUHtX33LcBflkrUDAX5TgQ89VQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rYiR5HRfpS/tMJ5vZ04WGHK5tqlEmN3zl7YBnuBIj4iDXvSjRcMk3Bm1xQR4G2xqA
	 ch/6vWdPHmOC2BUMMk4XX30GKkFETwPb6UKi6HR3vSS9M+ZGF48pqFYfp4X0b6Xnoc
	 3IT8Xs1CRfVJWHkXJOg3XffMJXWhIzBrBfe0rLT/1FOwmVJNKXhzU+07wARKckah+G
	 1nYEufulJtii1DdLYzWI+dlftci66s6CJLfGerDALqoTxKf5zQo5DIOqkNkz913pHl
	 hiwkYuo8iIaiLSkIq8iYXaa9BldBulkzz3WoyK+kyoqd71CY/sNwj3K8X+Pby7L5LJ
	 Ni+zJOD6zygLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rmc544Ldlz4wxN;
	Thu, 14 Sep 2023 22:26:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Mehta, Sohil"
 <sohil.mehta@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>
Subject: Re: [PATCH 2/2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
In-Reply-To: <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
 <20230911180210.1060504-3-sohil.mehta@intel.com>
 <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
Date: Thu, 14 Sep 2023 22:26:47 +1000
Message-ID: <871qf17xfc.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 15 Sep 2023 09:07:30 +1000
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "irogers@google.com" <irogers@google.com>, "dalias@libc.org" <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "will@kernel.org" <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "ysato@users.sourceforge.jp" <ysato@users.sourceforg
 e.jp>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, "mattst88@gmail.com" <mattst88@gmail.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "arnd@arndb.de" <arnd@arndb.de>, "brgerst@gmail.com" <brgerst@gmail.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "acme@kernel.org" <acme@kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "broonie@kernel.org" <broonie@kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "npiggin@gmail.com" <npiggin@gmail.com>, "Lutomirski, Andy" <luto@kernel.org>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "namhyung@kern
 el.org" <namhyung@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug@rivosinc.com>, "chris@zankel.net" <chris@zankel.net>, "monstr@monstr.eu" <monstr@monstr.eu>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "slyich@gmail.com" <slyich@gmail.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:
> On Mon, 2023-09-11 at 18:02 +0000, Sohil Mehta wrote:
>> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl
>> b/arch/powerpc/kernel/syscalls/syscall.tbl
>> index 20e50586e8a2..2767b8a42636 100644
>> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
>> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
>> @@ -539,3 +539,4 @@
>> =C2=A0450=C2=A0=C2=A0=C2=A0=C2=A0nospu=C2=A0=C2=A0=C2=A0set_mempolicy_ho=
me_node=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sys_set_mempol=
icy_hom
>> e_node
>> =C2=A0451=C2=A0=C2=A0=C2=A0=C2=A0common=C2=A0=C2=A0cachestat=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sys_cachestat
>> =C2=A0452=C2=A0=C2=A0=C2=A0=C2=A0common=C2=A0=C2=A0fchmodat2=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sys_fchmodat2
>> +453=C2=A0=C2=A0=C2=A0=C2=A0common=C2=A0=C2=A0map_shadow_stack=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0sys_map_shadow_stack
>
> I noticed in powerpc, the not implemented syscalls are manually mapped
> to sys_ni_syscall. It also has some special extra sys_ni_syscall()
> implementation bits to handle both ARCH_HAS_SYSCALL_WRAPPER and
> !ARCH_HAS_SYSCALL_WRAPPER. So wondering if it might need special
> treatment. Did you see those parts?

I don't think it needs any special treatment. It's processed by the same
script as other arches (scripts/syscalltbl.sh). So if there's no compat
or native entry it will default to sys_ni_syscall.

I think it's just habit/historical that we always spell out sys_ni_syscall.

cheers

Return-Path: <linuxppc-dev+bounces-4962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25973A08911
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 08:38:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTtmy2VNvz3cVR;
	Fri, 10 Jan 2025 18:38:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736494706;
	cv=none; b=ZbAf0KDMgcqIsqnTM3yjmXICK7E5zfA2EDfd+LGKdVaukHAhytrqS1nTarXhWoy/uMWwr+iE4kH0NcquW81r9aQ68Em3rL23sbhuwxqMDrd6L6YgkIOXw/IpY6fgdVeNvBzWV0Y/mGLMyOveuB4lAV+Kj6909JwSjZ3BN2BonqkgDf6jLUQY9ZgGcZDNr5cGSdsUTLwgT86ViyYU4d/oXb9p2XXp5e4FC7oSeEXqmPMQUolPwHxK0QAZBv/KU7rTZIw3VQlHmoO5o8AOzGJ8zrZG1bD8Yfn6wded2l54On0xetJKi6f0ePjC3DI3RnJ8tWVAs7NoFTS9daB9Pxl7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736494706; c=relaxed/relaxed;
	bh=2WLKmmEPE7uT96J0bnuWzAWEZ+Ks9Ue/uzhm9byypE8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DYk7so6KX9YVv/EilJ6NeRUHG25np+C3Kcn2Dh7+7jazbF1tP5aRb/s/kY5P/PEy5C8tYy4ovbLPlhY0T/AUpTZ7dV7VW81Q3uS7/ZWaK/ot9advjeUqbibEZS1Ove/1h43owQjDwub4MqffioIea6iKBhsK4UbPOaMY9LMI9hYs66Tj09h3+WPAeRek4G2cNY75fjtH1YQQJL+PM/6KgfM0o5vcHu49qHlxKf2gUjVR0iV9fozk0zHe1TR1qUQl+tizLqM/hMKRdh05Z8YLIGMoU01FtM9x7IVXSKdGWpySb6aP7H5iTTjGzzhO1Rd02E6J1h7YBWpINEpWYn6Ykw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRQpF/U/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRQpF/U/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTtmw65zrz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 18:38:24 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Nx3H2001639;
	Fri, 10 Jan 2025 07:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=2WLKmmEPE7uT96J0bnuWzAWEZ+Ks9U
	e/uzhm9byypE8=; b=oRQpF/U/6grcr4Snq1iRk/I9GYPWsewmz147QsJg3tlJpp
	Sm/UeyETvgjJAENQaWXaSd8cfqXr/0vuRhl8N3wtL6grgFwp/aIijZOMmhsN47FV
	f5jNMRsdgk7yT4y+tHRFOoWJtkEWYjhp56XaA02mxcT8qNb30IwNF63MXXQkZAEl
	UIlk8MTqRCqzy91KOcrwItqlnQdxp2B2h/5xAgUKTct76fC0NSNLcVTVxD2ZYQ7X
	9rxhSluh+DwsIN5cVsDEsi/dxgg4ADMCRoXyhv5xzciWSwH6XZkvVHoOuULqD2BA
	tjfE3Xo8v5ux7lwgyBH9IJOGKqLEpFGzYgoJwZfA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442rkhsd0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:37:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A7YWLB014523;
	Fri, 10 Jan 2025 07:37:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442rkhsd0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:37:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A5a76b015805;
	Fri, 10 Jan 2025 07:37:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtm930f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:37:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A7bmZl54264154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 07:37:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCF1520049;
	Fri, 10 Jan 2025 07:37:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2113920040;
	Fri, 10 Jan 2025 07:37:47 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jan 2025 07:37:47 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>, Eugene Syromyatnikov
 <evgsyr@gmail.com>,
        Mike Frysinger <vapier@gentoo.org>, Renzo Davoli
 <renzo@cs.unibo.it>,
        Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
        Vineet Gupta <vgupta@kernel.org>,
        Russell
 King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>,
        Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Geert
 Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen
 <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne
 <shorne@gmail.com>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer
 Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger
 <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov
 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel
 <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 3/6] syscall.h: introduce syscall_set_nr()
In-Reply-To: <20250107230438.GC30633@strace.io> (Dmitry V. Levin's message of
	"Wed, 8 Jan 2025 01:04:38 +0200")
References: <20250107230438.GC30633@strace.io>
Date: Fri, 10 Jan 2025 08:37:46 +0100
Message-ID: <yt9dzfjz6rw5.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oQL9q4Cm2OlRS0avVKS0GOik26TaXbjd
X-Proofpoint-GUID: v26jL7-Nw4XZK-M8Nskiprqug0sq7Zhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=723 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Dmitry V. Levin" <ldv@strace.io> writes:

> Similar to syscall_set_arguments() that complements
> syscall_get_arguments(), introduce syscall_set_nr()
> that complements syscall_get_nr().
>
> syscall_set_nr() is going to be needed along with
> syscall_set_arguments() on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
>
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
>  arch/arc/include/asm/syscall.h        |  6 ++++++
>  arch/arm/include/asm/syscall.h        | 12 ++++++++++++
>  arch/arm64/include/asm/syscall.h      |  7 +++++++
>  arch/hexagon/include/asm/syscall.h    |  7 +++++++
>  arch/loongarch/include/asm/syscall.h  |  7 +++++++
>  arch/m68k/include/asm/syscall.h       |  7 +++++++
>  arch/microblaze/include/asm/syscall.h |  7 +++++++
>  arch/mips/include/asm/syscall.h       |  7 +++++++
>  arch/nios2/include/asm/syscall.h      |  5 +++++
>  arch/openrisc/include/asm/syscall.h   |  6 ++++++
>  arch/parisc/include/asm/syscall.h     |  7 +++++++
>  arch/powerpc/include/asm/syscall.h    |  5 +++++
>  arch/riscv/include/asm/syscall.h      |  7 +++++++
>  arch/s390/include/asm/syscall.h       |  7 +++++++
>  arch/sh/include/asm/syscall_32.h      |  7 +++++++
>  arch/sparc/include/asm/syscall.h      |  7 +++++++
>  arch/um/include/asm/syscall-generic.h |  5 +++++
>  arch/x86/include/asm/syscall.h        |  7 +++++++
>  arch/xtensa/include/asm/syscall.h     |  7 +++++++
>  include/asm-generic/syscall.h         | 14 ++++++++++++++
>  20 files changed, 144 insertions(+)
>
> diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> index b3dd883699e7..1c0e349fd5c9 100644
> --- a/arch/s390/include/asm/syscall.h
> +++ b/arch/s390/include/asm/syscall.h
> @@ -24,6 +24,13 @@ static inline long syscall_get_nr(struct task_struct *task,
>  		(regs->int_code & 0xffff) : -1;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{

I think there should be a

	if (!test_pt_regs_flags(regs, PIF_SYSCALL))
		return;

before the modification so a user can't accidentally change int_code
when ptrace stopped in a non-syscall path.

> +	regs->int_code = (regs->int_code & ~0xffff) | (nr & 0xffff);
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {


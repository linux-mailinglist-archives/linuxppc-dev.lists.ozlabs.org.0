Return-Path: <linuxppc-dev+bounces-5707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C48A22A3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 10:27:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkDF664FZz2xHp;
	Thu, 30 Jan 2025 20:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738229226;
	cv=none; b=TVQHFbgRc7iaGMtU3MJk+n45x0hgsYsJ+EX6iHAJj/Q9/8rlMsdh8IAgs1jO6eD01QyKe1Jl/Ll339dZC735i7iiKBknI5Na4r29Ljvfd2bXQQ0Z4efbCDK/rFSIjKH0h/OCXwsxUa/1B4DbtgOn26odX1Iat/OdXA1052zqQNiNM/ygIDK1NryWc0+FuGpGewca+qSTNVOgm/rHGG0HxcmSNpW5Vl1iVJSwVNUx6wJlvF88UNX8bJY40fWCnWCjVkTjHn8XGUj+nWAg6pXHoUJ1iZ3wBLA/N69tbFUYS4VvEk+mu76rRt4rusaO93gPP0peVbbITKOqM9FnwZLiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738229226; c=relaxed/relaxed;
	bh=ENEt8TNFIIQna4oUkl6ZCfI1AZ3n0XWJoliPvJndSUA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S+D+LK6MA/XHihXSlPX0UPtMHj4w8shsur/Y0rynfJIraVdlhAeA6EB5a7MjMK9TcWPKxqc4I/GD1EO+DHxAEcBK4HwtFr8ucpAxxx351fwSqm7T9XWKywJpDSJRQ9TQQ42RaooI8q+YUCRmOsv0leX0p1pPRROz1bUmepGiFFna+H6wWi7zJwU+Hg+fwhRlu5C1lQYKu1MFeXl3XgqY/a6sus6v1+VlWBlZpTXAnZjktkuvq81E/XhCmZESbB5I/7OJ9ED6mXSM3YeQfmwIeJkOYYj+lLBjgdnnroLM8kSlWQD7kwYQe2c8tp2o84y2hVVIiw/IZ8mAIydLlFA4Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GwOLwzTm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GwOLwzTm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkDF56xC4z2xBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 20:27:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U5OAmX012556;
	Thu, 30 Jan 2025 09:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ENEt8TNFIIQna4oUkl6ZCfI1AZ3n0X
	WJoliPvJndSUA=; b=GwOLwzTmFKIJ+S/G/NDcueBX18kFIQDozO4Emp5FNyAE83
	LlV8nb0N5Bm6GmF5rJqj+NqKVtw41Fu0SdvorBdgMNdaaBYADm/bLytgCkSMwXuA
	iwBm6dlH41JVpb/ySdvAi7UUJVaC/ZdRGzHWxxHx7TTRfvejugAD9ULeVB2y7y6P
	SAsUNb0P96I/u5Laf36dVl5YhZS2/9Dx+cCv0EEOC1hCePh9PimW1Fq0lCgz8Npv
	BG1V0Ms7SqQOkVthuXoWasQs9yCyIkH3v4NRg30eAfifJVDwlW+u1J8spbIuh7M/
	fmg4P7PW5a4zD9z6VHTFRUR0ynPP4BvYS/C0wQmQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44g38810r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 09:25:35 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50U9P48j030487;
	Thu, 30 Jan 2025 09:25:34 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44g38810r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 09:25:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50U5FMJt018905;
	Thu, 30 Jan 2025 09:25:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dd01n2ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 09:25:33 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50U9PSJL47907140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 09:25:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F98F200D7;
	Thu, 30 Jan 2025 08:33:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9EC7200D6;
	Thu, 30 Jan 2025 08:33:03 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Jan 2025 08:33:03 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Eugene Syromyatnikov
 <evgsyr@gmail.com>,
        Mike Frysinger <vapier@gentoo.org>, Renzo Davoli
 <renzo@cs.unibo.it>,
        Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
        Vineet Gupta <vgupta@kernel.org>,
        Russell
 King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
        Guo Ren
 <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
        Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen
 <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne
 <shorne@gmail.com>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe
 Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens
 <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander
 Gordeev <agordeev@linux.ibm.com>,
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
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 2/6] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
In-Reply-To: <20250128091626.GB8601@strace.io> (Dmitry V. Levin's message of
	"Tue, 28 Jan 2025 11:16:26 +0200")
References: <20250128091626.GB8601@strace.io>
Date: Thu, 30 Jan 2025 09:33:03 +0100
Message-ID: <yt9dwmecya4g.fsf@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: _PT8AYkS--OiAY9k3Cx2fgjUXkzP0l7n
X-Proofpoint-GUID: HYavPV8yQaPduF9AV11zSUaS5ZQTGJu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=851 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300069
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Dmitry V. Levin" <ldv@strace.io> writes:

> These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
>
> This partially reverts commit 7962c2eddbfe ("arch: remove unused
> function syscall_set_arguments()") by reusing some of old
> syscall_set_arguments() implementations.
>
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
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

Could that be changed to something like:

for (int n = 1; n < 6; n++)
        regs->gprs[2 + n] = args[n];
regs->orig_gpr2 = args[0];

I think this is way easier to parse.


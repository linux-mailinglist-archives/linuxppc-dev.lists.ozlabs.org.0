Return-Path: <linuxppc-dev+bounces-5709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2BDA22C97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 12:38:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkH8P2Rf3z303K;
	Thu, 30 Jan 2025 22:38:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738237093;
	cv=none; b=N+ZMtVmB4RxVRpfRiYsb8OlUtqHeshq7X1hKZzL89JmjZFulNF9pKmom8wQml4YxEjkSzNLaQqwT4G3fj+eusYC8txvRpTmJ0SgDr5ZXLYrX25wdEdISJR2qrpUUmnHwODMXBITpascWghP/vonRkQcngG19o2SmdvksLvSMVubQlz5iOklxMUNi44vrVUOrbKepU9RHpu+SsWX6BJ1L/LlHGd1BQXXtaFI4ynAq3W5PPU3Banb7+MWaQYvLaZTa+wDMl0ZmHrr8USGrDWvX63hymXmLyYeH7oiTyEZAMplLUqS9R5T8i4TIHw1TrstZU3ycwz9kPGcbpKy6YWKNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738237093; c=relaxed/relaxed;
	bh=BpEfUaBr1Cw8QWsiOsJ1W6pndXsaAOxt2vlVbbXMbZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JbScNCN0LiIHr3B9PjdPEFVXs6Xdwmdr9hWr27WtlF1TxlkdhKZ2QgFtPUP2filMago55N3ndpnS0xi44yoPngSaYcM6GD4SFKhGDIEbOtdfrchTk54EaXf7u4uZ/Ss9+YXcC56TYxquEhIaj0m8rJTfYHx0sf5bnxI/pvMgMOfwuj7FkLSJ9guMsfD6CEPHI0s39rLhkvYGU0/ghyb/lxdSZtLlfONQhmBVMU+zM1PZR9Whivy5vFJb5GMyhcGygw3nsT/KN7unjqANJ2g0nCB8p6qdSGpGFEcexxi1t4yJqmHfyHmcNe5ThqaXpjulatvqa6cq0i0lUMf3dsPZHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=py0si/7i; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=py0si/7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkH8M4J0zz2yXs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 22:38:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U3S03G009805;
	Thu, 30 Jan 2025 11:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=BpEfUaBr1Cw8QWsiOsJ1W6pndXsaAO
	xt2vlVbbXMbZU=; b=py0si/7i7sYpYpgY+Cd85pkVNtrLlOqwSMEhmRUcKRZj7F
	AdWm9g97BBEh/k1QMz1gyW8k5eUcYgkXR7GTOMktSJAFpG3LMbyg98XYXGPU8sUo
	eqeaQ4p53wCU0NhpBpfouxy1ummA3PnohqoCPPT9kZK6xXqL8bMd1HPK3stTNTCc
	i9hgrzpbOa8Oy7fd/8G+IJIcqiisWNhctW460864Z4NJPiiQN3G8K0UqP+6d4dzH
	cmzmA7ITybYy/TOKFRbQlq2Z27a5FDfLohiHJU8VcETS6330kiMTctNfd+g/5c0g
	zhFPjq0jgTlDsz9Dp+ySr7XDG4pHCTnnLQrHeZDw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44fq5tvqhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 11:36:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UBWjRY023426;
	Thu, 30 Jan 2025 11:36:35 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44fq5tvqhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 11:36:35 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50U947Bm022193;
	Thu, 30 Jan 2025 11:36:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dcgjwkcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 11:36:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50UBaU8D29491780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 11:36:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3743200BB;
	Thu, 30 Jan 2025 11:36:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B194200BC;
	Thu, 30 Jan 2025 11:36:30 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Jan 2025 11:36:30 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: linux-snps-arc@lists.infradead.org, Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andreas Larsson
 <andreas@gaisler.com>,
        John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,
        x86@kernel.org, Arnd Bergmann
 <arnd@arndb.de>,
        linux-kernel@vger.kernel.org,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        linux-hexagon@vger.kernel.org, WANG Xuerui
 <kernel@xen0n.name>,
        Will Deacon <will@kernel.org>,
        Eugene Syromyatnikov
 <evgsyr@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
        Alexander
 Gordeev <agordeev@linux.ibm.com>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Yoshinori Sato
 <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
        Michael Ellerman
 <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
        Huacai Chen
 <chenhuacai@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen
 <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>, Vineet
 Gupta <vgupta@kernel.org>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        strace-devel@lists.strace.io, linux-arch@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>, Mike
 Frysinger <vapier@gentoo.org>,
        Davide Berardi <berardi.dav@gmail.com>,
        Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
        Heiko
 Carstens <hca@linux.ibm.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Borislav Petkov
 <bp@alien8.de>, loongarch@lists.linux.dev,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Stafford Horne <shorne@gmail.com>,
        linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Oleg
 Nesterov <oleg@redhat.com>, Dinh Nguyen <dinguyen@kernel.org>,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Weinberger <richard@nod.at>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Alexey Gladkov <legion@kernel.org>,
        "David
 S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 2/6] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
In-Reply-To: <20250130112207.GA6617@strace.io> (Dmitry V. Levin's message of
	"Thu, 30 Jan 2025 13:22:07 +0200")
References: <20250128091626.GB8601@strace.io> <yt9dwmecya4g.fsf@linux.ibm.com>
	<20250130112207.GA6617@strace.io>
Date: Thu, 30 Jan 2025 12:36:29 +0100
Message-ID: <yt9dsep0y1mq.fsf@linux.ibm.com>
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
X-Proofpoint-GUID: 3aUZNse446PGQfVafhK1HcR2G4gnMUaQ
X-Proofpoint-ORIG-GUID: 64WUIlsja2UYCCT0QvJj0Ow022g8u5FP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=982 lowpriorityscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300089
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Dmitry V. Levin" <ldv@strace.io> writes:

> On Thu, Jan 30, 2025 at 09:33:03AM +0100, Sven Schnelle wrote:
>> "Dmitry V. Levin" <ldv@strace.io> writes:
>> 
>> > These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
>> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
>> >
>> > This partially reverts commit 7962c2eddbfe ("arch: remove unused
>> > function syscall_set_arguments()") by reusing some of old
>> > syscall_set_arguments() implementations.
>> >
>> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
>> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>> > ---
>> >  arch/arc/include/asm/syscall.h        | 14 +++++++++++
>> >  arch/arm/include/asm/syscall.h        | 13 ++++++++++
>> >  arch/arm64/include/asm/syscall.h      | 13 ++++++++++
>> >  arch/csky/include/asm/syscall.h       | 13 ++++++++++
>> >  arch/hexagon/include/asm/syscall.h    | 14 +++++++++++
>> >  arch/loongarch/include/asm/syscall.h  |  8 ++++++
>> >  arch/mips/include/asm/syscall.h       | 32 ++++++++++++++++++++++++
>> >  arch/nios2/include/asm/syscall.h      | 11 ++++++++
>> >  arch/openrisc/include/asm/syscall.h   |  7 ++++++
>> >  arch/parisc/include/asm/syscall.h     | 12 +++++++++
>> >  arch/powerpc/include/asm/syscall.h    | 10 ++++++++
>> >  arch/riscv/include/asm/syscall.h      |  9 +++++++
>> >  arch/s390/include/asm/syscall.h       | 12 +++++++++
>> >  arch/sh/include/asm/syscall_32.h      | 12 +++++++++
>> >  arch/sparc/include/asm/syscall.h      | 10 ++++++++
>> >  arch/um/include/asm/syscall-generic.h | 14 +++++++++++
>> >  arch/x86/include/asm/syscall.h        | 36 +++++++++++++++++++++++++++
>> >  arch/xtensa/include/asm/syscall.h     | 11 ++++++++
>> >  include/asm-generic/syscall.h         | 16 ++++++++++++
>> >  19 files changed, 267 insertions(+)
>> >
>> > diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
>> > index 27e3d804b311..b3dd883699e7 100644
>> > --- a/arch/s390/include/asm/syscall.h
>> > +++ b/arch/s390/include/asm/syscall.h
>> > @@ -78,6 +78,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>> >  	args[0] = regs->orig_gpr2 & mask;
>> >  }
>> >  
>> > +static inline void syscall_set_arguments(struct task_struct *task,
>> > +					 struct pt_regs *regs,
>> > +					 const unsigned long *args)
>> > +{
>> > +	unsigned int n = 6;
>> > +
>> > +	while (n-- > 0)
>> > +		if (n > 0)
>> > +			regs->gprs[2 + n] = args[n];
>> > +	regs->orig_gpr2 = args[0];
>> > +}
>> 
>> Could that be changed to something like:
>> 
>> for (int n = 1; n < 6; n++)
>>         regs->gprs[2 + n] = args[n];
>> regs->orig_gpr2 = args[0];
>> 
>> I think this is way easier to parse.
>
> I don't mind changing syscall_set_arguments() this way, but it just
> mirrors syscall_get_arguments(), so I think it would be better if these
> two functions were written in the same style.  Would you like to change
> syscall_get_arguments() as well?

Oh. I'll prepare a patch for syscall_get_arguments(), wasn't aware
that this function looks the same. I'll send this via the s390 tree, so
it's independent of your patch series. Thanks!


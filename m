Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A351D427
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:19:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvlPL5SC8z3dvs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:19:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1yeUp3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L1yeUp3x; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvlNf0n0qz3bqw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 19:18:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467DF17007169;
 Fri, 6 May 2022 09:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=3mutIDwAoMDYppKvXj+Kh3Lz7GBDin/nQObbZDAncxw=;
 b=L1yeUp3xv84wxceE4LqZbb6r/vCK7SyqM8/NifRc8RG+IWkiJt6J9D4wqtJSSNEB1mFe
 rA0C6Ltu6Z/5kahIg5rBv24Ga0d2Ti/46VHxLcOX/Q672acGYV7gdgpcqhzXe+LRhzoV
 ct70vVFfcof8Ka2bO9/tS+nTwTbufy8MZMfyQziuVzR1e17pxHHbsI8BAZtztm6ozGN5
 38K3rKtZbuV3ZY2WdeHLjJPaPesIOQqPGqnG0fWZa9oYqX2YOtoGsk962GaDtk5lM3w8
 pt1NSaJzZfAf2NiDAWjQUP3kyZ9HGxqaqFv+IKIa1ojcbvOsDFQTeR6egxd1MNe2+33h rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvy3btd3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 09:17:43 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2468e2Bl013355;
 Fri, 6 May 2022 09:17:43 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvy3btd2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 09:17:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2469D1uF009644;
 Fri, 6 May 2022 09:17:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fvg6112ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 09:17:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2469HTr830998854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 09:17:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C18314C046;
 Fri,  6 May 2022 09:17:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173AB4C040;
 Fri,  6 May 2022 09:17:36 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  6 May 2022 09:17:36 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
Date: Fri, 06 May 2022 11:17:35 +0200
In-Reply-To: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
 (Josh Poimboeuf's message of "Thu, 5 May 2022 18:09:45 -0700")
Message-ID: <yt9d35hnj9zk.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4n8HqNW6ohwXkIgOJyGIpHi0JkINuDC6
X-Proofpoint-ORIG-GUID: S6dXLhewdUPDA_P7LfTbFsG0u0fKL_4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060049
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Josh Poimboeuf <jpoimboe@kernel.org> writes:

> With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
> pointers are calculated weirdly: based on the beginning of the bug_entry
> struct address, rather than their respective pointer addresses.
>
> Make the relative pointers less surprising to both humans and tools by
> calculating them the normal way.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Sven Schnelle <svens@linux.ibm.com> # s390
> ---
>  arch/arm64/include/asm/asm-bug.h |  4 ++--
>  arch/powerpc/include/asm/bug.h   |  5 +++--
>  arch/riscv/include/asm/bug.h     |  4 ++--
>  arch/s390/include/asm/bug.h      |  5 +++--
>  arch/x86/include/asm/bug.h       |  2 +-
>  lib/bug.c                        | 15 +++++++--------
>  6 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
> index 03f52f84a4f3..c762038ba400 100644
> --- a/arch/arm64/include/asm/asm-bug.h
> +++ b/arch/arm64/include/asm/asm-bug.h
> @@ -14,7 +14,7 @@
>  	14472:	.string file;					\
>  		.popsection;					\
>  								\
> -		.long 14472b - 14470b;				\
> +		.long 14472b - .;				\
>  		.short line;
>  #else
>  #define _BUGVERBOSE_LOCATION(file, line)
> @@ -25,7 +25,7 @@
>  #define __BUG_ENTRY(flags) 				\
>  		.pushsection __bug_table,"aw";		\
>  		.align 2;				\
> -	14470:	.long 14471f - 14470b;			\
> +	14470:	.long 14471f - .;			\
>  _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
>  		.short flags; 				\
>  		.popsection;				\
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index ecbae1832de3..76252576d889 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -13,7 +13,8 @@
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  .macro __EMIT_BUG_ENTRY addr,file,line,flags
>  	 .section __bug_table,"aw"
> -5001:	 .4byte \addr - 5001b, 5002f - 5001b
> +5001:	 .4byte \addr - .
> +	 .4byte 5002f - .
>  	 .short \line, \flags
>  	 .org 5001b+BUG_ENTRY_SIZE
>  	 .previous
> @@ -24,7 +25,7 @@
>  #else
>  .macro __EMIT_BUG_ENTRY addr,file,line,flags
>  	 .section __bug_table,"aw"
> -5001:	 .4byte \addr - 5001b
> +5001:	 .4byte \addr - .
>  	 .short \flags
>  	 .org 5001b+BUG_ENTRY_SIZE
>  	 .previous
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index d3804a2f9aad..1aaea81fb141 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -30,8 +30,8 @@
>  typedef u32 bug_insn_t;
>  
>  #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - 2b"
> -#define __BUG_ENTRY_FILE	RISCV_INT " %0 - 2b"
> +#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
> +#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
>  #else
>  #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
>  #define __BUG_ENTRY_FILE	RISCV_PTR " %0"
> diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> index 0b25f28351ed..aebe1e22c7be 100644
> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -15,7 +15,8 @@
>  		"1:	.asciz	\""__FILE__"\"\n"		\
>  		".previous\n"					\
>  		".section __bug_table,\"awM\",@progbits,%2\n"	\
> -		"2:	.long	0b-2b,1b-2b\n"			\
> +		"2:	.long	0b-.\n"				\
> +		"	.long	1b-.\n"				\
>  		"	.short	%0,%1\n"			\
>  		"	.org	2b+%2\n"			\
>  		".previous\n"					\
> @@ -30,7 +31,7 @@
>  	asm_inline volatile(					\
>  		"0:	mc	0,0\n"				\
>  		".section __bug_table,\"awM\",@progbits,%1\n"	\
> -		"1:	.long	0b-1b\n"			\
> +		"1:	.long	0b-.\n"				\
>  		"	.short	%0\n"				\
>  		"	.org	1b+%1\n"			\
>  		".previous\n"					\
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index aaf0cb0db4ae..a3ec87d198ac 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -18,7 +18,7 @@
>  #ifdef CONFIG_X86_32
>  # define __BUG_REL(val)	".long " __stringify(val)
>  #else
> -# define __BUG_REL(val)	".long " __stringify(val) " - 2b"
> +# define __BUG_REL(val)	".long " __stringify(val) " - ."
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> diff --git a/lib/bug.c b/lib/bug.c
> index 45a0584f6541..c223a2575b72 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -6,8 +6,7 @@
>  
>    CONFIG_BUG - emit BUG traps.  Nothing happens without this.
>    CONFIG_GENERIC_BUG - enable this code.
> -  CONFIG_GENERIC_BUG_RELATIVE_POINTERS - use 32-bit pointers relative to
> -	the containing struct bug_entry for bug_addr and file.
> +  CONFIG_GENERIC_BUG_RELATIVE_POINTERS - use 32-bit relative pointers for bug_addr and file
>    CONFIG_DEBUG_BUGVERBOSE - emit full file+line information for each BUG
>  
>    CONFIG_BUG and CONFIG_DEBUG_BUGVERBOSE are potentially user-settable
> @@ -53,10 +52,10 @@ extern struct bug_entry __start___bug_table[], __stop___bug_table[];
>  
>  static inline unsigned long bug_addr(const struct bug_entry *bug)
>  {
> -#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -	return bug->bug_addr;
> +#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> +	return (unsigned long)&bug->bug_addr_disp + bug->bug_addr_disp;
>  #else
> -	return (unsigned long)bug + bug->bug_addr_disp;
> +	return bug->bug_addr;
>  #endif
>  }
>  
> @@ -131,10 +130,10 @@ void bug_get_file_line(struct bug_entry *bug, const char **file,
>  		       unsigned int *line)
>  {
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> -#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -	*file = bug->file;
> +#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> +	*file = (const char *)&bug->file_disp + bug->file_disp;
>  #else
> -	*file = (const char *)bug + bug->file_disp;
> +	*file = bug->file;
>  #endif
>  	*line = bug->line;
>  #else

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 195261A0C3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 12:50:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xPLl68lTzDqDx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 20:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xPK0089kzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 20:48:35 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037AXHfB133583
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 06:48:32 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3082hy3xmc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 06:48:32 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 11:48:07 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 11:48:04 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 037AmR3e37486702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 10:48:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C7F942042;
 Tue,  7 Apr 2020 10:48:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16D1D42049;
 Tue,  7 Apr 2020 10:48:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.85.44])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 10:48:25 +0000 (GMT)
Subject: Re: [PATCH v5 11/21] powerpc: Define and use __get_user_instr{,
 inatomic}()
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 16:18:25 +0530
In-Reply-To: <20200406080936.7180-12-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-12-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040710-0016-0000-0000-000002FFF70F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040710-0017-0000-0000-00003363D152
Message-Id: <fa3e7acbe5b691060dc4f9635031733ffc36f92b.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_02:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=550
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070086
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
Cc: alistair@popple.id.au, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> Define specific __get_user_instr() and __get_user_instr_inatomic()
> macros for reading instructions from user space.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/uaccess.h  | 5 +++++
>  arch/powerpc/kernel/align.c         | 2 +-
>  arch/powerpc/kernel/hw_breakpoint.c | 2 +-
>  arch/powerpc/kernel/vecemu.c        | 2 +-
>  4 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h
> b/arch/powerpc/include/asm/uaccess.h
> index 2f500debae21..c0a35e4586a5 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -105,6 +105,11 @@ static inline int __access_ok(unsigned long addr,
> unsigned long size,
>  #define __put_user_inatomic(x, ptr) \
>  	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>  
> +#define __get_user_instr(x, ptr) \
> +	__get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> +
> +#define __get_user_instr_inatomic(x, ptr) \
> +	__get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))


should we use ppc_inst_val() ?

-- Bala


>  extern long __put_user_bad(void);
>  
>  /*
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index 66a6d1de7799..65cdfd41e3a1 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -304,7 +304,7 @@ int fix_alignment(struct pt_regs *regs)
>  	 */
>  	CHECK_FULL_REGS(regs);
>  
> -	if (unlikely(__get_user(instr.val, (unsigned int __user *)regs->nip)))
> +	if (unlikely(__get_user_instr(instr, (void __user *)regs->nip)))
>  		return -EFAULT;
>  	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
>  		/* We don't handle PPC little-endian any more... */
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> b/arch/powerpc/kernel/hw_breakpoint.c
> index 542f65ccf68b..cebab14e2788 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -249,7 +249,7 @@ static bool stepping_handler(struct pt_regs *regs, struct
> perf_event *bp,
>  	struct instruction_op op;
>  	unsigned long addr = info->address;
>  
> -	if (__get_user_inatomic(instr.val, (unsigned int *)regs->nip))
> +	if (__get_user_instr_inatomic(instr, (void __user *)regs->nip))
>  		goto fail;
>  
>  	ret = analyse_instr(&op, regs, instr);
> diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
> index bbf536e10902..c82ede46d71b 100644
> --- a/arch/powerpc/kernel/vecemu.c
> +++ b/arch/powerpc/kernel/vecemu.c
> @@ -266,7 +266,7 @@ int emulate_altivec(struct pt_regs *regs)
>  	unsigned int va, vb, vc, vd;
>  	vector128 *vrs;
>  
> -	if (get_user(instr.val, (unsigned int __user *) regs->nip))
> +	if (__get_user_instr(instr, (void __user *) regs->nip))
>  		return -EFAULT;
>  
>  	word = ppc_inst_val(instr);


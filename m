Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888658C2F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 07:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Q9w2h05z3bqT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:44:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0iqXQ+o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0iqXQ+o;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1Q974Sddz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 15:43:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2785KRnX002806;
	Mon, 8 Aug 2022 05:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=8W0Aro6K83/iIEWGQWnXXacwPMddES4OB/MkVdfE0HQ=;
 b=a0iqXQ+oEf+TUe3OCRxbVxJ7QesGbZb+TkI4narz5AKBHIZBZAuaj85GW9zdVXHVAW/n
 izjMjyMj5I/AKn+j3kmRN3ffU7c25QJVQdf/ivYCTiHceWPIY0x66qytreOmTgRrmEzE
 52JHsExO+sMH/HM+e+YUj0SOWTsBMJzlBL5fguMJqQgevH5qoRKx1fQpyEPXpUlWUVQ4
 /jnRJlgLGxtAVoQKUqdxg/AAkhMEaaO95yFWQJCDb63TDE2obYdVBaQnp9vG8iQPUWjc
 QoI4moxZP2q1dTK55rcHsSN98gFKH5ZQFSRPYaIIkMbo2RSb6MRjDJ4JRbbRzaveguiP GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htv8nrg2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 05:43:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2785Me28010307;
	Mon, 8 Aug 2022 05:43:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htv8nrg2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 05:43:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2785aBBX005437;
	Mon, 8 Aug 2022 05:43:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3hsfjj1r9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 05:43:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2785hDwP25624892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 05:43:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35380A405F;
	Mon,  8 Aug 2022 05:43:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D40C7A4054;
	Mon,  8 Aug 2022 05:43:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 05:43:12 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B1A436010A;
	Mon,  8 Aug 2022 15:43:11 +1000 (AEST)
Message-ID: <166fb6faeeb8bf480cc59254f9726ba15bbd1084.camel@linux.ibm.com>
Subject: Re: [PATCH v2 07/14] powerpc: Enable compile-time check for syscall
 handlers
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 15:43:11 +1000
In-Reply-To: <20220725062813.119723-1-rmclure@linux.ibm.com>
References: <20220725062813.119723-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p3e7XzQkVFXFY9nsPEPbgtI2O3j_Ca5G
X-Proofpoint-ORIG-GUID: _NP6WORYkYTunbhhGD9NF3D3qvZkX2l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080025
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
Cc: npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:28 +1000, Rohan McLure wrote:
> The table of syscall handlers and registered compatibility syscall
> handlers has in past been produced using assembly, with function
> references resolved at link time. This moves link-time errors to
> compile-time, by rewriting systbl.S in C, and including the
> linux/syscalls.h, linux/compat.h and asm/syscalls.h headers for
> prototypes.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: New patch.
> ---
>  arch/powerpc/kernel/{systbl.S => systbl.c} | 27 ++++++++++----------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/systbl.S
> b/arch/powerpc/kernel/systbl.c
> similarity index 59%
> rename from arch/powerpc/kernel/systbl.S
> rename to arch/powerpc/kernel/systbl.c
> index cb3358886203..99ffdfef6b9c 100644
> --- a/arch/powerpc/kernel/systbl.S
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -10,31 +10,32 @@
>   * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com) 
>   */
>  
> -#include <asm/ppc_asm.h>
> +#include <linux/syscalls.h>
> +#include <linux/compat.h>
> +#include <asm/unistd.h>
> +#include <asm/syscalls.h>
>  
> -.section .rodata,"a"
> +#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr,
> entry)
>  
> -#ifdef CONFIG_PPC64
> -       .p2align        3
> -#define __SYSCALL(nr, entry)   .8byte entry
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +#define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
> +#define __powerpc_sys_ni_syscall       sys_ni_syscall

Keep this until patch 10.

Otherwise looks alright to me.

>  #else
> -#define __SYSCALL(nr, entry)   .long entry
> +#define __SYSCALL(nr, entry) [nr] = entry,
>  #endif
>  
> -#define __SYSCALL_WITH_COMPAT(nr, native, compat)      __SYSCALL(nr,
> native)
> -.globl sys_call_table
> -sys_call_table:
> +void *sys_call_table[] = {
>  #ifdef CONFIG_PPC64
>  #include <asm/syscall_table_64.h>
>  #else
>  #include <asm/syscall_table_32.h>
>  #endif
> +};
>  
>  #ifdef CONFIG_COMPAT
>  #undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)      __SYSCALL(nr,
> compat)
> -.globl compat_sys_call_table
> -compat_sys_call_table:
> -#define compat_sys_sigsuspend  sys_sigsuspend
> +void *compat_sys_call_table[] = {
>  #include <asm/syscall_table_32.h>
> -#endif
> +};
> +#endif /* CONFIG_COMPAT */

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited


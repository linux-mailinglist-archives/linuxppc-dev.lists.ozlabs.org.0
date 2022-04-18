Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F58504CEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 09:01:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhdBl05P7z3bdq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 17:01:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qh2PeW62;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qh2PeW62; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhdB34dQHz2xDV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 17:00:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I6na4X016120; 
 Mon, 18 Apr 2022 07:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=cP8ktWUiSMOX5bCqRReCUKp7w8Y59KEtO2XxRz/iZsw=;
 b=qh2PeW62BJHJcpj0GhJUk4LxJOzegfswg06qf8Vz2lBl9bCvcu7w2jXQ2mwdD0ZIufGb
 ZsAx1g9AGLqJTonTHBtHoavBgKCSzu6FdbHN+DYalWdLmWO8RGgNCKamA0p0iJ8E9pXZ
 AVoogJOsD5ZyZeyLx3PBvSQGR5hsj7NMdTppBavZneI3WXCnPKbnzxETbj7UxidgCJnd
 d4svm9SS5l1z4Xw6IyyrgpNY59ZbQUv6k9jOYk4OdXS7f1bcvDlzVCwHn184ffWL/138
 84xXXybnQQ5D93xScCKx9t0j+Jy2Ut24Jk3QL5bqKrczYeU7+5oQPrwmjp448X1okZS5 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7d6e3md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:00:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23I6vJRK005836;
 Mon, 18 Apr 2022 07:00:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7d6e3ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:00:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I6wqWV007691;
 Mon, 18 Apr 2022 07:00:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3ffne91vnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:00:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23I70C8L45875484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 07:00:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 299EA4C040;
 Mon, 18 Apr 2022 07:00:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A24034C05A;
 Mon, 18 Apr 2022 07:00:11 +0000 (GMT)
Received: from localhost (unknown [9.43.2.186])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 07:00:11 +0000 (GMT)
Date: Mon, 18 Apr 2022 12:30:09 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 10/22] powerpc/ftrace: Use CONFIG_FUNCTION_TRACER
 instead of CONFIG_DYNAMIC_FTRACE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <72070995f96acaa9a387963e3848bd24a436a847.1648131740.git.christophe.leroy@csgroup.eu>
In-Reply-To: <72070995f96acaa9a387963e3848bd24a436a847.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1650264297.v44gkh54rc.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _5XR_0XfT75SWFghW64a5qO1XVdhpDMh
X-Proofpoint-GUID: ifTOizibZPfKHRGfAcybksYbdXDRkK2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204180037
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> Since commit 0c0c52306f47 ("powerpc: Only support DYNAMIC_FTRACE not
> static"), CONFIG_DYNAMIC_FTRACE is always selected when
> CONFIG_FUNCTION_TRACER is selected.
>=20
> To avoid confusion and have the reader wonder what's happen when
> CONFIG_FUNCTION_TRACER is selected and CONFIG_DYNAMIC_FTRACE is not,
> use CONFIG_FUNCTION_TRACER in ifdefs instead of CONFIG_DYNAMIC_FTRACE.
>=20
> As CONFIG_FUNCTION_GRAPH_TRACER depends on CONFIG_FUNCTION_TRACER,
> ftrace.o doesn't need to appear for both symbols in Makefile.
>=20
> Then as ftrace.o is built only when CONFIG_FUNCTION_TRACER is selected

and since it implies CONFIG_DYNAMIC_FTRACE, CONFIG_DYNAMIC_FTRACE is not=20
needed in ftrace.c

> ifdef CONFIG_FUNCTION_TRACER is not needed in ftrace.c
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
>  arch/powerpc/include/asm/module.h            | 4 ++--
>  arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
>  arch/powerpc/kernel/module_32.c              | 4 ++--
>  arch/powerpc/kernel/module_64.c              | 6 +++---
>  arch/powerpc/kernel/trace/Makefile           | 4 +---
>  arch/powerpc/kernel/trace/ftrace.c           | 4 ----
>  8 files changed, 11 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/=
include/asm/book3s/32/pgtable.h
> index 772e00dc4ef1..992aed626eb4 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -124,7 +124,7 @@ static inline bool pte_user(pte_t pte)
>   * on platforms where such control is possible.
>   */
>  #if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_S=
WITCH) ||\
> -	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
> +	defined(CONFIG_KPROBES) || defined(CONFIG_FUNCTION_TRACER)
>  #define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
>  #else
>  #define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/=
include/asm/book3s/64/pgtable.h
> index 875730d5af40..cf01b609572f 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -169,7 +169,7 @@
>   * on platforms where such control is possible.
>   */
>  #if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_S=
WITCH) || \
> -	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
> +	defined(CONFIG_KPROBES) || defined(CONFIG_FUNCTION_TRACER)
>  #define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
>  #else
>  #define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
> diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm=
/module.h
> index 857d9ff24295..e6f5963fd96e 100644
> --- a/arch/powerpc/include/asm/module.h
> +++ b/arch/powerpc/include/asm/module.h
> @@ -39,7 +39,7 @@ struct mod_arch_specific {
>  	unsigned int init_plt_section;
>  #endif /* powerpc64 */
>=20
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  	unsigned long tramp;
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  	unsigned long tramp_regs;
> @@ -68,7 +68,7 @@ struct mod_arch_specific {
>  #    endif	/* MODULE */
>  #endif
>=20
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  #    ifdef MODULE
>  	asm(".section .ftrace.tramp,\"ax\",@nobits; .align 3; .previous");
>  #    endif	/* MODULE */
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/inc=
lude/asm/nohash/pgtable.h
> index ac75f4ab0dba..2e8cf217a191 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -23,7 +23,7 @@
>   * on platforms where such control is possible.
>   */
>  #if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_S=
WITCH) ||\
> -	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
> +	defined(CONFIG_KPROBES) || defined(CONFIG_FUNCTION_TRACER)
>  #define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
>  #else
>  #define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
> diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module=
_32.c
> index a0432ef46967..2aa368ce21c9 100644
> --- a/arch/powerpc/kernel/module_32.c
> +++ b/arch/powerpc/kernel/module_32.c
> @@ -39,7 +39,7 @@ static unsigned int count_relocs(const Elf32_Rela *rela=
, unsigned int num)
>  			r_addend =3D rela[i].r_addend;
>  		}
>=20
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  	_count_relocs++;	/* add one for ftrace_caller */
>  #endif
>  	return _count_relocs;
> @@ -288,7 +288,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
>  	return 0;
>  }
>=20
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  int module_trampoline_target(struct module *mod, unsigned long addr,
>  			     unsigned long *target)
>  {
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module=
_64.c
> index 794720530442..b13a72665eee 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -207,7 +207,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr =
*hdr,
>  		}
>  	}
>=20
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  	/* make the trampoline to the ftrace_caller */
>  	relocs++;
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> @@ -372,7 +372,7 @@ static bool is_mprofile_ftrace_call(const char *name)
>  {
>  	if (!strcmp("_mcount", name))
>  		return true;
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  	if (!strcmp("ftrace_caller", name))
>  		return true;
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> @@ -740,7 +740,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>  	return 0;
>  }
>=20
> -#ifdef CONFIG_DYNAMIC_FTRACE
> +#ifdef CONFIG_FUNCTION_TRACER
>  int module_trampoline_target(struct module *mod, unsigned long addr,
>  			     unsigned long *target)
>  {

The below two changes to trace/Makefile and trace/ftrace.c make=20
sense, but I'm not sure the above changes are necessary.

For generic code (outside arch/powerpc/kernel/trace), I think it is good=20
to retain the actual dependency which is DYNAMIC_FTRACE. In my view,=20
gating some of the above code on FUNCTION_TRACER is also confusing. The=20
primary implication of always selecting DYNAMIC_FTRACE is within the=20
powerpc trace code, and it is good to keep it that way.

> diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/tra=
ce/Makefile
> index fc32ec30b297..af8527538fe4 100644
> --- a/arch/powerpc/kernel/trace/Makefile
> +++ b/arch/powerpc/kernel/trace/Makefile
> @@ -14,9 +14,7 @@ obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_mprofile.o
>  else
>  obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64_pg.o
>  endif
> -obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_low.o
> -obj-$(CONFIG_DYNAMIC_FTRACE)		+=3D ftrace.o
> -obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o
> +obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_low.o ftrace.o
>  obj-$(CONFIG_TRACING)			+=3D trace_clock.o
>=20
>  obj-$(CONFIG_PPC64)			+=3D $(obj64-y)
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 2c7e42e439bb..188f59f4ee4a 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -28,9 +28,6 @@
>  #include <asm/syscall.h>
>  #include <asm/inst.h>
>=20
> -
> -#ifdef CONFIG_DYNAMIC_FTRACE
> -
>  /*
>   * We generally only have a single long_branch tramp and at most 2 or 3 =
plt
>   * tramps generated. But, we don't use the plt tramps currently. We also=
 allot
> @@ -783,7 +780,6 @@ int __init ftrace_dyn_arch_init(void)
>  	return 0;
>  }
>  #endif
> -#endif /* CONFIG_DYNAMIC_FTRACE */
>=20
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>=20
> --=20
> 2.35.1
>=20

- Naveen

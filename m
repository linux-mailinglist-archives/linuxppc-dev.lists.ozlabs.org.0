Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161917C4F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 19:01:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YwQs1DcBzDqwp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 05:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YwNz6YsMzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 04:59:24 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026HpPHx097350; Fri, 6 Mar 2020 12:59:19 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ykd4a5tcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 12:59:19 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026HrPdC000583;
 Fri, 6 Mar 2020 17:59:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 2yffk8am77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 17:59:19 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026HxI5T50987368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 17:59:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3638EAE062;
 Fri,  6 Mar 2020 17:59:18 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB834AE05C;
 Fri,  6 Mar 2020 17:59:16 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.160.48.59])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 17:59:16 +0000 (GMT)
Subject: Re: [PATCH v3] ima: add a new CONFIG for loading arch-specific
 policies
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-efi@vger.kernel.org,
 linux-s390@vger.kernel.org, zohar@linux.ibm.com,
 Philipp Rudo <prudo@linux.ibm.com>, Ard Biesheuvel <ardb@kernel.org>
References: <1583516360-22016-1-git-send-email-nayna@linux.ibm.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <193c432d-f901-82e3-755c-e9fb723a36b7@linux.vnet.ibm.com>
Date: Fri, 6 Mar 2020 12:59:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583516360-22016-1-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_06:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060113
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oops,  Please ignore this patch.

By mistake I posted the wrong version. I am sorry for the confusion,  I 
will resend the right version.

Thanks & Regards,

      - Nayna

On 3/6/20 12:39 PM, Nayna Jain wrote:
> Every time a new architecture defines the IMA architecture specific
> functions - arch_ima_get_secureboot() and arch_ima_get_policy(), the IMA
> include file needs to be updated. To avoid this "noise", this patch
> defines a new IMA Kconfig IMA_SECURE_AND_OR_TRUSTED_BOOT option, allowing
> the different architectures to select it.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Philipp Rudo <prudo@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> ---
> v3:
> * Updated and tested the patch with improvements suggested by Michael.
> It now uses "imply" instead of "select". Thanks Michael.
> * Have missed replacing the CONFIG_IMA in x86 and s390 with new config,
> that was resulting in redefinition when the IMA_SECURE_AND_OR_TRUSTED_BOOT
> is not enabled. Thanks to Mimi for recognizing the problem.
>
> v2:
> * Fixed the issue identified by Mimi. Thanks Mimi, Ard, Heiko and Michael for
> discussing the fix.
>
>   arch/powerpc/Kconfig           | 1 +
>   arch/s390/Kconfig              | 1 +
>   arch/s390/kernel/Makefile      | 2 +-
>   arch/x86/Kconfig               | 1 +
>   arch/x86/kernel/Makefile       | 2 +-
>   include/linux/ima.h            | 3 +--
>   security/integrity/ima/Kconfig | 8 ++++++++
>   7 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 497b7d0b2d7e..a5cfde432983 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -979,6 +979,7 @@ config PPC_SECURE_BOOT
>   	bool
>   	depends on PPC_POWERNV
>   	depends on IMA_ARCH_POLICY
> +	select IMA_SECURE_AND_OR_TRUSTED_BOOT
>   	help
>   	  Systems with firmware secure boot enabled need to define security
>   	  policies to extend secure boot to the OS. This config allows a user
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 8abe77536d9d..4a502fbcb800 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -195,6 +195,7 @@ config S390
>   	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
>   	select SWIOTLB
>   	select GENERIC_ALLOCATOR
> +	select IMA_SECURE_AND_OR_TRUSTED_BOOT if IMA_ARCH_POLICY
>   
>   
>   config SCHED_OMIT_FRAME_POINTER
> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
> index 2b1203cf7be6..578a6fa82ea4 100644
> --- a/arch/s390/kernel/Makefile
> +++ b/arch/s390/kernel/Makefile
> @@ -70,7 +70,7 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>   obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file.o kexec_image.o
>   obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o
>   
> -obj-$(CONFIG_IMA)		+= ima_arch.o
> +obj-$(CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT)	+= ima_arch.o
>   
>   obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o perf_cpum_cf_common.o
>   obj-$(CONFIG_PERF_EVENTS)	+= perf_cpum_cf.o perf_cpum_sf.o
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index beea77046f9b..7f5bfaf0cbd2 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -230,6 +230,7 @@ config X86
>   	select VIRT_TO_BUS
>   	select X86_FEATURE_NAMES		if PROC_FS
>   	select PROC_PID_ARCH_STATUS		if PROC_FS
> +	select IMA_SECURE_AND_OR_TRUSTED_BOOT	if EFI && IMA_ARCH_POLICY
>   
>   config INSTRUCTION_DECODER
>   	def_bool y
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 9b294c13809a..7f131ceba136 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -155,5 +155,5 @@ ifeq ($(CONFIG_X86_64),y)
>   endif
>   
>   ifdef CONFIG_EFI
> -obj-$(CONFIG_IMA)			+= ima_arch.o
> +obj-$(CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT)	+= ima_arch.o
>   endif
> diff --git a/include/linux/ima.h b/include/linux/ima.h
> index 1659217e9b60..aefe758f4466 100644
> --- a/include/linux/ima.h
> +++ b/include/linux/ima.h
> @@ -30,8 +30,7 @@ extern void ima_kexec_cmdline(const void *buf, int size);
>   extern void ima_add_kexec_buffer(struct kimage *image);
>   #endif
>   
> -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
> -	|| defined(CONFIG_PPC_SECURE_BOOT)
> +#ifdef CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
>   extern bool arch_ima_get_secureboot(void);
>   extern const char * const *arch_get_ima_policy(void);
>   #else
> diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
> index 3f3ee4e2eb0d..2baaf196c6d8 100644
> --- a/security/integrity/ima/Kconfig
> +++ b/security/integrity/ima/Kconfig
> @@ -327,3 +327,11 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>   	depends on IMA_MEASURE_ASYMMETRIC_KEYS
>   	depends on SYSTEM_TRUSTED_KEYRING
>   	default y
> +
> +config IMA_SECURE_AND_OR_TRUSTED_BOOT
> +	bool
> +	depends on IMA_ARCH_POLICY
> +	default n
> +	help
> +	   This option is selected by architectures to enable secure and/or
> +	   trusted boot based on IMA runtime policies.

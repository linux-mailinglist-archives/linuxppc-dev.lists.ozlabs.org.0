Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5283C365
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 07:21:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NJJg054QzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 15:21:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NJGl3SFkzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 15:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NJGk1vxlz8vsm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 15:19:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NJGk1Zrfz9sND; Tue, 11 Jun 2019 15:19:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sathnaga@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NJGj5BrXz9s6w
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 15:19:57 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B5CX1i138918
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 01:19:53 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t25e3h7f1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 01:19:53 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sathnaga@linux.vnet.ibm.com>;
 Tue, 11 Jun 2019 06:19:51 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 06:19:49 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B5Jlhw51839080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 05:19:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC463A405F;
 Tue, 11 Jun 2019 05:19:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9125A4060;
 Tue, 11 Jun 2019 05:19:45 +0000 (GMT)
Received: from sathnaga86.in.ibm.com (unknown [9.122.211.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Jun 2019 05:19:45 +0000 (GMT)
Date: Tue, 11 Jun 2019 10:49:43 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v3 3/3] powerpc: Add support to initialize ima policy rules
References: <1560198837-18857-1-git-send-email-nayna@linux.ibm.com>
 <1560198837-18857-4-git-send-email-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560198837-18857-4-git-send-email-nayna@linux.ibm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-TM-AS-GCONF: 00
x-cbid: 19061105-0016-0000-0000-00000287EF6D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061105-0017-0000-0000-000032E51AC8
Message-Id: <20190611051943.GA7516@sathnaga86.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906110036
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
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2019 at 04:33:57PM -0400, Nayna Jain wrote:
> PowerNV secure boot relies on the kernel IMA security subsystem to
> perform the OS kernel image signature verification. Since each secure
> boot mode has different IMA policy requirements, dynamic definition of
> the policy rules based on the runtime secure boot mode of the system is
> required. On systems that support secure boot, but have it disabled,
> only measurement policy rules of the kernel image and modules are
> defined.
> 
> This patch defines the arch-specific implementation to retrieve the
> secure boot mode of the system and accordingly configures the IMA policy
> rules.
> 
> This patch provides arch-specific IMA policies if PPC_SECURE_BOOT
> config is enabled.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig           | 14 +++++++++
>  arch/powerpc/kernel/Makefile   |  1 +
>  arch/powerpc/kernel/ima_arch.c | 54 ++++++++++++++++++++++++++++++++++
>  include/linux/ima.h            |  3 +-
>  4 files changed, 71 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/kernel/ima_arch.c

Hi,

This series failed to build against linuxppc/merge tree with `ppc64le_defconfig`,

arch/powerpc/platforms/powernv/secboot.c:14:6: error: redefinition of 'get_powerpc_sb_mode'
   14 | bool get_powerpc_sb_mode(void)
      |      ^~~~~~~~~~~~~~~~~~~
In file included from arch/powerpc/platforms/powernv/secboot.c:11:
./arch/powerpc/include/asm/secboot.h:15:20: note: previous definition of 'get_powerpc_sb_mode' was here
   15 | static inline bool get_powerpc_sb_mode(void)
      |                    ^~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:278: arch/powerpc/platforms/powernv/secboot.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:489: arch/powerpc/platforms/powernv] Error 2
make[1]: *** [scripts/Makefile.build:489: arch/powerpc/platforms] Error 2
make: *** [Makefile:1071: arch/powerpc] Error 2
make: *** Waiting for unfinished jobs....

Regards,
-Satheesh

> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..9de77bb14f54 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -902,6 +902,20 @@ config PPC_MEM_KEYS
> 
>  	  If unsure, say y.
> 
> +config PPC_SECURE_BOOT
> +	prompt "Enable PowerPC Secure Boot"
> +	bool
> +	default n
> +	depends on PPC64
> +	depends on OPAL_SECVAR
> +	depends on IMA
> +	depends on IMA_ARCH_POLICY
> +	help
> +	  Linux on POWER with firmware secure boot enabled needs to define
> +	  security policies to extend secure boot to the OS.This config
> +	  allows user to enable OS Secure Boot on PowerPC systems that
> +	  have firmware secure boot support.
> +
>  endmenu
> 
>  config ISA_DMA_API
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 0ea6c4aa3a20..75c929b41341 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -131,6 +131,7 @@ ifdef CONFIG_IMA
>  obj-y				+= ima_kexec.o
>  endif
>  endif
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= ima_arch.o
> 
>  obj-$(CONFIG_AUDIT)		+= audit.o
>  obj64-$(CONFIG_AUDIT)		+= compat_audit.o
> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
> new file mode 100644
> index 000000000000..1767bf6e6550
> --- /dev/null
> +++ b/arch/powerpc/kernel/ima_arch.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * ima_arch.c
> + *      - initialize ima policies for PowerPC Secure Boot
> + */
> +
> +#include <linux/ima.h>
> +#include <asm/secboot.h>
> +
> +bool arch_ima_get_secureboot(void)
> +{
> +	bool sb_mode;
> +
> +	sb_mode = get_powerpc_sb_mode();
> +	if (sb_mode)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +/*
> + * File signature verification is not needed, include only measurements
> + */
> +static const char *const default_arch_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
> +	"measure func=MODULE_CHECK template=ima-modsig",
> +	NULL
> +};
> +
> +/* Both file signature verification and measurements are needed */
> +static const char *const sb_arch_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
> +	"measure func=MODULE_CHECK template=ima-modsig",
> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig template=ima-modsig",
> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig template=ima-modsig",
> +#endif
> +	NULL
> +};
> +
> +/*
> + * On PowerPC, file measurements are to be added to the IMA measurement list
> + * irrespective of the secure boot state of the system. Signature verification
> + * is conditionally enabled based on the secure boot state.
> + */
> +const char *const *arch_get_ima_policy(void)
> +{
> +	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot())
> +		return sb_arch_rules;
> +	return default_arch_rules;
> +}
> diff --git a/include/linux/ima.h b/include/linux/ima.h
> index fd9f7cf4cdf5..a01df076ecae 100644
> --- a/include/linux/ima.h
> +++ b/include/linux/ima.h
> @@ -31,7 +31,8 @@ extern void ima_post_path_mknod(struct dentry *dentry);
>  extern void ima_add_kexec_buffer(struct kimage *image);
>  #endif
> 
> -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390)
> +#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
> +	|| defined(CONFIG_PPC_SECURE_BOOT)
>  extern bool arch_ima_get_secureboot(void);
>  extern const char * const *arch_get_ima_policy(void);
>  #else
> -- 
> 2.20.1
> 


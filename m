Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A4DEF6D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 09:07:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476j1m4jHHzF3xV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 19:07:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476dBm0tPCzF3SY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 16:14:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 476dBl5G8tz8tS0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 16:14:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 476dBl4rNGz9sPL; Tue,  5 Nov 2019 16:14:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=erichte@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 476dBl1rp1z9sPF
 for <linuxppc-dev@ozlabs.org>; Tue,  5 Nov 2019 16:14:38 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA557Hn9076450
 for <linuxppc-dev@ozlabs.org>; Tue, 5 Nov 2019 00:14:35 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w2yrf5f0t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 05 Nov 2019 00:14:35 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <erichte@linux.ibm.com>;
 Tue, 5 Nov 2019 05:14:32 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Nov 2019 05:14:29 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA55ERdR50397194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 05:14:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B24004C046;
 Tue,  5 Nov 2019 05:14:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBC1D4C040;
 Tue,  5 Nov 2019 05:14:25 +0000 (GMT)
Received: from [9.80.237.45] (unknown [9.80.237.45])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 05:14:25 +0000 (GMT)
Subject: Re: [PATCH v10 1/9] powerpc: detect the secure boot mode of the system
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <1572492694-6520-1-git-send-email-zohar@linux.ibm.com>
 <1572492694-6520-2-git-send-email-zohar@linux.ibm.com>
From: Eric Richter <erichte@linux.ibm.com>
Date: Mon, 4 Nov 2019 23:14:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <1572492694-6520-2-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19110505-4275-0000-0000-0000037AD8D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110505-4276-0000-0000-0000388E21BD
Message-Id: <09a57ae4-c7b1-aaf4-0f89-a0d7ed16f6cf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050040
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:05:27 +1100
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/30/19 10:31 PM, Mimi Zohar wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
> 
> This patch defines a function to detect the secure boot state of a
> PowerNV system.
> 
> The PPC_SECURE_BOOT config represents the base enablement of secure boot
> for powerpc.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig                   | 10 ++++++++++
>  arch/powerpc/include/asm/secure_boot.h | 23 +++++++++++++++++++++++
>  arch/powerpc/kernel/Makefile           |  2 ++
>  arch/powerpc/kernel/secure_boot.c      | 32 ++++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/secure_boot.h
>  create mode 100644 arch/powerpc/kernel/secure_boot.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 3e56c9c2f16e..56ea0019b616 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -934,6 +934,16 @@ config PPC_MEM_KEYS
>  
>  	  If unsure, say y.
>  
> +config PPC_SECURE_BOOT
> +	prompt "Enable secure boot support"
> +	bool
> +	depends on PPC_POWERNV
> +	help
> +	  Systems with firmware secure boot enabled need to define security
> +	  policies to extend secure boot to the OS. This config allows a user
> +	  to enable OS secure boot on systems that have firmware support for
> +	  it. If in doubt say N.
> +
>  endmenu
>  
>  config ISA_DMA_API
> diff --git a/arch/powerpc/include/asm/secure_boot.h b/arch/powerpc/include/asm/secure_boot.h
> new file mode 100644
> index 000000000000..07d0fe0ca81f
> --- /dev/null
> +++ b/arch/powerpc/include/asm/secure_boot.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Secure boot definitions
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain
> + */
> +#ifndef _ASM_POWER_SECURE_BOOT_H
> +#define _ASM_POWER_SECURE_BOOT_H
> +
> +#ifdef CONFIG_PPC_SECURE_BOOT
> +
> +bool is_ppc_secureboot_enabled(void);
> +
> +#else
> +
> +static inline bool is_ppc_secureboot_enabled(void)
> +{
> +	return false;
> +}
> +
> +#endif
> +#endif
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index a7ca8fe62368..e2a54fa240ac 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -161,6 +161,8 @@ ifneq ($(CONFIG_PPC_POWERNV)$(CONFIG_PPC_SVM),)
>  obj-y				+= ucall.o
>  endif
>  
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o
> +
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
>  KCOV_INSTRUMENT_prom_init.o := n
> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
> new file mode 100644
> index 000000000000..63dc82c50862
> --- /dev/null
> +++ b/arch/powerpc/kernel/secure_boot.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain
> + */
> +#include <linux/types.h>
> +#include <linux/of.h>
> +#include <asm/secure_boot.h>
> +
> +bool is_ppc_secureboot_enabled(void)
> +{
> +	struct device_node *node;
> +	bool enabled = false;
> +
> +	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-v1");

Per skiboot changes, should instead look for "ibm,secureboot".

Updated set can be found here:
https://patchwork.ozlabs.org/project/skiboot/list/?series=140626

> +	if (!of_device_is_available(node)) {
> +		pr_err("Cannot find secure variable node in device tree; failing to secure state\n");

The default value for "enabled" is false, so it's actually failing insecure. Although, the print is
probably unnecessary.

> +		goto out;
> +	}
> +
> +	/*
> +	 * secureboot is enabled if os-secure-enforcing property exists,
> +	 * else disabled.
> +	 */
> +	enabled = of_property_read_bool(node, "os-secure-enforcing");

Property has been renamed to "os-secureboot-enforcing".

> +> +out:
> +	of_node_put(node);
> +
> +	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
> +	return enabled;
> +}
> 


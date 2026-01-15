Return-Path: <linuxppc-dev+bounces-15871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EA0D28814
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 21:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsZlM1NFrz309H;
	Fri, 16 Jan 2026 07:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768509983;
	cv=none; b=Zguq4Gl7EmFZILMuP8/nATvie4ij5CfhskqFmflvb8Swvsnag2bCXA+31Mzq7QTujajv9ZhwDDkGZAvK+MYat/CsHZktEG49/PqrsA0cWVVkDwsxsmF8CGS8Vmd8UMWEkSJdI9zwdW4Xv9tSHnZmD2ZHtUzmFr2cUyFYoPKnQv08t/nDilb3cnr+d3+eaU2N+o0nWt2ldX36l59VK7yNQUvwteGxc6J4XemcxPxTc8iXMIR2YHBH3Xv6u9vw924MuG4JRhUsLziRTkHQX3GvnnmPT+fKJrKHr813B9liue/pUJv64daKLOSd0JbfN/qwykrCavkSQIzk8Urcx1iYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768509983; c=relaxed/relaxed;
	bh=QtgObfZRbE3w+1IaWDxgjAPlf6cxdAzGJ7fWgI5eVEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOlNdVLzZblBjwmy8rS80ZFr005YFMOcoVfrnQj/oHWEKZ0N2bwY0PhnGAbtJJG3MCMa3DTOd10YLJ+HSX2cMA124VBsin2BYSyDkDmG6RSA8+TqpUaYJ6TxuReGHnMjATevLbbJaAHGZbwq/tQRpALcBcsU51CrPLxknhsrzRR/iZBkdYRBifu3gN69y9Q/4EPSHHabYRXmCevZfILrGbgW6HH7udldBb3IVzCTZBpyOlUGWu8o2vSYblTT72UzM5fSTzeq8GPMvdc5eQ0+2Z7hlGV+dG43NMohm3OyhMFDoU76j8duH6EyJGtMNOM9Kd0bJ1SZoNLnP8kIkJM8Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OJkwMm8F; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OJkwMm8F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsZlL2BTWz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 07:46:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FILuPU010070;
	Thu, 15 Jan 2026 20:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QtgObf
	ZRbE3w+1IaWDxgjAPlf6cxdAzGJ7fWgI5eVEk=; b=OJkwMm8FHHbMzBo4acrqKm
	1DMBb1NgqBCrAgdb+l4PXqbGyZxeixR7dzffebwlxnZziwbAzhNInE98w/lraamC
	KzfBMgZ8t4NmOF87Isvyb4EW/at/1t0eyOrsee940NCyhI/2ra0Vkw2JuZR6fGOW
	jOei9PKORiPkKuarX2PsfCq9dU03zDk6I+jEdA937/wdwvlIuDnzhjtFuNFZVkgU
	7pC8+SgIlOs3BBIll5iZ1vQD8EqjMT6VOeTJ6UQvyMfeZAr/RmNWRBrfTqaZOkkG
	hmXgIrgUvi1Cp+avFX6tCmNsKdkjaO5Ogw0eiMZoK7pa49xPuMuCtiHOLnLnV9YA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6eg7er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 20:46:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FKfuLg025482;
	Thu, 15 Jan 2026 20:46:09 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6eg7en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 20:46:09 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FKfMj6014303;
	Thu, 15 Jan 2026 20:46:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fyjfan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 20:46:09 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FKjni328443200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 20:45:49 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 885C858067;
	Thu, 15 Jan 2026 20:46:07 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA7E5805D;
	Thu, 15 Jan 2026 20:46:06 +0000 (GMT)
Received: from [9.61.83.249] (unknown [9.61.83.249])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 20:46:06 +0000 (GMT)
Message-ID: <eb58ca85-f44f-4ed3-a3fb-e01c8e6cbd18@linux.ibm.com>
Date: Thu, 15 Jan 2026 15:46:06 -0500
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] keys/trusted_keys: establish PKWM as a trusted
 source
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20260115100504.488665-1-ssrish@linux.ibm.com>
 <20260115100504.488665-6-ssrish@linux.ibm.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20260115100504.488665-6-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PBXEc1894phn0IewEYntExE_VNxgths6
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=69695212 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=EmpJ7-JGociuIM1Bw8YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OCBTYWx0ZWRfX28RW4zZoJSEl
 GescPwyf/cSVhL0PE64hxGbHevO07mJlKPr6H6nLK91WrmXAZ39MypLmF3hUsnBwIsdUsmq2V43
 2c4QcYj8ZpiIuRvA2dTMlcmHWbBy1NHFtudBy2dqtxg/GTdqY7V//Nd/Sk1ocwxVe3bhuKuqiSP
 jNURudTJxpKFBUXlRh3j9svkS55Y+47K5cceDxG5nuA2Jg8EvC6QQ6WbTy3OeBm+Kf11zs/Vl9C
 8WLxxSBI40jtEcUm+wP/tW/GLS+2Qn/jyChASlBBE2AczisPptdav5zpYxedctxiqaL+Dbkjbq1
 lB6Tkl0xmh8veuUGZz1Yuo0mtOqoi2YvMOT4wKWiuVHIgpGU73vcg3EynEboKlCieqkJXTrz++k
 XORFrAnINmWu9FYgr7zIHsyHgkfhW+VM9u/9Zlqa0sNixKC2bceeIkZM+jgFLGezeTzmji3c3Zh
 fHxYmbU006ytweHReeg==
X-Proofpoint-ORIG-GUID: RLGciDLoh1uTNhchitKob9ZVDEXdQoiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601150158
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 1/15/26 5:05 AM, Srish Srinivasan wrote:
> The wrapping key does not exist by default and is generated by the
> hypervisor as a part of PKWM initialization. This key is then persisted by
> the hypervisor and is used to wrap trusted keys. These are variable length
> symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) are
> generated using the kernel RNG. PKWM can be used as a trust source through
> the following example keyctl commands:
>
> keyctl add trusted my_trusted_key "new 32" @u
>
> Use the wrap_flags command option to set the secure boot requirement for
> the wrapping request through the following keyctl commands
>
> case1: no secure boot requirement. (default)
> keyctl usage: keyctl add trusted my_trusted_key "new 32" @u
> 	      OR
> 	      keyctl add trusted my_trusted_key "new 32 wrap_flags=0x00" @u
>
> case2: secure boot required to in either audit or enforce mode. set bit 0
> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x01" @u
>
> case3: secure boot required to be in enforce mode. set bit 1
> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x02" @u
>
> NOTE:
> -> Setting the secure boot requirement is NOT a must.
> -> Only either of the secure boot requirement options should be set. Not
> both.
> -> All the other bits are required to be not set.
> -> Set the kernel parameter trusted.source=pkwm to choose PKWM as the
> backend for trusted keys implementation.
> -> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.
>
> Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
> KeyStore, as a new trust source for trusted keys.

Looks good to me.

Reviewed-by: Nayna Jain <nayna@linux.ibm.com>

>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>   This version introduces a private pointer for backend specific fields and
>   related changes specific to the PKWM backend, but defers migrating the TPM
>   fields to this new framework. That will be done independently of this
>   patch series.
>   MAINTAINERS                               |   9 +
>   include/keys/trusted-type.h               |   7 +-
>   include/keys/trusted_pkwm.h               |  33 ++++
>   security/keys/trusted-keys/Kconfig        |   8 +
>   security/keys/trusted-keys/Makefile       |   2 +
>   security/keys/trusted-keys/trusted_core.c |   6 +-
>   security/keys/trusted-keys/trusted_pkwm.c | 190 ++++++++++++++++++++++
>   7 files changed, 253 insertions(+), 2 deletions(-)
>   create mode 100644 include/keys/trusted_pkwm.h
>   create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf755238c429..c98f1811f836 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14008,6 +14008,15 @@ S:	Supported
>   F:	include/keys/trusted_dcp.h
>   F:	security/keys/trusted-keys/trusted_dcp.c
>   
> +KEYS-TRUSTED-PLPKS
> +M:	Srish Srinivasan <ssrish@linux.ibm.com>
> +M:	Nayna Jain <nayna@linux.ibm.com>
> +L:	linux-integrity@vger.kernel.org
> +L:	keyrings@vger.kernel.org
> +S:	Supported
> +F:	include/keys/trusted_pkwm.h
> +F:	security/keys/trusted-keys/trusted_pkwm.c
> +
>   KEYS-TRUSTED-TEE
>   M:	Sumit Garg <sumit.garg@kernel.org>
>   L:	linux-integrity@vger.kernel.org
> diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
> index 4eb64548a74f..03527162613f 100644
> --- a/include/keys/trusted-type.h
> +++ b/include/keys/trusted-type.h
> @@ -19,7 +19,11 @@
>   
>   #define MIN_KEY_SIZE			32
>   #define MAX_KEY_SIZE			128
> -#define MAX_BLOB_SIZE			512
> +#if IS_ENABLED(CONFIG_TRUSTED_KEYS_PKWM)
> +#define MAX_BLOB_SIZE			1152
> +#else
> +#define MAX_BLOB_SIZE                   512
> +#endif
>   #define MAX_PCRINFO_SIZE		64
>   #define MAX_DIGEST_SIZE			64
>   
> @@ -46,6 +50,7 @@ struct trusted_key_options {
>   	uint32_t policydigest_len;
>   	unsigned char policydigest[MAX_DIGEST_SIZE];
>   	uint32_t policyhandle;
> +	void *private;
>   };
>   
>   struct trusted_key_ops {
> diff --git a/include/keys/trusted_pkwm.h b/include/keys/trusted_pkwm.h
> new file mode 100644
> index 000000000000..4035b9776394
> --- /dev/null
> +++ b/include/keys/trusted_pkwm.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PKWM_TRUSTED_KEY_H
> +#define __PKWM_TRUSTED_KEY_H
> +
> +#include <keys/trusted-type.h>
> +#include <linux/bitops.h>
> +#include <linux/printk.h>
> +
> +extern struct trusted_key_ops pkwm_trusted_key_ops;
> +
> +struct trusted_pkwm_options {
> +	u16 wrap_flags;
> +};
> +
> +static inline void dump_options(struct trusted_key_options *o)
> +{
> +	const struct trusted_pkwm_options *pkwm;
> +	bool sb_audit_or_enforce_bit;
> +	bool sb_enforce_bit;
> +
> +	pkwm = o->private;
> +	sb_audit_or_enforce_bit = pkwm->wrap_flags & BIT(0);
> +	sb_enforce_bit = pkwm->wrap_flags & BIT(1);
> +
> +	if (sb_audit_or_enforce_bit)
> +		pr_debug("secure boot mode required: audit or enforce");
> +	else if (sb_enforce_bit)
> +		pr_debug("secure boot mode required: enforce");
> +	else
> +		pr_debug("secure boot mode required: disabled");
> +}
> +
> +#endif
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
> index 204a68c1429d..9e00482d886a 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -46,6 +46,14 @@ config TRUSTED_KEYS_DCP
>   	help
>   	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
>   
> +config TRUSTED_KEYS_PKWM
> +	bool "PKWM-based trusted keys"
> +	depends on PSERIES_PLPKS >= TRUSTED_KEYS
> +	default y
> +	select HAVE_TRUSTED_KEYS
> +	help
> +	  Enable use of IBM PowerVM Key Wrapping Module (PKWM) as a trusted key backend.
> +
>   if !HAVE_TRUSTED_KEYS
>   	comment "No trust source selected!"
>   endif
> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
> index f0f3b27f688b..5fc053a21dad 100644
> --- a/security/keys/trusted-keys/Makefile
> +++ b/security/keys/trusted-keys/Makefile
> @@ -16,3 +16,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TEE) += trusted_tee.o
>   trusted-$(CONFIG_TRUSTED_KEYS_CAAM) += trusted_caam.o
>   
>   trusted-$(CONFIG_TRUSTED_KEYS_DCP) += trusted_dcp.o
> +
> +trusted-$(CONFIG_TRUSTED_KEYS_PKWM) += trusted_pkwm.o
> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
> index b1680ee53f86..2d328de170e8 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -12,6 +12,7 @@
>   #include <keys/trusted_caam.h>
>   #include <keys/trusted_dcp.h>
>   #include <keys/trusted_tpm.h>
> +#include <keys/trusted_pkwm.h>
>   #include <linux/capability.h>
>   #include <linux/err.h>
>   #include <linux/init.h>
> @@ -31,7 +32,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
>   
>   static char *trusted_key_source;
>   module_param_named(source, trusted_key_source, charp, 0);
> -MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or dcp)");
> +MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam, dcp or pkwm)");
>   
>   static const struct trusted_key_source trusted_key_sources[] = {
>   #if defined(CONFIG_TRUSTED_KEYS_TPM)
> @@ -46,6 +47,9 @@ static const struct trusted_key_source trusted_key_sources[] = {
>   #if defined(CONFIG_TRUSTED_KEYS_DCP)
>   	{ "dcp", &dcp_trusted_key_ops },
>   #endif
> +#if defined(CONFIG_TRUSTED_KEYS_PKWM)
> +	{ "pkwm", &pkwm_trusted_key_ops },
> +#endif
>   };
>   
>   DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
> diff --git a/security/keys/trusted-keys/trusted_pkwm.c b/security/keys/trusted-keys/trusted_pkwm.c
> new file mode 100644
> index 000000000000..4f391b77a907
> --- /dev/null
> +++ b/security/keys/trusted-keys/trusted_pkwm.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 IBM Corporation, Srish Srinivasan <ssrish@linux.ibm.com>
> + */
> +
> +#include <keys/trusted_pkwm.h>
> +#include <keys/trusted-type.h>
> +#include <linux/build_bug.h>
> +#include <linux/key-type.h>
> +#include <linux/parser.h>
> +#include <asm/plpks.h>
> +
> +enum {
> +	Opt_err,
> +	Opt_wrap_flags,
> +};
> +
> +static const match_table_t key_tokens = {
> +	{Opt_wrap_flags, "wrap_flags=%s"},
> +	{Opt_err, NULL}
> +};
> +
> +static int getoptions(char *datablob, struct trusted_key_options *opt)
> +{
> +	substring_t args[MAX_OPT_ARGS];
> +	char *p = datablob;
> +	int token;
> +	int res;
> +	u16 wrap_flags;
> +	unsigned long token_mask = 0;
> +	struct trusted_pkwm_options *pkwm;
> +
> +	if (!datablob)
> +		return 0;
> +
> +	pkwm = opt->private;
> +
> +	while ((p = strsep(&datablob, " \t"))) {
> +		if (*p == '\0' || *p == ' ' || *p == '\t')
> +			continue;
> +
> +		token = match_token(p, key_tokens, args);
> +		if (test_and_set_bit(token, &token_mask))
> +			return -EINVAL;
> +
> +		switch (token) {
> +		case Opt_wrap_flags:
> +			res = kstrtou16(args[0].from, 16, &wrap_flags);
> +			if (res < 0 || wrap_flags > 2)
> +				return -EINVAL;
> +			pkwm->wrap_flags = wrap_flags;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static struct trusted_key_options *trusted_options_alloc(void)
> +{
> +	struct trusted_key_options *options;
> +	struct trusted_pkwm_options *pkwm;
> +
> +	options = kzalloc(sizeof(*options), GFP_KERNEL);
> +
> +	if (options) {
> +		pkwm = kzalloc(sizeof(*pkwm), GFP_KERNEL);
> +
> +		if (!pkwm) {
> +			kfree_sensitive(options);
> +			options = NULL;
> +		} else {
> +			options->private = pkwm;
> +		}
> +	}
> +
> +	return options;
> +}
> +
> +static int trusted_pkwm_seal(struct trusted_key_payload *p, char *datablob)
> +{
> +	struct trusted_key_options *options = NULL;
> +	struct trusted_pkwm_options *pkwm = NULL;
> +	u8 *input_buf, *output_buf;
> +	u32 output_len, input_len;
> +	int rc;
> +
> +	options = trusted_options_alloc();
> +
> +	if (!options)
> +		return -ENOMEM;
> +
> +	rc = getoptions(datablob, options);
> +	if (rc < 0)
> +		goto out;
> +	dump_options(options);
> +
> +	input_len = p->key_len;
> +	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
> +	if (!input_buf) {
> +		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	memcpy(input_buf, p->key, p->key_len);
> +
> +	pkwm = options->private;
> +
> +	rc = plpks_wrap_object(&input_buf, input_len, pkwm->wrap_flags,
> +			       &output_buf, &output_len);
> +	if (!rc) {
> +		memcpy(p->blob, output_buf, output_len);
> +		p->blob_len = output_len;
> +		dump_payload(p);
> +	} else {
> +		pr_err("Wrapping of payload key failed: %d\n", rc);
> +	}
> +
> +	kfree(input_buf);
> +	kfree(output_buf);
> +
> +out:
> +	kfree_sensitive(options->private);
> +	kfree_sensitive(options);
> +	return rc;
> +}
> +
> +static int trusted_pkwm_unseal(struct trusted_key_payload *p, char *datablob)
> +{
> +	u8 *input_buf, *output_buf;
> +	u32 input_len, output_len;
> +	int rc;
> +
> +	input_len = p->blob_len;
> +	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
> +	if (!input_buf) {
> +		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(input_buf, p->blob, p->blob_len);
> +
> +	rc = plpks_unwrap_object(&input_buf, input_len, &output_buf,
> +				 &output_len);
> +	if (!rc) {
> +		memcpy(p->key, output_buf, output_len);
> +		p->key_len = output_len;
> +		dump_payload(p);
> +	} else {
> +		pr_err("Unwrapping of payload failed: %d\n", rc);
> +	}
> +
> +	kfree(input_buf);
> +	kfree(output_buf);
> +
> +	return rc;
> +}
> +
> +static int trusted_pkwm_init(void)
> +{
> +	int ret;
> +
> +	if (!plpks_wrapping_is_supported()) {
> +		pr_err("H_PKS_WRAP_OBJECT interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = plpks_gen_wrapping_key();
> +	if (ret) {
> +		pr_err("Failed to generate default wrapping key\n");
> +		return -EINVAL;
> +	}
> +
> +	return register_key_type(&key_type_trusted);
> +}
> +
> +static void trusted_pkwm_exit(void)
> +{
> +	unregister_key_type(&key_type_trusted);
> +}
> +
> +struct trusted_key_ops pkwm_trusted_key_ops = {
> +	.migratable = 0, /* non-migratable */
> +	.init = trusted_pkwm_init,
> +	.seal = trusted_pkwm_seal,
> +	.unseal = trusted_pkwm_unseal,
> +	.exit = trusted_pkwm_exit,
> +};


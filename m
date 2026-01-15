Return-Path: <linuxppc-dev+bounces-15868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415ED287D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 21:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsZk965llz309y;
	Fri, 16 Jan 2026 07:45:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768509921;
	cv=none; b=lYg2tdk+BZazUbmqlA8mbC5Bh5HdVCpM3OXwGiSt9OPq3VJbXxfYcnr7cCJcQ+cx5xVqI/I6uUWV1RZD7QrfKxWpHJbHml47Rc1oTHvWQEWTg20hUX1YJIsPHjjBR30mfFFFxqbdpgLsKiRNuLE6BGsCMrQUDgw8Yuos5sqPaQuTwUGs8kNcEu1OVEZVg9hSTkxWsSmFe5vL0ANCZ7J5tgN6yMxfZSffGObY+mnIXFMnhcSESarf6VoDTt5xEtrPxViAK6lXlQeD8CksXTCJ5phjurqDIyaGxoOO4urTpANF3Us7vbT7trA/454Jj9MyGf94E5nEXCAajFlasqfdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768509921; c=relaxed/relaxed;
	bh=0PMOkZbNwswkKJtImwqT66v0OFvkaSTwbfF93FawreU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoaFEih70wXhPZpErKYrv4lzObS0iQNCpwRkj35y4CtL+3xEiBmBfURiWt4VB9PO5q0M1USXgi4jqHsJ18q/tJTFUHPJVI464OzYl1b12FO8uvSqE12b+01K/7ReER28CJh319vhRfOUOqAD0pragEjQdrdMHCD4tB48leF+arMgeF94W1trwWk9jEj1irW9ScZPA3GyG+YIj/7COHtaCAKPA/JEKhuv/bQt4ECP6G6SuBJp97HSbNQvmjRwEgX6e+fWJjRqssVc+tMiam6GH0Cgs6NjyB9nJApXJmU6eb3CZR+KdjPpS6i/o7Io5s26/8b4lYaLZTuInSb75q2SZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AAgaF5Hr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AAgaF5Hr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsZk90Grzz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 07:45:20 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FGmqKN019307;
	Thu, 15 Jan 2026 20:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0PMOkZ
	bNwswkKJtImwqT66v0OFvkaSTwbfF93FawreU=; b=AAgaF5HrpIltmCF9paTjLO
	lnWmrjR+u3LFW5kK9hoyCuqHyZBLr+fRtzZc3P4b16AAC9882jy8/QD/bWg5lGvx
	csferWM6+XsjvlGfWUinI69yMchmDLTZd2rHn8InIPeLbBm3VDDTDNhT6BP9julZ
	nfHLwJYnQABr/MJJZXWx5M9eCPlvIWQb2xfb4Xn1mkI/cPW1a4okgcZCA2LXTY67
	nRH41jBVq9iYTtnwO0NsrryI012zMRqX5ow20/nrQQfnMa6kDDJk05H6mFtq0Abb
	L4sprLl2xtuKGVzo12QE3eP4+DLPRb3CIsayHgnOPM8urcpH2nmkCfifXfhDt6Ww
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6eg7ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 20:45:08 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FKhfHY028637;
	Thu, 15 Jan 2026 20:45:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6eg7aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 20:45:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FKNXeW002536;
	Thu, 15 Jan 2026 20:45:07 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm13t2j7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 20:45:07 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FKj5jW11600544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 20:45:05 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49AC658067;
	Thu, 15 Jan 2026 20:45:05 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E1B558065;
	Thu, 15 Jan 2026 20:45:04 +0000 (GMT)
Received: from [9.61.83.249] (unknown [9.61.83.249])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 20:45:04 +0000 (GMT)
Message-ID: <ef6b9315-f630-442a-b066-362a03c7bfe8@linux.ibm.com>
Date: Thu, 15 Jan 2026 15:45:04 -0500
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
Subject: Re: [PATCH v4 3/6] pseries/plpks: expose PowerVM wrapping features
 via the sysfs
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20260115100504.488665-1-ssrish@linux.ibm.com>
 <20260115100504.488665-4-ssrish@linux.ibm.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20260115100504.488665-4-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0mi4ryfsle12mS4H6NVxJOt-frP0pyY4
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=696951d4 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=iuZoUl8qdkSwtEGfI5EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OCBTYWx0ZWRfX8CpTZyqZoNmM
 2F5PSJ6R0em79TJaApREa27yKKcoCM6S5p3VlgJ4C4JK6JT/lMXkZAPRHCJUeBVkkXyMgMcAVVL
 Qdrxyceausc+0tysDf2xikf3GRYH97KnI46pBEvQZBgkfJowIr7WBc01CMRpNCO7wjnGrqDQcqJ
 nKf0A38UnFhOXxw4HsWUZF1k1TzcYRspgMXmajL5xQ/JGYJrfXehHHWJfAIVqq9wecoqwnl2yIH
 u0uKjVOJW3fYvpM1DQ+pHFwRHLJKqcuaas3Qw6wxlygxRmixO8+35Uf2BidTDcR5kFj/VDnp7B/
 JBsqGR6OvlBcuNnwDvXB36K9t5btpkWxfF917az2gr64QmgPS1Q3h1UpvNPclGQOIUtqdQwxJTf
 fZseOcdL/WTIGnVHCL89OAD4xxWx4q6LbRTTxFQ1kahH65c1fTxOTbWYJC3BWqWQLZXkE9btR+x
 ZOTR3b5BvN2juQuboGw==
X-Proofpoint-ORIG-GUID: vU3Ql7jZcxECdscT0Bu5P60B8u1zSQ1c
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
> Starting with Power11, PowerVM supports a new feature called "Key Wrapping"
> that protects user secrets by wrapping them using a hypervisor generated
> wrapping key. The status of this feature can be read by the
> H_PKS_GET_CONFIG HCALL.
>
> Expose the Power LPAR Platform KeyStore (PLPKS) wrapping features config
> via the sysfs file /sys/firmware/plpks/config/wrapping_features.
Thanks for the patch.

Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> ---
>   .../ABI/testing/sysfs-firmware-plpks          |  8 ++++++++
>   arch/powerpc/include/asm/hvcall.h             |  4 +++-
>   arch/powerpc/include/asm/plpks.h              |  3 +++
>   arch/powerpc/platforms/pseries/plpks-sysfs.c  |  2 ++
>   arch/powerpc/platforms/pseries/plpks.c        | 20 +++++++++++++++++++
>   5 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-firmware-plpks b/Documentation/ABI/testing/sysfs-firmware-plpks
> index af0353f34115..cba061e4eee2 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-plpks
> +++ b/Documentation/ABI/testing/sysfs-firmware-plpks
> @@ -48,3 +48,11 @@ Description:	Bitmask of flags indicating which algorithms the hypervisor
>   		supports for signed update of objects, represented as a 16 byte
>   		hexadecimal ASCII string. Consult the hypervisor documentation
>   		for what these flags mean.
> +
> +What:		/sys/firmware/plpks/config/wrapping_features
> +Date:		November 2025
> +Contact:	Srish Srinivasan <ssrish@linux.ibm.com>
> +Description:	Bitmask of the wrapping features indicating the wrapping
> +		algorithms that are supported for the H_PKS_WRAP_OBJECT requests
> +		, represented as a 8 byte hexadecimal ASCII string. Consult the
> +		hypervisor documentation for what these flags mean.
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 9aef16149d92..dff90a7d7f70 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -360,7 +360,9 @@
>   #define H_GUEST_RUN_VCPU	0x480
>   #define H_GUEST_COPY_MEMORY	0x484
>   #define H_GUEST_DELETE		0x488
> -#define MAX_HCALL_OPCODE	H_GUEST_DELETE
> +#define H_PKS_WRAP_OBJECT	0x490
> +#define H_PKS_UNWRAP_OBJECT	0x494
> +#define MAX_HCALL_OPCODE	H_PKS_UNWRAP_OBJECT
>   
>   /* Scope args for H_SCM_UNBIND_ALL */
>   #define H_UNBIND_SCOPE_ALL (0x1)
> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
> index 8829a13bfda0..8f034588fdf7 100644
> --- a/arch/powerpc/include/asm/plpks.h
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -23,6 +23,7 @@
>   #define PLPKS_IMMUTABLE		PPC_BIT32(5) // Once written, object cannot be removed
>   #define PLPKS_TRANSIENT		PPC_BIT32(6) // Object does not persist through reboot
>   #define PLPKS_SIGNEDUPDATE	PPC_BIT32(7) // Object can only be modified by signed updates
> +#define PLPKS_WRAPPINGKEY	PPC_BIT32(8) // Object contains a wrapping key
>   #define PLPKS_HVPROVISIONED	PPC_BIT32(28) // Hypervisor has provisioned this object
>   
>   // Signature algorithm flags from signed_update_algorithms
> @@ -103,6 +104,8 @@ u32 plpks_get_maxlargeobjectsize(void);
>   
>   u64 plpks_get_signedupdatealgorithms(void);
>   
> +u64 plpks_get_wrappingfeatures(void);
> +
>   u16 plpks_get_passwordlen(void);
>   
>   void plpks_early_init_devtree(void);
> diff --git a/arch/powerpc/platforms/pseries/plpks-sysfs.c b/arch/powerpc/platforms/pseries/plpks-sysfs.c
> index 01d526185783..c2ebcbb41ae3 100644
> --- a/arch/powerpc/platforms/pseries/plpks-sysfs.c
> +++ b/arch/powerpc/platforms/pseries/plpks-sysfs.c
> @@ -30,6 +30,7 @@ PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
>   PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
>   PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n",
>   		  plpks_get_signedupdatealgorithms);
> +PLPKS_CONFIG_ATTR(wrapping_features, "%016llx\n", plpks_get_wrappingfeatures);
>   
>   static const struct attribute *config_attrs[] = {
>   	&attr_version.attr,
> @@ -38,6 +39,7 @@ static const struct attribute *config_attrs[] = {
>   	&attr_used_space.attr,
>   	&attr_supported_policies.attr,
>   	&attr_signed_update_algorithms.attr,
> +	&attr_wrapping_features.attr,
>   	NULL,
>   };
>   
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
> index 03722fabf9c3..4a08f51537c8 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -38,6 +38,7 @@ static u32 usedspace;
>   static u32 supportedpolicies;
>   static u32 maxlargeobjectsize;
>   static u64 signedupdatealgorithms;
> +static u64 wrappingfeatures;
>   
>   struct plpks_auth {
>   	u8 version;
> @@ -248,6 +249,7 @@ static int _plpks_get_config(void)
>   		__be32 supportedpolicies;
>   		__be32 maxlargeobjectsize;
>   		__be64 signedupdatealgorithms;
> +		__be64 wrappingfeatures;
>   		u8 rsvd1[476];
>   	} __packed * config;
>   	size_t size;
> @@ -280,6 +282,7 @@ static int _plpks_get_config(void)
>   	supportedpolicies = be32_to_cpu(config->supportedpolicies);
>   	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
>   	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
> +	wrappingfeatures = be64_to_cpu(config->wrappingfeatures);
>   
>   	// Validate that the numbers we get back match the requirements of the spec
>   	if (maxpwsize < 32) {
> @@ -472,6 +475,23 @@ u64 plpks_get_signedupdatealgorithms(void)
>   	return signedupdatealgorithms;
>   }
>   
> +/**
> + * plpks_get_wrappingfeatures() - Returns a bitmask of the wrapping features
> + * supported by the hypervisor.
> + *
> + * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
> + * reads a bitmask of the wrapping features supported by the hypervisor into the
> + * file local static wrappingfeatures variable. This is valid only when the
> + * PLPKS config structure version >= 3.
> + *
> + * Return:
> + *	bitmask of the wrapping features supported by the hypervisor
> + */
> +u64 plpks_get_wrappingfeatures(void)
> +{
> +	return wrappingfeatures;
> +}
> +
>   /**
>    * plpks_get_passwordlen() - Get the length of the PLPKS password in bytes.
>    *


Return-Path: <linuxppc-dev+bounces-15290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B9CF6BA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 06:06:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlfKT2k5fz2yKr;
	Tue, 06 Jan 2026 16:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767676013;
	cv=none; b=lh0RZeqBGC6i+iC1mnwU7IlGkVIYMp8TRSvTbdSBEYAkHjvSzykTLeEQVe6n+utpjnzZfEoKbN0vOPlgmZGeA5AK3huEeRYito1apCd+KGEw4SVqEdxsm7D4iISNHc3rU1iFgM7zMBHPX5eqynGNnm95ArPD+wrdknIQfDgQLyJ5FoHnygjD2QF/ZUzTHbQLcra77+ih9Ivam1wLrMHZLSeje0IZo66YXKoXSPnKbOVY2zm9W20Wfq3Ks/sikDz1A2b+GqXp2Hq159CYtBChyB8hHwuECWOnAjof/WisJKpPaAjiKqYTeQSylAo/gHC6YXDfbshG7jFKhrCfhkueGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767676013; c=relaxed/relaxed;
	bh=S7h2+IDnxj5gHpjD+pubkFn98DZ0raW60w4hgStzi8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJHIxrmjFy0+LPkSZsFvX63ATdjnTsrTDp2fPQvhGXelZPYfOKLLvO9Ruz80wgGmqrZe975/1KUdTI3e5sYUDkBFrKw4oup9w4z1pTR+pFk9kND99GtGp/wNVxpZm7V49IjyTeXascofb1gNL8ZxvoovsRElbp6bnlA326kN/TkTdcxDel/bE6Z4adp5B6Gv+5FzxFF+dFkri2RRgctT9kA5rcM1msdmOhwoqQ5SNr3GO94pTQL+tcbAMgS0ZcHM6BtD/X7qO3qcuqiPZsqrlyKgKDVxMo4VUupO7wbrMg6q5Np6v86YzIVJ+6Ud1dE6AiEQMpkJ9KcXZ5pOHmgXUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MpFpvc/G; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MpFpvc/G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlfKR4VXzz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 16:06:51 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6064hu3F020721;
	Tue, 6 Jan 2026 05:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=S7h2+I
	Dnxj5gHpjD+pubkFn98DZ0raW60w4hgStzi8A=; b=MpFpvc/G8GZnBUmTLgulbG
	HJ77HWdBjVdM/G2ua+Aj2/ugwY7uVlee4ty9vf6SQ4bBAHtIUEAo7ADMpusEbOCF
	vUPSeauNvbolvKqftazSxvJEEWG2dRXPvF+UHC2ZBJez6EfRJxg8uOhFrVuk25ZN
	nHevY9ZNNOGR+dRHEByy/QNejnEQlW5tvJ5fj/UlyppYP+V+RgJSejTMc9mqIcUS
	S8DSNSlxHHdrQHc5oKNSMb4wfrs0YSKsgrbx1GpHqKtlUqLBRZOf9EPqBLILGL6G
	qQwXBhE0aJulewtIlTpOnbyAi7/QTgJPRmgFBkK7nRvyJ6/d58Uzi4nAK6egQ83w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu62d4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:06:38 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6064vBLH022002;
	Tue, 6 Jan 2026 05:06:37 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu62d47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:06:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6062WJ66012560;
	Tue, 6 Jan 2026 05:06:36 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bffnj9cbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:06:36 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60656Yfu31064710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 05:06:34 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F6C65805C;
	Tue,  6 Jan 2026 05:06:34 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C73F58051;
	Tue,  6 Jan 2026 05:06:30 +0000 (GMT)
Received: from [9.124.214.6] (unknown [9.124.214.6])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jan 2026 05:06:29 +0000 (GMT)
Message-ID: <ea73f55f-4906-40d4-ae25-a7bb1100ab9a@linux.ibm.com>
Date: Tue, 6 Jan 2026 10:36:28 +0530
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
Subject: Re: [PATCH v2 4/6] pseries/plpks: add HCALLs for PowerVM Key Wrapping
 Module
To: Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
 <20251217172505.112398-5-ssrish@linux.ibm.com>
 <d0d9315f3d907bd6bb172278e2746eda3482b475.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <d0d9315f3d907bd6bb172278e2746eda3482b475.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=695c985e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=koB8e8PFGBGOZsEmAvoA:9 a=ViHw82dsJJ-CUmMY:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4H0r5OgvqDD_WaDdIg-sgSbdXug1bEpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzOCBTYWx0ZWRfX6D+4oCq7Nixr
 NCeTnv4boSAGmqTWRphfCkd05iWEZImeMnyGc7uevp5EqYbUBJ4duDKze3+hYpMbSMerHrY/afK
 l5KC06TLaC6C67irWlzQhIRW+1DGRELFMx61cX+0wVBDAs3Vr0/J6jdgmx7UtYLWCvzJeAoddZs
 E6gcWgK10/9PZLUd8y17UWP6tI/a7UdFkG/BrwEHS35m/t1kASfeh/ESo8gdIkIfoXD+beEaHvI
 W9CxKoCr0+2M28GVELfPlTlXtMVGpvHM2Bd0B80j+GtS15FaYoEBnVBAq77PZNIGaeZ7fZ8CqBo
 Rw6FY/M+VJU7hkdd7TuNpmOi84cpllgrm5QrOeQmg3dZjTEDamMErIEYdRGDkzRCkeybx8sK2+C
 b4TkbjU/VqG9Lx768jcb/jDSODrulji4afw8USpAWJhfQfgwqsFFsiGNMd1PjXOeVJMVqUnNwwf
 NDP7V8IhLXSr+zBL+TQ==
X-Proofpoint-GUID: lK8WcFAvQJ1BPz8SfxhJtFQ1ImzG2GyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060038
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mimi,
thanks for taking  a look.

On 1/2/26 10:55 PM, Mimi Zohar wrote:
> Hi Srish,
>
> On Wed, 2025-12-17 at 22:55 +0530, Srish Srinivasan wrote:
>> The hypervisor generated wrapping key is an AES-GCM-256 symmetric key which
>> is stored in a non-volatile, secure, and encrypted storage called the Power
>> LPAR Platform KeyStore. It has policy based protections that prevent it
>> from being read out or exposed to the user.
>>
>> Implement H_PKS_GEN_KEY, H_PKS_WRAP_OBJECT, and H_PKS_UNWRAP_OBJECT HCALLs
>> to enable using the PowerVM Key Wrapping Module (PKWM) as a new trust
>> source for trusted keys. Disallow H_PKS_READ_OBJECT, H_PKS_SIGNED_UPDATE,
>> and H_PKS_WRITE_OBJECT for objects with the 'wrapping key' policy set.
>> Capture the availability status for the H_PKS_WRAP_OBJECT interface.
>>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> scripts/checkpatch.pl --codespell caught a couple of typos.  Please fix the
> typos here in in this patch and the one in v2 5/6.

Sure, I will fix them and send out v3.
Thanks for pointing these out.

>> ---
>>   Documentation/arch/powerpc/papr_hcalls.rst |  43 +++
>>   arch/powerpc/include/asm/plpks.h           |  10 +
>>   arch/powerpc/platforms/pseries/plpks.c     | 345 ++++++++++++++++++++-
>>   3 files changed, 396 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
>> index 805e1cb9bab9..14e39f095a1c 100644
>> --- a/Documentation/arch/powerpc/papr_hcalls.rst
>> +++ b/Documentation/arch/powerpc/papr_hcalls.rst
>> @@ -300,6 +300,49 @@ H_HTM supports setup, configuration, control and dumping of Hardware Trace
>>   Macro (HTM) function and its data. HTM buffer stores tracing data for functions
>>   like core instruction, core LLAT and nest.
>>   
>> +**H_PKS_GEN_KEY**
>> +
>> +| Input: authorization, objectlabel, objectlabellen, policy, out, outlen
>> +| Out: *Hypervisor Generated Key, or None when the wrapping key policy is set*
>> +| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
>> +                H_P3, H_P4, H_P5, H_P6, H_Authority, H_Nomem, H_Busy, H_Resource,
>> +                H_Aborted*
>> +
>> +H_PKS_GEN_KEY is used to have the hypervisor generate a new random key.
>> +This key is stored as an object in the Power LPAR Platform KeyStore with
>> +the provided object label. With the wrapping key policy set the key is only
>> +visible to the hypervisor, while the key's label would still be visible to
>> +the user. Generation of wrapping keys is supported only for a key size of
>> +32 bytes.
>> +
>> +**H_PKS_WRAP_OBJECT**
>> +
>> +| Input: authorization, wrapkeylabel, wrapkeylabellen, objectwrapflags, in,
>> +|        inlen, out, outlen, continue-token
>> +| Out: *continue-token, byte size of wrapped object, wrapped object*
>> +| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
>> +                H_P3, H_P4, H_P5, H_P6, H_P7, H_P8, H_P9, H_Authority, H_Invalid_Key,
>> +                H_NOT_FOUND, H_Busy, H_LongBusy, H_Aborted*
>> +
>> +H_PKS_WRAP_OBJECT is used to wrap an object using a wrapping key stored in the
>> +Power LPAR Platform KeyStore and return the wrapped object to the caller. The
>> +caller provides a label to a wrapping key with the 'wrapping key' policy set,
>> +which must have been previously created with H_PKS_GEN_KEY. The provided object
>> +is then encrypted with the wrapping key and additional metadata and the result
>> +is returned to the caller.
>> +
>> +
>> +**H_PKS_UNWRAP_OBJECT**
>> +
>> +| Input: authorization, objectwrapflags, in, inlen, out, outlen, continue-token
>> +| Out: *continue-token, byte size of unwrapped object, unwrapped object*
>> +| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
>> +                H_P3, H_P4, H_P5, H_P6, H_P7, H_Authority, H_Unsupported, H_Bad_Data,
>> +                H_NOT_FOUND, H_Invalid_Key, H_Busy, H_LongBusy, H_Aborted*
>> +
>> +H_PKS_UNWRAP_OBJECT is used to unwrap an object that was previously warapped with
>> +H_PKS_WRAP_OBJECT.
>> +
>>   References
>>   ==========
>>   .. [1] "Power Architecture Platform Reference"
>> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
>> index 8f034588fdf7..e87f90e40d4e 100644
>> --- a/arch/powerpc/include/asm/plpks.h
>> +++ b/arch/powerpc/include/asm/plpks.h
>> @@ -113,6 +113,16 @@ void plpks_early_init_devtree(void);
>>   int plpks_populate_fdt(void *fdt);
>>   
>>   int plpks_config_create_softlink(struct kobject *from);
>> +
>> +bool plpks_wrapping_is_supported(void);
>> +
>> +int plpks_gen_wrapping_key(void);
>> +
>> +int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
>> +		      u8 **output_buf, u32 *output_len);
>> +
>> +int plpks_unwrap_object(u8 **input_buf, u32 input_len,
>> +			u8 **output_buf, u32 *output_len);
>>   #else // CONFIG_PSERIES_PLPKS
>>   static inline bool plpks_is_available(void) { return false; }
>>   static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
>> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
>> index 4a08f51537c8..2ec04908b057 100644
>> --- a/arch/powerpc/platforms/pseries/plpks.c
>> +++ b/arch/powerpc/platforms/pseries/plpks.c
>> @@ -9,6 +9,32 @@
>>   
>>   #define pr_fmt(fmt) "plpks: " fmt
>>   
>> +#define PLPKS_WRAPKEY_COMPONENT	"PLPKSWR"
>> +#define PLPKS_WRAPKEY_NAME	"default-wrapping-key"
>> +
>> +/*
>> + * To 4K align the {input, output} buffers to the {UN}WRAP H_CALLs
>> + */
>> +#define PLPKS_WRAPPING_BUF_ALIGN	4096
>> +
>> +/*
>> + * To ensure the output buffer's length is at least 1024 bytes greater
>> + * than the input buffer's length during the WRAP H_CALL
>> + */
>> +#define PLPKS_WRAPPING_BUF_DIFF	1024
>> +
>> +#define PLPKS_WRAP_INTERFACE_BIT	3
>> +#define PLPKS_WRAPPING_KEY_LENGTH	32
>> +
>> +#define WRAPFLAG_BE_BIT_SET(be_bit) \
>> +	BIT_ULL(63 - (be_bit))
>> +
>> +#define WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo) \
>> +	GENMASK_ULL(63 - (be_bit_hi), 63 - (be_bit_lo))
>> +
>> +#define WRAPFLAG_BE_FIELD_PREP(be_bit_hi, be_bit_lo, val) \
>> +	FIELD_PREP(WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo), (val))
>> +
>>   #include <linux/delay.h>
>>   #include <linux/errno.h>
>>   #include <linux/io.h>
>> @@ -39,6 +65,7 @@ static u32 supportedpolicies;
>>   static u32 maxlargeobjectsize;
>>   static u64 signedupdatealgorithms;
>>   static u64 wrappingfeatures;
>> +static bool wrapsupport;
>>   
>>   struct plpks_auth {
>>   	u8 version;
>> @@ -283,6 +310,7 @@ static int _plpks_get_config(void)
>>   	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
>>   	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
>>   	wrappingfeatures = be64_to_cpu(config->wrappingfeatures);
>> +	wrapsupport = config->flags & PPC_BIT8(PLPKS_WRAP_INTERFACE_BIT);
>>   
>>   	// Validate that the numbers we get back match the requirements of the spec
>>   	if (maxpwsize < 32) {
>> @@ -614,6 +642,9 @@ int plpks_signed_update_var(struct plpks_var *var, u64 flags)
>>   	if (!(var->policy & PLPKS_SIGNEDUPDATE))
>>   		return -EINVAL;
>>   
>> +	if (var->policy & PLPKS_WRAPPINGKEY)
>> +		return -EINVAL;
>> +
>>   	// Signed updates need the component to be NULL.
>>   	if (var->component)
>>   		return -EINVAL;
>> @@ -696,6 +727,9 @@ int plpks_write_var(struct plpks_var var)
>>   	if (var.policy & PLPKS_SIGNEDUPDATE)
>>   		return -EINVAL;
>>   
>> +	if (var.policy & PLPKS_WRAPPINGKEY)
>> +		return -EINVAL;
>> +
>>   	auth = construct_auth(PLPKS_OS_OWNER);
>>   	if (IS_ERR(auth))
>>   		return PTR_ERR(auth);
>> @@ -790,6 +824,9 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
>>   	if (var->namelen > PLPKS_MAX_NAME_SIZE)
>>   		return -EINVAL;
>>   
>> +	if (var->policy & PLPKS_WRAPPINGKEY)
>> +		return -EINVAL;
>> +
>>   	auth = construct_auth(consumer);
>>   	if (IS_ERR(auth))
>>   		return PTR_ERR(auth);
>> @@ -845,8 +882,312 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
>>   }
>>   
>>   /**
>> - * plpks_read_os_var() - Fetch the data for the specified variable that is
>> - * owned by the OS consumer.
>> + * plpks_wrapping_is_supported() - Get the H_PKS_WRAP_OBJECT interface
>> + * availability status for the LPAR.
>> + *
>> + * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
>> + * sets bit 3 of the flags variable in the PLPKS config structure if the
>> + * H_PKS_WRAP_OBJECT interface is supported.
>> + *
>> + * Returns: true if the H_PKS_WRAP_OBJECT interface is supported, false if not.
>> + */
>> +bool plpks_wrapping_is_supported(void)
>> +{
>> +	return wrapsupport;
>> +}
>> +
>> +/**
>> + * plpks_gen_wrapping_key() - Generate a new random key with the 'wrapping key'
>> + * policy set.
>> + *
>> + * The H_PKS_GEN_KEY HCALL makes the hypervisor generate a new random key and
>> + * store the key in a PLPKS object with the provided object label. With the
>> + * 'wrapping key' policy set, only the label to the newly generated random key
>> + * would be visible to the user.
>> + *
>> + * Possible reasons for the returned errno values:
>> + *
>> + * -ENXIO	if PLPKS is not supported
>> + * -EIO		if PLPKS access is blocked due to the LPAR's state
>> + *		if PLPKS modification is blocked due to the LPAR's state
>> + *		if an error occurred while processing the request
>> + * -EINVAL	if invalid authorization parameter
>> + *		if invalid object label parameter
>> + *		if invalid object label len parameter
>> + *		if invalid or unsupported policy declaration
>> + *		if invalid output buffer parameter
>> + *		if invalid output buffer length parameter
>> + * -EPERM	if access is denied
>> + * -ENOMEM	if there is inadequate memory to perform this operation
>> + * -EBUSY	if unable to handle the request
>> + * -EEXIST	if the object label already exists
>> + *
>> + * Returns: On success 0 is returned, a negative errno if not.
>> + */
>> +int plpks_gen_wrapping_key(void)
>> +{
>> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
>> +	struct plpks_auth *auth;
>> +	struct label *label;
>> +	int rc = 0, pseries_status = 0;
>> +	struct plpks_var var = {
>> +		.name = PLPKS_WRAPKEY_NAME,
>> +		.namelen = strlen(var.name),
>> +		.policy = PLPKS_WRAPPINGKEY,
>> +		.os = PLPKS_VAR_LINUX,
>> +		.component = PLPKS_WRAPKEY_COMPONENT
>> +	};
>> +
>> +	auth = construct_auth(PLPKS_OS_OWNER);
>> +	if (IS_ERR(auth))
>> +		return PTR_ERR(auth);
>> +
>> +	label = construct_label(var.component, var.os, var.name, var.namelen);
>> +	if (IS_ERR(label)) {
>> +		rc = PTR_ERR(label);
>> +		goto out;
>> +	}
>> +
>> +	rc = plpar_hcall(H_PKS_GEN_KEY, retbuf,
>> +			 virt_to_phys(auth), virt_to_phys(label),
>> +			 label->size, var.policy,
>> +			 NULL, PLPKS_WRAPPING_KEY_LENGTH);
>> +
>> +	if (!rc)
>> +		rc = plpks_confirm_object_flushed(label, auth);
>> +
>> +	pseries_status = rc;
>> +	rc = pseries_status_to_err(rc);
>> +
>> +	if (rc && rc != -EEXIST) {
>> +		pr_err("H_PKS_GEN_KEY failed.");
>> +		pr_err("pseries_status = %d, error code = %d", pseries_status,
>> +		       rc);
>> +	} else {
>> +		rc = 0;
>> +	}
>> +
>> +	kfree(label);
>> +out:
>> +	kfree(auth);
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(plpks_gen_wrapping_key);
>> +
>> +/**
>> + * plpks_wrap_object() - Wrap an object using the default wrapping key stored in
>> + * the PLPKS.
>> + * @input_buf: buffer containing the data to be wrapped
>> + * @input_len: length of the input buffer
>> + * @wrap_flags: object wrapping flags
>> + * @output_buf: buffer to store the wrapped data
>> + * @output_len: length of the output buffer
>> + *
>> + * The H_PKS_WRAP_OBJECT HCALL wraps an object using a wrapping key stored in
>> + * the PLPKS and returns the wrapped object to the caller. The caller provides a
>> + * label to the wrapping key with the 'wrapping key' policy set that must have
>> + * been previously created with the H_PKS_GEN_KEY HCALL. The provided object is
>> + * then encrypted with the wrapping key and additional metadata and the result
>> + * is returned to the user. The metadata includes the wrapping algorithm and the
>> + * wrapping key name so those parameters are not required during unwrap.
>> + *
>> + * Possible reasons for the returned errno values:
>> + *
>> + * -ENXIO	if PLPKS is not supported
>> + * -EIO		if PLPKS access is blocked due to the LPAR's state
>> + *		if PLPKS modification is blocked due to the LPAR's state
>> + *		if an error occurred while processing the request
>> + * -EINVAL	if invalid authorization parameter
>> + *		if invalid wraping key label parameter
> -> wrapping

Noted.
Will fix this.

>
>> + *		if invalid wrapping key label length parameter
>> + *		if invalid or unsupported object wrapping flags
>> + *		if invalid inut buffer parameter
> -> input

Noted.
Will fix this.

>> + *		if invalid input buffer length parameter
>> + *		if invalid output buffer parameter
>> + *		if invalid output buffer length parameter
>> + *		if invalid continue token parameter
>> + *		if the wrapping key is not compatible with the wrapping
>> + *		algorithm
>> + * -EPERM	if access is denied
>> + * -ENOENT	if the requested wrapping key was not found
>> + * -EBUSY	if unable to handle the request or long running operation
>> + *		initiated, retry later.
>> + *
>> + * Returns: On success 0 is returned, a negative errno if not.
>> + */
>> +int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
>> +		      u8 **output_buf, u32 *output_len)
>> +{
>> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = { 0 };
>> +	struct plpks_auth *auth;
>> +	struct label *label;
>> +	u64 continuetoken = 0;
>> +	u64 objwrapflags = 0;
>> +	int rc = 0, pseries_status = 0;
>> +	bool sb_audit_or_enforce_bit = wrap_flags & BIT(0);
>> +	bool sb_enforce_bit = wrap_flags & BIT(1);
>> +	struct plpks_var var = {
>> +		.name = PLPKS_WRAPKEY_NAME,
>> +		.namelen = strlen(var.name),
>> +		.os = PLPKS_VAR_LINUX,
>> +		.component = PLPKS_WRAPKEY_COMPONENT
>> +	};
>> +
>> +	auth = construct_auth(PLPKS_OS_OWNER);
>> +	if (IS_ERR(auth))
>> +		return PTR_ERR(auth);
>> +
>> +	label = construct_label(var.component, var.os, var.name, var.namelen);
>> +	if (IS_ERR(label)) {
>> +		rc = PTR_ERR(label);
>> +		goto out;
>> +	}
>> +
>> +	/* Set the consumer password requirement bit. A must have. */
>> +	objwrapflags |= WRAPFLAG_BE_BIT_SET(3);
>> +
>> +	/* Set the wrapping algorithm bit. Just one algorithm option for now */
>> +	objwrapflags |= WRAPFLAG_BE_FIELD_PREP(60, 63, 0x1);
>> +
>> +	if (sb_audit_or_enforce_bit & sb_enforce_bit) {
>> +		pr_err("Cannot set both audit/enforce and enforce bits.");
>> +		rc = -EINVAL;
>> +		goto out_free_label;
>> +	} else if (sb_audit_or_enforce_bit) {
>> +		objwrapflags |= WRAPFLAG_BE_BIT_SET(1);
>> +	} else if (sb_enforce_bit) {
>> +		objwrapflags |= WRAPFLAG_BE_BIT_SET(2);
>> +	}
>> +
>> +	*output_len = input_len + PLPKS_WRAPPING_BUF_DIFF;
>> +
>> +	*output_buf = kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
>> +			      GFP_KERNEL);
>> +	if (!(*output_buf)) {
>> +		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
>> +		rc = -ENOMEM;
>> +		goto out_free_label;
>> +	}
>> +
>> +	do {
>> +		rc = plpar_hcall9(H_PKS_WRAP_OBJECT, retbuf,
>> +				  virt_to_phys(auth), virt_to_phys(label),
>> +				  label->size, objwrapflags,
>> +				  virt_to_phys(*input_buf), input_len,
>> +				  virt_to_phys(*output_buf), *output_len,
>> +				  continuetoken);
>> +
>> +		continuetoken = retbuf[0];
>> +		pseries_status = rc;
>> +		rc = pseries_status_to_err(rc);
>> +	} while (rc == -EBUSY);
>> +
>> +	if (rc) {
>> +		pr_err("H_PKS_WRAP_OBJECT failed.");
>> +		pr_err("pseries_status = %d, return code = %d", pseries_status,
>> +		       rc);
>> +		kfree(*output_buf);
>> +		*output_buf = NULL;
>> +	} else {
>> +		*output_len = retbuf[1];
>> +	}
>> +
>> +out_free_label:
>> +	kfree(label);
>> +out:
>> +	kfree(auth);
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(plpks_wrap_object);
>> +
>> +/**
>> + * plpks_unwrap_object() - Unwrap an object using the default wrapping key
>> + * stored in the PLPKS.
>> + * @input_buf: buffer containing the data to be unwrapped
>> + * @input_len: length of the input buffer
>> + * @output_buf: buffer to store the unwrapped data
>> + * @output_len: length of the output buffer
>> + *
>> + * The H_PKS_UNWRAP_OBJECT HCALL unwraps an object that was previously wrapped
>> + * using the H_PKS_WRAP_OBJECT HCALL.
>> + *
>> + * Possible reasons for the returned errno values:
>> + *
>> + * -ENXIO	if PLPKS is not supported
>> + * -EIO		if PLPKS access is blocked due to the LPAR's state
>> + *		if PLPKS modification is blocked due to the LPAR's state
>> + *		if an error occurred while processing the request
>> + * -EINVAL	if invalid authorization parameter
>> + *		if invalid or unsupported object unwrapping flags
>> + *		if invalid inut buffer parameter
> -> input

Noted.
Will fix this.

>
>> + *		if invalid input buffer length parameter
>> + *		if invalid output buffer parameter
>> + *		if invalid output buffer length parameter
>> + *		if invalid continue token parameter
>> + *		if the wrapping key is not compatible with the wrapping
>> + *		algorithm
>> + *		if the wrapped object's format is not supported
>> + *		if the wrapped object is invalid
>> + * -EPERM	if access is denied
>> + * -ENOENT	if the wrapping key for the provided object was not found
>> + * -EBUSY	if unable to handle the request or long running operation
>> + *		initiated, retry later.
>> + *
>> + * Returns: On success 0 is returned, a negative errno if not.
>> + */
>> +int plpks_unwrap_object(u8 **input_buf, u32 input_len, u8 **output_buf,
>> +			u32 *output_len)
>> +{
>> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = { 0 };
>> +	struct plpks_auth *auth;
>> +	u64 continuetoken = 0;
>> +	u64 objwrapflags = 0;
>> +	int rc = 0, pseries_status = 0;
>> +
>> +	auth = construct_auth(PLPKS_OS_OWNER);
>> +	if (IS_ERR(auth))
>> +		return PTR_ERR(auth);
>> +
>> +	*output_len = input_len - PLPKS_WRAPPING_BUF_DIFF;
>> +	*output_buf = kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
>> +			      GFP_KERNEL);
>> +	if (!(*output_buf)) {
>> +		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
>> +		rc = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	do {
>> +		rc = plpar_hcall9(H_PKS_UNWRAP_OBJECT, retbuf,
>> +				  virt_to_phys(auth), objwrapflags,
>> +				  virt_to_phys(*input_buf), input_len,
>> +				  virt_to_phys(*output_buf), *output_len,
>> +				  continuetoken);
>> +
>> +		continuetoken = retbuf[0];
>> +		pseries_status = rc;
>> +		rc = pseries_status_to_err(rc);
>> +	} while (rc == -EBUSY);
>> +
>> +	if (rc) {
>> +		pr_err("H_PKS_UNWRAP_OBJECT failed.");
>> +		pr_err("pseries_status = %d, return code = %d", pseries_status,
>> +		       rc);
>> +		kfree(*output_buf);
>> +		*output_buf = NULL;
>> +	} else {
>> +		*output_len = retbuf[1];
>> +	}
>> +
>> +out:
>> +	kfree(auth);
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(plpks_unwrap_object);
>> +
>> +/**
>> + * plpks_read_os_var() - Fetch the data for the specified variable that is owned
>> + * by the OS consumer.
>>    * @var: variable to be read from the PLPKS
>>    *
>>    * The consumer or the owner of the object is the os kernel. The

Thanks,
Srish.


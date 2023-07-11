Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B474EF49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:49:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+WxNINb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0gfh2cTwz3c03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+WxNINb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0gdp1QrZz30XP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:13 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BCklLR029718;
	Tue, 11 Jul 2023 12:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sdv+nX2g0tH7IRWavt/Cl+GR/UDTQqwkCstmk2Kzzf0=;
 b=h+WxNINbaqDCwY5V9fD17BvemK+ZuYmtj+m8AEFOx+QAwEfBGJh/F3A6bltvwqPuqHBo
 SclQ5dwZ6g+enTMzPhtNtF5dC63Cb7PUC8orN4CQ9miK0J/K5fhMkRKYPmA3gl7DXrGM
 7cHsgCJxzfdAfk1g2yjYdmTRYmiCJJhRcCaV4wO+SHFul0Scx7AwNVB8bllYFFF7wmyI
 56aYWPl8torTgwzrmFIn6vZzSsC6vl3P+K5pTIYZxZ0fOVdTvB8jAhHL8PV6sNK2skt0
 k8MPe3AbmFYjX0ctbYZK2A33rjjX97WCatH5o7lmUmDpLvm0iLqdchuj1ocxjvgfxMdE 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs7ctr0x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 12:47:54 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36BCllmj000539;
	Tue, 11 Jul 2023 12:47:53 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs7ctr0wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 12:47:53 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B9GTo6009352;
	Tue, 11 Jul 2023 12:47:52 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3rpye5pt4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 12:47:52 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36BClppM59965842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 12:47:51 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76B7D5804B;
	Tue, 11 Jul 2023 12:47:51 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49C1258059;
	Tue, 11 Jul 2023 12:47:50 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 12:47:50 +0000 (GMT)
Message-ID: <0fb26243-0d63-118b-2737-05391ba0c69a@linux.ibm.com>
Date: Tue, 11 Jul 2023 08:47:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] powerpc/tpm: Create linux,sml-base/size as big
 endian
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230615123703.4028156-1-mpe@ellerman.id.au>
 <4d378d53225fc8b8cdc99dde900388d2eefaad4e.camel@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <4d378d53225fc8b8cdc99dde900388d2eefaad4e.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zl0EHenGq0Rsv_AogZccBYYIiJYXiM5L
X-Proofpoint-GUID: 8rDio_9ztsvdkrLec7tE1iabzrZbRA_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_06,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110113
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
Cc: jgg@ziepe.ca, linux-integrity@vger.kernel.org, eajames@linux.ibm.com, peterhuewe@gmx.de, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/10/23 17:23, Jarkko Sakkinen wrote:
> On Thu, 2023-06-15 at 22:37 +1000, Michael Ellerman wrote:
>> There's code in prom_instantiate_sml() to do a "SML handover" (Stored
>> Measurement Log) from OF to Linux, before Linux shuts down Open
>> Firmware.
>>
>> This involves creating a buffer to hold the SML, and creating two device
>> tree properties to record its base address and size. The kernel then
>> later reads those properties from the device tree to find the SML.
>>
>> When the code was initially added in commit 4a727429abec ("PPC64: Add
>> support for instantiating SML from Open Firmware") the powerpc kernel
>> was always built big endian, so the properties were created big endian
>> by default.
>>
>> However since then little endian support was added to powerpc, and now
>> the code lacks conversions to big endian when creating the properties.
>>
>> This means on little endian kernels the device tree properties are
>> little endian, which is contrary to the device tree spec, and in
>> contrast to all other device tree properties.
>>
>> To cope with that a workaround was added in tpm_read_log_of() to skip
>> the endian conversion if the properties were created via the SML
>> handover.
>>
>> A better solution is to encode the properties as big endian as they
>> should be, and remove the workaround.
>>
>> Typically changing the encoding of a property like this would present
>> problems for kexec. However the SML is not propagated across kexec, so
>> changing the encoding of the properties is a non-issue.
>>
>> Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/prom_init.c |  8 ++++++--
>>   drivers/char/tpm/eventlog/of.c  | 23 ++++-------------------
>>   2 files changed, 10 insertions(+), 21 deletions(-)
> 
> Split into two patches (producer and consumer).

I think this wouldn't be right since it would break the system when only one patch is applied since it would be reading the fields in the wrong endianess.

     Stefan
> 
> BR, Jarkko
> 
>>
>> v2: Add Stefan's reviewed-by.
>>
>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
>> index d464ba412084..72fe306b6820 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -1900,6 +1900,7 @@ static void __init prom_instantiate_sml(void)
>>   	u32 entry = 0, size = 0, succ = 0;
>>   	u64 base;
>>   	__be32 val;
>> +	__be64 val64;
>>   
>>   	prom_debug("prom_instantiate_sml: start...\n");
>>   
>> @@ -1956,10 +1957,13 @@ static void __init prom_instantiate_sml(void)
>>   
>>   	reserve_mem(base, size);
>>   
>> +	val64 = cpu_to_be64(base);
>>   	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
>> -		     &base, sizeof(base));
>> +		     &val64, sizeof(val64));
>> +
>> +	val = cpu_to_be32(size);
>>   	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
>> -		     &size, sizeof(size));
>> +		     &val, sizeof(val));
>>   
>>   	prom_debug("sml base     = 0x%llx\n", base);
>>   	prom_debug("sml size     = 0x%x\n", size);
>> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
>> index 930fe43d5daf..0bc0cb6333c6 100644
>> --- a/drivers/char/tpm/eventlog/of.c
>> +++ b/drivers/char/tpm/eventlog/of.c
>> @@ -51,8 +51,8 @@ static int tpm_read_log_memory_region(struct tpm_chip *chip)
>>   int tpm_read_log_of(struct tpm_chip *chip)
>>   {
>>   	struct device_node *np;
>> -	const u32 *sizep;
>> -	const u64 *basep;
>> +	const __be32 *sizep;
>> +	const __be64 *basep;
>>   	struct tpm_bios_log *log;
>>   	u32 size;
>>   	u64 base;
>> @@ -73,23 +73,8 @@ int tpm_read_log_of(struct tpm_chip *chip)
>>   	if (sizep == NULL || basep == NULL)
>>   		return -EIO;
>>   
>> -	/*
>> -	 * For both vtpm/tpm, firmware has log addr and log size in big
>> -	 * endian format. But in case of vtpm, there is a method called
>> -	 * sml-handover which is run during kernel init even before
>> -	 * device tree is setup. This sml-handover function takes care
>> -	 * of endianness and writes to sml-base and sml-size in little
>> -	 * endian format. For this reason, vtpm doesn't need conversion
>> -	 * but physical tpm needs the conversion.
>> -	 */
>> -	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
>> -	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
>> -		size = be32_to_cpup((__force __be32 *)sizep);
>> -		base = be64_to_cpup((__force __be64 *)basep);
>> -	} else {
>> -		size = *sizep;
>> -		base = *basep;
>> -	}
>> +	size = be32_to_cpup(sizep);
>> +	base = be64_to_cpup(basep);
>>   
>>   	if (size == 0) {
>>   		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A3576500
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 18:02:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lkx2m1HFZz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 02:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQoMl8eY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQoMl8eY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lkx223KWQz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 02:02:01 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FFL0YF010551;
	Fri, 15 Jul 2022 16:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Nc7U3jMNz3s5relVkPSuzWGxkTEQWd++fvh2MPtZbDU=;
 b=KQoMl8eYhN6d6yRs668JUFyi3p0AiiMq0OLhbenyevAzQ1dRl1Pn2sUWq1EOyxg3GTY+
 4vkUAPlwg9vHxfY+YnChBcVItus4fUCjgMg4LnFV7wjc1f6WCKJZnOvT7XdhNwWo0624
 h6gPlUfhBhSdNzhOf3cIr4OIZHp8q4FBKMmtXQw9Oo9z0reD03HKMe1ex9mItzEqRWFR
 OfSSo5lIsKPVhkBXSvBHTfOGeG22u/a4lYMx+dzNPeSDwouOzNjbO2kWZg7icVWTTiAy
 J7rS8n3jKT6NmPVv1HrTgiEyN6SFl2XJI8igH1EN+G25O6BdpC5xtFRm9n0OR19rcZKO 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hbat68vfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 16:01:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26FFkLSm026424;
	Fri, 15 Jul 2022 16:01:40 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hbat68vf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 16:01:39 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26FFp5vB021358;
	Fri, 15 Jul 2022 16:01:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma02dal.us.ibm.com with ESMTP id 3h9am58svk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 16:01:39 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26FG1bhc35914158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Jul 2022 16:01:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B64D1136053;
	Fri, 15 Jul 2022 16:01:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F72413604F;
	Fri, 15 Jul 2022 16:01:36 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 15 Jul 2022 16:01:36 +0000 (GMT)
Message-ID: <3a9196b3-c510-0c32-8b70-572d9c4fe69d@linux.ibm.com>
Date: Fri, 15 Jul 2022 12:01:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 4/6] tpm: of: Make of-tree specific function commonly
 available
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>
References: <20220706152329.665636-1-stefanb@linux.ibm.com>
 <20220706152329.665636-5-stefanb@linux.ibm.com> <YsuTRny45aBxGjm5@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <YsuTRny45aBxGjm5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ad0o9E6xukVBHUz222-CjzD2D4HlvqOu
X-Proofpoint-ORIG-GUID: ZqRm3DHERDE5hNRQwUZcbTuvmXWwlZGl
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_08,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207150068
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/10/22 23:04, Jarkko Sakkinen wrote:
> On Wed, Jul 06, 2022 at 11:23:27AM -0400, Stefan Berger wrote:
>> Simplify tpm_read_log_of() by moving reusable parts of the code into
>> an inline function that makes it commonly available so it can be
>> used also for kexec support. Call the new of_tpm_get_sml_parameters()
>> function from the TPM Open Firmware driver.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> Cc: Jarkko Sakkinen <jarkko@kernel.org>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>>
>> ---
>> v4:
>>   - converted to inline function
>> ---
>>   drivers/char/tpm/eventlog/of.c | 31 +++++--------------------------
>>   include/linux/tpm.h            | 27 +++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
>> index a9ce66d09a75..f9462d19632e 100644
>> --- a/drivers/char/tpm/eventlog/of.c
>> +++ b/drivers/char/tpm/eventlog/of.c
>> @@ -12,6 +12,7 @@
>>   
>>   #include <linux/slab.h>
>>   #include <linux/of.h>
>> +#include <linux/tpm.h>
>>   #include <linux/tpm_eventlog.h>
>>   
>>   #include "../tpm.h"
>> @@ -20,11 +21,10 @@
>>   int tpm_read_log_of(struct tpm_chip *chip)
>>   {
>>   	struct device_node *np;
>> -	const u32 *sizep;
>> -	const u64 *basep;
>>   	struct tpm_bios_log *log;
>>   	u32 size;
>>   	u64 base;
>> +	int ret;
>>   
>>   	log = &chip->log;
>>   	if (chip->dev.parent && chip->dev.parent->of_node)
>> @@ -35,30 +35,9 @@ int tpm_read_log_of(struct tpm_chip *chip)
>>   	if (of_property_read_bool(np, "powered-while-suspended"))
>>   		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
>>   
>> -	sizep = of_get_property(np, "linux,sml-size", NULL);
>> -	basep = of_get_property(np, "linux,sml-base", NULL);
>> -	if (sizep == NULL && basep == NULL)
>> -		return -ENODEV;
>> -	if (sizep == NULL || basep == NULL)
>> -		return -EIO;
>> -
>> -	/*
>> -	 * For both vtpm/tpm, firmware has log addr and log size in big
>> -	 * endian format. But in case of vtpm, there is a method called
>> -	 * sml-handover which is run during kernel init even before
>> -	 * device tree is setup. This sml-handover function takes care
>> -	 * of endianness and writes to sml-base and sml-size in little
>> -	 * endian format. For this reason, vtpm doesn't need conversion
>> -	 * but physical tpm needs the conversion.
>> -	 */


Jarkko,

  can I apply your R-b tag after putting this lost comment back into the 
inline function?
    Stefan

>> -	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
>> -	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
>> -		size = be32_to_cpup((__force __be32 *)sizep);
>> -		base = be64_to_cpup((__force __be64 *)basep);
>> -	} else {
>> -		size = *sizep;
>> -		base = *basep;
>> -	}
>> +	ret = of_tpm_get_sml_parameters(np, &base, &size);
>> +	if (ret < 0)
>> +		return ret;
>>   
>>   	if (size == 0) {
>>   		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index dfeb25a0362d..b3dff255bc58 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -460,4 +460,31 @@ static inline struct tpm_chip *tpm_default_chip(void)
>>   	return NULL;
>>   }
>>   #endif
>> +
>> +#ifdef CONFIG_OF
>> +static inline int of_tpm_get_sml_parameters(struct device_node *np,
>> +					    u64 *base, u32 *size)
>> +{
>> +	const u32 *sizep;
>> +	const u64 *basep;
>> +
>> +	sizep = of_get_property(np, "linux,sml-size", NULL);
>> +	basep = of_get_property(np, "linux,sml-base", NULL);
>> +	if (sizep == NULL && basep == NULL)
>> +		return -ENODEV;
>> +	if (sizep == NULL || basep == NULL)
>> +		return -EIO;
>> +
>> +	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
>> +	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
>> +		*size = be32_to_cpup((__force __be32 *)sizep);
>> +		*base = be64_to_cpup((__force __be64 *)basep);
>> +	} else {
>> +		*size = *sizep;
>> +		*base = *basep;
>> +	}
>> +	return 0;
>> +}
>> +#endif
>> +
>>   #endif
>> -- 
>> 2.35.1
>>
> 
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> BR, Jarkko
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec

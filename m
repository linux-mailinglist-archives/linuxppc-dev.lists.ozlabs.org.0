Return-Path: <linuxppc-dev+bounces-8356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E0AACD9F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 21:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsSQb48Q9z304Z;
	Wed,  7 May 2025 05:00:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746558039;
	cv=none; b=m0rHWDGZi/1ahqkyAOjLrQeNdrsDzo1PaYW16QCZ82ecq40ERPqPpX7YfR2Xu/uGks29JV1/u5j7ri22kar4wXkcA/Fw8vMxmCh8OkvPbdZsKZaEZzLXFJnFQN4gThxK98NeW727AVRlrEaTkh58Pr9XsjlcfhZdF9aNo5J9K73LXrppJXHa/Tx7XktDkKqpIaHSso1HCi13GdNPB2dwTYdL95/bV3FtGc6vou4+eRza2zVUM/7UGKKan7ftkR18cWl1uBU8QfUI6ajZZSQE1muPvJJvpzftGTyun/D8b+njbsezkRrmiy9FydNav/NenfKnNkf1t6XdRMSzQ0dNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746558039; c=relaxed/relaxed;
	bh=i3vm45c5Yzthq8UV1UTQrKTGeJddui7WAzA3jzfj+fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oV8S7LlasVlUT2P0O2wk3jaJNCVr2Zl0WpZDMgasa1Ii7x/4yVkDqiQzZ52ENni/O5zgZE0mn0V+Nu7jQ5bJUd195v7OEqp0kgO3zXUSt80UJ5G/j+gDvwp1oRtb02iBzLZMF+Wi3zkkbshCbdgoLR1SkTbtTd1WH8ew8cOH3gMo4E2BNT/tU2S06O1sXE0v8m3USQ5kFV0klmau/HP2MNxW+2u5U07MDC9SzZvDpLjKsxqSU8fvSpRl5sGHvn1HE8JtZAE6EAkEb5Y9f/655dyA/6AiY1SFi03YZdt7Sv3bSXI7UDOrxVyGRb3sFNJWtKHpssdH4pTmbMfK4+tsRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJec/wvP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJec/wvP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsSQZ5254z3024
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 05:00:38 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546IYG5Y011191;
	Tue, 6 May 2025 19:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=i3vm45
	c5Yzthq8UV1UTQrKTGeJddui7WAzA3jzfj+fA=; b=TJec/wvPWeSa9bemcple4m
	nxBHX1CcWPIUZsVHnCG3UKiOUUUZ9NALwt4j3yqIpCJRjKPSnqbva2kDSMzPyywQ
	JdoxjijWbF9bstGxshOqHcYMKwXL0eje91jH7DFjsxC4tGJwMx14rijfPo7kRfNo
	WYf0ycDBnuGFXWdMacR3PBv9yzL8Dtrba878dBNjYLgDOHSrPDdhuL0yYcnN2Ys2
	QBXeTz8rlBzKQz7cW/AN4cbOHC6WnDPnN+xc509xD92Z2m/BymcLMI7+aqjUXqbG
	2IwgN1/pFEhPlUMuCHsmSC3BAiDNkPF2OOGXTiOgcu7vygm2bO2uqutIsPKrbrYQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgvsjdgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 546Iqow8010761;
	Tue, 6 May 2025 19:00:24 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgvsjdga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:24 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546Fjgq2025807;
	Tue, 6 May 2025 19:00:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwuyw0eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:23 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546J0M1211403790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 19:00:22 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A89158054;
	Tue,  6 May 2025 19:00:22 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 073BC5805C;
	Tue,  6 May 2025 19:00:14 +0000 (GMT)
Received: from [9.39.22.34] (unknown [9.39.22.34])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 19:00:13 +0000 (GMT)
Message-ID: <24ed9d66-ca87-4695-af77-a587929e3e7a@linux.ibm.com>
Date: Wed, 7 May 2025 00:30:12 +0530
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
Subject: Re: [PATCH 2/3] powerpc/secvar: Expose secvars relevant to the key
 management mode
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-3-ssrish@linux.ibm.com>
 <43baab5747031ec84100939fe154fa2b071f3789.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <43baab5747031ec84100939fe154fa2b071f3789.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=CLAqXQrD c=1 sm=1 tr=0 ts=681a5c48 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=tE8uJsxgfS_J_r_r1e0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4rAWqD3Le6JRtMTweH90HDWDFwUjlpYr
X-Proofpoint-ORIG-GUID: wleImVCZbktwx7sR-BOvIfcUNmzXNMD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3NSBTYWx0ZWRfXy//7pSs64BMD Rj09xVFw2nkYi6YyCPvYGhyQ4Eobj6aQVCH0u1QGh/Qr2LESuzgpmytJEJgFeFzJ3+rgpnx3v73 331DJM8Pd5Ijf750/VAhMfWNHgLj5cQ8DtP6+pO7HX2LNU11nd3mhZS/RZXGLPq5tORM7HxgGKm
 ZUpW6nELQB2qC6WKVuPIVyxlqKho/tHtRQdTkbU362i8bgEITK8JRl80wQyq/gI+bcdurTCE5Ci LBVuvyL4aZxDEYMFYZZaSh1KJQOVKjEv56bid/RcE/XP7x7EtZjSiLqfxiXjkGKycUMFETTGevi xEFnekF2T8JUDUUkNmeDmuXtxwZlLSAisAe/3pfek3yX4KTCNAnUIldBKaH3ADzeICQ6O2QHopO
 oBc/ZpeAe7gR50qjjqkgX7GtAyyHlOSCOnoYGPD/4V/61hcOkKSpmLcIXK96wm012aLhKiTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060175
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/5/25 12:53 PM, Andrew Donnellan wrote:
> On Wed, 2025-04-30 at 14:33 +0530, Srish Srinivasan wrote:
>> The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
>> secvars irrespective of the key management mode.
>>
>> The PowerVM LPAR supports static and dynamic key management for
>> secure
>> boot. The key management option can be updated in the management
>> console. Only in the dynamic key mode can the user modify the secure
>> boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed
>> via
>> the sysfs interface. But the sysfs interface exposes these secvars
>> even
>> in the static key mode. This could lead to errors when reading them
>> or
>> writing to them in the static key mode.
>>
>> Expose only PK, trustedcadb, and moduledb in the static key mode to
>> enable loading of signed third-party kernel modules.
>>
>> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
>> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> I'm assuming it's been determined that there's no value in letting
> userspace see db/dbx/etc in a read-only way in static mode?
>
> With one comment below:
>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Hi Andrew,
Thanks a lot for your feedback.

Yes, that is correct.
>> ---
>>   Documentation/ABI/testing/sysfs-secvar        |  9 ++++--
>>   arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++-
>> --
>>   2 files changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-secvar
>> b/Documentation/ABI/testing/sysfs-secvar
>> index 857cf12b0904..2bdc7d9c0c10 100644
>> --- a/Documentation/ABI/testing/sysfs-secvar
>> +++ b/Documentation/ABI/testing/sysfs-secvar
>> @@ -22,9 +22,12 @@ Description:	A string indicating which backend is
>> in use by the firmware.
>>   		and is expected to be "ibm,edk2-compat-v1".
>>   
>>   		On pseries/PLPKS, this is generated by the kernel
>> based on the
>> -		version number in the SB_VERSION variable in the
>> keystore, and
>> -		has the form "ibm,plpks-sb-v<version>", or
>> -		"ibm,plpks-sb-unknown" if there is no SB_VERSION
>> variable.
>> +		existence of the SB_VERSION property in firmware.
>> This string
>> +		takes the form "ibm,plpks-sb-v1" in the presence of
>> SB_VERSION,
>> +		indicating the key management mode is dynamic.
>> Otherwise it
>> +		takes the form "ibm,plpks-sb-v0" in the static key
>> management
>> +		mode. Only secvars relevant to the key management
>> mode are
>> +		exposed.
> Everything except the last sentence here is relevant to the previous
> patch in the series (noting my comments on the previous patch about the
> string).
>
> The last sentence is more related to the <variable name> entry than the
> format entry, and perhaps worth including a list of what variables are
> applicable to each mode.
Sure, will fix this.

Thanks and Regards,
Srish
>
>>   
>>   What:		/sys/firmware/secvar/vars/<variable name>
>>   Date:		August 2019
>> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c
>> b/arch/powerpc/platforms/pseries/plpks-secvar.c
>> index d57067a733ab..cbcb2c356f2a 100644
>> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
>> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
>> @@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
>>   		return PLPKS_SIGNEDUPDATE;
>>   }
>>   
>> -static const char * const plpks_var_names[] = {
>> +static const char * const plpks_var_names_static[] = {
>> +	"PK",
>> +	"moduledb",
>> +	"trustedcadb",
>> +	NULL,
>> +};
>> +
>> +static const char * const plpks_var_names_dynamic[] = {
>>   	"PK",
>>   	"KEK",
>>   	"db",
>> @@ -207,21 +214,34 @@ static int plpks_max_size(u64 *max_size)
>>   	return 0;
>>   }
>>   
>> +static const struct secvar_operations plpks_secvar_ops_static = {
>> +	.get = plpks_get_variable,
>> +	.set = plpks_set_variable,
>> +	.format = plpks_secvar_format,
>> +	.max_size = plpks_max_size,
>> +	.config_attrs = config_attrs,
>> +	.var_names = plpks_var_names_static,
>> +};
>>   
>> -static const struct secvar_operations plpks_secvar_ops = {
>> +static const struct secvar_operations plpks_secvar_ops_dynamic = {
>>   	.get = plpks_get_variable,
>>   	.set = plpks_set_variable,
>>   	.format = plpks_secvar_format,
>>   	.max_size = plpks_max_size,
>>   	.config_attrs = config_attrs,
>> -	.var_names = plpks_var_names,
>> +	.var_names = plpks_var_names_dynamic,
>>   };
>>   
>>   static int plpks_secvar_init(void)
>>   {
>> +	u8 mode;
>> +
>>   	if (!plpks_is_available())
>>   		return -ENODEV;
>>   
>> -	return set_secvar_ops(&plpks_secvar_ops);
>> +	mode = plpks_get_sb_keymgmt_mode();
>> +	if (mode)
>> +		return set_secvar_ops(&plpks_secvar_ops_dynamic);
>> +	return set_secvar_ops(&plpks_secvar_ops_static);
>>   }
>>   machine_device_initcall(pseries, plpks_secvar_init);


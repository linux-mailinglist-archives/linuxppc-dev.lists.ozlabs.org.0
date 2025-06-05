Return-Path: <linuxppc-dev+bounces-9177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB28ACF8F1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 22:49:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCxQV0bXBz2xgp;
	Fri,  6 Jun 2025 06:49:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749156578;
	cv=none; b=V7PIAIm0GK+AtyrDKNH/Ba8e5wWFMCDobN4VVSdD+ykjlssJN+xq5S9yXVUFWv6CPWC3ghdggzZvV07QM/fCPczvAAPuKlxTQI9a9Pu5jMjuRw/RTquXaMp9pR/WWIVtcsWzBRhmi4/JPTxAKSKGVFJKMJbxHfPZ1FVS45s+Txs0zrsu66aRsmDq7iDEZqmmUtpP3iMMjBCQpspA1N0kI8rBHrzSJB/PaHWua61qNYNaL0Ac1VKEt/TMYD40w0quk++2NwVlzO2XiVbZzae1Wf+BKPSkkt09ohmKGk6EvK3X8oE0TP5ns/3mbV5Xyo+gkawPPXHwlWBcloOF34nmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749156578; c=relaxed/relaxed;
	bh=iBMPUZBpDFsc6gfy03c++YYDiwHCoN78oz1YYmnfzPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1NIdLb5xT7kweh9nFA473XisYGQ+jBOefPHHUPiQnIJpYcTSck1hVmxuF2cAKHUfilbNUtlFHwmlcZNIw9A3kjr+kCFUG5ny/x1WCO/EzLc+ZwwNYBe/g7aQQo29/qmhqhozzqIf6uqYq3pf4b+bZkvamWGBCXe5f2B/633D/LJLfYKJ6bvYpGOQCeiig4M8VaovUbk8BElVj/7sIsXz1UViVhAmikmISlOGW5v8DSaIf4t1tzMK+KlOeIja/vg/0Obtm21Zto6CkyZWBpZtaWgQITg5hYqY4GFQf4WkYnBddKQgUuAI3YwDtTDcj72ZEJ9Je5Y6AcEFBOcSwKFdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ScOsjFYl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ScOsjFYl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCxQS6v0Bz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jun 2025 06:49:36 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GPosL030925;
	Thu, 5 Jun 2025 20:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iBMPUZ
	BpDFsc6gfy03c++YYDiwHCoN78oz1YYmnfzPs=; b=ScOsjFYlLX4ojzq9wu7fOB
	PziGl8xRQG7ZDzXusPec9tx6xyxhlcGc+eW23d8mBj1C0AzN0ze32GVwYVmN+WH1
	QtyzEdtU3xmhZcAHM7WNFsQ6t9vXe5/XSUViHbXVmdxp2vKcbDLR+R+Akbzx2JQT
	eJk//y9aJSfye/hhAPOxjVBilw6kJx8L8xTzXdaEgO6MKAr03o7ycxKhk860iL+3
	h64YeMs/Rr8q3FN5QUYTtG1I73F73hBeb7iGv8CY/wMVlQZIuAwnJQr+ZJ6yRdxr
	Umfi/Zl0nANxMNSmUeZvuPzdG0KE44KZeEsb1MXQAhtiJYASI2inAZGIRuiahuxg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gf032ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 20:49:21 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 555Kl6FX006954;
	Thu, 5 Jun 2025 20:49:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gf032sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 20:49:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 555KQtlC028434;
	Thu, 5 Jun 2025 20:49:20 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 470eakp9aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 20:49:20 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 555KnIQZ9306626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jun 2025 20:49:18 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E3A158056;
	Thu,  5 Jun 2025 20:49:18 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B0645803F;
	Thu,  5 Jun 2025 20:49:14 +0000 (GMT)
Received: from [9.124.215.100] (unknown [9.124.215.100])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jun 2025 20:49:14 +0000 (GMT)
Message-ID: <f4c7d9b6-38fe-452b-af8f-d18c2b506fe6@linux.ibm.com>
Date: Fri, 6 Jun 2025 02:19:12 +0530
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
Subject: Re: [PATCH v2 2/3] powerpc/secvar: Expose secvars relevant to the key
 management mode
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
 <20250521105759.8408-3-ssrish@linux.ibm.com>
 <aDATahmPIsOmiFAK@kitsune.suse.cz>
 <7dcd0f77-852b-4f4c-9842-f1d96e1d8b65@linux.ibm.com>
 <aEB3MPAYeAaFVpTc@kitsune.suse.cz>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <aEB3MPAYeAaFVpTc@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pUIT8FN7lu5-ekz5hH9QnVn6SpUS0kxz
X-Authority-Analysis: v=2.4 cv=DYMXqutW c=1 sm=1 tr=0 ts=684202d1 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=1AcIt4NcVLqilGCoAC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: N22Eis7WxtDybmoRU2gulXHpm56H0ggW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE4NSBTYWx0ZWRfXzmfK3PG1NOg0 3BqY2a6RE013zT5DGBrTHsLfC4K9AxsUvLZZHNr6JkLE1Hl1ulWPu/7csZp3lsbcdg7m/Fv1M36 2GGAc1RWCXO0KKXI4YxDYvtvPtxl7Jxt7jT/ndz1PT3JZgs387OkgNR6DxHUqCGqfqxtYxtiGwk
 +pUZoeXDAfb3gz8T8X3EkIV8vNk8WzWaVFjN13GZAyxADmWw4L11rY6pi5X/D7RuQnhe+yo/1BZ Mttj+v4/AvTWAhzPXtMRcUjgvU4l2Ql5GNH7kapvy5Zs32G9XzWm3G/wtQ/zYxds00PdLZ75G/w zXu5nyEf9+t7G+8aDWPJFPb2xygEgy5SQHJmls5xrL7AQJPTmAS6/qwYqgnmqoASNfnfWfAMfIH
 qAZYODz2biUHsSFYU9Z8ZQL0XfnXqb3je529/IwXJ99Xpr2l7ShkLdtD/Ggcw/IJReJgkFyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050185
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/4/25 10:11 PM, Michal Suchánek wrote:
> On Thu, May 29, 2025 at 10:39:58PM +0530, Srish Srinivasan wrote:
>> On 5/23/25 11:49 AM, Michal Suchánek wrote:
>>> Hello,
>>>
>>> On Wed, May 21, 2025 at 04:27:58PM +0530, Srish Srinivasan wrote:
>>>> The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
>>>> secvars irrespective of the key management mode.
>>>>
>>>> The PowerVM LPAR supports static and dynamic key management for secure
>>>> boot. The key management option can be updated in the management
>>>> console. Only in the dynamic key mode can the user modify the secure
>>>> boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed via
>>>> the sysfs interface. But the sysfs interface exposes these secvars even
>>>> in the static key mode. This could lead to errors when reading them or
>>>> writing to them in the static key mode.
>>> would it cause an error when reading these variables or only when
>>> writing them?
>>>
>>> Thanks
>>>
>>> Michal
>> Hi Michal,
>> Thanks for taking a look.
>>
>>
>> Yes, when PKS is enabled without enabling dynamic key secure boot, the
>> secvars
>> are NOT yet initialized with the default keys built into the binaries, and
>> therefore
>> reading them will result in an error.
> That suggests that 'cannot be written' as said in the documentation and
> commit message, which would imply readonly, is misleading. The value is
> not accessible at all.

Hi Michal.

Yes, this seems to be misleading.

Will address this.

>
>> Now, while in static key management mode with PKS enabled, if one tries to
>> populate secvars that are relevant to dynamic key management, the write does
>> not fail as long as the "Platform KeyStore Signed Update Infrastructure"
>> flag on
>> the HMC is enabled and the signed updates are authorized by valid PK/KEK
>> keys.
> Which suggests that some variables can if fact be written
>
>> However, secvars like db and grubdb populated while in static key management
>> mode are not used by the Partition Firmware or grub as SB_VERSION is not
>> present,
> but are not used until the key management is switched to dynamic
>
>> i.e dynamic key secure boot has not been enabled yet. In this case, when
>> there is a
>> transition from static key management to dynamic key management, secvars
>> with
>> the signed update policy bit set will not be overwritten by the hypervisor
>> with the
>> default keys. Now, if the keys written into these secvars were not the ones
>> that were
>> used to sign the grub and kernel, it would fail to verify them.
> Which is the case even for the case the system is already in dynamic key
> mode, unless the variables are append-only.

Yes, that is correct. The main intention of this patch is to not expose 
secvars that are

to be consumed only in the dynamic key management mode while in static key

management mode.


I will post v4 with the updated patch description and documentation.

> Thanks
>
> Michal
>
>> These are the reasons behind the decision to expose only those secvars that
>> are
>> relevant to the key management mode.
>>
>>>
>>>> Expose only PK, trustedcadb, and moduledb in the static key mode to
>>>> enable loading of signed third-party kernel modules.
>>>>
>>>> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
>>>> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
>>>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
>>>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>>>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>>>> Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
>>>> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
>>>> ---
>>>>    Documentation/ABI/testing/sysfs-secvar        |  6 ++++
>>>>    arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++---
>>>>    2 files changed, 30 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
>>>> index 45281888e520..948df3446a03 100644
>>>> --- a/Documentation/ABI/testing/sysfs-secvar
>>>> +++ b/Documentation/ABI/testing/sysfs-secvar
>>>> @@ -37,6 +37,12 @@ Description:	Each secure variable is represented as a directory named as
>>>>    		representation. The data and size can be determined by reading
>>>>    		their respective attribute files.
>>>> +		Only secvars relevant to the key management mode are exposed.
>>>> +		Only in the dynamic key mode can the user modify the secure boot
>>>> +		secvars db, dbx, grubdb, grubdbx, and sbat. PK, trustedcadb and
>>>> +		moduledb are the secvars common to both static and dynamic key
>>>> +		management modes.
>>>> +
>>>>    What:		/sys/firmware/secvar/vars/<variable_name>/size
>>>>    Date:		August 2019
>>>>    Contact:	Nayna Jain <nayna@linux.ibm.com>
>>>> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
>>>> index 767e5e8c6990..f9e9cc40c9d0 100644
>>>> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
>>>> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
>>>> @@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
>>>>    		return PLPKS_SIGNEDUPDATE;
>>>>    }
>>>> -static const char * const plpks_var_names[] = {
>>>> +static const char * const plpks_var_names_static[] = {
>>>> +	"PK",
>>>> +	"moduledb",
>>>> +	"trustedcadb",
>>>> +	NULL,
>>>> +};
>>>> +
>>>> +static const char * const plpks_var_names_dynamic[] = {
>>>>    	"PK",
>>>>    	"KEK",
>>>>    	"db",
>>>> @@ -213,21 +220,34 @@ static int plpks_max_size(u64 *max_size)
>>>>    	return 0;
>>>>    }
>>>> +static const struct secvar_operations plpks_secvar_ops_static = {
>>>> +	.get = plpks_get_variable,
>>>> +	.set = plpks_set_variable,
>>>> +	.format = plpks_secvar_format,
>>>> +	.max_size = plpks_max_size,
>>>> +	.config_attrs = config_attrs,
>>>> +	.var_names = plpks_var_names_static,
>>>> +};
>>>> -static const struct secvar_operations plpks_secvar_ops = {
>>>> +static const struct secvar_operations plpks_secvar_ops_dynamic = {
>>>>    	.get = plpks_get_variable,
>>>>    	.set = plpks_set_variable,
>>>>    	.format = plpks_secvar_format,
>>>>    	.max_size = plpks_max_size,
>>>>    	.config_attrs = config_attrs,
>>>> -	.var_names = plpks_var_names,
>>>> +	.var_names = plpks_var_names_dynamic,
>>>>    };
>>>>    static int plpks_secvar_init(void)
>>>>    {
>>>> +	u8 mode;
>>>> +
>>>>    	if (!plpks_is_available())
>>>>    		return -ENODEV;
>>>> -	return set_secvar_ops(&plpks_secvar_ops);
>>>> +	mode = plpks_get_sb_keymgmt_mode();
>>>> +	if (mode)
>>>> +		return set_secvar_ops(&plpks_secvar_ops_dynamic);
>>>> +	return set_secvar_ops(&plpks_secvar_ops_static);
>>>>    }
>>>>    machine_device_initcall(pseries, plpks_secvar_init);
>>>> -- 
>>>> 2.47.1
>>>>
>>>>


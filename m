Return-Path: <linuxppc-dev+bounces-8358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5653AACE00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 21:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsT1z2bHDz301N;
	Wed,  7 May 2025 05:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746559671;
	cv=none; b=ZTEn+TjAyTjMk/4bw3YcbJwAlr9kwDzZO+TPgGAZ49e+PtxBMl6J9sLtqrbLd189i6eIP8UuqYKh2fdVGkpGXdFVP6i0pR3NnJ0/7Ky1KX/VvDvl78kX4o1KNA9MZlkS8ooOWRG6BA/NXzEnrhCvCwBFt1dvGBFtaKKczcL5BMN46rQXW2A+WmwXgcyLNeYhpoQIGjAq0UAjnFkCV5WJ7bTOIBK0vcLp0AzhjuyS7vTAzz+wwSKxl5tNSQ0jCRhZdaoc4vynXyVzmCfP6FbQ2aXFaEJm1h9a78/xu6DGpTc9yOfwfVHnjkg9UTgkQE/pg6GMKMrWfjxCTDNuan7GQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746559671; c=relaxed/relaxed;
	bh=9CKr8Ln3nt2SxOfg0/UtWumQ6eO2SXY096BCvVYgX/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZRTZttDASthFOlAJRu/bflWUoLTFW6V3sQrUdjrzAI2ueVA3qi3xKHPNt8Zfchi8ODuQE9Sw8MuW5Tt67vkRBDY9fRAg/G3jqmQntnfTRPBy2xWUHgzSgaiUCUpRq2dM8mU2w6SG3ltzyZxTZw5YTI50Asb9fC0mSr6Ku9Og9/219XSkt24JGxvf+3UBGv+1YZWymtwEczUeJZ4ITm9xrmKKgsIWs1cQZT2UAAm9A94gxfGGggIQrzzqMeKG9TspaMoyj/MDpfX7KePvCDs0bXojFofQtZRwEZWe0fGH9+FG4Upr4kLU48PfjeGEEPU1zQgOusaTM41e8IiPfjeZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kakncqkO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kakncqkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsT1y3LFnz300M
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 05:27:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546B4jWd018011;
	Tue, 6 May 2025 19:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9CKr8L
	n3nt2SxOfg0/UtWumQ6eO2SXY096BCvVYgX/0=; b=kakncqkOKMEU6XYcuzsUR8
	f+H+Mw9nr30pWt7wXPEQNWq9Sf5NRMDFyDS3V87Qhio75GGa6HLrMWeV0nO0/m1E
	6NQZcO0pgZHOpGZ69s5k08xHSNZM2GEcRD7omQbpi8b3DX/mb+aX2v/rJIuKObXR
	gWAo/CuKUqFsHkXScRSMuGy1NJU1tsN8LEI+KMhpa+rrln9uIfGJ6Uz7q2dZ84iS
	d04/l/vJ1fqTF4TZcXc/6nHMkOW+AaOybqMzuHigB6zcrqG82UNQhMbnNXs+MUiv
	rzey0EVoTRhUY1vFfMRuiqFlNur0uLzxpBuA+N2S0h1UadUFZ+46P4mY8ITnmksw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46f4wkn9p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:27:37 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 546JRarT023249;
	Tue, 6 May 2025 19:27:37 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46f4wkn9nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:27:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546Hi2ao014082;
	Tue, 6 May 2025 19:27:36 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkmqn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:27:35 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546JRZ2c18022938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 19:27:35 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AAE65805A;
	Tue,  6 May 2025 19:27:35 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E7BE58051;
	Tue,  6 May 2025 19:27:34 +0000 (GMT)
Received: from [9.61.28.170] (unknown [9.61.28.170])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 19:27:34 +0000 (GMT)
Message-ID: <3fe59767-954b-4c2c-a602-9801f1c1080a@linux.ibm.com>
Date: Tue, 6 May 2025 15:27:34 -0400
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
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format representation
 for static key management
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Srish Srinivasan <ssrish@linux.ibm.com>,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-2-ssrish@linux.ibm.com>
 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Up9jN/wB c=1 sm=1 tr=0 ts=681a62a9 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=UZ5C6JHDXKJ_dhtl4DAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0cvndxHY9UJMP2VkpR2QjnVifzB51N3Z
X-Proofpoint-GUID: XxBzFcS7CkdmKszy940OiMo5s8xoMgWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE4MCBTYWx0ZWRfX46/rbUTAY6UT biEU1yq0oDcrDTH/4D4an7SnnND8aQovGaKOH3cEuwnzPKdgRlkBvyDiKU2r12wSWWBhqlBP7d4 fZhyaRJaF3b8PvG8yyDmWmt3CjuC7/wqT/rooiB4+VsDjiimlEdpQugGThn3Bp1lUZHkk/PlANv
 McbmP2OMtusaaFaVEDqr4RJWLdZb5jQ6aUxRNS1N0icYTIyXhpj3nF5iVhbaMnG0EnWXqX/IAFV dY0h6dkwrjXElwXwfsO+kz9NQXIL3niyKiEGorWav2jm0XWdLsQNnNAQImw9j6DAb7lDSjBhf0S SGLg8Wy5enTlak39o6Bb/2rcs8FocrfNDQ+OE5aPR8areetI8K1IeElgnILi6HRXRugWKmDXjfb
 0TuFq6/xuAzuXsMgflyWsj7cpJpS4qvrXyKvG/2Hygh72bQoHNbjRfKfgde0SYiLuoig/Ua1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060180
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/5/25 4:36 AM, Andrew Donnellan wrote:
> On Wed, 2025-04-30 at 14:33 +0530, Srish Srinivasan wrote:
>> On a PLPKS enabled PowerVM LPAR, the secvar format property for
>> static
>> key management is misrepresented as "ibm,plpks-sb-unknown", creating
>> reason for confusion.
>>
>> Static key management mode uses fixed, built-in keys. Dynamic key
>> management mode allows keys to be updated in production to handle
>> security updates without firmware rebuilds.
>>
>> Define a function named plpks_get_sb_keymgmt_mode() to retrieve the
>> key management mode based on the existence of the SB_VERSION property
>> in the firmware.
>>
>> Set the secvar format property to either "ibm,plpks-sb-v1" or
>> "ibm,plpks-sb-v0" based on the key management mode, and return the
>> length of the secvar format property.
>>
>> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
>> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/plpks-secvar.c | 70 +++++++++++------
>> --
>>   1 file changed, 40 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c
>> b/arch/powerpc/platforms/pseries/plpks-secvar.c
>> index 257fd1f8bc19..d57067a733ab 100644
>> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
>> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
>> @@ -152,39 +152,49 @@ static int plpks_set_variable(const char *key,
>> u64 key_len, u8 *data,
>>   	return rc;
>>   }
>>   
>> -// PLPKS dynamic secure boot doesn't give us a format string in the
>> same way OPAL does.
>> -// Instead, report the format using the SB_VERSION variable in the
>> keystore.
>> -// The string is made up by us, and takes the form "ibm,plpks-sb-
>> v<n>" (or "ibm,plpks-sb-unknown"
>> -// if the SB_VERSION variable doesn't exist). Hypervisor defines the
>> SB_VERSION variable as a
>> -// "1 byte unsigned integer value".
>> -static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
>> +/*
>> + * Return the key management mode.
>> + *
>> + * SB_VERSION is defined as a "1 byte unsigned integer value". It is
>> owned by
>> + * the Partition Firmware and its presence indicates that the key
>> management
>> + * mode is dynamic. Only signed variables have null bytes in their
>> names.
>> + * SB_VERSION does not.
>> + *
>> + * Return 1 to indicate that the key management mode is dynamic.
>> Otherwise
>> + * return 0, indicating that the key management mode is static.
>> + */
> This description isn't accurate.
>
> For dynamic mode, it doesn't return 1, it returns whatever version is
> defined in SB_VERSION, which could be 1, or could at some later point be
> a higher version.
>
> Which makes the function name a bit of a misnomer too - it is returning
> the version number, just the version number can now be zero.
>
>> +static u8 plpks_get_sb_keymgmt_mode(void)
>>   {
>> -	struct plpks_var var = {0};
>> -	ssize_t ret;
>> -	u8 version;
>> -
>> -	var.component = NULL;
>> -	// Only the signed variables have null bytes in their names,
>> this one doesn't
>> -	var.name = "SB_VERSION";
>> -	var.namelen = strlen(var.name);
>> -	var.datalen = 1;
>> -	var.data = &version;
>> -
>> -	// Unlike the other vars, SB_VERSION is owned by firmware
>> instead of the OS
>> -	ret = plpks_read_fw_var(&var);
>> -	if (ret) {
>> -		if (ret == -ENOENT) {
>> -			ret = snprintf(buf, bufsize, "ibm,plpks-sb-
>> unknown");
>> -		} else {
>> -			pr_err("Error %ld reading SB_VERSION from
>> firmware\n", ret);
>> -			ret = -EIO;
>> -		}
>> -		goto err;
>> +	u8 mode;
>> +	ssize_t rc;
>> +	struct plpks_var var = {
>> +		.component = NULL,
>> +		.name = "SB_VERSION",
>> +		.namelen = 10,
>> +		.datalen = 1,
>> +		.data = &mode,
>> +	};
>> +
>> +	rc = plpks_read_fw_var(&var);
>> +	if (rc) {
>> +		pr_info("Error %ld reading SB_VERSION from
>> firmware\n", rc);
> We need to check for -ENOENT, otherwise this message is going to be
> printed every time you boot a machine in static mode.
>
> I think you should handle this as the existing code does: if it's
> ENOENT, return 0, and for other codes print an error and return -EIO.
>
>> +		mode = 0;
>>   	}
>> +	return mode;
>> +}
>>   
>> -	ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
>> -err:
>> -	return ret;
>> +// PLPKS dynamic secure boot doesn't give us a format string in the
>> same way
>> +// OPAL does. Instead, report the format using the SB_VERSION
>> variable in the
>> +// keystore. The string, made up by us, takes the form "ibm,plpks-
>> sb-v<n>".Set
>> +// the secvar format property to either "ibm,plpks-sb-v1" or
>> "ibm,plpks-sb-v0",
>> +// based on the key management mode, and return the length of the
>> secvar format
>> +// property.
>> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
>> +{
>> +	u8 mode;
>> +
>> +	mode = plpks_get_sb_keymgmt_mode();
>> +	return snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", mode);
> It might be better to use something like "ibm,plpks-sb-static" in place
> of "ibm,plpks-sb-v0" to make it instantly clear that static mode
> doesn't use the same version numbering scheme as dynamic mode.

Yes, "ibm,plpks-sb-static" is more clear compared to "ibm,plpks-sb-v0".  
However, I am not sure why "static mode doesn't use the same version 
numbering scheme as dynamic mode". Infact, as per my understanding,  it 
is part of same versioning system. "0 represent static, 1 represent 
dynamic and anything beyond 1 would mean dynamic with additional features".

Also, wouldn't having "ibm,pkpks-sb-static" and then "ibm,pkpk-sb-v1" 
for dynamic would be bit confusing? I mean being static is clear, but 
what they relate v1 to? Or did you mean to have "ibm,plpks-sb-static" 
and "ibm,plpks-sb-dynamic"  for the two modes?

Thanks & Regards,
          - Nayna



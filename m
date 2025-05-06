Return-Path: <linuxppc-dev+bounces-8355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337C0AACD9C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 21:00:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsSQW29d8z2xfR;
	Wed,  7 May 2025 05:00:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746558035;
	cv=none; b=olBfSGBgCr9MHOg0S6tlcl3r5CVNRTnsrjFyYu3sZsa6NZQ7KcPydTK4Fo1b2mjD+NTY4r1Opb/zJ8v5EIvn0eIW0TZnA82Ebg/TiNkLGWIBqNKj25M5ECvr/WjXucI1GlWppTURKGgUQdtIlqW/SdSFNk5KbdF8SQB7jg3QdOE0SZ6GAsH3Egthumok8CxIyCP4uYsbjLKrdtDsCBIzoJoQUpf8rPENN8HarOg408hW5ra9Trc0arRRQB4wHwRruS8ayXSXMqVYKDhfdPeI7oHb5XIaBGFKrNZ3V4iwXt+HnQFu2AVT1TCgU3Jy/clF+1jla1WDxuM+lG9HWSwMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746558035; c=relaxed/relaxed;
	bh=q0MTLuMq9GJQsuaxY8CU/FZ5CU08WvQxGmpW7OCbWeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKC/QSO7ZwIPV1cXG6NROcmdUPww88j9TLrsIibIpw7TYUy/NM8K4c5ZR+uDd67jNu1nqMhv61DRPRCocTl8kJn7rkN3sWLPmKuR2uE/ShwNZblSQEJmJcVugsjZCE0gOdg75Q2J0VsgMVTyTHd9go6VHlm3oHPA+2J6wiisAEfCUHqofAcd8sUxEjrkZQl1apE9k2ZKDEVreWLF9bfoBG2M3BPcmZ+wJgCWJEGYB7rprIWFIH5mfUXQR5wzGfLpdXfUyu3neO0RNJTyU0hNH9e90NmXJAa1nU+kPxsp0lAQDGdZ+g0yivxUE/8atKpHsLWEer+OEs1q8pSCXn/4PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DLv4NxFs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DLv4NxFs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsSQT0yTyz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 05:00:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HqpUQ010209;
	Tue, 6 May 2025 19:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q0MTLu
	Mq9GJQsuaxY8CU/FZ5CU08WvQxGmpW7OCbWeo=; b=DLv4NxFsbxeVULgkfqp06g
	RbYC7ArtZx9cNgqyvOdnwyQ1B7SZFfiZDNOoPav6TgUVBbEFr/oKTpa2SlGrjgzE
	aF/GnA8BbTxIlaS5T24+4CxtpTeURFUOxjmhdDMUnKZehuLwhJ1dn/sA9p/pXIu0
	Wpm5R08s3ou6kESFrXYA/GAAIgZCGWoQHkylqrQVeDYa4wsqt+Wqu0llRdvy7iCz
	Snyw7sZToW35A6034kuK5e4IeIKffUGthiZdjBNWY5FQ16Ug9tmyJrtc31bRpCKP
	D/LqtnUGQtThSR7fPflgCo3ucwiyCgj2CUcM9rZhzFLnf1oArjO0sYKLH7kMzrRw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgbjaka1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 546J02hM004826;
	Tue, 6 May 2025 19:00:02 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgbjak9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546GO2rt002734;
	Tue, 6 May 2025 19:00:00 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnvv7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:00 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546Ixx9o30736940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 18:59:59 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54DEF5805A;
	Tue,  6 May 2025 18:59:59 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 051565805C;
	Tue,  6 May 2025 18:59:52 +0000 (GMT)
Received: from [9.39.22.34] (unknown [9.39.22.34])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 18:59:51 +0000 (GMT)
Message-ID: <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
Date: Wed, 7 May 2025 00:29:50 +0530
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
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-2-ssrish@linux.ibm.com>
 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oD1gVoxlLOwlz-tQ37K3oxNxipaz2nGU
X-Proofpoint-GUID: Qbb7VxQdaELoKldB5GBBY37Do6Vk87eE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3NSBTYWx0ZWRfX+h29MpY/uKbH Ub4jUdmEYIR7+kZKUMAC1jLkAEUXPRtLWAyd6HhvSSGMaV+T6+4ZpZsD3aCfWDmULb8bvMqFwtn 5FaaVCC+fuJTzZrOLNKDrIWIoO2HkMGpUK3jfXO3Q0H96aW3kdDYkN0tqjBmtwWyZnNUroWEBZu
 jNzqbNKqvrmS94hI0dn/DyzGbhJHeNNArcZ3/PuHOEe1AGw871puRyXhOe0AezmeJOADQCM6fc/ gwQl/8KcT1YGg+qNX0VBfk28MWug/xYRk5rgoNSY4f29JqRZrfJQjtFJ/4pJJ2viVYddv2fDDjH ErqlOzbdjV5sOr0Teq5cqz1scDEw1ASNpUUO06NUTd0rbJNsKv7lTHr/soNuGHyS/STZlfn1a5h
 m763HGQbBUc+0LkN7AedAarlaYDuhh9qG7vdZ/RwGEGQQwm6KEgdvPj3bxdk66D7LaWDKmim
X-Authority-Analysis: v=2.4 cv=FJcbx/os c=1 sm=1 tr=0 ts=681a5c32 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=1mVJ_uiqAAAA:8 a=VnNF1IyMAAAA:8 a=29poTW6gvZIBSQWbZqAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=h67g7WpEjx8dfGT80pje:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060175
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/5/25 2:06 PM, Andrew Donnellan wrote:
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
Hi Andrew,
Thanks a lot for your feedback.

Thanks for noticing this. Yes, will fix it.
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
Yes, I agree with your concern. I just want to add that, as per my 
understanding, we need to check for both -ENOENT and -EPERM,
as explained below:

As per H_PKS_READ_OBJECT semantics described in the PAPR v10.60 
(https://files.openpower.foundation/s/XFgfMaqLMD5Bcm8),

* If the object is not world readable, verify that the consumer password 
matches the stored value in the hypervisor. Else return H_AUTHORITY.
* Verify if the object exists, else return H_NOT_FOUND.
* Verify if the policy for the object is met, else return H_AUTHORITY.

So, the hypervisor returns H_NOT_FOUND only for the authenticated 
consumer. For unauthenticated consumers, which is the case here,
it would return H_AUTHORITY.
> I think you should handle this as the existing code does: if it's
> ENOENT, return 0, and for other codes print an error and return -EIO.
Currently, the other layers in the boot stack assume static key mode for 
any failure in reading SB_VERSION. We added the same interpretation
in the kernel to keep it consistent with the other layers, and represent 
the same to the user. This is the reason for not parsing the error codes
when trying to read SB_VERSION, and defaulting to the static key 
management mode. However, we want the exact error code to be logged
for debugging purposes. And, it does make sense to have logging only for 
error codes other than -ENOENT and -EPERM, as you suggested.
Does this sound okay?
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
Sure.

Thanks and Regards,
Srish
>
>>   }
>>   
>>   static int plpks_max_size(u64 *max_size)


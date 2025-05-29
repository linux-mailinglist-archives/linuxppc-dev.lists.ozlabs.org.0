Return-Path: <linuxppc-dev+bounces-9019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E68BAC81E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 19:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7YxP6l4Sz2xHY;
	Fri, 30 May 2025 03:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748541465;
	cv=none; b=iqNNjVvEImCamkuSqMy6Wo5I9R9Le6aCYqxoJQ0glcjWMq8KUdgdZjJ6LTndHKlxxbM490GrJ6DFSMJwKG9JbC2QHKHE5DpiaZT5VCUhpu8GM0Mmm0drhRKd31k5/Or7Nj1s1SBFvSTiWnNhBE15Z/bvDKvdX6UBgh2HiwErYbNvt804mxTGdRRnY1vtpUWNx29TFkMvyqZC2anbXjF7wCM5Kug5GQ53PlwnVxdsx6pMJ9fJX+uTa0rDPpBH5LqvtB4/ddnkNpFQBQYNY1JBnEM9r/fkFyL7iN1cqXFEyfLInylXwEpIgS4nQlWuOIDJ4nhzPstb59rbVgL7e6zFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748541465; c=relaxed/relaxed;
	bh=MMSPzb4oQ+h918UwB1Z3SCKlZ/8CX7OHWRXLne8aVQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs8TBnlccQnzC6ho4ureTIL2m/PcBsVd4iAJnhIP+KcMGdlOYJyAwzPUtyptwsHjXHWD+JkcrYT2lWFB1zEA1+vPe0m24P0odiUm24v8oOEOM7C4SgY8GoLFTZXIVLxr/c6rL/nz7d7N5v+p9hhnoQVhCNNK9//tKKxQytVVjonuK8ZwRSl2eDHkus8NMcc+gf/yxKa9lCvYErPIfScC90Fiy9HyEfnTxL8kbBMiQcxafInS1zPl0r0sAW2mjct5SBUD1WIQH9dQSWSAcSe3Fina5yTXUXCUUE1SMK/o34IT68V1+Tb6LhiDIJdJHmvpsg41fn1PkIANrnjVQ5AFXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AkTm4zxM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AkTm4zxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7YxN4VvXz2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 03:57:44 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TCnwuO013450;
	Thu, 29 May 2025 17:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MMSPzb
	4oQ+h918UwB1Z3SCKlZ/8CX7OHWRXLne8aVQg=; b=AkTm4zxMnMqciznNBqK1XZ
	SWfoiAjlw2KRQsjXoBOiRZGhr4kitR2pHNmknen18ZYWyCuXY/qDnws72f+EqKE6
	xKOFSFeXLzXdv4kRrOeuS3JP6rQ1uP8Fyi4zHgUM4Y+9P+hyG1MmYMMIb5J7oqM2
	LqvFvuX0sN26gaAVNtA1HQ4AepB1xHSHoHYZz4gsi2ZYCLyOwm3eOXHhN0P2wG50
	O7VEL6r3k/a7VMay3ASi+Rr0kGedEjs/Cs90MFSQehdsTNcc2HJUZbGYa7AYrpsY
	vfDRLePq+SUlM7E5JFtP+RKv6pbGrheWuRpWtq6QEdwlK4gqtvK6R4DOT9jqCinw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40h7611-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 17:57:31 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54THlPPJ031719;
	Thu, 29 May 2025 17:57:30 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40h760u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 17:57:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54THYkRY001617;
	Thu, 29 May 2025 17:57:30 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46utnmwd6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 17:57:30 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54THvSY531261230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 17:57:28 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 207BC5805C;
	Thu, 29 May 2025 17:57:28 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93AF45805A;
	Thu, 29 May 2025 17:57:24 +0000 (GMT)
Received: from [9.39.17.148] (unknown [9.39.17.148])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 May 2025 17:57:24 +0000 (GMT)
Message-ID: <fd6846dc-a2b3-42fa-9d75-8ff41b4ca531@linux.ibm.com>
Date: Thu, 29 May 2025 23:27:23 +0530
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
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
 <20250521105759.8408-2-ssrish@linux.ibm.com>
 <c06c6a36356ce803654a441d4b8b2901b5f78007.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <c06c6a36356ce803654a441d4b8b2901b5f78007.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AUXR36wK3LTPreFspGwVbMMCyC3l3qlR
X-Proofpoint-ORIG-GUID: JF3PRAuRSYXGXqu-q3qMkGojeNhW5YVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE3MCBTYWx0ZWRfX/zUGsrPo6Evh bBBOo+oIVcx0gKfOT0l5ojOttlZwLRx/5UqwttBM9UX4kugfk7u3Rrp0uSAE+3r82sx4S884GG5 ynoGN3/ZWJ0qVDLBtr1m8nW/OYvhbg0c156G4jV1nNAtpk4A0uSE5mlzHx79irIncWFMuk22VIZ
 5BFPQHBDGHLTbSk8YGtY9hgQhvDcR0Nfgns7SXeDE0JIsyXiC/Xu0RKuD4ZpfYOwiOf6/Nc+BB3 ZcDHPyywNxzNqeiS+fvvl0Wbsj9aoh1plvfRtM13HEAHURXFWD6KeVPGniWOUSDLgmFwS9dDB8O yVjowsr1AV1rnJLPcOxfs5qaxvEl1g7gLS9D8ArCtHhl2D/qeH//oAtwC0zYMn1yJoWU66/U3I9
 amIU5Z6MleGOyWGhhMB2uMy8kffw+6aVE9huX6suTqU9vzEJy2/ASNDuocSmjdl+PYBM6czE
X-Authority-Analysis: v=2.4 cv=L8MdQ/T8 c=1 sm=1 tr=0 ts=6838a00b cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=egBsNbqSnoRc1Z-rUywA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290170
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/23/25 11:27 AM, Andrew Donnellan wrote:
> On Wed, 2025-05-21 at 16:27 +0530, Srish Srinivasan wrote:
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
>> Set the secvar format property to either "ibm,plpks-sb-v<version>" or
>> "ibm,plpks-sb-v0" based on the key management mode, and return the
>> length of the secvar format property.
>>
>> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
>> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
> Thanks for the fixes, minor comment about the docs below.
>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
>
>> ---
>>   Documentation/ABI/testing/sysfs-secvar        |  9 ++-
>>   arch/powerpc/platforms/pseries/plpks-secvar.c | 76 +++++++++++------
>> --
>>   2 files changed, 52 insertions(+), 33 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-secvar
>> b/Documentation/ABI/testing/sysfs-secvar
>> index 857cf12b0904..45281888e520 100644
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
>> +		version number in the SB_VERSION variable in the
>> keystore. The
>> +		version numbering in the SB_VERSION variable starts
>> from 1. The
>> +		format string takes the form "ibm,plpks-sb-
>> v<version>" in the
>> +		case of dynamic key management mode. Otherwise, for
>> any error in
>> +		reading SB_VERSION it takes the form "ibm,plpks-sb-
>> v0",
>> +		indicating that the key management mode is static.
> This last sentence is true, but makes it sound like static mode is only
> used in case of errors.
>
> Something like:
>
> "If the SB_VERSION variable does not exist (or there is an error while
> reading it), it takes the form "ibm,plpks-sb-v0", indicating that the
> key management mode is static."
>
> might be slightly clearer?

Hi Andrew,
Sure, will take this up in v3.

Thank You.

>
>>   
>>   What:		/sys/firmware/secvar/vars/<variable name>
>>   Date:		August 2019
>> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c
>> b/arch/powerpc/platforms/pseries/plpks-secvar.c
>> index 257fd1f8bc19..767e5e8c6990 100644
>> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
>> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
>> @@ -152,39 +152,55 @@ static int plpks_set_variable(const char *key,
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
>> + * SB_VERSION is defined as a "1 byte unsigned integer value",
>> taking values
>> + * starting from 1. It is owned by the Partition Firmware and its
>> presence
>> + * indicates that the key management mode is dynamic. Any failure in
>> + * reading SB_VERSION defaults the key management mode to static.
>> The error
>> + * codes -ENOENT or -EPERM are expected in static key management
>> mode. An
>> + * unexpected error code will have to be investigated. Only signed
>> variables
>> + * have null bytes in their names, SB_VERSION does not.
>> + *
>> + * Return 0 to indicate that the key management mode is static.
>> Otherwise
>> + * return the SB_VERSION value to indicate that the key management
>> mode is
>> + * dynamic.
>> + */
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
>> +		if (rc != -ENOENT && rc != -EPERM)
>> +			pr_info("Error %ld reading SB_VERSION from
>> firmware\n", rc);
>> +		mode = 0;
>>   	}
>> +	return mode;
>> +}
>>   
>> -	ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
>> -err:
>> -	return ret;
>> +/*
>> + * PLPKS dynamic secure boot doesn't give us a format string in the
>> same way
>> + * OPAL does. Instead, report the format using the SB_VERSION
>> variable in the
>> + * keystore. The string, made up by us, takes the form of either
>> + * "ibm,plpks-sb-v<n>" or "ibm,plpks-sb-v0", based on the key
>> management mode,
>> + * and return the length of the secvar format property.
>> + */
>> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
>> +{
>> +	u8 mode;
>> +
>> +	mode = plpks_get_sb_keymgmt_mode();
>> +	return snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", mode);
>>   }
>>   
>>   static int plpks_max_size(u64 *max_size)


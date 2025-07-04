Return-Path: <linuxppc-dev+bounces-10085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E4AF8C3E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 10:43:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYRwg3MKNz30Pn;
	Fri,  4 Jul 2025 18:42:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751618579;
	cv=none; b=GzQ4ACxA+CSOwXG37sVIdHN5Wppz/Xa7qF/gTlEloHxnvcJrKtOOTgsq8mqOEZ0IqBurdaITuMwtEK/EPySCXpfJp5lcZG7EYcWgW2R919getKATq04wZouFBgHM/dmvwXcRowMbqaaD+2uSwiUkbA9pTFIMmfhkWtoCREwKQsipjAlcZ1W+uHlRnFfoFnd+oUTBiDf+bLrLsuO9uIDpkynExjp4E8vbW4yn/4hZw9N9I4isxXxH1uzX2qGaVcmxYfOYrZIYt5NMaRhTwS7vOkeAcQrqrWjEr05L+RxM+F51QETbx0lNFjwoJkAQoY+5pM6DQ9ofiuV3yGq1rqcU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751618579; c=relaxed/relaxed;
	bh=3UdQ8Dxjk4XDYNnQQ3bQvUxc58xt/mNU1w0LcNH4EvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7YxsCkk5KMae03Uxl/pRqKx8hH5/LakdrB6kqa+G62jxBittFofsQ9A8vnv8fUokZEBUDWdiH4bzFxWrjB4raXPdGFy5Oz6Fo21KWK4h/hhJzpnjU2sC5W1R9oErdhcwEcL0UwsxekEoxLBIghg/4vJT9F/Xd0M5Wz5MYW8nB8eTDWO0pd6PzgcDRsaz+5UvmH8gISjsjo+md4b4f147ux9wlK/RwKQvx5EQZRI9nORuPh43pcF1Sax4mjzI9wLyXZ7W3BcR9S9aYI3sk8UBZc/Z5PL2OfwGjJiVog19/2w6qTG9cTDWXQw43H7aG2CSoOhXqdFAEFRWChsgeFQ/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TCcWXlqc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TCcWXlqc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYRwf4BS6z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 18:42:58 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5643QCx3020597;
	Fri, 4 Jul 2025 08:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3UdQ8D
	xjk4XDYNnQQ3bQvUxc58xt/mNU1w0LcNH4EvA=; b=TCcWXlqc8GcxQktbr9NM6q
	ttXDjiepo6npGnqo4dXoc20L0cM1yZLbYtit3jH9llDNLP97qOCs3o6QvPL2H3tg
	B0PMI2tJFEAix9Z6FJ/JwnW0GERHUzpEXSNKIP7L5H5VB8eCKungDdk5TilZTi+Q
	+sy24DTHcJz/7b3sBoJb+LDjlAw7vSoYRf7Y+i1npdFY/eJjkvl5MDd1eXwbfZU3
	t/ZfBudt2FRWAi6aE4I86gm8tRX6GtvB+wxc6cuFs0iLi6siq43J25htoU5BzSML
	nDQU7sHcct2YuVgI/TcYzX7SkL/LkOQ4GuItpZxQ4WHSnOrgJHmx21Utz0fiWPyw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u287n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:42:44 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5648bLAL021704;
	Fri, 4 Jul 2025 08:42:44 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u287mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:42:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56461FKL032151;
	Fri, 4 Jul 2025 08:42:43 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju4116vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:42:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5648gdCh58327392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 08:42:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 230E82004B;
	Fri,  4 Jul 2025 08:42:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1093B20040;
	Fri,  4 Jul 2025 08:42:34 +0000 (GMT)
Received: from [9.61.253.3] (unknown [9.61.253.3])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  4 Jul 2025 08:42:33 +0000 (GMT)
Message-ID: <ea69919d-87dd-4d5c-b096-620a4050af6f@linux.ibm.com>
Date: Fri, 4 Jul 2025 14:12:30 +0530
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
Subject: Re: [PATCH v4 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, msuchanek@suse.de,
        linux-kernel@vger.kernel.org
References: <20250610211907.101384-1-ssrish@linux.ibm.com>
 <20250610211907.101384-2-ssrish@linux.ibm.com>
Content-Language: en-US
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20250610211907.101384-2-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gVgEwNCUjoQDvVkuldKTtmrvcZX4v83C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfX5VMG+ECazCKX L3bYeVBvWCDf/09q5KykN1lagxUyLzrHF2qFzzMaPa8XneKmDIX0S8jA+zzZFJfrV+23OwE3Fcz TOkwcrt3QTEqFPasMrdHn/q4idiWc1+CHqzcVSrb8ls1vA75RtTagu0Z9d9Th4YB3tPDSfQj8B1
 +R+GgR8jVLUACxnpC7Anon9ClblIuRBVTvorNH3SVZodWLIMRN7zQ6px7kt8lKfmG4uYei5YIQu OaFBJ4ZRRo3ePD+gSLE+Ui7xenx5LsBQHGRRpN4vjkwauyGXeNQUryRhGENxFTfqSJZhGFe8U7L es3NI6UUsyByHCX1t441C2w6Yb1LNRWNlgCyphVerkqIiIUy0AfnqJ/OZgu+6ugmDLpXj41TNR0
 MRpWRqDf+BkUQVti8uEsPOmTTsqlPbNSBdrJH8G8Ev1DhKG9ZkE3aNtoHFphkaD0UZ9dBfLI
X-Proofpoint-GUID: EHLgPpDBDYIi4ey7y9-9AwS7zr8TuSZc
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=68679404 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=JeGirNJSJm6n8U7jAzIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040064
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/06/25 2:49 AM, Srish Srinivasan wrote:
> On a PLPKS enabled PowerVM LPAR, the secvar format property for static
> key management is misrepresented as "ibm,plpks-sb-unknown", creating
> reason for confusion.
>
> Static key management mode uses fixed, built-in keys. Dynamic key
> management mode allows keys to be updated in production to handle
> security updates without firmware rebuilds.
>
> Define a function named plpks_get_sb_keymgmt_mode() to retrieve the
> key management mode based on the existence of the SB_VERSION property
> in the firmware.
>
> Set the secvar format property to either "ibm,plpks-sb-v<version>" or
> "ibm,plpks-sb-v0" based on the key management mode, and return the
> length of the secvar format property.
>
> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
With the following scenarios:
1. With and with out secure boot by enabling keystore_signed_updates and 
keystore_kbytes
2. With Dynamic Key Guest Secure Boot
3. With Static Key Guest Secure Boot

> ---
>   Documentation/ABI/testing/sysfs-secvar        | 10 ++-
>   arch/powerpc/platforms/pseries/plpks-secvar.c | 76 +++++++++++--------
>   2 files changed, 53 insertions(+), 33 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> index 857cf12b0904..f001a4f4bd2e 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -22,9 +22,13 @@ Description:	A string indicating which backend is in use by the firmware.
>   		and is expected to be "ibm,edk2-compat-v1".
>   
>   		On pseries/PLPKS, this is generated by the kernel based on the
> -		version number in the SB_VERSION variable in the keystore, and
> -		has the form "ibm,plpks-sb-v<version>", or
> -		"ibm,plpks-sb-unknown" if there is no SB_VERSION variable.
> +		version number in the SB_VERSION variable in the keystore. The
> +		version numbering in the SB_VERSION variable starts from 1. The
> +		format string takes the form "ibm,plpks-sb-v<version>" in the
> +		case of dynamic key management mode. If the SB_VERSION variable
> +		does not exist (or there is an error while reading it), it takes
> +		the form "ibm,plpks-sb-v0", indicating that the key management
> +		mode is static.
>   
>   What:		/sys/firmware/secvar/vars/<variable name>
>   Date:		August 2019
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> index 257fd1f8bc19..767e5e8c6990 100644
> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -152,39 +152,55 @@ static int plpks_set_variable(const char *key, u64 key_len, u8 *data,
>   	return rc;
>   }
>   
> -// PLPKS dynamic secure boot doesn't give us a format string in the same way OPAL does.
> -// Instead, report the format using the SB_VERSION variable in the keystore.
> -// The string is made up by us, and takes the form "ibm,plpks-sb-v<n>" (or "ibm,plpks-sb-unknown"
> -// if the SB_VERSION variable doesn't exist). Hypervisor defines the SB_VERSION variable as a
> -// "1 byte unsigned integer value".
> -static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +/*
> + * Return the key management mode.
> + *
> + * SB_VERSION is defined as a "1 byte unsigned integer value", taking values
> + * starting from 1. It is owned by the Partition Firmware and its presence
> + * indicates that the key management mode is dynamic. Any failure in
> + * reading SB_VERSION defaults the key management mode to static. The error
> + * codes -ENOENT or -EPERM are expected in static key management mode. An
> + * unexpected error code will have to be investigated. Only signed variables
> + * have null bytes in their names, SB_VERSION does not.
> + *
> + * Return 0 to indicate that the key management mode is static. Otherwise
> + * return the SB_VERSION value to indicate that the key management mode is
> + * dynamic.
> + */
> +static u8 plpks_get_sb_keymgmt_mode(void)
>   {
> -	struct plpks_var var = {0};
> -	ssize_t ret;
> -	u8 version;
> -
> -	var.component = NULL;
> -	// Only the signed variables have null bytes in their names, this one doesn't
> -	var.name = "SB_VERSION";
> -	var.namelen = strlen(var.name);
> -	var.datalen = 1;
> -	var.data = &version;
> -
> -	// Unlike the other vars, SB_VERSION is owned by firmware instead of the OS
> -	ret = plpks_read_fw_var(&var);
> -	if (ret) {
> -		if (ret == -ENOENT) {
> -			ret = snprintf(buf, bufsize, "ibm,plpks-sb-unknown");
> -		} else {
> -			pr_err("Error %ld reading SB_VERSION from firmware\n", ret);
> -			ret = -EIO;
> -		}
> -		goto err;
> +	u8 mode;
> +	ssize_t rc;
> +	struct plpks_var var = {
> +		.component = NULL,
> +		.name = "SB_VERSION",
> +		.namelen = 10,
> +		.datalen = 1,
> +		.data = &mode,
> +	};
> +
> +	rc = plpks_read_fw_var(&var);
> +	if (rc) {
> +		if (rc != -ENOENT && rc != -EPERM)
> +			pr_info("Error %ld reading SB_VERSION from firmware\n", rc);
> +		mode = 0;
>   	}
> +	return mode;
> +}
>   
> -	ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
> -err:
> -	return ret;
> +/*
> + * PLPKS dynamic secure boot doesn't give us a format string in the same way
> + * OPAL does. Instead, report the format using the SB_VERSION variable in the
> + * keystore. The string, made up by us, takes the form of either
> + * "ibm,plpks-sb-v<n>" or "ibm,plpks-sb-v0", based on the key management mode,
> + * and return the length of the secvar format property.
> + */
> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +{
> +	u8 mode;
> +
> +	mode = plpks_get_sb_keymgmt_mode();
> +	return snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", mode);
>   }
>   
>   static int plpks_max_size(u64 *max_size)

-- 
Thanks and Regards
R.Nageswara Sastry



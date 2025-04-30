Return-Path: <linuxppc-dev+bounces-8191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EDAA5014
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 17:22:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZngsR6SP4z2ytT;
	Thu,  1 May 2025 01:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746026539;
	cv=none; b=Xo+OUNjB7+FjSSv5WwFnif3WJ12e9LUKpO3tPQfvPtr7j/+AD4IERpRG2uZenP29KCQ00Vu1PDDX4UQn2MYe+i9qmj3TgoAPLS8Mfh4JySUbKjm11QoQnVcGugkznR76It9ZbYnEqplW02yr8uiseN7c1Ggp1fak7T1TgaWUkE1g1PYDcCiv/DfBDzAo2PonUhg/o9nMoYPMhwxKQgBfUju8QGD2cl450utAfyntQmPZeOEEn4epKMnSus3ugMx1giLxrDmqaa+T9bprUjj9hkR239rNxC0uuS8pF3mMOOqjDlMvLZTed4VpogsGBXZSsBgif4vnkepmuiUEG3t6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746026539; c=relaxed/relaxed;
	bh=ytRHOYeqjabITmUgbm/Ecbe+B/ixJIyy8ToZHTTbedY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBAjvJsJKeJistjQBpd//gdvhOc7Fs+u8s11dwnVdTItVMpUby/isex8JL0phNATwDEoAt+Gt3tzgRerLiq8IN5umatHHT3h4Rsjq1yfv5YBmsqY5MV+8Vlxv+JppMdJbAaZX+pY727w5QVEnDCuoYYMg7B3m4s4bfAPLqdcGA7jE8YNHtTZZdNNB7fEXL+Z5sMgWPRfQWWT5EbTJdXkgycq+eOk251oGQ5W4U0OgbdnydJ7vU3OuY5k3Y3OUFwTbZ4WsXHhs49HL+fYYnJDjvOxSBSSkwHG+at4b9Yo2rpineaEGhLsAvA/FwZu9fbF8Q2btTKhhe8Xp3goK42B2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbCf/M78; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbCf/M78;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZngsR0hZgz2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 01:22:18 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UA4G7X006462;
	Wed, 30 Apr 2025 15:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ytRHOY
	eqjabITmUgbm/Ecbe+B/ixJIyy8ToZHTTbedY=; b=CbCf/M78IsT8ZzF0c/KnBr
	YybWVypFPp0KeftmoxzDJTlyr+hKr0V4L4WnF0VODvA7XRkk9lzWNGIKUqufZE3i
	o/OqpW94Bm236aWuDpDVZLxLO2QKOCLEUyPhC9l6Fx7GZmdHWAQaemeNSwHjRcvZ
	vyGeDPkFSAbuJA5MFsPhT41KtELk/AtfLDcX+0Lst3dxmy/gXB0zgfGxizKrMwis
	V4oEBNFEcBLnz8sYMwv/DOsS0UAsJFmPxL2UMBuCnNSBPeQmg50euG7J+O2OTgYy
	Ig8CbTHsW+YQU4r7YouLA9grDqS+ON+7OU7fnEl8BYNVbwjzCnUrVqxfj3iR9jgw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjsh75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 15:22:07 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53UFM67k025728;
	Wed, 30 Apr 2025 15:22:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjsh72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 15:22:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53UEIcaj008494;
	Wed, 30 Apr 2025 15:22:06 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch3844t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 15:22:05 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53UFM1FY60490178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 15:22:01 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EC0658060;
	Wed, 30 Apr 2025 15:22:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4462658056;
	Wed, 30 Apr 2025 15:22:03 +0000 (GMT)
Received: from [9.61.140.105] (unknown [9.61.140.105])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 15:22:03 +0000 (GMT)
Message-ID: <f098b278-e3a9-4434-ac0b-9bdb1bdf5855@linux.ibm.com>
Date: Wed, 30 Apr 2025 11:22:02 -0400
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
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-3-ssrish@linux.ibm.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20250430090350.30023-3-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dcuA3WXe c=1 sm=1 tr=0 ts=6812401f cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=KJy4oYrYVPbNKidmU1UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: otvFdb7AGlj3ot212roM59_IncOgPEJE
X-Proofpoint-ORIG-GUID: PinrsG26jDZGBYOebqIDV4RmBD1K4kPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwNyBTYWx0ZWRfX24mZG9RR3XTC QtpZG5fg7b8kqu/sJMIegiJwIFzeV+saFGVsfkgu0ZiUIV7YshE4h6M/dELfvKuTzOE5AUC7pEO uAWtXIzbI0zpdkrAISGP99tZPuofZu8sNCTjWXEQb0+D43ss9tf21Cqxb7KNJHiIb/Tn9TTBGYt
 PTEV/ccAXnItGABn7PxyEBjHAQLwkNhtPg2t9jDAju86fDPuBelhSe08Lcpmc9XsVrIMkzN361V 4ue6VfhtDRN+YVMdt+qZsLyBlSXJ5XgNgD2/TmdLAe9+Q7bPYhx5mE5UsViIIyMRFfuAXYxsdTl mbdwn4Z4+KOiv4E/1BdqR47IM2ml1zI5TELNACrZDQfisc3NIpo/r2vlP9yMmJRGi0qK4w4NN9+
 y7nmpWIykkPhCTLbukO7bQNQArUmJgTRTpjcJIWYu+X/KmzODAbOo+GMQ2/t9A02lmFHR98n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300107
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 4/30/25 5:03 AM, Srish Srinivasan wrote:
> The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
> secvars irrespective of the key management mode.
>
> The PowerVM LPAR supports static and dynamic key management for secure
> boot. The key management option can be updated in the management
> console. Only in the dynamic key mode can the user modify the secure
> boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed via
> the sysfs interface. But the sysfs interface exposes these secvars even
> in the static key mode. This could lead to errors when reading them or
> writing to them in the static key mode.
>
> Expose only PK, trustedcadb, and moduledb in the static key mode to
> enable loading of signed third-party kernel modules.

Reviewed-by: Nayna Jain <nayna@linux.ibm.com>

Thanks & Regards,
    - Nayna

>
> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   Documentation/ABI/testing/sysfs-secvar        |  9 ++++--
>   arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++---
>   2 files changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> index 857cf12b0904..2bdc7d9c0c10 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -22,9 +22,12 @@ Description:	A string indicating which backend is in use by the firmware.
>   		and is expected to be "ibm,edk2-compat-v1".
>   
>   		On pseries/PLPKS, this is generated by the kernel based on the
> -		version number in the SB_VERSION variable in the keystore, and
> -		has the form "ibm,plpks-sb-v<version>", or
> -		"ibm,plpks-sb-unknown" if there is no SB_VERSION variable.
> +		existence of the SB_VERSION property in firmware. This string
> +		takes the form "ibm,plpks-sb-v1" in the presence of SB_VERSION,
> +		indicating the key management mode is dynamic. Otherwise it
> +		takes the form "ibm,plpks-sb-v0" in the static key management
> +		mode. Only secvars relevant to the key management mode are
> +		exposed.
>   
>   What:		/sys/firmware/secvar/vars/<variable name>
>   Date:		August 2019
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> index d57067a733ab..cbcb2c356f2a 100644
> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
>   		return PLPKS_SIGNEDUPDATE;
>   }
>   
> -static const char * const plpks_var_names[] = {
> +static const char * const plpks_var_names_static[] = {
> +	"PK",
> +	"moduledb",
> +	"trustedcadb",
> +	NULL,
> +};
> +
> +static const char * const plpks_var_names_dynamic[] = {
>   	"PK",
>   	"KEK",
>   	"db",
> @@ -207,21 +214,34 @@ static int plpks_max_size(u64 *max_size)
>   	return 0;
>   }
>   
> +static const struct secvar_operations plpks_secvar_ops_static = {
> +	.get = plpks_get_variable,
> +	.set = plpks_set_variable,
> +	.format = plpks_secvar_format,
> +	.max_size = plpks_max_size,
> +	.config_attrs = config_attrs,
> +	.var_names = plpks_var_names_static,
> +};
>   
> -static const struct secvar_operations plpks_secvar_ops = {
> +static const struct secvar_operations plpks_secvar_ops_dynamic = {
>   	.get = plpks_get_variable,
>   	.set = plpks_set_variable,
>   	.format = plpks_secvar_format,
>   	.max_size = plpks_max_size,
>   	.config_attrs = config_attrs,
> -	.var_names = plpks_var_names,
> +	.var_names = plpks_var_names_dynamic,
>   };
>   
>   static int plpks_secvar_init(void)
>   {
> +	u8 mode;
> +
>   	if (!plpks_is_available())
>   		return -ENODEV;
>   
> -	return set_secvar_ops(&plpks_secvar_ops);
> +	mode = plpks_get_sb_keymgmt_mode();
> +	if (mode)
> +		return set_secvar_ops(&plpks_secvar_ops_dynamic);
> +	return set_secvar_ops(&plpks_secvar_ops_static);
>   }
>   machine_device_initcall(pseries, plpks_secvar_init);


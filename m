Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41A77E3F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 16:42:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U6jdEwZ3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQrT449nyz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 00:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U6jdEwZ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQrRL5bqXz3cRj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 00:41:02 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GEdQj7020221;
	Wed, 16 Aug 2023 14:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1waCB4ES7jBPwgYqnxuZZXisMpuTJTeVygV2vRMlpYw=;
 b=U6jdEwZ3KUeNoBe2dRxB66dqdyMjL8waDm0XTzGJOUOPwLBu8I41OQXNYRsKm1QVT2Dg
 MMzBGcoPTix1pNJHpyvgIjulq9IYOZ/D7XMjuPWCwO7c1OVnd9D5NXjVoLylp/sX9Gv2
 /9cUJU6Z4RE/DWts0pewvDoqgfb10DJ8av98xZtk504PKdm4xMObAtqRGekCqKUUuLZp
 jJ263gdDJqbbXnTsmChM3/hDLQEjc7lI3NtqlJYLYISxXRD+eusWEvZvexpY2TbxbVWh
 hgi3Mogt5YRJAjgWxtBSTV+MNf9x4SiDFEhWvkRQga1nrW6X3NHu9fHCOyvyVWJ6I+bz 2g== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgy4utbwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:40:57 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GDjqai001107;
	Wed, 16 Aug 2023 14:40:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsydpq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:40:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GEen3g22872680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 14:40:49 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22F012004D;
	Wed, 16 Aug 2023 14:40:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6333D2004B;
	Wed, 16 Aug 2023 14:40:47 +0000 (GMT)
Received: from [9.43.32.205] (unknown [9.43.32.205])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 14:40:47 +0000 (GMT)
Message-ID: <cecf4c1d-e7be-ae64-d184-8d6f72948dff@linux.ibm.com>
Date: Wed, 16 Aug 2023 20:10:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/6] integrity: PowerVM support for loading CA keys on
 machine keyring
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org
References: <20230815112722.1591829-1-nayna@linux.ibm.com>
 <20230815112722.1591829-2-nayna@linux.ibm.com>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230815112722.1591829-2-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ywiIaqZSgUFwhM0b1c81sEw2HWQCZweR
X-Proofpoint-ORIG-GUID: ywiIaqZSgUFwhM0b1c81sEw2HWQCZweR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_14,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160125
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, inux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/08/23 4:57 pm, Nayna Jain wrote:
> Keys that derive their trust from an entity such as a security officer,
> administrator, system owner, or machine owner are said to have "imputed
> trust". CA keys with imputed trust can be loaded onto the machine keyring.
> The mechanism for loading these keys onto the machine keyring is platform
> dependent.
> 
> Load keys stored in the variable trustedcadb onto the .machine keyring
> on PowerVM platform.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>

Tested with trustedcadb, moduledb scenarios
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>


> ---
>   .../integrity/platform_certs/keyring_handler.c  |  8 ++++++++
>   .../integrity/platform_certs/keyring_handler.h  |  5 +++++
>   .../integrity/platform_certs/load_powerpc.c     | 17 +++++++++++++++++
>   3 files changed, 30 insertions(+)
> 
> diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
> index 8a1124e4d769..1649d047e3b8 100644
> --- a/security/integrity/platform_certs/keyring_handler.c
> +++ b/security/integrity/platform_certs/keyring_handler.c
> @@ -69,6 +69,14 @@ __init efi_element_handler_t get_handler_for_mok(const efi_guid_t *sig_type)
>   	return NULL;
>   }
>   
> +__init efi_element_handler_t get_handler_for_ca_keys(const efi_guid_t *sig_type)
> +{
> +	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0)
> +		return add_to_machine_keyring;
> +
> +	return NULL;
> +}
> +
>   /*
>    * Return the appropriate handler for particular signature list types found in
>    * the UEFI dbx and MokListXRT tables.
> diff --git a/security/integrity/platform_certs/keyring_handler.h b/security/integrity/platform_certs/keyring_handler.h
> index 212d894a8c0c..6f15bb4cc8dc 100644
> --- a/security/integrity/platform_certs/keyring_handler.h
> +++ b/security/integrity/platform_certs/keyring_handler.h
> @@ -29,6 +29,11 @@ efi_element_handler_t get_handler_for_db(const efi_guid_t *sig_type);
>    */
>   efi_element_handler_t get_handler_for_mok(const efi_guid_t *sig_type);
>   
> +/*
> + * Return the handler for particular signature list types for CA keys.
> + */
> +efi_element_handler_t get_handler_for_ca_keys(const efi_guid_t *sig_type);
> +
>   /*
>    * Return the handler for particular signature list types found in the dbx.
>    */
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> index 170789dc63d2..339053d9726d 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -59,6 +59,7 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
>   static int __init load_powerpc_certs(void)
>   {
>   	void *db = NULL, *dbx = NULL, *data = NULL;
> +	void *trustedca;
>   	u64 dsize = 0;
>   	u64 offset = 0;
>   	int rc = 0;
> @@ -120,6 +121,22 @@ static int __init load_powerpc_certs(void)
>   		kfree(data);
>   	}
>   
> +	data = get_cert_list("trustedcadb", 12,  &dsize);
> +	if (!data) {
> +		pr_info("Couldn't get trustedcadb list from firmware\n");
> +	} else if (IS_ERR(data)) {
> +		rc = PTR_ERR(data);
> +		pr_err("Error reading trustedcadb from firmware: %d\n", rc);
> +	} else {
> +		extract_esl(trustedca, data, dsize, offset);
> +
> +		rc = parse_efi_signature_list("powerpc:trustedca", trustedca, dsize,
> +					      get_handler_for_ca_keys);
> +		if (rc)
> +			pr_err("Couldn't parse trustedcadb signatures: %d\n", rc);
> +		kfree(data);
> +	}
> +
>   	return rc;
>   }
>   late_initcall(load_powerpc_certs);

-- 
Thanks and Regards
R.Nageswara Sastry

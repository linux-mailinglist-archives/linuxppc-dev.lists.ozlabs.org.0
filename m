Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D077E416
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 16:46:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZO5Jsb9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQrZ64f7Hz3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 00:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZO5Jsb9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQrVP6jjSz3d8x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 00:43:41 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GEYkD8009111;
	Wed, 16 Aug 2023 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eV6cfVJfXrjPrtlfw4ceYY4u5opv4sA1bvwtpNO8nAM=;
 b=sZO5Jsb9zlBtlDSl2L2yBRm1BOrpPG/NymbzPlN8RMqp/mBCKwl4aZ1ewMCiIFw/xwQE
 4oN65CV/dFvQ9zLp2tYvfNfH22QxugQrp2cbMJBa144uN3FtmntPgDlz2wKoxWlLAEs6
 ZGIqMS7WLBRjad4PVlGGYCT20kfjn8ZTTkk3g6iSscGw9LBaCSR/UfQ+fHMVlrunBLhM
 JVxAUhqLfIRG4hfdASznO9a8isKvFV7ra9102FZHnbKIz3V2TaJlxnCNWp/RfBncrQbi
 4acbpHa3nCfwn1PwF7yOS+2G35/5QCEeaKJH9TiziEj8FceN/Uj55ODkaaeYcCTU83SM 8g== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sh0bh0quc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:43:34 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GE1Oxh018848;
	Wed, 16 Aug 2023 14:42:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3seq41ms9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:42:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GEg4k953543262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 14:42:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A76E2004B;
	Wed, 16 Aug 2023 14:42:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2E8020040;
	Wed, 16 Aug 2023 14:42:02 +0000 (GMT)
Received: from [9.43.32.205] (unknown [9.43.32.205])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 14:42:02 +0000 (GMT)
Message-ID: <dc9a4271-8f26-5c2d-27e9-8a6e16abdf37@linux.ibm.com>
Date: Wed, 16 Aug 2023 20:12:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 5/6] integrity: PowerVM machine keyring enablement
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org
References: <20230815112722.1591829-1-nayna@linux.ibm.com>
 <20230815112722.1591829-6-nayna@linux.ibm.com>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230815112722.1591829-6-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R2ruOT0bP3U2etym7pfgUh_qJh_ynTK9
X-Proofpoint-ORIG-GUID: R2ruOT0bP3U2etym7pfgUh_qJh_ynTK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_14,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
> Update Kconfig to enable machine keyring and limit to CA certificates
> on PowerVM. Only key signing CA keys are allowed.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Tested with trustedcadb, moduledb scenarios
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
>   security/integrity/Kconfig | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
> index ec6e0d789da1..232191ee09e3 100644
> --- a/security/integrity/Kconfig
> +++ b/security/integrity/Kconfig
> @@ -67,7 +67,9 @@ config INTEGRITY_MACHINE_KEYRING
>   	depends on SECONDARY_TRUSTED_KEYRING
>   	depends on INTEGRITY_ASYMMETRIC_KEYS
>   	depends on SYSTEM_BLACKLIST_KEYRING
> -	depends on LOAD_UEFI_KEYS
> +	depends on LOAD_UEFI_KEYS || LOAD_PPC_KEYS
> +	select INTEGRITY_CA_MACHINE_KEYRING if LOAD_PPC_KEYS
> +	select INTEGRITY_CA_MACHINE_KEYRING_MAX if LOAD_PPC_KEYS
>   	help
>   	 If set, provide a keyring to which Machine Owner Keys (MOK) may
>   	 be added. This keyring shall contain just MOK keys.  Unlike keys

-- 
Thanks and Regards
R.Nageswara Sastry

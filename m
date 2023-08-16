Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AD77E3F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 16:43:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djSAkPZn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQrV92P8Mz3cWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 00:43:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djSAkPZn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQrRj53ksz3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 00:41:21 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GEauAu020518;
	Wed, 16 Aug 2023 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hwt6M335dyjo6zbzIVGUx0VPlgGbGHYidY3D1m/PXhE=;
 b=djSAkPZnk5y5DXh9LGpsgu4JVaR7qYWBKp1+6ok6fnm1XaMhUCnXtdgy3nazXpAMam9L
 lhTM8XY4f18gs23gsQjdXc7BMvYVqcpYnOdrK0GOPzlin4VX6S9ol1OdyE9cwTtVDLfn
 T4kqNgMOM4e0bSe8BXzvdq7DSPOCz4xwLjFmvF0DqH2hJ8R/rZs/gFFAvOYM4OMEVfi8
 nTkp1KhScOqQq8bIEAEq8GzStGZiRIVOt07Jtkogfx+uav4f05UcYTFuvK99yK5EwNq0
 u9OYHeQ4qlu1sx0oj98MU+LnzAQ3OAOgXNJpcAcx/cCGvhSW8Ck2w+BFaru1pIikWZoQ Ng== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sh08w0etg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:41:13 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GDnlDd018891;
	Wed, 16 Aug 2023 14:41:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3seq41mryp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:41:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GEf5EK13369864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 14:41:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBAF32004E;
	Wed, 16 Aug 2023 14:41:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8797120043;
	Wed, 16 Aug 2023 14:41:03 +0000 (GMT)
Received: from [9.43.32.205] (unknown [9.43.32.205])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 14:41:03 +0000 (GMT)
Message-ID: <eb595d1d-bc9f-8451-9450-cb1c4a02ce9b@linux.ibm.com>
Date: Wed, 16 Aug 2023 20:11:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/6] integrity: ignore keys failing CA restrictions on
 non-UEFI platform
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org
References: <20230815112722.1591829-1-nayna@linux.ibm.com>
 <20230815112722.1591829-3-nayna@linux.ibm.com>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230815112722.1591829-3-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: neMqKv1GXhA_NfzIvV7IfHJO_Mig-6XJ
X-Proofpoint-GUID: neMqKv1GXhA_NfzIvV7IfHJO_Mig-6XJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_14,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160125
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
> On non-UEFI platforms, handle restrict_link_by_ca failures differently.
> 
> Certificates which do not satisfy CA restrictions on non-UEFI platforms
> are ignored.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>


Tested with trustedcadb, moduledb scenarios
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
>   security/integrity/platform_certs/machine_keyring.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/integrity/platform_certs/machine_keyring.c b/security/integrity/platform_certs/machine_keyring.c
> index 7aaed7950b6e..389a6e7c9245 100644
> --- a/security/integrity/platform_certs/machine_keyring.c
> +++ b/security/integrity/platform_certs/machine_keyring.c
> @@ -36,7 +36,7 @@ void __init add_to_machine_keyring(const char *source, const void *data, size_t
>   	 * If the restriction check does not pass and the platform keyring
>   	 * is configured, try to add it into that keyring instead.
>   	 */
> -	if (rc && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
> +	if (rc && efi_enabled(EFI_BOOT) && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
>   		rc = integrity_load_cert(INTEGRITY_KEYRING_PLATFORM, source,
>   					 data, len, perm);
>   

-- 
Thanks and Regards
R.Nageswara Sastry

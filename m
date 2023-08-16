Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDD77E404
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 16:44:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WOkWZe9c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQrW714G3z3cRX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 00:44:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WOkWZe9c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQrRv51Shz3cVg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 00:41:31 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GEdUBS020303;
	Wed, 16 Aug 2023 14:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=d10kSWhL6a8/trSLqSkrLJS5o8PzuKnPfUHn1MnoOJY=;
 b=WOkWZe9c9ob2AOrf65/qQW4KGZfPTD9N9bc03NvEcePyDdgRaoaAqCRvaJIYpuW2GHnm
 dQoqjYUNJOUHrCByjec4WG6MUx3PZpM2626LHmxrMRdYvrfL/MTji3HY7i4qr6Jk5cIZ
 xNbgIyUnL1bA0HusKX94T0PZrkuO1W/mT702xagrWxqIeJ/IAolgidz9lyCar455czti
 HwWwnbSyj5QC2NZ0EgQTNYm7eUXrk/bg/vTtD1b+T0HF42HWFHGrS3ARCFgKhJ1b8eWR
 FCn/rhRPc0SuJCLigeqF0giWNSOGbaWS2iErOXSxO6Mwrcp5OPQFwDeF3fQe5S0NU5H/ Sw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgy4utdb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:41:27 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GDebFG013323;
	Wed, 16 Aug 2023 14:41:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sepmjvwn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:41:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GEfLV732834032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 14:41:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 106D52004E;
	Wed, 16 Aug 2023 14:41:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 567DB20040;
	Wed, 16 Aug 2023 14:41:19 +0000 (GMT)
Received: from [9.43.32.205] (unknown [9.43.32.205])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 14:41:19 +0000 (GMT)
Message-ID: <f72a385f-b7aa-9c73-057d-0bfb8cd413dc@linux.ibm.com>
Date: Wed, 16 Aug 2023 20:11:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/6] integrity: remove global variable from
 machine_keyring.c
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org
References: <20230815112722.1591829-1-nayna@linux.ibm.com>
 <20230815112722.1591829-4-nayna@linux.ibm.com>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230815112722.1591829-4-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6pV1pdOXkdp4yJhRbFFCWp3uGonO3NqD
X-Proofpoint-ORIG-GUID: 6pV1pdOXkdp4yJhRbFFCWp3uGonO3NqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_14,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
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
> trust_mok variable is accessed within a single function locally.
> 
> Change trust_mok from global to local static variable.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>


Tested with trustedcadb, moduledb scenarios
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
>   security/integrity/platform_certs/machine_keyring.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/integrity/platform_certs/machine_keyring.c b/security/integrity/platform_certs/machine_keyring.c
> index 389a6e7c9245..9482e16cb2ca 100644
> --- a/security/integrity/platform_certs/machine_keyring.c
> +++ b/security/integrity/platform_certs/machine_keyring.c
> @@ -8,8 +8,6 @@
>   #include <linux/efi.h>
>   #include "../integrity.h"
>   
> -static bool trust_mok;
> -
>   static __init int machine_keyring_init(void)
>   {
>   	int rc;
> @@ -65,9 +63,11 @@ static __init bool uefi_check_trust_mok_keys(void)
>   bool __init trust_moklist(void)
>   {
>   	static bool initialized;
> +	static bool trust_mok;
>   
>   	if (!initialized) {
>   		initialized = true;
> +		trust_mok = false;
>   
>   		if (uefi_check_trust_mok_keys())
>   			trust_mok = true;

-- 
Thanks and Regards
R.Nageswara Sastry

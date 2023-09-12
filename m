Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49079C44D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:40:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDKiat1y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rl8W13TK0z3cGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 13:40:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDKiat1y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rl8V50D4dz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 13:39:56 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C3VdrO032504;
	Tue, 12 Sep 2023 03:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NFU4wTwzHwHfa9+mQzTQI4YpbvlwC3kC297FAjKVUUg=;
 b=ZDKiat1y8LwzyMEyMYcler3CZrU4kc5w6ElYza9UtlwfT/zxrVgC62xkVUxscoYJqG50
 kz/D35qKpaTjVNTEyQphi5Z2mheMGP1PZnGVt+Yg5jh/+LlPRvxPgxOJfTlHUgEy8kEB
 YPI7jYoN6X778719vA8KfWGiSi0zluO8BE/pphxJqeLWng4gGc5P8H8PwVdsYemiVT3Q
 wTAPmixMGN9q4014WOSTO30Rzqn7+eLSNeqfRDkccEm37drg7Av77FYcgk7RuwnNVOai
 QaH+DU9OKOP5tA8/rZkY50YlLICD28jRq7yVZiz5FVJwgTUoXl95JHYL5OTBNc0eKOS+ 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2g5f0jnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 03:39:42 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38C3VaJ8031310;
	Tue, 12 Sep 2023 03:39:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2g5f0jnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 03:39:41 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38C3Z6lm022941;
	Tue, 12 Sep 2023 03:39:40 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141nfw1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 03:39:40 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38C3ddI825625246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 03:39:39 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6B475805A;
	Tue, 12 Sep 2023 03:39:39 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC19258051;
	Tue, 12 Sep 2023 03:39:38 +0000 (GMT)
Received: from [9.61.48.18] (unknown [9.61.48.18])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 03:39:38 +0000 (GMT)
Message-ID: <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
Date: Mon, 11 Sep 2023 23:39:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        linux-integrity@vger.kernel.org
References: <20230907165224.32256-1-msuchanek@suse.de>
 <20230907173232.GD8826@kitsune.suse.cz>
Content-Language: en-US
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <20230907173232.GD8826@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T17CezFdhedLHXke8Gyoh1jkNFmlvHOb
X-Proofpoint-ORIG-GUID: 17MJJileaVp_LAD-ypZZ54rJrf3zkS4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120027
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/7/23 13:32, Michal Suchánek wrote:
> Adding more CC's from the original patch, looks like get_maintainers is
> not that great for this file.
>
> On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
>> No other platform needs CA_MACHINE_KEYRING, either.
>>
>> This is policy that should be decided by the administrator, not Kconfig
>> dependencies.

We certainly agree that flexibility is important. However, in this case, 
this also implies that we are expecting system admins to be security 
experts. As per our understanding, CA based infrastructure(PKI) is the 
standard to be followed and not the policy decision. And we can only 
speak for Power.

INTEGRITY_CA_MACHINE_KEYRING ensures that we always have CA signed leaf 
certs.

INTEGRITY_CA_MACHINE_KEYRING_MAX ensures that CA is only allowed to do 
key signing and not code signing.

Having CA signed certs also permits easy revocation of all leaf certs.

Loading certificates is completely new for Power Systems. We would like 
to make it as clean as possible from the start. We want to enforce CA 
signed leaf certificates(INTEGRITY_CA_MACHINE_KEYRING). As per 
keyUsage(INTEGRITY_CA_MACHINE_KEYRING_MAX), if we want more flexibility, 
probably a boot time override can be considered.

Thanks & Regards,

     - Nayna


>>
>> cc: joeyli <jlee@suse.com>
>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>> ---
>>   security/integrity/Kconfig | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
>> index 232191ee09e3..b6e074ac0227 100644
>> --- a/security/integrity/Kconfig
>> +++ b/security/integrity/Kconfig
>> @@ -68,8 +68,6 @@ config INTEGRITY_MACHINE_KEYRING
>>   	depends on INTEGRITY_ASYMMETRIC_KEYS
>>   	depends on SYSTEM_BLACKLIST_KEYRING
>>   	depends on LOAD_UEFI_KEYS || LOAD_PPC_KEYS
>> -	select INTEGRITY_CA_MACHINE_KEYRING if LOAD_PPC_KEYS
>> -	select INTEGRITY_CA_MACHINE_KEYRING_MAX if LOAD_PPC_KEYS
>>   	help
>>   	 If set, provide a keyring to which Machine Owner Keys (MOK) may
>>   	 be added. This keyring shall contain just MOK keys.  Unlike keys
>> -- 
>> 2.41.0
>>

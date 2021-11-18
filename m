Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126364565C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 23:35:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwF3p73TVz3c6K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 09:35:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LtdEAQpZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LtdEAQpZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwF3233M7z2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 09:34:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIKxYo6019153; 
 Thu, 18 Nov 2021 22:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3sZP65E5byhIvz4i90BuqnvbuxB6Skk0Z/nrqSuw/UU=;
 b=LtdEAQpZQ05KH5eWVBSStMhM3evlFg17GYUOrqiEEofJjF7olEuXJDGAhK/ypIfKoOEO
 8GF6QG9C4QQR5ZNJWrVJv248tj4jW/G88iXQNnKU2SHmhKiz78/lOaH5ksQ3wznTAEW7
 k0OV5qeRSLfQY6YrEZw+TWpvjoeYbDUKOJ9TG6EnjSfn2xPRPTdjgkwYlSqmK3hG/NZD
 BfKELpL8fKNQ7oZez7ucVBq2QpCch/kfKfc6aV6QA+KOJMQQW6hZ4qW1/JtxxSGt58H5
 Hasrmk6b8pfNF0IoFg0puoGk85s41/jy9eqRxipxUZY8vKsWyTU7GSmQyY+EvYsgI3dt QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdxbvt7mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 22:34:13 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AIMNMYg013965;
 Thu, 18 Nov 2021 22:34:13 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdxbvt7m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 22:34:12 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AIMR5mD011651;
 Thu, 18 Nov 2021 22:34:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3ca50cfmfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 22:34:11 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AIMY7FK36241826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 22:34:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34C12AC089;
 Thu, 18 Nov 2021 22:34:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7D03AC06C;
 Thu, 18 Nov 2021 22:34:02 +0000 (GMT)
Received: from [9.211.61.197] (unknown [9.211.61.197])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 18 Nov 2021 22:34:02 +0000 (GMT)
Message-ID: <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
Date: Thu, 18 Nov 2021 17:34:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
 <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
 <20211112083055.GA34414@kunlun.suse.cz>
 <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
 <20211116095343.GG34414@kunlun.suse.cz>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <20211116095343.GG34414@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x398kgBnLb2ZNX7NPbVzUTEXr0d2VD96
X-Proofpoint-GUID: G_o52HHXc1RIsRhcs9H375AtA3LqBl1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180115
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 buendgen@de.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/16/21 04:53, Michal Suchánek wrote:
> On Mon, Nov 15, 2021 at 06:53:53PM -0500, Nayna wrote:
>> On 11/12/21 03:30, Michal Suchánek wrote:
>>> Hello,
>>>
>>> On Thu, Nov 11, 2021 at 05:26:41PM -0500, Nayna wrote:
>>>> On 11/8/21 07:05, Michal Suchánek wrote:
>>>>> Hello,
>>>>>
>>>>> The other part is that distributions apply 'lockdown' patches that change
>>>>> the security policy depending on secure boot status which were rejected
>>>>> by upstream which only hook into the _SIG options, and not into the IMA_
>>>>> options. Of course, I expect this to change when the IMA options are
>>>>> universally available across architectures and the support picked up by
>>>>> distributions.
>>>>>
>>>>> Which brings the third point: IMA features vary across architectures,
>>>>> and KEXEC_SIG is more common than IMA_KEXEC.
>>>>>
>>>>> config/arm64/default:CONFIG_HAVE_IMA_KEXEC=y
>>>>> config/ppc64le/default:CONFIG_HAVE_IMA_KEXEC=y
>>>>>
>>>>> config/arm64/default:CONFIG_KEXEC_SIG=y
>>>>> config/s390x/default:CONFIG_KEXEC_SIG=y
>>>>> config/x86_64/default:CONFIG_KEXEC_SIG=y
>>>>>
>>>>> KEXEC_SIG makes it much easier to get uniform features across
>>>>> architectures.
>>>> Architectures use KEXEC_SIG vs IMA_KEXEC based on their requirement.
>>>> IMA_KEXEC is for the kernel images signed using sign-file (appended
>>>> signatures, not PECOFF), provides measurement along with verification, and
>>> That's certainly not the case. S390 uses appended signatures with
>>> KEXEC_SIG, arm64 uses PECOFF with both KEXEC_SIG and IMA_KEXEC.
>> Yes, S390 uses appended signature, but they also do not support
>> measurements.
>>
>> On the other hand for arm64/x86, PECOFF works only with KEXEC_SIG. Look at
>> the KEXEC_IMAGE_VERIFY_SIG config dependencies in arch/arm64/Kconfig and
>> KEXEC_BZIMAGE_VERIFY_SIG config dependencies in arch/x86/Kconfig. Now, if
>> KEXEC_SIG is not enabled, then IMA appraisal policies are enforced if secure
>> boot is enabled, refer to security/integrity/ima_efi.c . IMA would fail
>> verification if kernel is not signed with module sig appended signatures or
>> signature verification fails.
>>
>> In short, IMA is used to enforce the existence of a policy if secure boot is
>> enabled. If they don't support module sig appended signatures, by definition
>> it fails. Thus PECOFF doesn't work with both KEXEC_SIG and IMA_KEXEC, but
>> only with KEXEC_SIG.
> Then IMA_KEXEC is a no-go. It is not supported on all architectures and
> it principially cannot be supported because it does not support PECOFF
> which is needed to boot the kernel on EFI platforms. To get feature
> parity across architectures KEXEC_SIG is required.

I would not say "a no-go", it is based on user requirements.

The key takeaway from this discussion is that both KEXEC_SIG and 
IMA_KEXEC support functionality with some small degree of overlap, and 
that documenting the differences is needed.  This will help kernel 
consumers to understand the difference and enable the appropriate 
functionality for their environment.

As per my understanding:

KEXEC_SIG:
* Supports kernel image verification
* Linked with secureboot state using downstream patch
* Supports PECOFF and module sig appended signature format
* Supports blocklisting of keys

IMA_KEXEC:
* Supports kernel image verification
* Linked with secureboot state in upstream
* Supports module sig appended signature format and signatures in 
extended attribute.
* Supports blocklisting of keys
* Supports blocklisting single kernel binary
* Supports measurements for attestation
* Supports audit log

Users can enable the option based on their requirements.

Thanks for the good discussion and enabling KEXEC_SIG for POWER as well. 
It would be good to have updated kernel documentation to go along with 
KEXEC_SIG support in the patchset.

Thanks & Regards,
     - Nayna


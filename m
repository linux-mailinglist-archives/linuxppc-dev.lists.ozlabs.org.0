Return-Path: <linuxppc-dev+bounces-15291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD934CF6BD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 06:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlfP81GqRz2yKr;
	Tue, 06 Jan 2026 16:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767676204;
	cv=none; b=BZlrKIPpZJwHV4u7hh54cAEgPiV2s1R94jo3LZsUQoskEw20QrttLPitXeBL0/oU61FhHf0bnRZ0XGyWFV5lZ4ObWNGw3LYceNcceLdmpSKJURFJYLjtzu8on0rKh4dJN1yiiAIUSNU8nkFCTIfOYS1mvkzuwQNWYHFfgcJgGpmwGtPB1nOXd/D2Ob1Pzaoucw5AlrZ721vNP8B6GKhuoiVL9fFxUTuEaKVXE/3Wxwn/4O8KY4WOFalhaKR/RaHcccrifRbC+F0M6qfi1WJE3ed5ksTa/UEy6SHsUBwks+odEh4vtYvJvHro3uh2j5IOH1FVE5lSa6vGcPJ6UXiA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767676204; c=relaxed/relaxed;
	bh=+kaidPU2r9UG5d+cT39AxQa40CxkXVRvwfc0y61s5NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGqmOtXJJrksuGV4MqWtI4/gUR3S0fCfBgiH1D/H2h4YPlx7X1theaAfN6EN0eIszXfdaa9kMtyterwD4hdUncXeqIEnXwl1mkeD8Zu5chro9vaqtWH4uGPB3RdpiLRpyk0kuZhdZMjTT6VhE045khEvUf+H3q7cAFItHT+y9ceajKfmlT+NWSMwCYgZ6FQYHeHQdT0snevZJQo4lyRFNMZf+YHlcsX6R4OMQEQ5PzlW2rxbUHkf4h5It26rIn/mkIMFjiNFgLeAeNwzsLlnX3G2NQEKgi2m6SrDBS4yu5ZLm606zMZknOg36jJeH5Q0O7WNc8+4BcwAG5AYolUV5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pL6YUpXz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pL6YUpXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlfP72Fvqz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 16:10:03 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 605EhWbe014268;
	Tue, 6 Jan 2026 05:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+kaidP
	U2r9UG5d+cT39AxQa40CxkXVRvwfc0y61s5NY=; b=pL6YUpXzSa0p3Q4ELWkgvo
	2ayEZ8sy/I2POBTvkYsEEKLpRbwpiTlQRj12ncjP6bHdvVqI0cOr+IQyz+pIdUNe
	h054D9+Y12xnK40SGEsuOl1ZsrjoISBmg2FCqaqM+Q218sUhdgw7IZrg9JZTcXzF
	rQ/s7UJ+W8XEQHygPqqmDPMEGAC2suLNeBibDVhzKXL/6wHWb5xz9Owxs77xIzlO
	Rv9nzty8xnLnPDFPSNeZuR2gaL62EtN/jPMkkuOKMF5HrvvS9DyIaaEzRZ0beqKy
	JwiucgW85tCly96kPv3+u3jVz1i/qsMknKwIHKN4jSUo2DkN4QVnQzFuOope+FPA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu62dfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:09:51 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60659pns013961;
	Tue, 6 Jan 2026 05:09:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu62dfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:09:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6064nbDs023501;
	Tue, 6 Jan 2026 05:09:50 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bg3rm67ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:09:50 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60659mcC4064084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 05:09:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACCC258051;
	Tue,  6 Jan 2026 05:09:48 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B46985805A;
	Tue,  6 Jan 2026 05:09:44 +0000 (GMT)
Received: from [9.124.214.6] (unknown [9.124.214.6])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jan 2026 05:09:44 +0000 (GMT)
Message-ID: <9f2f041d-37a7-42ed-bc06-540b65e8b54f@linux.ibm.com>
Date: Tue, 6 Jan 2026 10:39:42 +0530
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
Subject: Re: [PATCH v2 5/6] keys/trusted_keys: establish PKWM as a trusted
 source
To: Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
 <20251217172505.112398-6-ssrish@linux.ibm.com>
 <14a30e37e0cf8ef373b63d3b905ec1a7d807118a.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <14a30e37e0cf8ef373b63d3b905ec1a7d807118a.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=695c9920 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=zoI4ALCl8jw1XMAjGw4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DmxY2bha4venHbUU40UgUVK-KtoI7j_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzOCBTYWx0ZWRfXyoFXHwCbfM8y
 YBwaQNxTCM7fVJXN60Rlnw7lJH33D64qhnZfrRs05T1KkyDWLS/wXJJLN/GGNFIoayvipBiOMIN
 E1qkxWkrPY5xiXbfCGVFLUqza/yUMWxtAfmUaffqjDh9smmhSkASZQtk9zY5kVbZPDlM8kd+hwb
 8lP0NRSejJ9XwCII0dPhcdC8mlybz/I4xNgwJ/pRqUDT/iYe124ljOmTxbyhSAE4BouooWEwLly
 tsFFaak7NVQhE1MNtVr4hJya42s948amnOX2YNoYuqlzcEdhyggxkoRg0SoV2qBeBAp+aBWEBPM
 uFv2iUR238zwSiqqrYPh81L5fKKrrBGlR4FlQ+HNwPVKxFfBagh+Frivur4oNZGWqwMDhRy1faF
 Rhz/aFU7VtqEG1BWAlNEWufY3TissCCL1yim5ZJDymICCgFm5hAA6KivxYnvVfIPybFIStRKmHn
 c6gN534DrKdD8lE9Fiw==
X-Proofpoint-GUID: s2y3tF9tsH2IQgG83SdIEOTTrg7_KjkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060038
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mimi,
thanks for taking a look.

On 1/2/26 11:14 PM, Mimi Zohar wrote:
> On Wed, 2025-12-17 at 22:55 +0530, Srish Srinivasan wrote:
>> The wrapping key does not exist by default and is generated by the
>> hypervisor as a part of PKWM initialization. This key is then persisted by
>> the hypervisor and is used to wrap trusted keys. These are variable length
>> symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) are
>> generated using the kernel RNG. PKWM can be used as a trust source through
>> the following example keyctl command
> -> commands:

Yes, I will fix this.

>
>> keyctl add trusted my_trusted_key "new 32" @u
>>
>> Use the wrap_flags command option to set the secure boot requirement for
>> the wrapping request through the following keyctl commands
>>
>> case1: no secure boot requirement. (default)
>> keyctl usage: keyctl add trusted my_trusted_key "new 32" @u
>> 	      OR
>> 	      keyctl add trusted my_trusted_key "new 32 wrap_flags=0x00" @u
>>
>> case2: secure boot required to in either audit or enforce mode. set bit 0
>> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x01" @u
>>
>> case3: secure boot required to be in enforce mode. set bit 1
>> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x02" @u
>>
>> NOTE:
>> -> Setting the secure boot requirement is NOT a must.
>> -> Only either of the secure boot requirement options should be set. Not
>> both.
>> -> All the other bits are requied to be not set.
> -> required

Noted.
Will fix this.

>
>> -> Set the kernel parameter trusted.source=pkwm to choose PKWM as the
>> backend for trusted keys implementation.
>> -> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.
>>
>> Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
>> KeyStore, as a new trust source for trusted keys.
>>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Thanks, Srish.  Other than fixing the typo and other suggestion above,
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Thanks for the review Mimi.
Will fix these typos and send out v3.

thanks,
Srish.


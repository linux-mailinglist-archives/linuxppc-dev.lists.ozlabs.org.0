Return-Path: <linuxppc-dev+bounces-8402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9AAAE553
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt07C39wtz3057;
	Thu,  8 May 2025 01:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746632951;
	cv=none; b=UC7t/OqLebS+4xX5AllWm0QOoGIP+k/q8qUgw874AqtFpmlhwgY0Q+1ORD/bPEbluPk5yxBvml6kZNvptkbu1umddL6JEZm1QptZVxUBn9xlA1ZjwljcQAE/rd9KCXyfF7QtTaD76R+8kd045+th/fV0OHuQ9MBaKJJ8kYxMSf8xqxfPv9aK0gOayRKiaNhPrOKGuhGRkLWaLwLLDL47SUiMa9SA6AVKajd/TfZcMYGENrQgJ5DTpEGBgRmEeFqIacVP4X8zjidl5+9fbStKx76vulsDv8/eDCMLCxxX/T4wRPz9CU681DlXiM53kIq/5X9EKap1LxYmmHzSX8+qog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746632951; c=relaxed/relaxed;
	bh=rxNYkFWtHwpUdB6qVUY8sUHqnKrrwew+/mCMWWdHo04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnsvjlTwQ8j2mOt/Dq3Ii6cSTxvZvJ2rdv7yBltQ9y8IiHkAq7ghE2cMDVeZ1AkIOXum7BsyCjfKcdaC7ERFhuLgXpBDSESGCHt7BBn+8qzkq9z7bVOaHNItP8D0J+5/D+emvvHEdWET8ip8gpJlRXSFGQxUaH7I2gjNAB4v+B5fmWpMQjwqz4cw+de4yV2EQL5PADNCA9g3z3Ty6FZ0O/OIOSkLLaebMqTqd5YjjRk7zruwQ4//gT2NWRfysUfV3sOoNIE6+aPW8ZssBmI0XpId6ql9wi3JZc09nLghI864Ew265AXLNSvTyhC2EA8pif/heQZmIPfeeVMXTPW9Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FU7Og6M1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FU7Og6M1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt07B2Z1Wz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:49:09 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AWSCu016688;
	Wed, 7 May 2025 15:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rxNYkF
	WtHwpUdB6qVUY8sUHqnKrrwew+/mCMWWdHo04=; b=FU7Og6M1cbvnL7VjCmQNIM
	B+6cJQYZ6H9MPhMEWpe2cHNrqxyAwuhQPqpuqGqXYwK40Q7ZU5NoPSJ5v1tvLyzH
	bGbDqm3BljWPNXEdrsuSLnc+hRlP2Xl5mQQpkDqyvS1cbQGlooosfeG78AjxgTbA
	LOd0bn45JRXUYDGBCAhdT5NJqqReHDyGzw4HluiBXNTJ9h5ZVfC0fPPMMEBamKXH
	I5txNMLh+ooRXMRrY58MwtUEnDp27yX7zc3MLH62sBmZLjaxOYNGJTPCKORf6ksx
	g144BObN0Slnb52ST/2aWPPsgXzv2GLMC1fW/BPdBfBaXOuzCCfoUn4bdPs3Ew3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fvd0m3m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:48:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 547FdLwr031187;
	Wed, 7 May 2025 15:48:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fvd0m3m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:48:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 547Es3BY013765;
	Wed, 7 May 2025 15:48:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e062h22v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:48:55 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 547FmrYS24248944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 15:48:53 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76C6758056;
	Wed,  7 May 2025 15:48:53 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3DDF58054;
	Wed,  7 May 2025 15:48:46 +0000 (GMT)
Received: from [9.39.20.214] (unknown [9.39.20.214])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 May 2025 15:48:46 +0000 (GMT)
Message-ID: <e80c83a1-77db-452e-8a5d-d435e61bd544@linux.ibm.com>
Date: Wed, 7 May 2025 21:18:44 +0530
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
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format representation
 for static key management
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-2-ssrish@linux.ibm.com>
 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
 <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
 <24106430db9693f580c3765206257677c10e4375.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <24106430db9693f580c3765206257677c10e4375.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0n5xQSiBnbuu_XS3icD9NCdQqM7XK_al
X-Proofpoint-GUID: 3_6RqbKZ8aCNXmUSTH6QTnv6Mad-dn-p
X-Authority-Analysis: v=2.4 cv=LYc86ifi c=1 sm=1 tr=0 ts=681b80e8 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=1mVJ_uiqAAAA:8 a=Icq07P0Zc9DzbdNrBL8A:9 a=QEXdDO2ut3YA:10
 a=h67g7WpEjx8dfGT80pje:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0NyBTYWx0ZWRfXxxc3J+kuXBEW vDq3iyDNIp7Lkc9l1c+nvDqkLncWa25YVHUuE48n/g/AXgzqbqVO69RQ18/JN0g/MJQS6gTx5I1 sya3QVQphs/LevEM7OJpd41I5/3Z0u33DS5VTAFbzTU8j7RSE3I9ozCRKO5/YHSxHTvYhH5RvfI
 6DHEkWYYgktPeqMOmy9LFCa0D85sq39pq8xt3aJACxoPTu2MNcU2qGyxCTKYtuqDvhI8DBRb05S 6anCcgSDlDIQRFixpTXLxE9QUpmi/WkZjy2lRDobubqIGVF4SihgqwFPckaVlsV733SxUueIl+l dd420VYlRkV2XnUPycHa6uHOVqP+1Y/mG3BA5z+KbAKu1zIFOQanHofrVVdEj3+npAgLPTHGLt/
 Dovdd6CzUtklrE6rFYuc0frWAbUKBiXvyryFo9qvn0fwWie4ntvP8LSn30AtE1eJ2WEdJOqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070147
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/7/25 11:47 AM, Andrew Donnellan wrote:
> On Wed, 2025-05-07 at 00:29 +0530, Srish Srinivasan wrote:
>>>> +	rc = plpks_read_fw_var(&var);
>>>> +	if (rc) {
>>>> +		pr_info("Error %ld reading SB_VERSION from
>>>> firmware\n", rc);
>>> We need to check for -ENOENT, otherwise this message is going to be
>>> printed every time you boot a machine in static mode.
>> Yes, I agree with your concern. I just want to add that, as per my
>> understanding, we need to check for both -ENOENT and -EPERM,
>> as explained below:
>>
>> As per H_PKS_READ_OBJECT semantics described in the PAPR v10.60
>> (https://files.openpower.foundation/s/XFgfMaqLMD5Bcm8),
>>
>> * If the object is not world readable, verify that the consumer
>> password
>> matches the stored value in the hypervisor. Else return H_AUTHORITY.
>> * Verify if the object exists, else return H_NOT_FOUND.
>> * Verify if the policy for the object is met, else return
>> H_AUTHORITY.
>>
>> So, the hypervisor returns H_NOT_FOUND only for the authenticated
>> consumer. For unauthenticated consumers, which is the case here,
>> it would return H_AUTHORITY.
> We expect SB_VERSION to always be world-readable, I think? In which
> case it shouldn't return H_AUTHORITY / -EPERM, ever, and if it does
> that's an error which should be handled as an error. Or am I
> misinterpreting the spec here?

Yes, SB_VERSION is world-readable and should not return H_AUTHORITY in 
the case of dynamic key management mode. However, in
the case of static key management mode, when SB_VERSION does not exist, 
the hypervisor tries to authenticate the consumer. If the
authentication is successful, H_NOT_FOUND is returned, else H_AUTHORITY 
is returned. The intention behind authenticating the
consumer when the object is not found is to ensure that a 
non-authenticated consumer is unable to conclude on the absence of
the object. Here, when the kernel tries to read the non-existent 
SB_VERSION, it fails the authentication check and therefore,
gets the H_AUTHORITY error code.

>
>


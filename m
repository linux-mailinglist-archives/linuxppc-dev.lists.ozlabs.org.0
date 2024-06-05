Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2898FCEB1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 15:15:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pEDUb6r5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvScZ5K6Rz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:15:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pEDUb6r5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSZS6tKRz3cMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 23:13:20 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455D7Sdf019226;
	Wed, 5 Jun 2024 13:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=EwYCG4cYNmVGzMldoH8rmZ99WGkkfxZ/nkO7rj+J1CI=;
 b=pEDUb6r5h3Kq9KmN9g368eCe5Ynem6iWryLKZlisf7leTq0ncGjMmJQj72mvbLSk2bGl
 gsX1h5SQ7+Zi5k/5FrVMOdYxITaXWUugtQV7pd4gvUdoW4GX6XdpcLO5FzYascokVUhp
 hibn+RKhd84WMafZc0yjdKJABdSG0QszDVpxTffjyOGE7T5qkmyK0lSC5pmVf8qtarTY
 GYPwTgEij//EmCZAzUDWTbbsy8ySudwbDWeCF02CPZ+HdzBTQ+26k+mU0xhrtpog5flA
 9rdL7lUu4jCJq9uEuiw+KaHsgkIYeOkIfyUWOpnc9svqX1AY8Ly9MS/2c+oYfiJhx2Yh ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjrm9g0ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:13:12 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 455DDB0H028029;
	Wed, 5 Jun 2024 13:13:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjrm9g0pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:13:11 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455AdLmv026592;
	Wed, 5 Jun 2024 13:13:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn44pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:13:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455DD63R53477776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 13:13:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84B4A2004B;
	Wed,  5 Jun 2024 13:13:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F50320040;
	Wed,  5 Jun 2024 13:13:04 +0000 (GMT)
Received: from [9.195.38.242] (unknown [9.195.38.242])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 13:13:03 +0000 (GMT)
Message-ID: <3dea8d70-9f04-4410-8063-d98c392c10c7@linux.ibm.com>
Date: Wed, 5 Jun 2024 18:43:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] KVM: PPC: Book3S HV: Add one-reg interface for
 HASHKEYR register
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741330411.6631.10739157625274499060.stgit@linux.ibm.com>
 <D1R0AHN2MCOS.BPHUJKSV7YSO@gmail.com>
Content-Language: en-US
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <D1R0AHN2MCOS.BPHUJKSV7YSO@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FhHe7XHzQiXgt5lBSKMgmOg4mits-tmi
X-Proofpoint-GUID: 4E3K761OZvwEgk7TdIGzCeYmQTSeIE5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=626 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050100
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
Cc: atrajeev@linux.vnet.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/4/24 11:37, Nicholas Piggin wrote:
> On Mon Jun 3, 2024 at 9:15 PM AEST, Shivaprasad G Bhat wrote:
>> The patch adds a one-reg register identifier which can be used to
>> read and set the virtual HASHKEYR for the guest during enter/exit
>> with KVM_REG_PPC_HASHKEYR. The specific SPR KVM API documentation
>> too updated.
>>
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> ---
>>   Documentation/virt/kvm/api.rst            |    1 +
>>   arch/powerpc/include/uapi/asm/kvm.h       |    1 +
>>   arch/powerpc/kvm/book3s_hv.c              |    6 ++++++
>>   tools/arch/powerpc/include/uapi/asm/kvm.h |    1 +
>>   4 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 81077c654281..0c22cb4196d8 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -2439,6 +2439,7 @@ registers, find a list below:
>>     PPC     KVM_REG_PPC_PSSCR               64
>>     PPC     KVM_REG_PPC_DEC_EXPIRY          64
>>     PPC     KVM_REG_PPC_PTCR                64
>> +  PPC     KVM_REG_PPC_HASHKEYR            64
> Just looking at the QEMU side of this change made me think... AFAIKS
> we need to also set and get and migrate the HASHPKEY SPR.

Thanks Nick. I have posted the v2 with changes for HASHPKEYR

and your other suggestions at

171759276071.1480.9356137231993600304.stgit@linux.ibm.com


Regards,

Shivaprasad

>
> The hashst/hashchk test cases might be "working" by chance if the SPR
> is always zero :/
>
> Thanks,
> Nick

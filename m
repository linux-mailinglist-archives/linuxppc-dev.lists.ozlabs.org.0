Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549AA85753E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 05:14:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fy945UcM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbdqy21cvz3vZ9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 15:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fy945UcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bergner@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbdq81R0fz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 15:14:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41G3CJPU019202;
	Fri, 16 Feb 2024 04:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bLxNPSUeDM1zYoU0JmieJdwQm/KA7OT3+zW4QSPieE0=;
 b=fy945UcMGaXZolPWT1ZARC8XgJ+JtR4MDVcIytDOnagRJBTZOgvA21r2fi83CTQM7kI3
 GdWRsrinLwCrmthOcxlV2VXJCpmRBhPkpfTedSrBmiJ2khA05GObdIxutmF+6J5dTk6l
 PXAzK8bXVLjGhF6mEkQ8kajY8yTZi7fFumyIm5biBtpgcSmwmhWRDLyhM8pfwYqQqiNR
 lRK07CMbL1V97DVYAn5kagDNyQJxtlNMW6ShNNd2XEIE5OmlqODiOYesKfB8LUu7EsTR
 LiW71RiyBRPAwpJt5Liw6EIQWxHZ6zThtTJH2j4mAyXzWIEubqTEQsZOQz1dyYIx+oWx sA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9ykj8x2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 04:13:57 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41G4Bmj1009896;
	Fri, 16 Feb 2024 04:13:56 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm8prg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 04:13:56 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41G4Drjl19530426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Feb 2024 04:13:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D6B858064;
	Fri, 16 Feb 2024 04:13:53 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 763E15805A;
	Fri, 16 Feb 2024 04:13:52 +0000 (GMT)
Received: from [9.61.99.202] (unknown [9.61.99.202])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Feb 2024 04:13:52 +0000 (GMT)
Message-ID: <f651ea8d-795a-4511-92a1-3441d3467c35@linux.ibm.com>
Date: Thu, 15 Feb 2024 22:13:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux
 vector, entries
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@kernel.org>,
        linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
 <aa657f01-7cb1-43f4-947e-173fc8a53f1f@app.fastmail.com>
 <a50cf258-b861-40e5-8ca9-dec7721400ec@linux.ibm.com>
 <87edddp48o.fsf@mail.lhotse>
From: Peter Bergner <bergner@linux.ibm.com>
In-Reply-To: <87edddp48o.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GyEMjP-TllGv82einiGrI8xf55oCrydv
X-Proofpoint-ORIG-GUID: GyEMjP-TllGv82einiGrI8xf55oCrydv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_03,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=713 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402160031
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, Nick Piggin <npiggin@au1.ibm.com>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/15/24 7:49 PM, Michael Ellerman wrote:
> Peter Bergner <bergner@linux.ibm.com> writes:
>> On 2/15/24 2:16 AM, Arnd Bergmann wrote:
>>> On Wed, Feb 14, 2024, at 23:34, Peter Bergner wrote:
>>>> Arnd, we seem to have consensus on the patch below.  Is this something
>>>> you could take and apply to your tree? 
>>>>
>>>
>>> I don't mind taking it, but it may be better to use the
>>> powerpc tree if that is where it's actually being used.
>>
>> So this is not a powerpc only patch, but we may be the first arch
>> to use it.  Szabolcs mentioned that aarch64 was pretty quickly filling
>> up their AT_HWCAP2 and that they will eventually require using AT_HWCAP3
>> as well.  If you still think this should go through the powerpc tree,
>> I can check on that.
> 
> I'm happy to take it with Arnd's ack.
> 
> I trimmed up the commit message a bit, see below.

Perfect.  Thanks everyone!

Peter



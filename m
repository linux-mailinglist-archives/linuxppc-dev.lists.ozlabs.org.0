Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2F9176FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 05:56:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q0eZcGYQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W87Cq2vPkz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 13:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q0eZcGYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W87C60PVdz2y70
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 13:55:29 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q31Pbq019531;
	Wed, 26 Jun 2024 03:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=o
	sFM4lpMex6gjN2AX73iQL+tlb4cPpJGt/GYHMHRBR8=; b=Q0eZcGYQW01TMN1On
	bVbmH91KNy6tWyWzfvICb9kr1cb1Yglyt2ssxStuhff0UjAxy8AJOhjm0/6eTy1M
	WrXxw+MJ/wZYh3Q14ohZN851YYONY4NQIno+fZ0oLLs2ODwDQjTF/B643Ivoara/
	YaNnmIJYkyWAqw4K5ID1547j5FEmFwOQ4fU0fwmIFqdON3QbjM9nkuO2CHS83wSz
	Mix6H4qCbio/myWG7YkNznHADtrXACbtKdik36nd6Zswy7tDoOKLIW/d34Hd4WBG
	Re/O/lXB2Pm9I18cz1d0F+IgEAD/hilXOA5mcNBPoLHaBRayhAfxNzJFHDy95mLN
	Ud+dA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4009str6jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:55:23 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q3ortq027633;
	Wed, 26 Jun 2024 03:55:22 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4009str6jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:55:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45Q0HHSQ008172;
	Wed, 26 Jun 2024 03:55:21 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9b0t9jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:55:21 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45Q3tHvX44761678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 03:55:20 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D08DB5805D;
	Wed, 26 Jun 2024 03:55:17 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEA3458059;
	Wed, 26 Jun 2024 03:55:14 +0000 (GMT)
Received: from [9.204.206.229] (unknown [9.204.206.229])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jun 2024 03:55:14 +0000 (GMT)
Message-ID: <e3433830-d9a9-43cc-8440-5fb5ee996a55@linux.ibm.com>
Date: Wed, 26 Jun 2024 09:25:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] powerpc: Document details on H_HTM hcall
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, mpe@ellerman.id.au
References: <20240620174614.53751-1-maddy@linux.ibm.com>
 <20240620174614.53751-3-maddy@linux.ibm.com> <87le2x5qmv.fsf@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87le2x5qmv.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2qZh5CivsoP3KaMg6ajHU2jfoDzdowYY
X-Proofpoint-GUID: Myk--zTr1qHO8BOGLPCmRNqYLNYARDC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260029
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/22/24 1:57 PM, Ritesh Harjani (IBM) wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>
>> Add documentation to 'papr_hcalls.rst' describing the
>> input, output and return values of the H_HTM hcall as
>> per the internal specification.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
>> index 80d2c0aadab5..805e1cb9bab9 100644
>> --- a/Documentation/arch/powerpc/papr_hcalls.rst
>> +++ b/Documentation/arch/powerpc/papr_hcalls.rst
>> @@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
>>   subsequent hcalls to the hypervisor until the hcall is completely serviced
>>   at which point H_SUCCESS or other error is returned by the hypervisor.
>>   
>> +**H_HTM**
>> +
>> +| Input: flags, target, operation (op), op-param1, op-param2, op-param3
>> +| Out: *dumphtmbufferdata*
>> +| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
>> +		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
>> +
>> +H_HTM supports setup, configuration, control and dumping of Hardware Trace
>> +Macro (HTM) function and its data. HTM buffer stores tracing data for functions
>> +like core instruction, core LLAT and nest.
>> +
> Minor nit: Maybe the set of debugfs cmds to collect the trace and some
> example trace log? If it is not confidential?

I could add the file structure in the commit message, but logs are just 
binary data.

Maddy

>
>>   References
>>   ==========
>>   .. [1] "Power Architecture Platform Reference"
>> -- 
>> 2.45.2

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C67777378
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 10:56:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BFopj2GS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM14G1GX7z3cPC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 18:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BFopj2GS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM13K6cpSz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 18:55:25 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37A8am5U007086;
	Thu, 10 Aug 2023 08:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+fRkCnNNBwwB/QcUJm8EU1yNLh5o83ghi1A8NTIo6XA=;
 b=BFopj2GSBfefXMKkeaCVph4CoQ6vCDgkVc8nnfBHZsy/l2gsPRG3FHnqrqf4b3NCh4iF
 ZLcTDwSglcYJusmdFGH+cvzQfIPtGI7hILlto6/SB7BKMBtD0RGnRIVTp07Nc7+a9KiE
 HAhrkY6fek8YhXmIaMn6zGmRY7ypPlJC6LGkVFaJdFVYjGdBogMzAiVSln88RXcwBNIg
 1BDvshoZTYF9oVqKiBUkhLB0SfBS2UgwXchsK0XMLNnpQtorgxsIa1JFMb1M1to5I/zR
 YyPLqVN0jvUloqGKuRuqZu2UD7xivWCsFjVYcf0IqMrVh9zgSE4JESLMUoRryt/r5Wc8 rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3scvb18qq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 08:52:26 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37A8ax1v008230;
	Thu, 10 Aug 2023 08:52:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3scvb18qpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 08:52:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37A8lHh8006666;
	Thu, 10 Aug 2023 08:51:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa0rtgff3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 08:51:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37A8poha50659796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Aug 2023 08:51:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 994212004B;
	Thu, 10 Aug 2023 08:51:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3DDD20040;
	Thu, 10 Aug 2023 08:51:49 +0000 (GMT)
Received: from [9.171.1.11] (unknown [9.171.1.11])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Aug 2023 08:51:49 +0000 (GMT)
Message-ID: <b1198f29-f8fd-acf4-67f3-ecde234cbf84@linux.ibm.com>
Date: Thu, 10 Aug 2023 10:51:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] Introduce SMT level and add PowerPC support
To: Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
 <87tttoqxft.ffs@tglx> <87msyzbekt.fsf@mail.lhotse>
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87msyzbekt.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qf09CQQNGO83Ay44TN5KJUTEv_abOCpL
X-Proofpoint-ORIG-GUID: 2u3Tb3liz5zn6QtmHhoX8RKm0K-YmI6Y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_07,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308100072
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, rui.zhang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 10/08/2023 à 08:23, Michael Ellerman a écrit :
> Thomas Gleixner <tglx@linutronix.de> writes:
>> Laurent, Michael!
>>
>> On Wed, Jul 05 2023 at 16:51, Laurent Dufour wrote:
>>> I'm taking over the series Michael sent previously [1] which is smartly
>>> reviewing the initial series I sent [2].  This series is addressing the
>>> comments sent by Thomas and me on the Michael's one.
>>
>> Thanks for getting this into shape.
>>
>> I've merged it into:
>>
>>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git smp/core
>>
>> and tagged it at patch 7 for consumption into the powerpc tree, so the
>> powerpc specific changes can be applied there on top:
>>
>>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git smp-core-for-ppc-23-07-28
> 
> Thanks. I've merged this and applied the powerpc patches on top.
> 
> I've left it sitting in my topic/cpu-smt branch for the build bots to
> chew on:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/cpu-smt
> 
> I'll plan to merge it into my next in the next day or two.

Thanks Michael!

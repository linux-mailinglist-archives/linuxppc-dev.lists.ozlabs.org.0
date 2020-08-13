Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8268C2431F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 03:09:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRpPV6541zDqHv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 11:09:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=duJCk6tq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRpMX5fXJzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 11:07:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D13JCG107345; Wed, 12 Aug 2020 21:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=nqdweNomGRVVapp5Uhx8ZWKEZnwBkIVU0isIjCtR2JE=;
 b=duJCk6tq4VgyyHp75B56aDrnUrTl4er3Rxvb9Z743Iixj09uvdYW6bplmQt+QQX6JKKM
 4M76GW8a0NAG3hfFXS0UoY/nrmnbCyvR+P0GgkO5aaiaoRmBZXfeNDYJ7vH4s+CuPANQ
 1HQO4a7FxbD4jVYmidwItQwnCeHy5DH55U4F36qlLp94ITKk3n99PwnZa3J4zZWPWMsJ
 VAdTkrgVbYZ33vIXrkhkkd6RoMLESH+VozmsUFNtZjWCRCBtc+QepwMSCb6thwyOOiZG
 gfY1YbG6qaZp4J8yzE4EoDGoncFHqB9wm+lgILZyGlTE8kJTx4c2PXFXs3eZr195OPl/ YA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sratbyvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 21:07:27 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D16TBX010523;
 Thu, 13 Aug 2020 01:07:26 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 32skp9e0wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 01:07:26 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07D17Q7R11993798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 01:07:26 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DA6C28064;
 Thu, 13 Aug 2020 01:07:26 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DACE2805C;
 Thu, 13 Aug 2020 01:07:26 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 01:07:25 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
In-Reply-To: <87lfij9yp6.fsf@mpe.ellerman.id.au>
References: <20200812012005.1919255-1-nathanl@linux.ibm.com>
 <5e8213a6-802b-f7ca-b43b-a3de8a03d1da@linux.ibm.com>
 <87lfij9yp6.fsf@mpe.ellerman.id.au>
Date: Wed, 12 Aug 2020 20:07:25 -0500
Message-ID: <874kp7z73m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_19:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 suspectscore=1 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=902
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008130006
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 8/11/20 6:20 PM, Nathan Lynch wrote:
>>>  
>>> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
>>> +{
>>> +	const unsigned int resched_interval = 20;
>>> +
>>> +	BUG_ON(lmb < drmem_info->lmbs);
>>> +	BUG_ON(lmb >= drmem_info->lmbs + drmem_info->n_lmbs);
>>
>> I think BUG_ON is a pretty big no-no these days unless there is no other option.
>
> It's complicated, but yes we would like to avoid adding them if we can.
>
> In a case like this there is no other option, *if* the check has to be
> in drmem_lmb_next().
>
> But I don't think we really need to check that there.
>
> If for some reason this was called with an *lmb pointing outside of the
> lmbs array it would confuse the cond_resched() logic, but it's not worth
> crashing the box for that IMHO.

The BUG_ONs are pretty much orthogonal to the cond_resched().

It's not apparent from the context of the change, but some users of the
for_each_drmem_lmb* macros modify elements of the drmem_info->lmbs
array. If the lmb passed to drmem_lmb_next() violates the bounds check
(say, if the callsite inappropriately modifies it within the loop), such
users are guaranteed to corrupt other objects in memory. This was my
thinking in adding the BUG_ONs, and I don't see another place to do
it.

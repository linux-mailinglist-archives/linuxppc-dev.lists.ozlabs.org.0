Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAA53114A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 16:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6KHR4fgnz3bkY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 00:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MR4Rn/6i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=murphyp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MR4Rn/6i; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6KGh6xbdz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 00:19:56 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NEDjnV002727;
 Mon, 23 May 2022 14:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qBmsxwi4lCespPhYuPLAJWW5ORIDnogvPNtq63ieWjs=;
 b=MR4Rn/6ifwjhYZ8bj6mNkJSs8P87N89AM7kOS5wnoqC+7jydVeS3oOoqltejdDsDbcjB
 IJLBbjfTN1UPDLOI61NWLRfP9v7GI3AClftLy2nTk9Dcyde7VwEkRT5iFJVAKkmynb+k
 oprRdxJGNnw8FPQROGRtWC3aMXLU/s50PYQYGDV8t5JVCf7H5FSCFqIK3h5W3S00Kov/
 PfIBg1+m+dOWEWW6DLlMtEQN0gY6HlSXrdpOZ6EQ+ksGiv7UcDoE7wYOPLcjQqRmxUzy
 oDu5McdHomlA0CntyQY4kT7vwwmbwLmKMoLz9/EjJfZDMkSb48XWet3MDUohAG/mKOeT ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8buc049q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 14:19:50 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24NEIRgw022590;
 Mon, 23 May 2022 14:19:50 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8buc049j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 14:19:50 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NEIpIN022605;
 Mon, 23 May 2022 14:19:49 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3g6qq9crek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 14:19:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24NEJmN428901768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 14:19:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BCECBE051;
 Mon, 23 May 2022 14:19:48 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05005BE056;
 Mon, 23 May 2022 14:19:48 +0000 (GMT)
Received: from [9.160.107.32] (unknown [9.160.107.32])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 14:19:47 +0000 (GMT)
Message-ID: <27e05114-fd3a-b7cc-1bdd-05d8eaf0b483@linux.ibm.com>
Date: Mon, 23 May 2022 09:19:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC Linux patch] powerpc: add documentation for HWCAPs
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220520051528.98097-1-npiggin@gmail.com>
 <c1f6c6c9-4cc7-0dcb-360d-9ae0df6378b4@linux.ibm.com>
 <1653091346.1a5h1ae3pd.astroid@bobo.none>
From: Paul E Murphy <murphyp@linux.ibm.com>
In-Reply-To: <1653091346.1a5h1ae3pd.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iwiQ7e3rQkxS3vx6qxmaMpdUasbj9GXf
X-Proofpoint-GUID: v1u-EZaBbZFjIMDskUdp7D2rBgkdccIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=975 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230079
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/20/22 7:11 PM, Nicholas Piggin wrote:
> Excerpts from Paul E Murphy's message of May 21, 2022 12:21 am:
>>
>>
>> On 5/20/22 12:15 AM, Nicholas Piggin via Gcc wrote:
>>> +PPC_FEATURE2_TAR
>>> +    VSX facility is available.
>>
>> Was manipulating the tar spr was once a privileged instruction, is this
>> a hint userspace can use the related instructions?
> 
> It can be disabled with facility control, and I guess there was
> some consideration for how it might be used, e.g., "system software"
> could use it for its own purpose then clear the bit for the application.
> 
> In practice I don't really know what makes use of this or whether
> anything sanely can, it's marked reserved in the ABI. Would be
> interesting to know whether there is much benefit to use it in the
> compiler. The kernel could actually use it for something nifty if we
> were able to prevent userspace from accessing it entirely...

It might be useful as a scratch register for indirect branches in some 
odd cases, such as golang's preemptive userspace threading.  Though, it 
seems more trouble than its worth for a very limited benefit.

> 
>>> +
>>> +PPC_FEATURE2_HAS_IEEE128
>>> +    IEEE 128 is available? What instructions/data?
>>
>> Maybe something like "IEEE 128 binary floating point instructions are
>> supported.  Individual instruction availability is dependent on the
>> reported architecture version."?
> 
> Right, I just didn't know what architectural class of instructions
> those are. Is it just VSX in general or are there some specific
> things we can name?

I think ISA 3.1 buckets this into an OpenPOWER Linux Optional Feature 
for "Quad-precision floating-point (QFP)".  I guess ISA 3.0 predates 
those categorizations.


>>> +PPC_FEATURE2_MMA
>>> +    MMA facility is available.
>>
>> Maybe another note that specific instruction availability may depend on
>> the reported architecture version?
Yep. I wonder if it would help to note how these align (or don't) with 
the various OpenPOWER features.

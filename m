Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF422372629
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 09:04:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ9nz69Xmz30DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:04:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjPK9GoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FjPK9GoX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ9nR3t4Kz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 17:04:26 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14474HG1148126; Tue, 4 May 2021 03:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r2ME6H6lhBrw1IN5ZZtG9XfZxaqmoLe/vkQHSKs9uwU=;
 b=FjPK9GoXSqkPDufiM5JI5is+s0GSnuy/w8NuQBPjlMKhLL0IdwBHwh5j09SIVSZaAF2l
 g5qEciChc6L3Wdwcrycca41cc2YHXWVft+vhHkThXCLrdYaEFd0m+xyriIvMmeU0DHXL
 iLdC5u5pa+tjpn9MnuRwQ0hnM3CXB9wCb5m7RWBugKowMw1Ev+mH4xwzchkWzMJNrvE8
 Izciuze7OpncgzF7oxGUHNbz+jKBPVoxWJFa0dDGtjhEzqSYyIreOxMqyL5wmI2FkC4A
 DBWWVpAt6pTIlQLp6TOS0TDtXxuxSgxSOTSBbvHGVbHCNQ4STPuz6P8wJ/kISb4GwPMI zA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b1hj80r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:17 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1446rRDm011658;
 Tue, 4 May 2021 07:04:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 388xm88jv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 07:04:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14473akc29360402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 07:03:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1433911C04A;
 Tue,  4 May 2021 07:04:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC61C11C05C;
 Tue,  4 May 2021 07:04:01 +0000 (GMT)
Received: from pomme.local (unknown [9.145.18.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 07:04:01 +0000 (GMT)
Subject: Re: [PATCH v3] pseries/drmem: update LMBs after LPM
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210428094758.28665-1-ldufour@linux.ibm.com>
 <87fsz95qso.fsf@linux.ibm.com>
 <9d29bf8c-9e97-c179-6897-8e25fa4eb516@linux.ibm.com>
 <271ef351-b89c-ba68-3b6d-baa24cc0021b@linux.ibm.com>
 <c87e17d3-8956-9eb0-6f8a-ae316ea75f7e@linux.ibm.com>
 <1eac9540-e8b4-53be-1f27-4c36f92c8a5e@linux.ibm.com>
 <bdc510ff-f9f6-b032-0f0d-52a274fb9dab@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <f8b12753-5f4c-c64f-0847-3d52dc464ce2@linux.ibm.com>
Date: Tue, 4 May 2021 09:03:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <bdc510ff-f9f6-b032-0f0d-52a274fb9dab@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vu9wfwbCv4MvyX7AzWmC0v68poH9B0D1
X-Proofpoint-GUID: Vu9wfwbCv4MvyX7AzWmC0v68poH9B0D1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_02:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105040052
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 03/05/2021 à 22:44, Tyrel Datwyler a écrit :
> On 5/3/21 10:28 AM, Laurent Dufour wrote:
>> Le 01/05/2021 à 01:58, Tyrel Datwyler a écrit :
>>> On 4/30/21 9:13 AM, Laurent Dufour wrote:
>>>> Le 29/04/2021 à 21:12, Tyrel Datwyler a écrit :
>>>>> On 4/29/21 3:27 AM, Aneesh Kumar K.V wrote:
>>>>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>>>>
> 
> Snip
> 
>>>
>>> As of today I don't have a problem with your patch. This was more of me pointing
>>> out things that I think are currently wrong with our memory hotplug
>>> implementation, and that we need to take a long hard look at it down the road.
>>
>> I do agree, there is a lot of odd things there to address in this area.
>> If you're ok with that patch, do you mind to add a reviewed-by?
>>
> 
> Can you send a v4 with the fix for the duplicate update included?

Of course !
I wrote it last week, but let in the to-be-sent list, my mistake.

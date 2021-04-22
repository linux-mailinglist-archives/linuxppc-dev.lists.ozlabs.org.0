Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC26367A94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpRv2hBcz3bsp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:08:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cf2PjBmi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ricklind@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cf2PjBmi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpR94nlvz30Bl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:08:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M74P3T032893; Thu, 22 Apr 2021 03:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hBKjfcrKHvPZuyw4887AQ9KUsBTVTdRWR+dU2vlNDhw=;
 b=cf2PjBmi3OuAPFBFYWpfCGPAnMvBOfOfmBiYJYUrXkeSsK899FErog0d1GlnzKdcAOSa
 wji69yAs/pYsECgj8zDkc000MyGw/bwpzYUbTZEM1jNdDX8mppIOb4Z9j71O1b+ByNXM
 skxZ1k/Yi/KGqBuH1qkYcpe2GOlXjxZ9unq/TUFTcnJdrPTsMmtZm6Qj5GnCvSaIM7sU
 /CMmTqZ1mY2Hvr1dcRmiioCm8O7UMXs163spBOvpyjZ1QLvHdQE7LFpy1W3kna4Hm0TO
 qj+XoeD6rIjGKgBur/iH6WX/vq/Aa8OWfkR5e4hrrywHoPzLgd6Hn5cjbdYQn9TtBZcr zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382xveqmf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 03:07:50 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M74i9w034716;
 Thu, 22 Apr 2021 03:07:49 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382xveqme5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 03:07:49 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M6utS2001040;
 Thu, 22 Apr 2021 07:07:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 37yqa9g1nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 07:07:48 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M77moF27132394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 07:07:48 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7612AE05C;
 Thu, 22 Apr 2021 07:07:47 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76777AE063;
 Thu, 22 Apr 2021 07:07:46 +0000 (GMT)
Received: from [9.160.109.21] (unknown [9.160.109.21])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 07:07:46 +0000 (GMT)
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: Lijun Pan <lijunp213@gmail.com>, Dany Madden <drt@linux.ibm.com>
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <CAOhMmr5XayoXS=sJ+9zm68VF+Jn+9qiVvWUrDfq0WGQ6ftKdbw@mail.gmail.com>
From: Rick Lindsley <ricklind@linux.vnet.ibm.com>
Message-ID: <49b3b535-3b81-6ffd-44b7-6226507859fa@linux.vnet.ibm.com>
Date: Thu, 22 Apr 2021 00:07:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAOhMmr5XayoXS=sJ+9zm68VF+Jn+9qiVvWUrDfq0WGQ6ftKdbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1BuwRCZ903Px1DaknrGiO9nGDpV-h_Iu
X-Proofpoint-GUID: ZErJA5Kva0BMOsfpeSNsQ9JI91_nkjHu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1011 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104220059
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
Cc: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/21/21 10:30 PM, Lijun Pan wrote:
>> Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
>> Signed-off-by: Dany Madden <drt@linux.ibm.com>
>> Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
>> Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> 
> One thing I would like to point out as already pointed out by Nathan Lynch is
> that those review-by tags given by the same groups of people from the same
> company loses credibility over time if you never critique or ask
> questions on the list.
> 

Well, so far you aren't addressing either my critiques or questions.

I have been asking questions but all I have from you are the above
attempts to discredit the reputation of myself and other people, and
non-technical statements like

     will make the code very difficult to manage
     I think there should be a trade off between optimization and stability.
     So I don't think you could even compare the two results

On the other hand, from the original submission I see some very specific
details:

     If ibmvnic abandons the reset because of this failed set link
     down and this is the last reset in the workqueue, then this
     adapter will be left in an inoperable state.

and from a followup discussion:

     We had a FATAL error and when handling it, we failed to
     send a link-down message to the VIOS. So what we need
     to try next is to reset the connection with the VIOS. For
     this we must ...

These are great technical points that could be argued or discussed.
Problem is, I agree with them.

I will ask again:  can you please supply some technical reasons for
your objections.  Otherwise, your objections are meritless and at worst
simply an ad hominem attack.

Rick

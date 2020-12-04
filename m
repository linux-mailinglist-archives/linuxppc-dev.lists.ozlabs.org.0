Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B7F2CE94F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 09:15:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnQVW6dQ4zDrPK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 19:14:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TYSRebq6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnQS74gbhzDr6L
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 19:12:55 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B482uvd189493; Fri, 4 Dec 2020 03:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ihxf7PJh5l3HHItoamPpTYGJI1jYXP30TqwIpz+HddI=;
 b=TYSRebq62M6AXo8D2v54bUslXHUqXnA5gP9UepZ5rvnQyGbTejZOJojdL4wgxyhju6tu
 WhO0GC5mokvq1G/PYqvYryEZHIUw76EcScnWPlogPdlgjXtdusb9gzkeF/8Jg5xPXOGp
 AiAdp4aQFjWpRz56924WESQSnTV9zzXeIdO6BpgXYEpTqTDXpY8ImA1GMTnzxW+ZWG/j
 d5LEauvPD1GLQ/BeDGuq9XDgWQ3o8wAhEWYPR3M1j1iw5KhiL/RZxNdhP5knsTjnU72S
 yS/3DIaRuESdxCtb9CTNNjpLi27GbvsaX5gS3tWffzp8HjdhAaTuZBbFg0UNCIkJYVgZ Tg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357742xc2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:12:46 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B48CC0p025047;
 Fri, 4 Dec 2020 08:12:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 354fpdcta0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 08:12:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B48Cdba6029836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 08:12:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 489AD4C046;
 Fri,  4 Dec 2020 08:12:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 021BE4C040;
 Fri,  4 Dec 2020 08:12:39 +0000 (GMT)
Received: from pomme.local (unknown [9.145.0.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 08:12:38 +0000 (GMT)
Subject: Re: [PATCH] powerpc/hotplug: assign hot added LMB to the right node
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201203101514.33591-1-ldufour@linux.ibm.com>
 <X8ktsoAv4/h+p1/8@kroah.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <0fbf1f3c-908e-34ee-637c-b29f15e9dea8@linux.ibm.com>
Date: Fri, 4 Dec 2020 09:12:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X8ktsoAv4/h+p1/8@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_02:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040043
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 03/12/2020 à 19:25, Greg KH a écrit :
> On Thu, Dec 03, 2020 at 11:15:14AM +0100, Laurent Dufour wrote:
>> This patch applies to 5.9 and earlier kernels only.
>>
>> Since 5.10, this has been fortunately fixed by the commit
>> e5e179aa3a39 ("pseries/drmem: don't cache node id in drmem_lmb struct").
> 
> Why can't we just backport that patch instead?  It's almost always
> better to do that than to have a one-off patch, as almost always those
> have bugs in them.

That's a good option too.
I was thinking that this 5.10 patch was not matching the stable release's 
guidelines since it was targeting performance issue, but since it is also fixing 
this issue, I'm certainly wrong.

So, forget that patch.

Thanks,
Laurent.

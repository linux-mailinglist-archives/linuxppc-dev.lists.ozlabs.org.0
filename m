Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A036799E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 08:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQmz60HTgz30Cy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 16:02:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KOhsHZz9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KOhsHZz9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQmyc51ZLz2xZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 16:01:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M5XqHu129053; Thu, 22 Apr 2021 02:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Hf7TVy2ciAKoWfBJo8pseOdiWMHj7OEvZvNm/wvEYos=;
 b=KOhsHZz9Nc0y9o8bPjb9d//CYlT7ZnC4oKIy72Iyy3cNhY3xzj6lHGTbKxK+pne3z2KX
 FKVZSF+L9ONfsv5SsKz3SLIk5zIsGBb+x1zSk6LEpHZ1LtQK1kNXAOyzlRlfT9YYg+fk
 SbuUIlTQgIUKKpMU3YrLGJTplkFzC0MPMBauLRsGl6gC/GFbMGXJFeG1aNedka6nn7Y/
 LiQEP9f4zmBSHSJtABlV7FBrWw4fhB9haKAwgvITP2+LwYmZN9fp2o2vAY3WdRkJSqDU
 o4IB4ErdAoV9IPQvMiMPD6JmiQcpwLAG/NYZgU2hWNfbZA85YjZzsIuu2/MBQaJpncXh /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38322aa6p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 02:01:38 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M5vATg075160;
 Thu, 22 Apr 2021 02:01:38 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38322aa6my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 02:01:38 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M5r5jL005975;
 Thu, 22 Apr 2021 06:01:35 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 380hbf17cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 06:01:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M61X5N54329722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 06:01:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E71EA4066;
 Thu, 22 Apr 2021 06:01:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3684A4054;
 Thu, 22 Apr 2021 06:01:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.84.22])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 06:01:31 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: save ignore_event flag unconditionally for UE
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <cdc59fb2-b389-99ee-24bd-10f3f09c2b42@linux.ibm.com>
Date: Thu, 22 Apr 2021 11:31:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ngT93Dk-OLuKx4uGYVEehB83MmMqeGWG
X-Proofpoint-ORIG-GUID: sypro41wd3Iz-UPydKvq9LW-AvLWYBRv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220047
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/7/21 10:28 AM, Ganesh Goudar wrote:

> When we hit an UE while using machine check safe copy routines,
> ignore_event flag is set and the event is ignored by mce handler,
> And the flag is also saved for defered handling and printing of
> mce event information, But as of now saving of this flag is done
> on checking if the effective address is provided or physical address
> is calculated, which is not right.
>
> Save ignore_event flag regardless of whether the effective address is
> provided or physical address is calculated.
>
> Without this change following log is seen, when the event is to be
> ignored.
>
> [  512.971365] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
> [  512.971509] MCE: CPU1: NIP: [c0000000000b67c0] memcpy+0x40/0x90
> [  512.971655] MCE: CPU1: Initiator CPU
> [  512.971739] MCE: CPU1: Unknown
> [  512.972209] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
> [  512.972334] MCE: CPU1: NIP: [c0000000000b6808] memcpy+0x88/0x90
> [  512.972456] MCE: CPU1: Initiator CPU
> [  512.972534] MCE: CPU1: Unknown
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>   arch/powerpc/kernel/mce.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
Hi mpe, Any comments on this patch?


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1A36668A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 09:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQCWm6z84z30Dq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 17:55:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WlqwUZO5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ricklind@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WlqwUZO5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQCWH1Spbz2y0J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 17:54:33 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13L7YwmQ184653; Wed, 21 Apr 2021 03:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WOE3R1b3R7c75tHsejOc95dkQqk3TOGxsEnOEyMupvQ=;
 b=WlqwUZO58DjQwhOl6LwuyEUnCDzZSbmCCu5fnFchJoT+PEM5FRjFq/a0WI3GTeXNJmz8
 4KXhzqNfAYtjr55+ZezxauSxtt9tNk4LqyJOt7FX60uSwaX5nWvySLFEfnBCXVKxTklU
 36YgWToclpt0zNOk6VekfvZsLhxWNxsMLKapYSqVPYChXq900quhXuJ83BxQ0b0YtMkB
 lstuA4mXkep+Cwj/R++Lcd14ev5d8MGYttG32k3yMNCBN6xFUsAmWMUwP0qM8CryZ/We
 CgApxJowYz9QH9yTrK+uXFL5fsbLv8/DA1I1UP4+D8zN9A2ZBcDHCAlS79cz1RPk2rjq DQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382espa62d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 03:54:28 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13L7gdJi028644;
 Wed, 21 Apr 2021 07:54:27 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 37yqaa0edu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:54:27 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13L7sQnP31261332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 07:54:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E7DB6E04C;
 Wed, 21 Apr 2021 07:54:26 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A6536E050;
 Wed, 21 Apr 2021 07:54:24 +0000 (GMT)
Received: from [9.160.109.21] (unknown [9.160.109.21])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 07:54:23 +0000 (GMT)
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: Lijun Pan <ljp@linux.vnet.ibm.com>, Dany Madden <drt@linux.ibm.com>
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
From: Rick Lindsley <ricklind@linux.vnet.ibm.com>
Message-ID: <51a63be8-9b24-3f72-71d0-111959649059@linux.vnet.ibm.com>
Date: Wed, 21 Apr 2021 00:54:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qoGb_kptybPMowIAmvtbiHa6dhgYhfzA
X-Proofpoint-ORIG-GUID: qoGb_kptybPMowIAmvtbiHa6dhgYhfzA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_02:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210060
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
Cc: netdev@vger.kernel.org, Tom Falcon <tlfalcon@linux.ibm.com>,
 paulus@samba.org, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 2:42 PM, Lijun Pan wrote:
> 
> This v2 does not adddress the concerns mentioned in v1.
> And I think it is better to exit with error from do_reset, and schedule a thorough
> do_hard_reset if the the adapter is already in unstable state.

But the point is that the testing and analysis has indicated that doing a full
hard reset is not necessary. We are about to take the very action which will fix
this situation, but currently do not.

Please describe the advantage in deferring it further by routing it through
do_hard_reset().  I don't see one.

Rick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F4143E6B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 18:58:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgBbd25Wnz3cQJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:58:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aqeEOID1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aqeEOID1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgBZX5HYqz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 03:57:56 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SFl9vZ008345; 
 Thu, 28 Oct 2021 16:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=c0JbqTpFjhGSp79mAPo+AdUKlu4drc5njvF9ZCKAiAA=;
 b=aqeEOID1RmW6Vkx1PlH97SLS6OpdQ+x5uPv4FGQ3Xpon9T9LxEPGQTlf3cS40lr9gkcD
 p49gheHPBzqLXQgWVNQJqltw+dwFu+PD/DRMUU/aLOSNOvsfWvJrgp87Rt9r6PVcE/3t
 1I2yrkyC1vldwAL27h6euZiAe3asf3yVa2x81oPG53mIw/4CasnHQpmuze5lrWkADHaG
 dXoTsJuo7QjLpRXP2p87+klBnE5wq/BwIlf5K1Tx6pxqDS/yWoSDpocnoZawlf6XR6lN
 MKzNYnuxbH/wb4HLktM0sbC5ElTbs4NN5iNB6I3RRmtMxiQB4BB2lVw90U87C1AI/D33 1A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byxtd9km6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 16:57:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19SGlrL6014195;
 Thu, 28 Oct 2021 16:57:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3bx4eeb9qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 16:57:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19SGvmXI54067588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 16:57:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 279BE5204E;
 Thu, 28 Oct 2021 16:57:48 +0000 (GMT)
Received: from [9.43.16.206] (unknown [9.43.16.206])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 78BFF5204F;
 Thu, 28 Oct 2021 16:57:47 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier
 during module unload
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20210928120933.196571-1-hegdevasant@linux.vnet.ibm.com>
 <87r1d5mg1a.fsf@linkitivity.dja.id.au>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Message-ID: <b4b9310e-76a6-4d29-0cba-af7ae7ab7945@linux.vnet.ibm.com>
Date: Thu, 28 Oct 2021 22:27:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87r1d5mg1a.fsf@linkitivity.dja.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a1SAejAtsjXnktVQHvlgFUUDioYaSt-g
X-Proofpoint-GUID: a1SAejAtsjXnktVQHvlgFUUDioYaSt-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280089
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/1/21 11:40 AM, Daniel Axtens wrote:
> Hi Vasant,
> 
>> Commit 587164cd, introduced new opal message type (OPAL_MSG_PRD2) and added
>> opal notifier. But I missed to unregister the notifier during module unload
>> path. This results in below call trace if you try to unload and load
>> opal_prd module.
>>
>> Fixes: 587164cd ("powerpc/powernv: Add new opal message type")
> 
> In reviewing this patch, I've become a bit worried the underlying patch
> has another issue that we should fix.

Thanks for the review. I have addressed below comments in v2.

-Vasant


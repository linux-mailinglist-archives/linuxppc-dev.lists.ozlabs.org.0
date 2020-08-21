Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4524D0DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 10:53:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXwK72MzkzDqjV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:53:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FGRjBFog; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXwGq0V2CzDr39
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:51:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07L8W8Bj083053; Fri, 21 Aug 2020 04:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1/zOaMZKTPygQbKfBPguz4Xe4bC6bZSd5G/KDP2B0y8=;
 b=FGRjBFogBBdkXXbZYcXwAiihdlWga9jXFMcVtLPIrx42++Jjl9iftJKe6U7ZwsnXgeWJ
 v8MXWy5rqf9ix5XVFNsf962VRIJDLZ8N48hClCxZ/hDyGLRQIX/Iya8c3YMUQmLpWQij
 UzinByxUDnLDMpVHdbV1++rN7dw3HMSpnU9xFYRqVRgEnuM8EOI0t5cuYmJjDmny2Ivk
 gxv/CW24OT7rLbnM9ZrUt+jxbb3TvyqTouBkqMvUAVh1r8qLpBkMOwci+XNoeNObP2d8
 /y/Xgs5YmWqul0PE59FAMGi6EYmGgc/SoyF2zWeQ9ZhWCCoh8zwAJS+w3ME/wAJplxyK Hw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 331uj48mem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 04:51:03 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07L8opl5022465;
 Fri, 21 Aug 2020 08:51:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3304cc453b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 08:51:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07L8nTP354985150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Aug 2020 08:49:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BBB6AE053;
 Fri, 21 Aug 2020 08:50:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D22FAE04D;
 Fri, 21 Aug 2020 08:50:58 +0000 (GMT)
Received: from [9.102.2.201] (unknown [9.102.2.201])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Aug 2020 08:50:57 +0000 (GMT)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <87tuwyvjei.fsf@linux.ibm.com> <856eb6d7-9c09-728e-b374-d787145ac052@arm.com>
 <46cc2987-0d1e-f8e8-ecaf-2d246b33413e@linux.ibm.com>
 <6927a5cf-4100-e43e-6aba-5d7bc0533276@arm.com>
 <9b01e909-e6c3-1e6d-ae83-249bdab84ece@linux.ibm.com>
Message-ID: <b764dcea-94e8-d2a1-6c09-c33b9073b01c@linux.ibm.com>
Date: Fri, 21 Aug 2020 14:20:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9b01e909-e6c3-1e6d-ae83-249bdab84ece@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-21_05:2020-08-19,
 2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 mlxlogscore=824 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210075
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Sure. I am hoping kernel test robot will pick this up. I did an x86 and 
> about 19 different ppc config build with the series. The git tree above 
> was pushed with that. Considering you authored the change i am wondering 
> if you could help with checking other architecture (may be atleast arm 
> variant)
> 

I updated the tree after a defconfig build on arch/arm64/s390/x86.  I 
will not be able to boot test them.

Can you help with boot testing on arm?

-aneesh

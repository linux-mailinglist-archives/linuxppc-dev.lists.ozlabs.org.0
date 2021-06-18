Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1123AC140
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:19:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5kg74hDyz3c3X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:19:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UfV9nUwW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UfV9nUwW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5kfb0Xdcz3bsW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:19:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I34TVo045909; Thu, 17 Jun 2021 23:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4HilPkXvb6bTYkKp2m1g2r9rRIauZ5FArvnRGSw46qw=;
 b=UfV9nUwWdYudz5TEFNXY7KV9yan2Pm5l8bs/mlzDiMrmIQNsj7GXx2kd6jHTGnsPGI04
 epesUdmn9UB2gtGbnMBYoSUq1RoHArRfEua/ZgkLcvlUeNe0TwH2ZRgNvVdnYg5uHRhr
 hRp7wM2lFwo1ksrNaFiRUxZ7XsCGvr/P+XfN6i0Zbm5CyVo+HMO9YyFJVtJMdMbx0tES
 dkonI4RsOMpoViKm9X+Vb2kgl07nZa7xXxMiK8wu0lquFwAZx1DXVTZpXXagM09aSPgF
 0gEiVOwEs7vSzkOK60m4mG2uYCZUIisVrHanWumPE5TcwiYGhbmsiX8fFnQbUALrmdDP fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398hrejgr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:18:53 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15I34Ux0045967;
 Thu, 17 Jun 2021 23:18:52 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398hrejgqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:18:52 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15I3F4tr032444;
 Fri, 18 Jun 2021 03:18:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3966jph664-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 03:18:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15I3IlkA23069044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 03:18:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D54334204B;
 Fri, 18 Jun 2021 03:18:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F263A42045;
 Fri, 18 Jun 2021 03:18:46 +0000 (GMT)
Received: from [9.77.205.195] (unknown [9.77.205.195])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 03:18:46 +0000 (GMT)
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com> <YMgkyfc4g+na5GJZ@yekko>
 <87czsnoejl.fsf@linux.ibm.com> <YMhKEJ9WSlapuSE6@yekko>
 <87a6nrobf6.fsf@linux.ibm.com> <YMr92K2gaidDHeqC@yekko>
 <ae4a2ec4-cb34-313b-df08-126998815e47@gmail.com>
 <87r1h0n3u6.fsf@linux.ibm.com>
 <5e180af8-9d48-7519-0b35-967065f8e3e1@gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <b2d32816-e96c-6823-b659-c1878e0b4c86@linux.ibm.com>
Date: Fri, 18 Jun 2021 08:48:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e180af8-9d48-7519-0b35-967065f8e3e1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YpBxyPnCadkad_0ZxFHhvb8OUXy17Zsz
X-Proofpoint-GUID: rSH4Hf31ELB31hu01qIK9ArddEg8KTQI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180015
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/18/21 1:30 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 6/17/21 8:11 AM, Aneesh Kumar K.V wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>
>>> On 6/17/21 4:46 AM, David Gibson wrote:
>>>> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>

> 
> 
> In fact, the more I speak about this PMEM scenario the more I wonder:
> why doesn't the PMEM driver, when switching from persistent to regular
> memory and vice-versa, take care of all the necessary updates in the
> numa-distance-table and kernel internals to reflect the current distances
> of its current mode? Is this a technical limitation?
> 
> 

I sent v4 doing something similar to this .

-aneesh


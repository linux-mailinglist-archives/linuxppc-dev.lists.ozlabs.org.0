Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223CB3B157F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 10:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8wwF64vmz3bts
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 18:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fF5r69AG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fF5r69AG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8wvj5BfVz2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 18:11:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N84KQU050994; Wed, 23 Jun 2021 04:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=i8MDSIZW/35ev9s39ALUhQOMjMh/q0RDS7Pu1CN4oDk=;
 b=fF5r69AGE6rRo+QmX/7xCrHYyndSUZx7yn+h3BmX5lgw/I7vEYdsU9fit078p9WzYjIb
 aeyJMFgSQEkT8vLCE8Dg0L7KW3tT5TFW1q4UtdbaNed2KJDRgUle9RJ+1gC8YHn83/pv
 in13oQeZloHqSXRX4r+aQMlUnMjyihNJQxCspEmpZrUTIT35+/C+I7V06HF4PGQ6DT21
 esei9VAywbQQ0k6s7yzTjmvZZLtgIym0UTXBKj6B7IrUsiC/n8tVRgWHLglO7DSKNO+p
 9JY6YhjbKGK1aezKAw8f/jNX39A5u8Z6HObQCqwn9wOYOj8EPARcrfDiimQLPrsjKncg Uw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bx95n4yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 04:10:48 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N87rII016869;
 Wed, 23 Jun 2021 08:10:47 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 399879ejf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 08:10:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N8AkPW18219498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 08:10:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 692A178069;
 Wed, 23 Jun 2021 08:10:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E7A47805F;
 Wed, 23 Jun 2021 08:10:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.33.142])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 08:10:40 +0000 (GMT)
Subject: Re: [PATCH v3 0/4] Add perf interface to expose nvdimm
To: Peter Zijlstra <peterz@infradead.org>
References: <20210617132617.99529-1-kjain@linux.ibm.com>
 <YNHiRO11E9yYS6mv@hirez.programming.kicks-ass.net>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <cea827fe-62d4-95fe-b81f-5c7bebe4a6f0@linux.ibm.com>
Date: Wed, 23 Jun 2021 13:40:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNHiRO11E9yYS6mv@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jOAojHhoEMMccKbKMSYzhidU-4waVfvF
X-Proofpoint-GUID: jOAojHhoEMMccKbKMSYzhidU-4waVfvF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_03:2021-06-22,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230048
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
Cc: nvdimm@lists.linux.dev, santosh@fossix.org, maddy@linux.vnet.ibm.com,
 ira.weiny@intel.com, rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/22/21 6:44 PM, Peter Zijlstra wrote:
> On Thu, Jun 17, 2021 at 06:56:13PM +0530, Kajol Jain wrote:
>> ---
>> Kajol Jain (4):
>>   drivers/nvdimm: Add nvdimm pmu structure
>>   drivers/nvdimm: Add perf interface to expose nvdimm performance stats
>>   powerpc/papr_scm: Add perf interface support
>>   powerpc/papr_scm: Document papr_scm sysfs event format entries
> 
> Don't see anything obviously wrong with this one.
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 

Hi Peter,
    Thanks for reviewing the patch. Can you help me on how to take 
these patches to linus tree or can you take it?

Thanks,
Kajol Jain

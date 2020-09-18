Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0426F868
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 10:33:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt6Yt360NzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 18:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f+HiGThg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt6WL4w3NzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 18:31:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08I87k8R074586; Fri, 18 Sep 2020 04:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OVwmFcDXD14Sj/el2nOYFGLk1fFCIlWriAqJljEUo+g=;
 b=f+HiGThgP4uwy/48e0sVNC+ByHLIedn9Im1NJzlCPDbf3cO2sWSf9JWtgQ8i8fdt6moK
 WxxQgA3/lBvy86scsw1iPi23TZKgtOQYIe4dEVkum5u2qm+2q7Il4Ie6eEZ4sY8/MOU0
 UMQVTqPsd3FyGfYbJUOqjFfz5Dr9303ZKQOqpgCnMMkWotXFAgw0NTHTnwh/ID+B/MqC
 VB+tzs7lrxUvHJRB2pI10HgANK7mkW99b7t3gJ/zaSbzDuK1K500LT1SYUrHBzf+EcuG
 ht9CX8iUh73UsOsJwnayqwP5eMEjbTPLA0Z7jsYIkmYgZmAK4lXGRWYiFIWoBAqh/aSF qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mrut1cpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 04:31:31 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08I839bt058396;
 Fri, 18 Sep 2020 04:31:31 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mrut1cnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 04:31:31 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08I8S312002386;
 Fri, 18 Sep 2020 08:31:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 33k9geatfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 08:31:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08I8VQ7T30736842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 08:31:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D2B411C04A;
 Fri, 18 Sep 2020 08:31:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB0A411C050;
 Fri, 18 Sep 2020 08:31:23 +0000 (GMT)
Received: from [9.199.44.250] (unknown [9.199.44.250])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Sep 2020 08:31:23 +0000 (GMT)
Subject: Re: [PATCH v6 0/8] powerpc/watchpoint: Bug fixes plus new feature flag
To: Rogerio Alves <rcardoso@linux.ibm.com>
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
 <6927523d-de63-910a-e789-5fab424c7eb9@linux.ibm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <339e69c6-947c-031b-8018-f590afe8569e@linux.ibm.com>
Date: Fri, 18 Sep 2020 14:01:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6927523d-de63-910a-e789-5fab424c7eb9@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_06:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180062
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
Cc: christophe.leroy@c-s.fr, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 mikey@neuling.org, pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jniethe5@gmail.com, rogealve@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/17/20 6:54 PM, Rogerio Alves wrote:
> On 9/2/20 1:29 AM, Ravi Bangoria wrote:
>> Patch #1 fixes issue for quardword instruction on p10 predecessors.
>> Patch #2 fixes issue for vector instructions.
>> Patch #3 fixes a bug about watchpoint not firing when created with
>>           ptrace PPC_PTRACE_SETHWDEBUG and CONFIG_HAVE_HW_BREAKPOINT=N.
>>           The fix uses HW_BRK_TYPE_PRIV_ALL for ptrace user which, I
>>           guess, should be fine because we don't leak any kernel
>>           addresses and PRIV_ALL will also help to cover scenarios when
>>           kernel accesses user memory.
>> Patch #4,#5 fixes infinite exception bug, again the bug happens only
>>           with CONFIG_HAVE_HW_BREAKPOINT=N.
>> Patch #6 fixes two places where we are missing to set hw_len.
>> Patch #7 introduce new feature bit PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
>>           which will be set when running on ISA 3.1 compliant machine.
>> Patch #8 finally adds selftest to test scenarios fixed by patch#2,#3
>>           and also moves MODE_EXACT tests outside of BP_RANGE condition.
>>
[...]

> 
> Tested this patch set for:
> - SETHWDEBUG when CONFIG_HAVE_HW_BREAKPOINT=N = OK
> - Fix exception handling for CONFIG_HAVE_HW_BREAKPOINT=N = OK
> - Check for PPC_DEBUG_FEATURE_DATA_BP_ARCH_31 = OK
> - Fix quarword instruction handling on p10 predecessors = OK
> - Fix handling of vector instructions = OK
> 
> Also tested for:
> - Set second watchpoint (P10 Mambo) = OK
> - Infinity loop on sc instruction = OK

Thanks Rogerio!

Ravi

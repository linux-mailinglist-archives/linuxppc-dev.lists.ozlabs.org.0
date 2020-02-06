Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656F154ED4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 23:17:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DCVM17s9zDqLr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 09:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gustavold@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DCSY0wCNzDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 09:16:12 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016M9mqK143667; Thu, 6 Feb 2020 17:16:08 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0nxn2wyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 17:16:08 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 016MFvLF011605;
 Thu, 6 Feb 2020 22:16:07 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 2xykc9rfkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 22:16:07 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 016MG7UJ52953518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 22:16:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC39E112061;
 Thu,  6 Feb 2020 22:16:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED92A112065;
 Thu,  6 Feb 2020 22:16:05 +0000 (GMT)
Received: from [9.85.151.5] (unknown [9.85.151.5])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 22:16:05 +0000 (GMT)
Subject: Re: [PATCH v2 2/3] selftests/powerpc: Add tm-signal-pagefault test
To: Michael Ellerman <mpe@ellerman.id.au>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200203160906.24482-1-gustavold@linux.ibm.com>
 <20200203160906.24482-2-gustavold@linux.ibm.com>
 <8736bp38o7.fsf@mpe.ellerman.id.au>
From: Gustavo Luiz Duarte <gustavold@linux.vnet.ibm.com>
Message-ID: <4c4295c6-c2d3-0e83-68aa-dc8770c80381@linux.vnet.ibm.com>
Date: Thu, 6 Feb 2020 19:16:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8736bp38o7.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060161
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
Cc: mikey@neuling.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/5/20 2:27 AM, Michael Ellerman wrote:
> Gustavo Luiz Duarte <gustavold@linux.ibm.com> writes:
>> This test triggers a TM Bad Thing by raising a signal in transactional state
>> and forcing a pagefault to happen in kernelspace when the kernel signal
>> handling code first touches the user signal stack.
>>
>> This is inspired by the test tm-signal-context-force-tm but uses userfaultfd to
>> make the test deterministic. While this test always triggers the bug in one
>> run, I had to execute tm-signal-context-force-tm several times (the test runs
>> 5000 times each execution) to trigger the same bug.
> 
> Using userfaultfd is a very nice touch. But it's not always enabled,
> which leads to eg:
> 
>    root@mpe-ubuntu-le:~# /home/michael/tm-signal-pagefault
>    test: tm_signal_pagefault
>    tags: git_version:v5.5-9354-gc1e346e7fc44
>    userfaultfd() failed: Function not implemented
>    failure: tm_signal_pagefault
> 
> It would be nice if that resulted in a skip, not a failure.
> 
> It looks like it shouldn't be too hard to skip if the userfaultfd call
> returns ENOSYS.

Good point. I will fix that on v3.

> 
> cheers
> 

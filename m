Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA7168F0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 14:19:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ppnj4prrzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Feb 2020 00:19:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PplP0bPFzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2020 00:17:19 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01MD5Xsl041697
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 08:17:16 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb15ywsgx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 08:17:16 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Sat, 22 Feb 2020 13:17:14 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 22 Feb 2020 13:17:12 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01MDHBtJ46072260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Feb 2020 13:17:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB040A404D;
 Sat, 22 Feb 2020 13:17:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BB04A4040;
 Sat, 22 Feb 2020 13:17:00 +0000 (GMT)
Received: from [9.199.56.192] (unknown [9.199.56.192])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 22 Feb 2020 13:16:59 +0000 (GMT)
Subject: Re: [PATCH] powerpc/watchpoint: Don't call dar_within_range() for
 Book3S
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200222082049.330435-1-ravi.bangoria@linux.ibm.com>
 <d2aad6ea-5b61-7321-13a6-5faef361c57d@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Sat, 22 Feb 2020 18:46:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d2aad6ea-5b61-7321-13a6-5faef361c57d@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022213-0016-0000-0000-000002E9447B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022213-0017-0000-0000-0000334C6734
Message-Id: <22698949-553b-c15d-27b1-983d3fb47507@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-22_03:2020-02-21,
 2020-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002220116
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/22/20 4:56 PM, Christophe Leroy wrote:
> 
> 
> On 02/22/2020 08:20 AM, Ravi Bangoria wrote:
>> DAR is set to the first byte of overlap between actual access and
>> watched range at DSI on Book3S processor. But actual access range
>> might or might not be within user asked range. So for Book3S, it
>> must not call dar_within_range().
>>
>> This revert portion of commit 39413ae00967 ("powerpc/hw_breakpoints:
>> Rewrite 8xx breakpoints to allow any address range size.").
>>
>> Before patch:
>>    # ./tools/testing/selftests/powerpc/ptrace/perf-hwbreak
>>    ...
>>    TESTED: No overlap
>>    FAILED: Partial overlap: 0 != 2
>>    TESTED: Partial overlap
>>    TESTED: No overlap
>>    FAILED: Full overlap: 0 != 2
>>    failure: perf_hwbreak
>>
>> After patch:
>>    TESTED: No overlap
>>    TESTED: Partial overlap
>>    TESTED: Partial overlap
>>    TESTED: No overlap
>>    TESTED: Full overlap
>>    success: perf_hwbreak
>>
>> Fixes: 39413ae00967 ("powerpc/hw_breakpoints: Rewrite 8xx breakpoints to allow any address range size.")
> 
> Oh, this seems to have been introduced by 27985b2a640e ("powerpc/watchpoint: Don't ignore extraneous exceptions blindly").
> 
> I must have lost it through a rebase as we were doing our series approximately at the same time, sorry for that.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

No worries. Thanks for the review :)

Ravi


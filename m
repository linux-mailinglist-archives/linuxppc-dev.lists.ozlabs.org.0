Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E6D5A0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 05:48:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s4KJ71CzzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 14:48:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s4FX38xxzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 14:45:04 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9E3g4sT062318
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 23:45:01 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vkafs6p99-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 23:45:01 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 14 Oct 2019 04:44:58 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 14 Oct 2019 04:44:56 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9E3it3x47513922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 03:44:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8316752059;
 Mon, 14 Oct 2019 03:44:55 +0000 (GMT)
Received: from [9.124.31.69] (unknown [9.124.31.69])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E4B3552051;
 Mon, 14 Oct 2019 03:44:53 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v4 0/5] Powerpc/Watchpoint: Few important fixes
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20190925040630.6948-1-ravi.bangoria@linux.ibm.com>
 <19b222ce-3013-7de5-1c04-48c6fd00fe81@linux.ibm.com>
 <0d98e256-44ee-f920-cb2f-f79545584769@c-s.fr>
 <3e31e5f7-f948-512a-054c-9ad10103ccc0@linux.ibm.com>
 <de06dac0-3103-64ed-0e97-c2b6972c59c2@c-s.fr>
Date: Mon, 14 Oct 2019 09:14:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <de06dac0-3103-64ed-0e97-c2b6972c59c2@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101403-0028-0000-0000-000003A9C539
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101403-0029-0000-0000-0000246BD56F
Message-Id: <4a6d9aa3-4e6b-0e32-9000-156b49559c8c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=972 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140034
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/12/19 2:21 PM, Christophe Leroy wrote:
> 
> 
> Le 10/10/2019 à 06:44, Ravi Bangoria a écrit :
>>
>>>> @Christophe, Is patch5 works for you on 8xx?
>>>>
>>>
>>> Getting the following :
>>>
>>> root@vgoip:~# ./ptrace-hwbreak
>>> test: ptrace-hwbreak
>>> tags: git_version:v5.4-rc2-710-gf0082e173fe4-dirty
>>> PTRACE_SET_DEBUGREG, WO, len: 1: Ok
>>> PTRACE_SET_DEBUGREG, WO, len: 2: Ok
>>> PTRACE_SET_DEBUGREG, WO, len: 4: Ok
>>> PTRACE_SET_DEBUGREG, WO, len: 8: Ok
>>> PTRACE_SET_DEBUGREG, RO, len: 1: Ok
>>> PTRACE_SET_DEBUGREG, RO, len: 2: Ok
>>> PTRACE_SET_DEBUGREG, RO, len: 4: Ok
>>> PTRACE_SET_DEBUGREG, RO, len: 8: Ok
>>> PTRACE_SET_DEBUGREG, RW, len: 1: Ok
>>> PTRACE_SET_DEBUGREG, RW, len: 2: Ok
>>> PTRACE_SET_DEBUGREG, RW, len: 4: Ok
>>> PTRACE_SET_DEBUGREG, RW, len: 8: Ok
>>> PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
>>> PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
>>> PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
>>> PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO, len: 6: Ok
>>> PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RO, len: 6: Fail
>>> failure: ptrace-hwbreak
>>>
>>
> 
> I also tried on a 83xx (book3s/32). This one has a regular DABR :
> 
> root@vgoippro:~# ./ptrace-hwbreak
> test: ptrace-hwbreak
> tags: git_version:v5.4-rc2-710-gf0082e173fe4-dirty
> PTRACE_SET_DEBUGREG, WO, len: 1: Ok
> PTRACE_SET_DEBUGREG, WO, len: 2: Ok
> PTRACE_SET_DEBUGREG, WO, len: 4: Ok
> PTRACE_SET_DEBUGREG, WO, len: 8: Ok
> PTRACE_SET_DEBUGREG, RO, len: 1: Ok
> PTRACE_SET_DEBUGREG, RO, len: 2: Ok
> PTRACE_SET_DEBUGREG, RO, len: 4: Ok
> PTRACE_SET_DEBUGREG, RO, len: 8: Ok
> PTRACE_SET_DEBUGREG, RW, len: 1: Ok
> PTRACE_SET_DEBUGREG, RW, len: 2: Ok
> PTRACE_SET_DEBUGREG, RW, len: 4: Ok
> PTRACE_SET_DEBUGREG, RW, len: 8: Ok
> PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
> PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
> PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
> PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO, len: 6: Ok
> PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RO, len: 6: Ok
> PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RW, len: 6: Ok
> PPC_PTRACE_SETHWDEBUG failed: Invalid argument

Ok. If it has the DABR _only_, creation of MODE RANGE UNALINGED breakpoint
will failed because DABR supports only 8 bytes wide breakpoint and it must
be doubleword aligned.

So this means I've to add all unaligned tests inside if (dawr) condition.

Ravi


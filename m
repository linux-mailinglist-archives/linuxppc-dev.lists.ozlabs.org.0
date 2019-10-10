Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91ED1FC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 06:46:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pdnm3Z8KzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 15:46:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pdlk2k0mzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 15:44:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9A4fZId007004
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 00:44:13 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vhqexs3tw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 00:44:13 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Thu, 10 Oct 2019 05:44:11 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Oct 2019 05:44:08 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9A4i72M42992074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 04:44:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 356945204F;
 Thu, 10 Oct 2019 04:44:07 +0000 (GMT)
Received: from [9.124.31.69] (unknown [9.124.31.69])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9E9D252050;
 Thu, 10 Oct 2019 04:44:05 +0000 (GMT)
Subject: Re: [PATCH v4 0/5] Powerpc/Watchpoint: Few important fixes
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20190925040630.6948-1-ravi.bangoria@linux.ibm.com>
 <19b222ce-3013-7de5-1c04-48c6fd00fe81@linux.ibm.com>
 <0d98e256-44ee-f920-cb2f-f79545584769@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Thu, 10 Oct 2019 10:14:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <0d98e256-44ee-f920-cb2f-f79545584769@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19101004-0028-0000-0000-000003A8B5B6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101004-0029-0000-0000-0000246ABC78
Message-Id: <3e31e5f7-f948-512a-054c-9ad10103ccc0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=934 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100042
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


>> @Christophe, Is patch5 works for you on 8xx?
>>
> 
> Getting the following :
> 
> root@vgoip:~# ./ptrace-hwbreak
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
> PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RO, len: 6: Fail
> failure: ptrace-hwbreak
> 

Thanks Christophe. I don't have any 8xx box. I checked qemu and it seems
qemu emulation for 8xx is not yet supported. So I can't debug this. Can
you please check why it's failing?

-Ravi


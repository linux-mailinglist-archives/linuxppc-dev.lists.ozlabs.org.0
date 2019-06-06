Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3736E6B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 10:22:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KJZ20Kl2zDqJK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 18:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KJXW0fjgzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 18:21:30 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x568HQRo133279
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 04:21:27 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sxv7eg9q8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 04:21:27 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Thu, 6 Jun 2019 09:21:25 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 09:21:22 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x568LLRj63045844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 08:21:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B92C6A405B;
 Thu,  6 Jun 2019 08:21:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B507A4054;
 Thu,  6 Jun 2019 08:21:21 +0000 (GMT)
Received: from localhost (unknown [9.122.211.182])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 08:21:21 +0000 (GMT)
Date: Thu, 06 Jun 2019 13:51:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] Powerpc/Watchpoint: Restore nvgprs while returning from
 exception
To: mpe@ellerman.id.au, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20190606072951.32116-1-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20190606072951.32116-1-ravi.bangoria@linux.ibm.com>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19060608-4275-0000-0000-0000033F4CA3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060608-4276-0000-0000-0000384F5055
Message-Id: <1559809100.x2v1my2997.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060061
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
Cc: mikey@neuling.org, mahesh@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria wrote:
> Powerpc hw triggers watchpoint before executing the instruction.
> To make trigger-after-execute behavior, kernel emulates the
> instruction. If the instruction is 'load something into non-
> volatile register', exception handler should restore emulated
> register state while returning back, otherwise there will be
> register state corruption. Ex, Adding a watchpoint on a list
> can corrput the list:
>=20
>   # cat /proc/kallsyms | grep kthread_create_list
>   c00000000121c8b8 d kthread_create_list
>=20
> Add watchpoint on kthread_create_list->next:
>=20
>   # perf record -e mem:0xc00000000121c8c0
>=20
> Run some workload such that new kthread gets invoked. Ex, I
> just logged out from console:
>=20
>   list_add corruption. next->prev should be prev (c000000001214e00), \
> 	but was c00000000121c8b8. (next=3Dc00000000121c8b8).
>   WARNING: CPU: 59 PID: 309 at lib/list_debug.c:25 __list_add_valid+0xb4/=
0xc0
>   CPU: 59 PID: 309 Comm: kworker/59:0 Kdump: loaded Not tainted 5.1.0-rc7=
+ #69
>   ...
>   NIP __list_add_valid+0xb4/0xc0
>   LR __list_add_valid+0xb0/0xc0
>   Call Trace:
>   __list_add_valid+0xb0/0xc0 (unreliable)
>   __kthread_create_on_node+0xe0/0x260
>   kthread_create_on_node+0x34/0x50
>   create_worker+0xe8/0x260
>   worker_thread+0x444/0x560
>   kthread+0x160/0x1a0
>   ret_from_kernel_thread+0x5c/0x70
>=20
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Awesome catch - this one has had a glorious run...
Fixes: 5aae8a5370802 ("powerpc, hw_breakpoints: Implement hw_breakpoints fo=
r 64-bit server processors")

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

=


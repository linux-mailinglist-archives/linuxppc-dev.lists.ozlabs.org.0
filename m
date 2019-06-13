Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E844E0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 23:04:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Px7H416PzDrPQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 07:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=pc@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Px3072rQzDrFD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 07:00:22 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5DKrfKO083804
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 17:00:19 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t3u7pegkm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 17:00:19 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <pc@us.ibm.com>;
 Thu, 13 Jun 2019 22:00:18 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Jun 2019 22:00:16 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5DL0Fdu38338998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 21:00:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B11A28066;
 Thu, 13 Jun 2019 21:00:15 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F3032805E;
 Thu, 13 Jun 2019 21:00:15 +0000 (GMT)
Received: from oc3272150783.ibm.com (unknown [9.80.231.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Jun 2019 21:00:15 +0000 (GMT)
Subject: Re: sys_exit: NR -1
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>
References: <2f004b41-4f6f-3e6f-227a-cb199b8429d2@us.ibm.com>
 <1560320989.8h9se8cb9p.naveen@linux.ibm.com>
From: Paul Clarke <pc@us.ibm.com>
Date: Thu, 13 Jun 2019 16:00:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560320989.8h9se8cb9p.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061321-0052-0000-0000-000003CF8E46
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011257; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01217536; UDB=6.00640258; IPR=6.00998648; 
 MB=3.00027299; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-13 21:00:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061321-0053-0000-0000-000061505789
Message-Id: <b3d497ac-6e87-c675-3bd3-def0baddf53e@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-13_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906130157
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

On 6/12/19 1:32 AM, Naveen N. Rao wrote:
> Paul Clarke wrote:
>> What are the circumstances in which raw_syscalls:sys_exit reports "-1" for the syscall ID?
>>
>>     perf  5375 [007] 59632.478528:   raw_syscalls:sys_enter: NR 1 (3, 9fb888, 8, 2d83740, 1, 7ffff)
>>     perf  5375 [007] 59632.478532:    raw_syscalls:sys_exit: NR 1 = 8
>>     perf  5375 [007] 59632.478538:   raw_syscalls:sys_enter: NR 15 (11, 7ffffca734b0, 7ffffca73380, 2d83740, 1, 7ffff)
>>     perf  5375 [007] 59632.478539:    raw_syscalls:sys_exit: NR -1 = 8
>>     perf  5375 [007] 59632.478543:   raw_syscalls:sys_enter: NR 16 (4, 2401, 0, 2d83740, 1, 0)
>>     perf  5375 [007] 59632.478551:    raw_syscalls:sys_exit: NR 16 = 0
> 
> Which architecture?
> For powerpc, see:
> 
> static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
> {
>     /*
>      * Note that we are returning an int here. That means 0xffffffff, ie.
>      * 32-bit negative 1, will be interpreted as -1 on a 64-bit kernel.
>      * This is important for seccomp so that compat tasks can set r0 = -1
>      * to reject the syscall.
>      */
>     return TRAP(regs) == 0xc00 ? regs->gpr[0] : -1;
> }

So, that's intentional?  And has some special meaning?  (I confess I don't understand what the comment is saying exactly.)

Is this documented?  Does something depend on this ABI?

To me, it just makes parsing more difficult, both by humans and machines.

PC


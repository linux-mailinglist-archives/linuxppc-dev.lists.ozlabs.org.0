Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05441C4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:34:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nxtb5bMCzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nxrf2jwtzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:33:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5C6VuO6082535
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 02:33:03 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t2t1amvrx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 02:33:03 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Wed, 12 Jun 2019 07:33:00 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 07:32:57 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5C6Wuxw61538430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 06:32:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1FF5A4051;
 Wed, 12 Jun 2019 06:32:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F16CA4053;
 Wed, 12 Jun 2019 06:32:56 +0000 (GMT)
Received: from localhost (unknown [9.199.37.223])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 06:32:56 +0000 (GMT)
Date: Wed, 12 Jun 2019 12:02:53 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: sys_exit: NR -1
To: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Paul Clarke <pc@us.ibm.com>
References: <2f004b41-4f6f-3e6f-227a-cb199b8429d2@us.ibm.com>
In-Reply-To: <2f004b41-4f6f-3e6f-227a-cb199b8429d2@us.ibm.com>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19061206-4275-0000-0000-000003419147
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061206-4276-0000-0000-00003851A644
Message-Id: <1560320989.8h9se8cb9p.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=876 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120045
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

Paul Clarke wrote:
> What are the circumstances in which raw_syscalls:sys_exit reports "-1" fo=
r the syscall ID?
>=20
>     perf  5375 [007] 59632.478528:   raw_syscalls:sys_enter: NR 1 (3, 9fb=
888, 8, 2d83740, 1, 7ffff)
>     perf  5375 [007] 59632.478532:    raw_syscalls:sys_exit: NR 1 =3D 8
>     perf  5375 [007] 59632.478538:   raw_syscalls:sys_enter: NR 15 (11, 7=
ffffca734b0, 7ffffca73380, 2d83740, 1, 7ffff)
>     perf  5375 [007] 59632.478539:    raw_syscalls:sys_exit: NR -1 =3D 8
>     perf  5375 [007] 59632.478543:   raw_syscalls:sys_enter: NR 16 (4, 24=
01, 0, 2d83740, 1, 0)
>     perf  5375 [007] 59632.478551:    raw_syscalls:sys_exit: NR 16 =3D 0

Which architecture?
For powerpc, see:

static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *=
regs)
{
	/*
	 * Note that we are returning an int here. That means 0xffffffff, ie.
	 * 32-bit negative 1, will be interpreted as -1 on a 64-bit kernel.
	 * This is important for seccomp so that compat tasks can set r0 =3D -1
	 * to reject the syscall.
	 */
	return TRAP(regs) =3D=3D 0xc00 ? regs->gpr[0] : -1;
}


- Naveen

=


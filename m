Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA0A5BF668
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 08:31:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXT8j0QzDz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 16:31:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b39rKPm3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b39rKPm3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXT7z1Pc9z30LJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:31:10 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6EIFw022002;
	Wed, 21 Sep 2022 06:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=vjk4eIKbdqnaddTSBrwhu12wc7vTtk5Lr5Xt0GcaCq4=;
 b=b39rKPm3+hdbLJJ9JIpIctTGtop7X4q89BLV6xWqGvtWAfAQHybnaMynVNggroBAm0t/
 DapLHg0t2RnGLZg0LKK/aOeCgZz2dgMEQ4qccr/2urORoVJzKRMkX35noSAepT33o9ea
 8BhPKaxg+uyhEdJohuQsgrLIrUDoEKu1Lrx+via9lmnV6BAPNjOBmWNzuq2GtXJs0+kA
 9TJgNSgclWCU6RQkAm8MvkAsjZDTqh7LGE/gKW6XvTHYKrpep1+70LRlt0Ub+UTsOf/C
 Ny0U8Q2YJ3eMZtpzdRIheJPd+P/m8f78IsUoe3zhqRRQS9kWp3b8ksD8gm38LreFnncn YQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw5m8dyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:31:04 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6L7EW023313;
	Wed, 21 Sep 2022 06:31:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3jn5v8kjhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:31:02 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6Qxa842205694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:26:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF40CAE04D;
	Wed, 21 Sep 2022 06:30:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C059AE045;
	Wed, 21 Sep 2022 06:30:59 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.54])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:30:58 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: [powerpc] Kernel crash with THP tests (next-20220920)
Message-Id: <C2C8DA4F-F00F-43E9-ACD8-2A8BACA55893@linux.ibm.com>
Date: Wed, 21 Sep 2022 12:00:57 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm@kvack.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FmHBtZGju_2Wpn0e6Rqc0-P0DWZ-YXBe
X-Proofpoint-GUID: FmHBtZGju_2Wpn0e6Rqc0-P0DWZ-YXBe
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=665 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210040
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
Cc: open list <linux-kernel@vger.kernel.org>, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running transparent huge page tests [1] against 6.0.0-rc6-next-202209=
20
following crash is seen on IBM Power server.

Kernel attempted to read user page (34) - exploit attempt? (uid: 0)
BUG: Kernel NULL pointer dereference on read at 0x00000034
Faulting instruction address: 0xc0000000004d2744
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
Modules linked in: dm_mod(E) bonding(E) rfkill(E) tls(E) sunrpc(E) nd_pmem(=
E) nd_btt(E) dax_pmem(E) papr_scm(E) libnvdimm(E) pseries_rng(E) vmx_crypto=
(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) crc64_rocksoft(E) crc64(=
E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) fuse(E)
CPU: 37 PID: 2219255 Comm: sysctl Tainted: G            E      6.0.0-rc6-ne=
xt-20220920 #1
NIP:  c0000000004d2744 LR: c0000000004d2734 CTR: 0000000000000000
REGS: c0000012801bf660 TRAP: 0300   Tainted: G            E       (6.0.0-rc=
6-next-20220920)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24048222  XER: 20040000
CFAR: c0000000004b0eac DAR: 0000000000000034 DSISR: 40000000 IRQMASK: 0=20
GPR00: c0000000004d2734 c0000012801bf900 c000000002a92300 0000000000000000=
=20
GPR04: c000000002ac8ac0 c000000001209340 0000000000000005 c000001286714b80=
=20
GPR08: 0000000000000034 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000028048242 c00000167fff6b00 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: c0000012801bfae8 0000000000000001 0000000000000100 0000000000000001=
=20
GPR24: c0000012801bfae8 c000000002ac8ac0 0000000000000002 0000000000000005=
=20
GPR28: 0000000000000000 0000000000000001 0000000000000000 0000000000346cca=
=20
NIP [c0000000004d2744] alloc_buddy_huge_page+0xd4/0x240
LR [c0000000004d2734] alloc_buddy_huge_page+0xc4/0x240
Call Trace:
[c0000012801bf900] [c0000000004d2734] alloc_buddy_huge_page+0xc4/0x240 (unr=
eliable)
[c0000012801bf9b0] [c0000000004d46a4] alloc_fresh_huge_page.part.72+0x214/0=
x2a0
[c0000012801bfa40] [c0000000004d7f88] alloc_pool_huge_page+0x118/0x190
[c0000012801bfa90] [c0000000004d84dc] __nr_hugepages_store_common+0x4dc/0x6=
10
[c0000012801bfb70] [c0000000004d88bc] hugetlb_sysctl_handler_common+0x13c/0=
x180
[c0000012801bfc10] [c0000000006380e0] proc_sys_call_handler+0x210/0x350
[c0000012801bfc90] [c000000000551c00] vfs_write+0x2e0/0x460
[c0000012801bfd50] [c000000000551f5c] ksys_write+0x7c/0x140
[c0000012801bfda0] [c000000000033f58] system_call_exception+0x188/0x3f0
[c0000012801bfe10] [c00000000000c53c] system_call_common+0xec/0x270
--- interrupt: c00 at 0x7fffa9520c34
NIP:  00007fffa9520c34 LR: 00000001024754bc CTR: 0000000000000000
REGS: c0000012801bfe80 TRAP: 0c00   Tainted: G            E       (6.0.0-rc=
6-next-20220920)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28002202  =
XER: 00000000
IRQMASK: 0=20
GPR00: 0000000000000004 00007fffccd76cd0 00007fffa9607300 0000000000000003=
=20
GPR04: 0000000138da6970 0000000000000006 fffffffffffffff6 0000000000000000=
=20
GPR08: 0000000138da6970 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00007fffa9a40940 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR24: 0000000000000001 0000000000000010 0000000000000006 0000000138da8aa0=
=20
GPR28: 00007fffa95fc2c8 0000000138da8aa0 0000000000000006 0000000138da6930=
=20
NIP [00007fffa9520c34] 0x7fffa9520c34
LR [00000001024754bc] 0x1024754bc
--- interrupt: c00
Instruction dump:
3b400002 3ba00001 3b800000 7f26cb78 7fc5f378 7f64db78 7fe3fb78 4bfde5b9=20
60000000 7c691b78 39030034 7c0004ac <7d404028> 7c0ae800 40c20010 7f80412d=20
---[ end trace 0000000000000000 ]---

Kernel panic - not syncing: Fatal exception

Bisect points to following patch:
commit f2f3c25dea3acfb17aecb7273541e7266dfc8842
    hugetlb: freeze allocated pages before creating hugetlb pages

Reverting the patch allows the test to run successfully.

Thanks
- Sachin

[1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/mast=
er/memory/transparent_hugepages_defrag.py=

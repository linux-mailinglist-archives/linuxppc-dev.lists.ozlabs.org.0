Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC8663E74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:43:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrnVJ1bHvz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 21:43:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r7CKwSFh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r7CKwSFh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrnTN0kDbz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 21:43:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30AAT1WR007264;
	Tue, 10 Jan 2023 10:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=+ABv3h0j8OIXwtbcwfJ0Ss5bponXeDNhMqOqcDY0Cpc=;
 b=r7CKwSFh9M/4jprYllVuH37em+g2yQWsMozrWnDpqdcXcsK/+ZQnxhRWs45GlsPE6DWf
 KpEyrf+aRtLX9de3j9G9FsSlzAPDT+2UAwcdqUbQ9+2JuW2chr947gNpsSrHDVE/a8YS
 Ms54fLgiK5VSci3T7LvdG94ljZvvWY49ThmhXI7jbwzXkBm7DvwiVF63I9B1vthPp9DU
 vW3/qkNDG0JOyNB0+PZ18rguR3SbLEjtm+Me2pc+LEXSquf6PvPGJ8ggYTWS2LvdlchY
 2vh/wfjuCBgPMhSjakHS0xJKKbPDc7BGzov8Kbpcq80O+f3u69vOEKqvOyzUpTuFEq/d Og== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n14qx2tdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 10:42:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30A83dsg000570;
	Tue, 10 Jan 2023 10:42:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3my0c6mp47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 10:42:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30AAgsRU50200926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 10:42:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8183120043;
	Tue, 10 Jan 2023 10:42:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF0B920040;
	Tue, 10 Jan 2023 10:42:53 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.16])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jan 2023 10:42:53 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: [powerpc] Boot failure kernel BUG at mm/usercopy.c:102
Message-Id: <8C9D7E49-5A75-41BE-ACCB-44FDD8FBE4D0@linux.ibm.com>
Date: Tue, 10 Jan 2023 16:12:42 +0530
To: linux-next@vger.kernel.org, mathieu.desnoyers@efficios.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fxDUG0c3KYwm_R8k8fhqIcyimVGZ7xgr
X-Proofpoint-GUID: fxDUG0c3KYwm_R8k8fhqIcyimVGZ7xgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_03,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=769 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100063
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.2.0-rc3-next-20230109 fails to boot on powerpc with following:

[ 0.444834] ------------[ cut here ]------------
[ 0.444838] kernel BUG at mm/usercopy.c:102!
[ 0.444842] Oops: Exception in kernel mode, sig: 5 [#1]
[ 0.444845] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[ 0.444849] Modules linked in:
[ 0.444853] CPU: 23 PID: 201 Comm: modprobe Not tainted =
6.2.0-rc3-next-20230109 #1
[ 0.444858] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[ 0.444862] NIP: c00000000055a934 LR: c00000000055a930 CTR: =
0000000000725d90
[ 0.444866] REGS: c000000007f937c0 TRAP: 0700 Not tainted =
(6.2.0-rc3-next-20230109)
[ 0.444871] MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 28088822 =
XER: 00000007
[ 0.444879] CFAR: c0000000002012a8 IRQMASK: 0=20
[ 0.444879] GPR00: c00000000055a930 c000000007f93a60 c0000000013b0800 =
0000000000000066=20
[ 0.444879] GPR04: 00000000ffff7fff c000000007f93880 c000000007f93878 =
0000000000000000=20
[ 0.444879] GPR08: 00000000ffff7fff 0000000000000000 c0000000025e7150 =
c0000000029672b8=20
[ 0.444879] GPR12: 0000000048088824 c000000e87bf6300 c00000000017f458 =
c0000000034b8100=20
[ 0.444879] GPR16: 000000012f18eac0 00007fffc5c095d0 00007fffc5c095d8 =
000000012f140040=20
[ 0.444879] GPR20: fcffffffffffffff 00000000001fffff 5455555555555555 =
000ffffffffffff8=20
[ 0.444879] GPR24: c00000000723a0c0 00007fffc5c09368 0000000000000000 =
00007fffc5c09370=20
[ 0.444879] GPR28: 0000000000000250 0000000000000001 c000000003017000 =
c00000000723a0c0=20
[ 0.444922] NIP [c00000000055a934] usercopy_abort+0xa4/0xb0
[ 0.444928] LR [c00000000055a930] usercopy_abort+0xa0/0xb0
[ 0.444932] Call Trace:
[ 0.444933] [c000000007f93a60] [c00000000055a930] =
usercopy_abort+0xa0/0xb0 (unreliable)
[ 0.444939] [c000000007f93ad0] [c00000000050eeb8] =
__check_heap_object+0x198/0x1d0
[ 0.444945] [c000000007f93b10] [c00000000055a7e0] =
__check_object_size+0x290/0x340
[ 0.444949] [c000000007f93b50] [c00000000060eba4] =
create_elf_tables.isra.20+0xc04/0xc90
[ 0.444956] [c000000007f93c10] [c000000000610b2c] =
load_elf_binary+0xdac/0x1320
[ 0.444962] [c000000007f93d00] [c000000000571cf0] =
bprm_execve+0x3d0/0x7c0
[ 0.444966] [c000000007f93dc0] [c000000000572b9c] =
kernel_execve+0x1ac/0x270
[ 0.444971] [c000000007f93e10] [c00000000017f5cc] =
call_usermodehelper_exec_async+0x17c/0x250
[ 0.444978] [c000000007f93e50] [c00000000000e054] =
ret_from_kernel_thread+0x5c/0x64
[ 0.444983] --- interrupt: 0 at 0x0
[ 0.444986] NIP: 0000000000000000 LR: 0000000000000000 CTR: =
0000000000000000
[ 0.444990] REGS: c000000007f93e80 TRAP: 0000 Not tainted =
(6.2.0-rc3-next-20230109)
[ 0.444994] MSR: 0000000000000000 <> CR: 00000000 XER: 00000000
[ 0.444998] CFAR: 0000000000000000 IRQMASK: 0=20
[ 0.444998] GPR00: 0000000000000000 c000000007f94000 0000000000000000 =
0000000000000000=20
[ 0.444998] GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 0.444998] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 0.444998] GPR12: 0000000000000000 0000000000000000 c00000000017f458 =
c0000000034b8100=20
[ 0.444998] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 0.444998] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 0.444998] GPR24: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 0.444998] GPR28: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 0.445039] NIP [0000000000000000] 0x0
[ 0.445042] LR [0000000000000000] 0x0
[ 0.445044] --- interrupt: 0
[ 0.445046] Code: 392990f8 48000014 3d02ffe9 390827f0 7d074378 7d094378 =
7c661b78 3c62ffe7 f9610060 386319f0 4bca6935 60000000 <0fe00000> =
00000000 00000000 7c0802a6=20
[ 0.445061] ---[ end trace 0000000000000000 ]=E2=80=94

Git bisect points to following patch:

commit 317c8194e6aeb8b3b573ad139fc2a0635856498e
     rseq: Introduce feature size and alignment ELF auxiliary vector =
entries

Reverting the patch helps boot the kernel.

Thanks
-Sachin=

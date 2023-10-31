Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7B7DCC99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 13:09:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CTjsHXGL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKTTq1gGsz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 23:09:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CTjsHXGL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKTSt68KGz300v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 23:09:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VC5BWp013894;
	Tue, 31 Oct 2023 12:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=V6NmdaSgVW3N030dFBGJpeC6MoCP5aKmyx/pwxFz4oU=;
 b=CTjsHXGLX6w751KhemgPlBkc3w1Bvlc0RMZt2+5hCbfMqXFry9ci9h7zjo3hrGXNlXf4
 FisY5mAhqrHU2KxX+5CuFRL79vQsCyDtWUxl+0JAz5UJ8O8CrDBVvJD4WSG3JPb+fPo+
 sst9pZSkDo8Xjvnf3jF61hXx9mkMbFxDDqejNPt1TvTrCTRLvJXwXSdv0v74c52IIq6W
 /TSxpvFQ6QAud9DRyL0kvBskceUDXoca0wI/+ouh2KHnB6OTl6hTsvUBwNrBc2vo483i
 nGf/YInzKDpyJc5Z5lIn5/SvGXY+kW62Ulc+sWPl8VvYIyRzOqoxHdjlXYXY8h+JNrrO 6A== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u319c88gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:08:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39V9qwgV031377;
	Tue, 31 Oct 2023 12:08:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u1fb1ynbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:08:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39VC8mVa7471658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Oct 2023 12:08:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 316AD2004B;
	Tue, 31 Oct 2023 12:08:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 047C320040;
	Tue, 31 Oct 2023 12:08:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.119.159])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Oct 2023 12:08:46 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: [ppc64le] WARN at crypto/testmgr.c:5804 
Message-Id: <2721FCA5-6113-4B2E-8DA9-893105EE966C@linux.ibm.com>
Date: Tue, 31 Oct 2023 17:38:35 +0530
To: linux-crypto@vger.kernel.org, dimitri.ledkov@canonical.com
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A9dzOTInhVy5uIoT3uDy9CKCFJsy_JPi
X-Proofpoint-ORIG-GUID: A9dzOTInhVy5uIoT3uDy9CKCFJsy_JPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_01,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=668 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310095
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
Cc: linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following warning is observed during boot of latest -next
kernel (6.6.0-rc7-next-20231030 and todays -next) on IBM Power server.

[ 0.085775] workingset: timestamp_bits=3D38 max_order=3D20 =
bucket_order=3D0
[ 0.085801] zbud: loaded
[ 0.086473] ------------[ cut here ]------------
[ 0.086477] WARNING: CPU: 23 PID: 211 at crypto/testmgr.c:5804 =
alg_test.part.33+0x308/0x740
[ 0.086486] Modules linked in:
[ 0.086489] CPU: 23 PID: 211 Comm: cryptomgr_test Not tainted =
6.6.0-rc7-next-20231030 #1
[ 0.086493] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[ 0.086497] NIP: c000000000765068 LR: c000000000764ff4 CTR: =
c00000000075da00
[ 0.086500] REGS: c00000000ed7bb50 TRAP: 0700 Not tainted =
(6.6.0-rc7-next-20231030)
[ 0.086503] MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 80000284 =
XER: 20040002
[ 0.086511] CFAR: c000000000765318 IRQMASK: 1=20
GPR00: c000000000764ff4 c00000000ed7bdf0 c000000001482000 =
0000000000000002=20
GPR04: c00000000ed7be60 000000000000000e 000000000000002f =
fffffffffffe0000=20
GPR08: 0000ff000000ffff 0000000000000001 0000000000000008 =
0000000000000000=20
GPR12: c00000000075da00 c000000aa7cec700 c00000000019da88 =
c000000006df9cc0=20
GPR16: 0000000000000000 0000000000000000 c000000001309f98 =
0000000000000000=20
GPR20: c000000001308d50 c000000001308d98 c000000000ffeaf0 =
c000000001309fb0=20
GPR24: c000000000ffb330 c000000000ffdf30 0000000000000400 =
c000000019bfd480=20
GPR28: 0000000000000002 c000000019bfd400 c000000002bcf633 =
000000000000000e=20
[ 0.086547] NIP [c000000000765068] alg_test.part.33+0x308/0x740
[ 0.086552] LR [c000000000764ff4] alg_test.part.33+0x294/0x740
[ 0.086556] Call Trace:
[ 0.086557] [c00000000ed7bdf0] [c000000000764ff4] =
alg_test.part.33+0x294/0x740 (unreliable)
[ 0.086563] [c00000000ed7bf60] [c00000000075da34] =
cryptomgr_test+0x34/0x70
[ 0.086568] [c00000000ed7bf90] [c00000000019dbb8] kthread+0x138/0x140
[ 0.086573] [c00000000ed7bfe0] [c00000000000df98] =
start_kernel_thread+0x14/0x18
[ 0.086578] Code: fb210138 fb810150 3af76d20 3b80ffff 3a526d38 3a946d50 =
3ab56d98 3b380040 3ad837c0 2f9c0000 7d301026 5529f7fe <0b090000> =
7f890034 5529d97e 419d03a4=20
[ 0.086589] ---[ end trace 0000000000000000 ]---
[ 0.086592] testmgr: alg_test_descs entries in wrong order: =
'pkcs1pad(rsa,sha512)' before 'pkcs1pad(rsa,sha3-256)=E2=80=99

Git bisect points to following patch:
commit ee62afb9d02dd279a7b73245614f13f8fe777a6d
    crypto: rsa-pkcs1pad - Add FIPS 202 SHA-3 support

- Sachin=

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D87566BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 16:47:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=buRhAy3I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Q0J1qnzz2yxs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=buRhAy3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4PzB4pCHz2yW0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 00:46:14 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36HEaQ04010337
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 14:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=4O8ipgD1PqiCINYHpbglrwspTsNvQVxq2rW7GOBomx4=;
 b=buRhAy3I4N33H1R89WsNKR+a41WOUWdNo2O4+/LP98HGeG9VWTRUhJwcknR3t3DWk7yf
 YHJGIoCpkb0IvIy7h3il3AuEVcVPvkMuAXIzr+iYCXfeHTW0kEVhQMozmJm2h9ZqTqOu
 CryeI63sFrtzAgbV4zBcPrL6LCbvVrR4XYyTRLMUkySZTrniK4kmUQSjmnB0pXO/BS+n
 hepQvY/gmST2QSFHM8Jn+rgo5TYFWcF24N1YLtuLtwqstK82sUwQC95LyDdlVZhyAvsO
 SnBimill+TxH2tnz+FHusJp5OTsrhsK3uQGiWrTC1AilFfWSbGLK9G6belim7VJ+1KYk tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw7cw0jxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 14:46:11 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36HEae7D011775
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 14:46:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw7cw0jwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 14:46:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36H9C41C016862;
	Mon, 17 Jul 2023 14:46:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv5srkaya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 14:46:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36HEk6mI9896670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 14:46:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B0F820043;
	Mon, 17 Jul 2023 14:46:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5745720040;
	Mon, 17 Jul 2023 14:46:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.42.123])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 14:46:05 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Kernel Crash Dump (kdump) broken with 6.5
Message-Id: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
Date: Mon, 17 Jul 2023 20:15:53 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bK44SgR4nhEMVQTva4HCsX0mik-zzCSj
X-Proofpoint-ORIG-GUID: H3EZ_cxvbfrgOQVuq3Up_m-SUo8p4pzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_11,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=605 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170133
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kdump seems to be broken with 6.5 for ppc64le.

[ 14.200412] systemd[1]: Starting dracut pre-pivot and cleanup hook...
[[0;32m OK [0m] Started dracut pre-pivot and cleanup hook.
Starting Kdump Vmcore Save Service...
[ 14.231669] systemd[1]: Started dracut pre-pivot and cleanup hook.
[ 14.231801] systemd[1]: Starting Kdump Vmcore Save Service...
[ 14.341035] kdump.sh[297]: kdump: saving to =
/sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
[ 14.350053] EXT4-fs (sda2): re-mounted =
e971a335-1ef8-4295-ab4e-3940f28e53fc r/w. Quota mode: none.
[ 14.345979] kdump.sh[297]: kdump: saving vmcore-dmesg.txt to =
/sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
[ 14.348742] kdump.sh[331]: Cannot open /proc/vmcore: No such file or =
directory
[ 14.348845] kdump.sh[297]: kdump: saving vmcore-dmesg.txt failed
[ 14.349014] kdump.sh[297]: kdump: saving vmcore
[ 14.443422] kdump.sh[332]: open_dump_memory: Can't open the dump =
memory(/proc/vmcore). No such file or directory
[ 14.456413] kdump.sh[332]: makedumpfile Failed.
[ 14.456662] kdump.sh[297]: kdump: saving vmcore failed, _exitcode:1
[ 14.456822] kdump.sh[297]: kdump: saving the =
/run/initramfs/kexec-dmesg.log to =
/sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
[ 14.487002] kdump.sh[297]: kdump: saving vmcore failed
[[0;1;31mFAILED[0m] Failed to start Kdump Vmcore Save Service.

6.4 was good. Git bisect points to following patch

commit 606787fed7268feb256957872586370b56af697a
    powerpc/64s: Remove support for ELFv1 little endian userspace

Reverting this patch allows a successful capture of vmcore.

Does this change require any corresponding change to kdump
and/or kexec tools?

- Sachin


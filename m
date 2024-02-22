Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E255F85F0EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 06:26:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lAw7w8NB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgM7n68Lwz3dXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lAw7w8NB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgM713ttCz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 16:25:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41M5CT6k006725
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 05:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=X4bI9N2VHyfz1WXJBZ8qFJ/koAbmb7Jw0Cd+VFprjfg=;
 b=lAw7w8NB+AWVEUMLQiJYu4i7cp3ovrlErU+gQe+SDivj+FCeS5px2FYLjpPlUa6B6cSJ
 5tOhsb8Kn5uCyoTCvpo3tLSIPY2sbTcd6Qy0gPXfOJ8F2VBO3GkcggwK3uVH+sb1DX6D
 7z/xr6zydHOAeJTdPtLPSS8CIDyJPVuSQIo40nK/c8OzH0HOCBm8iKAWAOJ5sTpPO8UL
 I6RXSDvH6h4sOqfE4xvYEKNKCZcOhXb7JIq+3p4ZGpyupwGz4Cf/tuVlVO+ATJLWZbKs
 CQXc7yfeJ7kCJvcDsuKRIkDT1D0crqcpAkz4Weigoem/vYNwcJmW4+5dg79zH5U5Lh4P 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wdywt88we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 05:25:45 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41M5Pjca012478
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 05:25:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wdywt88wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 05:25:45 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41M3g37C031153;
	Thu, 22 Feb 2024 05:25:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wb9bm3p0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 05:25:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41M5PdTR17171100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Feb 2024 05:25:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 576502004D;
	Thu, 22 Feb 2024 05:25:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C934B20040;
	Thu, 22 Feb 2024 05:25:37 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.34.141])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Feb 2024 05:25:37 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: [powerpc] Dump capture failure with recent linux-next
Message-Id: <9F885948-234F-4047-AE00-5E37C21FC22D@linux.ibm.com>
Date: Thu, 22 Feb 2024 10:55:26 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bhe@redhat.com
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5yNzMsHbRcYO7jDWnIK9qXRZeyxNQoA4
X-Proofpoint-ORIG-GUID: 5CR40c49xn0Woq54D4NfTm8qdRJFm_qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_03,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=968 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402220039
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kdump fails to save vmcore with recent linux-next builds on IBM Power =
server
with following messages

         Starting Kdump Vmcore Save Service...
[ 17.349599] kdump[367]: Kdump is using the default log level(3).
[ 17.407407] kdump[391]: saving to =
/sysroot//var/crash//127.0.0.1-2024-02-21-15:03:55/
[ 17.441270] EXT4-fs (sda2): re-mounted =
630dfb4e-74bd-45c4-a8de-232992bc8724 r/w. Quota mode: none.
[ 17.444404] kdump[395]: saving vmcore-dmesg.txt to =
/sysroot//var/crash//127.0.0.1-2024-02-21-15:03:55/
[ 17.464859] kdump[401]: saving vmcore-dmesg.txt complete
[ 17.466636] kdump[403]: saving vmcore
[ 17.551589] kdump.sh[404]:=20
Checking for memory holes : [ 0.0 %] /=20
Checking for memory holes : [100.0 %] | readpage_elf: Attempt to read =
non-existent page at 0xc000000000000.
[ 17.551718] kdump.sh[404]: readmem: type_addr: 0, =
addr:c00c000000000000, size:16384
[ 17.551793] kdump.sh[404]: __exclude_unnecessary_pages: Can't read the =
buffer of struct page.
[ 17.551864] kdump.sh[404]: create_2nd_bitmap: Can't exclude unnecessary =
pages.
[ 17.562632] kdump.sh[404]: The kernel version is not supported.
[ 17.562708] kdump.sh[404]: The makedumpfile operation may be =
incomplete.
[ 17.562773] kdump.sh[404]: makedumpfile Failed.
[ 17.564335] kdump[406]: saving vmcore failed, _exitcode:1
[ 17.566013] kdump[408]: saving the /run/initramfs/kexec-dmesg.log to =
/sysroot//var/crash//127.0.0.1-2024-02-21-15:03:55/
[ 17.583658] kdump[414]: saving vmcore failed

Git bisect points to following patch

commit 378eb24a0658dd922b29524e0ce35c6c43f56cba
    mm/vmalloc: remove vmap_area_list

Reverting this patch allows kdump to save vmcore file correctly.

Does this change require any corresponding changes to makedumpfile?

- Sachin=

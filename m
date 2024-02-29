Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECE86CAB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:54:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EuglddQq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlt4C23kzz3vdd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 00:54:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EuglddQq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlt3V59blz3d39
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 00:53:26 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41TDC2Dl014540;
	Thu, 29 Feb 2024 13:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=7NAN/HeHdSbzCETUmBemDrt3oj+C73aX5z95QNceeME=;
 b=EuglddQqY59e/8ZfSn3BsN9GK/342L+QRk9H4VPGuA+dp+5o0anREcTg+FkLL57SW2cv
 jNKWyDX6NaB7O5o51ResB9iUVd+MPfcNz8j1Sk5g+f2oX3Iy47HYBU7meT4T0sCdbP1a
 xtUIYjLE3gEgY7tmuExUrmLmXh4mKOabMQaHgOIknU23E4buz95czbZV7XvlSUUjXXua
 NAfkU37g2x9GGw9pNnSIsihl/0gQwg/e//dknGFYZepG/Xt1tvCOkR9QO0Hs9E07OLFK
 V6siW82kaWGi+6MCaV/51KW6VSCSttvmdsjSS4/pEHOTuqYR6cpe+uTjh6g3WdqhFL3R sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjtknsaap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 13:53:24 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41TDex0G005431;
	Thu, 29 Feb 2024 13:53:23 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjtknsa8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 13:53:23 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41TDaRop012312;
	Thu, 29 Feb 2024 13:53:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg2n745-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 13:53:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41TDrI8H9568830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 13:53:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A7432004B;
	Thu, 29 Feb 2024 13:53:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 537E420040;
	Thu, 29 Feb 2024 13:53:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.80.238])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 13:53:17 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: [kselftests/powerpc] Primitives test build failure with linux-next
Message-Id: <C11ED986-3959-4C4D-8780-ABD97D5FB0D1@linux.ibm.com>
Date: Thu, 29 Feb 2024 19:23:06 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tlFuWMaYGOxJ8u8g8dnzpvawlC79KxYq
X-Proofpoint-ORIG-GUID: AD9XdlWXzVfnbtjbolv_XXqXnb8bvXla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 mlxlogscore=996 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290107
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
Cc: tanzhasanwork@gmail.com, andy.shevchenko@gmail.com, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc specific selftests (specifically powerpc/primitives) included in =
linux-next
tree fails to build with following error

gcc -std=3Dgnu99 -O2 -Wall -Werror =
-DGIT_VERSION=3D'"next-20240229-0-gf303a3e2bcfb-dirty"' =
-I/home/sachin/linux-next/tools/testing/selftests/powerpc/include  =
-I/home/sachin/linux-next/tools/testing/selftests/powerpc/primitives    =
load_unaligned_zeropad.c ../harness.c  -o =
/home/sachin/linux-next/tools/testing/selftests/powerpc/primitives/load_un=
aligned_zeropad
In file included from load_unaligned_zeropad.c:26:
word-at-a-time.h:7:10: fatal error: linux/bitops.h: No such file or =
directory
    7 | #include <linux/bitops.h>
      |          ^~~~~~~~~~~~~~~~
compilation terminated.

The header file in question was last changed by following commit

commit 66a5c40f60f5d88ad8d47ba6a4ba05892853fa1f
    kernel.h: removed REPEAT_BYTE from kernel.h

Thanks
=E2=80=94 Sachin=

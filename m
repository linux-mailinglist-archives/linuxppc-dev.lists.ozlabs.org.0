Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B35621BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 20:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYmcc47DLz3dp1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 04:11:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ee74leaS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ee74leaS;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYmbt6zFXz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 04:11:06 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UHhnid032979;
	Thu, 30 Jun 2022 18:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=88WZx86HudOPmlmqtdxMaUGdFLqWwn/ZdU9TIZdzHfw=;
 b=ee74leaSvYnIQz2UIsvogJTQw92ctL4gKmh/u/mRG149J6OgFi9XvzefSgZhALk3IBJX
 HaG72UGW2mG5hNjVX9fqdOo8BWr2IvfEOGQunihEHWsqFPDnEqmqf14juvfnspNBkGEj
 ErY7pT4eWuS5WHD//KCCLJGBoP2yDaCNmtK0yKzRoMnaKkR9lCgaNxp9/zvQTwCrHn+l
 wohnNWMTOJtIpEiytBwEacUtWJH+3nq2prXLOn/6sNuqdF8JhLvGlQKxkAxbKxhmy1tY
 U1JJPE9DHz1YrgVHGw4pEn26AA+CIUzwQpEqMvMY0m23FCKbi668+fUIwI3eewx7lRf4 xg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1gg10qyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 18:11:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UI5BSm018370;
	Thu, 30 Jun 2022 18:11:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3gwt090h8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 18:11:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25UIAvNK22675890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 18:10:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA008AE055;
	Thu, 30 Jun 2022 18:10:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8056AE051;
	Thu, 30 Jun 2022 18:10:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.9.111])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 18:10:56 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: WARN at crypto/testmgr.c:5774 (next)
Message-Id: <74179C93-0D19-4A8A-81EB-07BD836A3BD3@linux.ibm.com>
Date: Thu, 30 Jun 2022 23:40:55 +0530
To: linux-crypto@vger.kernel.org, ignat@cloudflare.com
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dH9DkQw1GlHuk-TbHhjTCU6LWfgClaTS
X-Proofpoint-GUID: dH9DkQw1GlHuk-TbHhjTCU6LWfgClaTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=634 adultscore=0
 phishscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300070
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following warning is seen while booting recent -next kernel on IBM Power =
server.

[    1.544420] ------------[ cut here ]------------
[    1.544422] alg: self-tests for rsa-generic (rsa) failed (rc=3D-22)
[    1.544429] WARNING: CPU: 18 PID: 512 at crypto/testmgr.c:5774 =
alg_test+0x42c/0x850
[    1.544437] Modules linked in:
[    1.544441] CPU: 18 PID: 512 Comm: cryptomgr_test Not tainted =
5.19.0-rc4-next-20220627 #2
[    1.544446] NIP:  c0000000006fa76c LR: c0000000006fa768 CTR: =
c0000000008552e0
[    1.544448] REGS: c000000008a27980 TRAP: 0700   Not tainted  =
(5.19.0-rc4-next-20220627)
[    1.544451] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28008822  XER: 20040005
[    1.544458] CFAR: c000000000154114 IRQMASK: 0=20
[    1.544458] GPR00: c0000000006fa768 c000000008a27c20 c000000002a8ff00 =
0000000000000035=20
[    1.544458] GPR04: 00000000ffff7fff c000000008a279e0 c000000008a279d8 =
0000000000000000=20
[    1.544458] GPR08: 00000000ffff7fff 0000000000000000 c0000000025c6ff8 =
c000000002947160=20
[    1.544458] GPR12: 0000000000008000 c0000009afff3f00 c00000000018c6f8 =
c0000000070c5180=20
[    1.544458] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    1.544458] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
c000000000f1c230=20
[    1.544458] GPR24: 0000000000000000 c00000000e679080 0000000000000400 =
ffffffffffffffff=20
[    1.544458] GPR28: c00000000e679000 000000000000000d c000000002d814a8 =
ffffffffffffffea=20
[    1.544491] NIP [c0000000006fa76c] alg_test+0x42c/0x850
[    1.544495] LR [c0000000006fa768] alg_test+0x428/0x850
[    1.544499] Call Trace:
[    1.544500] [c000000008a27c20] [c0000000006fa768] =
alg_test+0x428/0x850 (unreliable)
[    1.544505] [c000000008a27d90] [c0000000006f8df0] =
cryptomgr_test+0x40/0x70
[    1.544510] [c000000008a27dc0] [c00000000018c814] kthread+0x124/0x130
[    1.544514] [c000000008a27e10] [c00000000000cdf4] =
ret_from_kernel_thread+0x5c/0x64
[    1.544518] Instruction dump:
[    1.544520] 409e02e0 3d22002f 892915d1 2f890000 409e02d0 3c62fe77 =
7f25cb78 7f84e378=20
[    1.544526] 7fe6fb78 3863ac78 4ba59949 60000000 <0fe00000> fa2100f8 =
fa410100 fa610108=20
[    1.544532] ---[ end trace 0000000000000000 ]=E2=80=94

Git bisect points to the following patch.

# git bisect bad
f145d411a67efacc0731fc3f9c7b2d89fb62523a is the first bad commit
commit f145d411a67efacc0731fc3f9c7b2d89fb62523a
    crypto: rsa - implement Chinese Remainder Theorem for faster private =
key operations

Reverting the patch helps avoid this boot time warning.

- Sachin=

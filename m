Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815F6D2433
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:42:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp4KL5v94z3fTV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:41:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OTJWbur3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OTJWbur3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp4Gf5Gncz3fRH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:39:38 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VDcdWs022563;
	Fri, 31 Mar 2023 15:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UpblJDU7vz76uVVRKDbjzEDuGN2orkZu8ubqezXdWbs=;
 b=OTJWbur3s7IbBmMNrVsQpr0xoy5xbM6TsEE29muFuNCkorilSyW0HeecFJm6Q7yy957F
 BXTwz+ST4yVCWAE8ubCd36XYuACR4FC2lEePBy6JS9CVCO2ZPYAuNQ1Ql4hlRwMe9XFP
 XRYx6ZqSh1QXnZSyw7wxvxRXMBzr3+iXJqbBnr7hihsDqNY32TXj9sbF2iR6TMaFFy2d
 My/qktrPFcSTUE5r0vnc8kyxb2NV4ApjU50qhdZXFe/dCu/oMcVU9M153Gnu8eIKtC4I
 V+45YvpvpoDdgIqc+TrxmhYA52lPMcvH5ITI08sJaVvqOf6jAKN9UoLIjlLzFvrI8vT/ cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnyyx47xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:39:30 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VEqurx015243;
	Fri, 31 Mar 2023 15:39:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnyyx47t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:39:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32UKhWc9019202;
	Fri, 31 Mar 2023 15:39:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6pw6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:39:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32VFdGJA25428694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Mar 2023 15:39:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8F4E20043;
	Fri, 31 Mar 2023 15:39:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1613D20040;
	Fri, 31 Mar 2023 15:39:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.179.0.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Mar 2023 15:39:15 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 0/2] Online new threads according to the current SMT level
Date: Fri, 31 Mar 2023 17:39:03 +0200
Message-Id: <20230331153905.31698-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QIhdxJvQkW_D27aogd9MPS49xoIDn8XO
X-Proofpoint-ORIG-GUID: eRf1oP8p4BOZ73N2skgpM0sMxePKXi_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=947 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310123
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
Cc: nathanl@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a new CPU is added, the kernel is activating all its threads. This
leads to weird, but functional, result when adding CPU on a SMT 4 system
for instance.

Here the newly added CPU 1 has 8 threads while the other one has 4 threads
active (system has been booted with the 'smt-enabled=4' kernel option):

ltcden3-lp12:~ # ppc64_cpu --info
Core   0:    0*    1*    2*    3*    4     5     6     7
Core   1:    8*    9*   10*   11*   12*   13*   14*   15*

This mixed SMT level is confusing end users and some application like
lparstat are reporting wrong values.

There is no SMT level recorded in the kernel, neither in user space. Such a
level could be helpful when adding new CPU or when optimizing the energy
efficiency. This series introduce a new SYS FS entry named 'pseries_smt' to
store the current SMT level.

The SMT level is provided in best effort, writing a new value into that
entry is only recording it into the kernel. This way, it can be used when
new CPU are onlined for instance. There is no real change to the CPU setup
when a value is written, no CPU are onlined or offlined.

At boot time `pseries_smt` is loaded with smt_enabled_at_boot which is
containing the SMT level set at boot time, even if no kernel option is
specified.

The change is specific to pseries since CPU hot-plug is only provided for
this platform.

The second patch of this series is implementing the change to online only
the right number of threads when a new CPU is added.

Laurent Dufour (2):
  pseries/smp: export the smt level in the SYS FS.
  powerpc/pseries/cpuhp: respect current SMT when adding new CPU

 arch/powerpc/platforms/pseries/hotplug-cpu.c | 18 ++++++---
 arch/powerpc/platforms/pseries/pseries.h     |  3 ++
 arch/powerpc/platforms/pseries/smp.c         | 39 ++++++++++++++++++++
 3 files changed, 55 insertions(+), 5 deletions(-)

-- 
2.40.0


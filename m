Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F009424B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 05:04:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aOapW2Fb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYcPf6v9dz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 13:04:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aOapW2Fb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYcNB0x9cz3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 13:02:49 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V0TV4Z011905;
	Wed, 31 Jul 2024 03:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=Cw63VamFp7AmPOSAUxa/qTud2ZXpcxSEr76YQB2
	tW38=; b=aOapW2FbziOEpRepubMdrr6A+vh1BVuaOkUUiH4xb+vBge3clMlpKb3
	AhC+paMDMuIINDawhSbvERBpSnozneoiHVf0Dg1unxOKjynYBW8jfAQDEGnWYxqV
	km1cdsp2dbHruzIb2xing1Ari8xCyrwf2lkPQZAEwuCYCP6+BsbH10vEW2E0Rgvk
	/m/0o/SgC1wR8yJIh5FXInea22BJ+lcYohGH7qW4TvhopISTY8ldZDxnd/JFD5Dg
	5xfE/0DqDN2RsCM+BRE63TxCc0UftQ58vNj4wnWFNfLaaEAvXCn4uxL9+7v7nGpq
	iU0ROnmLfas8EMreibrrPw0nqMd1eaw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q9vh8ahf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:02:06 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46V3266n020717;
	Wed, 31 Jul 2024 03:02:06 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q9vh8ahb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:02:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46V2rU2A011155;
	Wed, 31 Jul 2024 03:02:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40ncqmrufc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:02:04 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46V31xXJ53739994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 03:02:01 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1741620043;
	Wed, 31 Jul 2024 03:01:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CD5B20040;
	Wed, 31 Jul 2024 03:01:53 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com.com (unknown [9.43.68.49])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jul 2024 03:01:52 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 0/2] Skip offline cores when enabling SMT on PowerPC
Date: Wed, 31 Jul 2024 08:31:11 +0530
Message-ID: <20240731030126.956210-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1RWiwBguWtvjASUZd3xOLv90iT6QqSpU
X-Proofpoint-GUID: BcFpmrep9d0bPBXfrSFi534L0ryxfdBC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_21,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310019
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Laurent Dufour <ldufour@linux.ibm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Nysal Jan K.A" <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Nysal Jan K.A" <nysal@linux.ibm.com>

After the addition of HOTPLUG_SMT support for PowerPC [1] there was a
regression reported [2] when enabling SMT. On a system with at least
one offline core, when enabling SMT, the expectation is that no CPUs
of offline cores are made online.

On a POWER9 system with 4 cores in SMT4 mode:
$ ppc64_cpu --info
Core   0:    0*    1*    2*    3*
Core   1:    4*    5*    6*    7*
Core   2:    8*    9*   10*   11*
Core   3:   12*   13*   14*   15*

Turn only one core on:
$ ppc64_cpu --cores-on=1
$ ppc64_cpu --info
Core   0:    0*    1*    2*    3*
Core   1:    4     5     6     7
Core   2:    8     9    10    11
Core   3:   12    13    14    15

Change the SMT level to 2:
$ ppc64_cpu --smt=2
$ ppc64_cpu --info
Core   0:    0*    1*    2     3
Core   1:    4     5     6     7
Core   2:    8     9    10    11
Core   3:   12    13    14    15

As expected we see only two CPUs of core 0 are online

Change the SMT level to 4:
$ ppc64_cpu --smt=4
$ ppc64_cpu --info
Core   0:    0*    1*    2*    3*
Core   1:    4*    5*    6*    7*
Core   2:    8*    9*   10*   11*
Core   3:   12*   13*   14*   15*

The CPUs of offline cores are made online. If a core is offline then
enabling SMT should not online CPUs of this core. An arch specific
function topology_is_core_online() is proposed to address this.

topology_sibling_cpumask() might not be available yet for the to be
brought up CPU, so it cannot be relied upon to detect an offline core.

v2:
 * Document PowerPC specific behaviour when enabling SMT

v1:
 https://lore.kernel.org/all/20240612185046.1826891-1-nysal@linux.ibm.com/

[1] https://lore.kernel.org/lkml/20230705145143.40545-1-ldufour@linux.ibm.com/
[2] https://groups.google.com/g/powerpc-utils-devel/c/wrwVzAAnRlI/m/5KJSoqP4BAAJ

Nysal Jan K.A (2):
  cpu/SMT: Enable SMT only if a core is online
  powerpc/topology: Check if a core is online

 Documentation/ABI/testing/sysfs-devices-system-cpu |  3 ++-
 arch/powerpc/include/asm/topology.h                | 13 +++++++++++++
 kernel/cpu.c                                       | 12 +++++++++++-
 3 files changed, 26 insertions(+), 2 deletions(-)


base-commit: 94ede2a3e9135764736221c080ac7c0ad993dc2d
-- 
2.35.3


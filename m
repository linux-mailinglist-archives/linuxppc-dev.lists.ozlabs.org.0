Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C395AA1A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 23:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJZQ74dZ2z306K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 07:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ket3w1/A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ket3w1/A;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJZPR5m6Fz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 07:46:35 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281LUgSW031933;
	Thu, 1 Sep 2022 21:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=r2ZqQzsxMzMBvy51gRpn7fAMC1irQrpsOuT7QpcOflw=;
 b=Ket3w1/Aq7qOEsc1YWBmSvfDetKV0jycPNgjtk3WQz4+UqU9QmMUv2aY7WA9w2pHCekL
 wO0oTAuRi0TJNALLyyK9+8vfuOAWj20F2UsS+5D7XPsKaWI3WG/SEbT5aygf8que9ukB
 5GUp+vkg8ka3NP9Hl4yvISnny3swTxU1LyF+rF07evkOPGS2C+MCbwHtU0/6eulxYlNp
 Pk00G4vRokI7ualg5vnFn418SdkAS1PmPLqVM59mqzSF7M96TtdAXVOPw4lh73yocgeQ
 HMTtznSqxXpH4uxnh/hpcr+7btmzBHJiXYsOiYiQCuGxkmV3qnzA9z5JPYnHJ2qrUH9E 8A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jb4qg0h3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 21:46:23 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 281LaGBO019083;
	Thu, 1 Sep 2022 21:46:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma02dal.us.ibm.com with ESMTP id 3j7awa4v52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 21:46:22 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 281LkL3S15860208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 21:46:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E35A5C6057;
	Thu,  1 Sep 2022 21:46:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DE01C6055;
	Thu,  1 Sep 2022 21:46:20 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  1 Sep 2022 21:46:20 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 0/4] tpm: Preserve TPM measurement log across kexec (ppc64)
Date: Thu,  1 Sep 2022 17:46:06 -0400
Message-Id: <20220901214610.768645-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GsA1unPRsVQRw4jZ6R8Ro8Eu6KpIZ5_9
X-Proofpoint-GUID: GsA1unPRsVQRw4jZ6R8Ro8Eu6KpIZ5_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=757 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010094
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
Cc: nayna@linux.ibm.com, nasastry@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of-tree subsystem does not currently preserve the IBM vTPM 1.2 and
vTPM 2.0 measurement logs across a kexec on PowerVM and PowerKVM. This
series fixes this for the kexec_file_load() syscall using the flattened
device tree (fdt) to carry the TPM measurement log's buffer across kexec.

   Stefan

v8:
 - Added Jarkko's, Coiby's, and Rob's tags
 - Rebase on v6.0-rc3 that absorbed 2 already upstreamed patches

v7:
 - Added Nageswara's Tested-by tags
 - Added back original comment to inline function and removed Jarkko's R-b tag

v6:
 - Add __init to get_kexec_buffer as suggested by Jonathan
 - Fixed issue detected by kernel test robot

v5:
 - Rebased on 1 more patch that would otherwise create merge conflicts

v4:
 - Rebased on 2 patches that would otherwise create merge conflicts;
   posting these patches in this series with several tags removed so
   krobot can test the series already
 - Changes to individual patches documented in patch descripitons

v3:
 - Moved TPM Open Firmware related function to drivers/char/tpm/eventlog/tpm_of.c

v2:
 - rearranged patches
 - fixed compilation issues for x86

Palmer Dabbelt (1):
  drivers: of: kexec ima: Support 32-bit platforms

Stefan Berger (3):
  tpm: of: Make of-tree specific function commonly available
  of: kexec: Refactor IMA buffer related functions to make them reusable
  tpm/kexec: Duplicate TPM measurement log in of-tree for kexec

 drivers/char/tpm/eventlog/of.c |  31 +--
 drivers/of/kexec.c             | 336 ++++++++++++++++++++++++++++-----
 include/linux/kexec.h          |   6 +
 include/linux/of.h             |   9 +-
 include/linux/tpm.h            |  36 ++++
 kernel/kexec_file.c            |   6 +
 6 files changed, 346 insertions(+), 78 deletions(-)


base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
-- 
2.35.1


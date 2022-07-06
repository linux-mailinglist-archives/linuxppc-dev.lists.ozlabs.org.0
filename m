Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C7568CAF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:26:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdNfr3TJVz3drb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 01:26:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9xKkZ/o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9xKkZ/o;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdNc575Plz3bm5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 01:23:49 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266EWNj2008525;
	Wed, 6 Jul 2022 15:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GqfdF8L1josTjn4gSKMpVt2e0w3DxLAN0XMqncZijg8=;
 b=a9xKkZ/o84iXC1aTc03gyo+GcQmCDIVOR47/iBPOXzKhG4N6xE7tjbKkyhSLQNREage1
 Pwx2bc343HnMaghT4+5JD+mJENXPHDsfkHrtDt1m9AZ7QsanYPXwzb/IfpbxVcXGPeyE
 DGF3kw2KF+xatgzTN9LPV/bT4v1Fq6B3QkVnMc41K3qqyxM6LUNSWQkoFQ/9mygJr8xG
 ZpYy/4B1HooUP+QZCbuT9C2vbXFGTLoY6kFH8RP96lRpZ0A0ScwpSiG9xeSbMrCqAONZ
 YiHPc5tvnkU1hSmPO5l4opPx3ZOlDWynnXlPruVpylKgjC9js8Q7TKj/vzomACRZBzZy BQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5as4c91b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 15:23:39 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 266FLTkq002931;
	Wed, 6 Jul 2022 15:23:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma01wdc.us.ibm.com with ESMTP id 3h4ud1n7yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 15:23:39 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 266FNccK32506212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Jul 2022 15:23:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40B82112061;
	Wed,  6 Jul 2022 15:23:38 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27BD9112064;
	Wed,  6 Jul 2022 15:23:38 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed,  6 Jul 2022 15:23:38 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/6] tpm: Preserve TPM measurement log across kexec (ppc64)
Date: Wed,  6 Jul 2022 11:23:23 -0400
Message-Id: <20220706152329.665636-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 74g5zCz-hh4mOnUkq2FRI6sXOvCKh7b6
X-Proofpoint-ORIG-GUID: 74g5zCz-hh4mOnUkq2FRI6sXOvCKh7b6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=605 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060060
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

Jonathan McDowell (1):
  x86/kexec: Carry forward IMA measurement log on kexec

Palmer Dabbelt (1):
  drivers: of: kexec ima: Support 32-bit platforms

Stefan Berger (3):
  tpm: of: Make of-tree specific function commonly available
  of: kexec: Refactor IMA buffer related functions to make them reusable
  tpm/kexec: Duplicate TPM measurement log in of-tree for kexec

Vaibhav Jain (1):
  of: check previous kernel's ima-kexec-buffer against memory bounds

 arch/x86/Kconfig                      |   1 +
 arch/x86/include/uapi/asm/bootparam.h |   9 +
 arch/x86/kernel/e820.c                |   6 +-
 arch/x86/kernel/kexec-bzimage64.c     |  42 +++-
 arch/x86/kernel/setup.c               |  63 +++++
 drivers/char/tpm/eventlog/of.c        |  31 +--
 drivers/of/kexec.c                    | 341 ++++++++++++++++++++++----
 include/linux/ima.h                   |   5 +
 include/linux/kexec.h                 |   6 +
 include/linux/of.h                    |  10 +-
 include/linux/tpm.h                   |  27 ++
 kernel/kexec_file.c                   |   6 +
 security/integrity/ima/ima_kexec.c    |   2 +-
 13 files changed, 467 insertions(+), 82 deletions(-)


base-commit: 03c765b0e3b4cb5063276b086c76f7a612856a9a
-- 
2.35.1


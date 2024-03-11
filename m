Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B987806B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 14:21:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aB0Qh6IM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttcqd6883z3dXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 00:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aB0Qh6IM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttcpw1chtz3039
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 00:20:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42BCI8Jw005870;
	Mon, 11 Mar 2024 13:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Bi0JfFIbxmrcO+JuI0s9tGF/rGitvqCliyhjBRUI4WQ=;
 b=aB0Qh6IMn9z1nanQJpB/CND3ub4ikrLKpxlETU57Cnau4ghjmEUdxP5m73op+JTLZIfN
 ywT338ZmIyPLt1JbGrxyGyyUZYjjTuhKraxGsjGMnnu1yMd5g+S7aA1k+743nEBO783r
 /XU1DrDoUzoIl0I1Rr/s9wlgFvAl0d5UOPdbFYsXm8uN8U60S1uUSTouNJqJ9YHQBNFh
 ikc/xwpUEsIHZWeVPrdpp6uxiR0TGcuEnxt44NCByexrxJZLz2ZikSzEKKRzjOvxyc8A
 egQma2RZg5N4GkbKp5jaYJvsO62CLngjT7TtclDKwtOjgPEQtKCre418X34QppPZFkIm LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt1ub18s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:46 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42BCdvp5002135;
	Mon, 11 Mar 2024 13:20:46 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt1ub18rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:46 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42BCWaqc018575;
	Mon, 11 Mar 2024 13:20:45 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t1r7d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:45 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42BDKfLL49873394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Mar 2024 13:20:44 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A692F58052;
	Mon, 11 Mar 2024 13:20:41 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0944F5806B;
	Mon, 11 Mar 2024 13:20:41 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Mar 2024 13:20:40 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: mpe@ellerman.id.au, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 0/3] Preserve TPM log across kexec
Date: Mon, 11 Mar 2024 09:20:27 -0400
Message-ID: <20240311132030.1103122-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xr-xHkLmF9h3KYaSDuSM45usL_Xs_Pz6
X-Proofpoint-ORIG-GUID: jSeJUwI5ej7dkFGgywgbufOlky76KrWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=736 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403110100
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series resolves an issue on PowerVM and KVM on Power where the memory
the TPM log was held in may become inaccessible or corrupted after a kexec
soft reboot. The solution on these two platforms is to store the whole log
in the device tree because the device tree is preserved across a kexec with
either of the two kexec syscalls.

Regards,
   Stefan

v2:
 - Added DT bindings patch (2/3)
 - Reformulated commit messages and addded Fixes tags
 - Follow Michael's suggestion on prom_init patch (1/3)

Stefan Berger (3):
  powerpc/prom_init: Replace linux,sml-base/sml-size with linux,sml-log
  dt-bindings: tpm: Add linux,sml-log to ibm,vtpm.yaml
  tpm: of: If available use linux,sml-log to get the log and its size

 .../devicetree/bindings/tpm/ibm,vtpm.yaml     | 20 +++++++++--
 .../devicetree/bindings/tpm/tpm-common.yaml   | 14 +++++++-
 arch/powerpc/kernel/prom_init.c               | 27 +++++++++-----
 drivers/char/tpm/eventlog/of.c                | 36 ++++++-------------
 4 files changed, 61 insertions(+), 36 deletions(-)

-- 
2.43.0


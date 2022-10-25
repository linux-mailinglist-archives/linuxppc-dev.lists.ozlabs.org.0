Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F11760C2C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 06:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxKHS72YWz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 15:49:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=osw9iwXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=osw9iwXq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxK9M4Kwlz3bjm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 15:44:39 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P3n3AU026271;
	Tue, 25 Oct 2022 04:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ICBFSdYRs1ASRd2lQmSzhfbm6hPrzEIYWRhD+COAbiE=;
 b=osw9iwXqUoiFQl5DDMq6XWPs8eWwYfDHO7MjCXBzw0Tj2PN6kfWAz+7JRJPGGk7e4hqz
 udY7aJ2eU+r7UCDfJmYCSWBZ+3R/fLjOZUSagXzNmVwf8AtHsK9t1nAS4PzGAPl5FNT4
 ZR48cFCqjY4GJ/nHySLfZohc1PIg38+2L21X29QE0M8cwmYCCNR9vRB2s/6Dj5Xksck+
 jm4fIIopOqCB962hG/2oxAqHShA7d7jMvacnney4PQ7Z89IZUKcFZUb8jK3jLBLBqhFF
 HCuwcvuURZz4r5Lm9rnpq3Aad19q0uUmnebkeVsdA9Sin75yQWpce7H5LB9wXlIKAhpc Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke87u9ed7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:28 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P4II4L020384;
	Tue, 25 Oct 2022 04:44:27 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke87u9ecs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:27 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P4LeGQ025508;
	Tue, 25 Oct 2022 04:44:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3kc859kex9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P4iNl62097906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 04:44:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61BAE5204E;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0BF5E5204F;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3A89D600BA;
	Tue, 25 Oct 2022 15:44:21 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 0/7] Use per-CPU temporary mappings for patching on Radix MMU
Date: Tue, 25 Oct 2022 15:44:02 +1100
Message-Id: <20221025044409.448755-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yAEHHCHOvnO_Bo_qAGq2rbzP_6iqu4PM
X-Proofpoint-GUID: ln9kUb9cs1TrbRwmt7RScMLOmiUAnVLI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxlogscore=511 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250024
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a revision of Chris and Jordan's series to introduce a per-cpu temporary
mm to be used for patching with strict rwx on radix mmus.

v9:	* Fixed patch series name to include "on Radix MMU" again
	* Renamed breakpoint functions
	* Introduce patch to gracefully return when patching not possible
	* Make book3s/32/tlbflush.h TLB page flush implementation a warning
	* Removed temp_mm_state
	* Consolidate patching context into single struct shared by both paths

Previous versions:
v8: https://lore.kernel.org/all/20221021052238.580986-1-bgray@linux.ibm.com/
v7: https://lore.kernel.org/all/20211110003717.1150965-1-jniethe5@gmail.com/
v6: https://lore.kernel.org/all/20210911022904.30962-1-cmr@bluescreens.de/
v5: https://lore.kernel.org/all/20210713053113.4632-1-cmr@linux.ibm.com/
v4: https://lore.kernel.org/all/20210429072057.8870-1-cmr@bluescreens.de/
v3: https://lore.kernel.org/all/20200827052659.24922-1-cmr@codefail.de/
v2: https://lore.kernel.org/all/20200709040316.12789-1-cmr@informatik.wtf/
v1: https://lore.kernel.org/all/20200603051912.23296-1-cmr@informatik.wtf/
RFC: https://lore.kernel.org/all/20200323045205.20314-1-cmr@informatik.wtf/
x86: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/


Benjamin Gray (7):
  powerpc: Allow clearing and restoring registers independent of saved
    breakpoint state
  powerpc/code-patching: Handle RWX patching initialisation error
  powerpc/code-patching: Use WARN_ON and fix check in poking_init
  powerpc/code-patching: Verify instruction patch succeeded
  powerpc/tlb: Add local flush for page given mm_struct and psize
  powerpc/code-patching: Use temporary mm for Radix MMU
  powerpc/code-patching: Consolidate and cache per-cpu patching context

 arch/powerpc/include/asm/book3s/32/tlbflush.h |   9 +
 .../include/asm/book3s/64/tlbflush-hash.h     |   5 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/include/asm/debug.h              |   2 +
 arch/powerpc/include/asm/nohash/tlbflush.h    |   8 +
 arch/powerpc/kernel/process.c                 |  38 ++-
 arch/powerpc/lib/code-patching.c              | 252 +++++++++++++++++-
 7 files changed, 305 insertions(+), 17 deletions(-)


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
--
2.37.3

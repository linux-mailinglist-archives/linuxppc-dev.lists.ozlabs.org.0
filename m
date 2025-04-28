Return-Path: <linuxppc-dev+bounces-8106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76485A9F44F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 17:24:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmS0W2LBNz30Nl;
	Tue, 29 Apr 2025 01:24:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745853851;
	cv=none; b=eaMYt2m+SPRiOvA7JGa6cx8C1r+EmvHSkjWJW9sXhvGBWa3j6zU2BUqFqX8e6JsqcEhZ9QeKWbAKouhc/A+haqS6sOSPGjJo+xHDQo4lT7w5u32eyc0fE6jkXhux9heofeK71YYBhb1PWi4pG6mhcbe6G9Tom5d8/CV8EYEmYuM9hwMEboAtP1tBVQLsSzhl+hbNcyIa3rLT4w0xk+IZth3wD8TFpxjX7SXp4Q1d7X8gGzr91VRwp0ORzquTnIgnuT3L80YSLRcBmuQBaZKBYo8OVdvIMrRf4zYH0K26Y/sOypHsB/iNiNo8ubn8fhhXUalR4yW8YehIeLztz85pMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745853851; c=relaxed/relaxed;
	bh=fwHaxczBR7yQD6/R7nlEMeprDyL/dgd7UkBYm4zCmSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClBZUvwl80pOpVuhz7njD+sgMNaq2jwUP413my48AvY/6x4pDWYGVSNk7hYxkioQwIDYTGpUdVDNNsVbk0Ke5ZJwVI7R++llGLrhjiynxKZHLhsKcpQg8B4m0jIsn28xeqbgYa/UPTyTbJVvYBikRkhDMQU/VwZ9rJQN23Eod7yRjsDtGdivg1o4oAFdEivxAPk1KPXI3RBOZEKDKL9fFoH5k4FZ/U3PxW7/4lUXZCEEdOHyAHPsaXHjCf+xOe21TKkMdBdKwLvbLzU4P7z1TdXU/Tz2jYTpdgZ5918Zeny/ttrIBHWuAoLU06FThUVPkI4PQmlPogSxYKilB9aY1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PFZphABG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PFZphABG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmS0V3dwBz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 01:24:10 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SCuQ5X001912;
	Mon, 28 Apr 2025 15:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fwHaxczBR7yQD6/R7
	nlEMeprDyL/dgd7UkBYm4zCmSs=; b=PFZphABGPhOdbuAfSId0VtvZaDZ9Rmx5+
	BjXhCbowZjcQGURoOvlqstm5+sQCHVCPYWjOV7OtoZ6qpkob3C2C8uZc42Zuu9BF
	mn5cFHzQ17pu1D2qKYYbY82USvFhRFex+7H4TZ9eJaRhNVSisywb7aBe8iZMkXAI
	xrHLkGtq2GE9Qrk8ZDfaQ7wMjNcrQ0uMZaPeS5h5rF+ebcwqAl5jQW24z9NeZeij
	psrlHfQSQySixhPlAilYUDRwoze0zCaclf0rbQaGgKRCkUWdwlwdgOijmMe8pbgD
	4La1whAcLVPIP5cDOJOQepkuqSaOKmBgyhREv9dfq6Lyhi5uximLQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469xj0unem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SFE18H015303;
	Mon, 28 Apr 2025 15:23:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469xj0uneg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SCnbPu008518;
	Mon, 28 Apr 2025 15:23:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch2xq93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SFNmG020971838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:23:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA50A20040;
	Mon, 28 Apr 2025 15:23:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D822620043;
	Mon, 28 Apr 2025 15:23:42 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.30.54])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 15:23:42 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, sshegde@linux.ibm.com,
        bigeasy@linutronix.de, kees@kernel.org, oleg@redhat.com,
        peterz@infradead.org, tzimmermann@suse.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mcgrof@kernel.org, rppt@kernel.org,
        atrajeev@linux.vnet.ibm.com, anjalik@linux.ibm.com,
        coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Subject: [RFC V1 4/6] powerpc: Add flag in paca for register restore state
Date: Mon, 28 Apr 2025 20:52:25 +0530
Message-ID: <20250428152225.66044-7-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428152225.66044-2-mchauras@linux.ibm.com>
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O5prXhxbgXtqtZqsDc8dN7eMM6GyMqI7
X-Authority-Analysis: v=2.4 cv=GJYIEvNK c=1 sm=1 tr=0 ts=680f9d8a cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=Kj5IoVDe1b0y73Rl6aEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNCBTYWx0ZWRfX3z+ZrzZTIW9M 0SDDaMiu35cTYgSpqCmtsVuG3W5eho6YoeLFf9sPMzNfDuHUH0zAHzR5DEgqhdPUldsoB2qKl2J IWp3evivlyzAbWlyEx8rk4shVVtocD6yVuwNkV0PLjc3Q5U6D3q4t7R7wSLxfAaWsk5Bw+tjXd7
 5damFaTR4KNq8F6OPKSjstBv0valRMsRFCAJ3Ilma7kmKlRBeU/EL73fTXkCyn50FyaH7y1UcKq yXAFCv30/Cp6cSZ31HmL8sA/kHJmvtFac53ZE+idA9OR7eU6adwwpAT0cyavPjcmaaDmnzSxV2/ D+UxMtfxNeJZTrgeGM2x3nbBDT+io3UnuhkH3p2IQNgkHLfp6Wz45ok+fHF0uLIvjPD2w7T2iJJ
 GI7nuv7u0e0IYdYbEiRv/ZJeVL3lTs/JwIA6srnqJ9jD+DV2/dvkmrMApElne7SQWquOwfzM
X-Proofpoint-ORIG-GUID: Nu1XezD8osXlo9WblDfB_6U8i7CFyL2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=898
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280124
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In case of signal being processed we want to restore the GPRS. To save the state
of whether we need to restore the registers or not a flag is introduced so that
we can save the state for that cpu in case we want to save the register state.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/paca.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 1d58da9467396..215cafd64d8f5 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -174,6 +174,7 @@ struct paca_struct {
 	u8 irq_soft_mask;		/* mask for irq soft masking */
 	u8 irq_happened;		/* irq happened while soft-disabled */
 	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
+	u8 generic_fw_flags;		/* Flags for generic framework */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	u8 pmcregs_in_use;		/* pseries puts this in lppaca */
 #endif
-- 
2.49.0



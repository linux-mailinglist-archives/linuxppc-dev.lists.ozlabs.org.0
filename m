Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B7375999
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 19:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbgtL5rHNz3bTl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 03:43:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq3LqVEf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=phps=kb=linux.ibm.com=mahesh@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kq3LqVEf; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbgsq3865z2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 03:43:26 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4Fbgsp0Wq8z9sWY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 03:43:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Fbgsp0LTXz9sWk; Fri,  7 May 2021 03:43:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kq3LqVEf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Fbgsn2Xf8z9sWY
 for <linuxppc-dev@ozlabs.org>; Fri,  7 May 2021 03:43:24 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146HXbul049153
 for <linuxppc-dev@ozlabs.org>; Thu, 6 May 2021 13:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=AT2/QYEDBz3wV1OVYJYd19jHQbAV3LUgbpxbMon0LAI=;
 b=kq3LqVEfPcCydnuxfyqgcKMTo/zcHRsLV3cY5ZZztw18Ks/Dpk9w4JVTVq8ZmjeAJCla
 AcA2wzQ6/Iux1I0eEU5i5Y2pG3tz2kZkYrJuXme0u3/jp9/bmiVSQEV8VR0PuolkXT6I
 PhnJEK5Z7UIx5kdKXwF8rWlVMctZFTtGgKlCkbZEWxHexeeQOg20CQPGZVR1CMCO09Um
 wgqsBGBymauBJj4faRHDikIylVhYrzDubRBBxOHFWDCmE2vwmPu4BquKeFjuAq0fHeMW
 UTC9HOYxQVv8BeLeTHQ3yV2UeQNVH+pQJnpVOgiCHAqX2CMknK2D4DxiPnTXe4xBxxJ4 iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38cmbs9a5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 May 2021 13:43:22 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 146HYFkS057066
 for <linuxppc-dev@ozlabs.org>; Thu, 6 May 2021 13:43:21 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38cmbs9a5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 13:43:21 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146HbvVo021411;
 Thu, 6 May 2021 17:43:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 38bee88m0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 17:43:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 146HhHmf32899448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 17:43:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6712DA4053;
 Thu,  6 May 2021 17:43:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E67B0A4051;
 Thu,  6 May 2021 17:43:16 +0000 (GMT)
Received: from [127.0.0.1] (unknown [9.199.58.100])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 May 2021 17:43:16 +0000 (GMT)
Subject: [PATCH] powerpc/eeh: skip slot presence check when PE is temporarily
 unavailable.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Thu, 06 May 2021 23:13:15 +0530
Message-ID: <162032297784.225551.1220900342102038880.stgit@jupiter>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qzNIxp5zGbCoyHlKDNdf_WgI2lSRIUhM
X-Proofpoint-ORIG-GUID: ShfBDr2uK6Q2K0NTOLKaKWCsBcAsRLI6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_10:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060120
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When certain PHB HW failure causes phyp to recover PHB, it marks the PE
state as temporarily unavailable. In this case, per PAPR, rtas call
ibm,read-slot-reset-state2 returns a PE state as temporarily unavailable(5)
and OS has to wait until that recovery is complete. During this state the
slot presence check 'get-sensor-state(dr-entity-sense)' returns as DR
connector empty which leads to assumption that the device has been
hot-removed. This results into no EEH recovery on this device and it stays
in failed state forever.

This patch fixes this issue by skipping slot presence check only if device
PE state is temporarily unavailable(5).

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h   |    1 +
 arch/powerpc/kernel/eeh.c        |   14 ++++++++++++--
 arch/powerpc/kernel/eeh_driver.c |   18 ++++++++++++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index b1a5bba2e0b94..5dc5538e39b62 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -64,6 +64,7 @@ struct pci_dn;
 #define EEH_PE_RECOVERING	(1 << 1)	/* Recovering PE	*/
 #define EEH_PE_CFG_BLOCKED	(1 << 2)	/* Block config access	*/
 #define EEH_PE_RESET		(1 << 3)	/* PE reset in progress */
+#define EEH_PE_TEMP_UNAVAIL	(1 << 4)	/* PE is temporarily unavailable */
 
 #define EEH_PE_KEEP		(1 << 8)	/* Keep PE on hotplug	*/
 #define EEH_PE_CFG_RESTRICTED	(1 << 9)	/* Block config on error */
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 7040e430a1249..7fcbf3df18583 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -405,7 +405,8 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
 	    (ret == EEH_STATE_NOT_SUPPORT) || eeh_state_active(ret)) {
 		ret = 0;
 		goto out;
-	}
+	} else if (ret == EEH_STATE_UNAVAILABLE)
+		eeh_pe_state_mark(phb_pe, EEH_PE_TEMP_UNAVAIL);
 
 	/* Isolate the PHB and send event */
 	eeh_pe_mark_isolated(phb_pe);
@@ -519,14 +520,23 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * We will punt with the following conditions: Failure to get
 	 * PE's state, EEH not support and Permanently unavailable
 	 * state, PE is in good state.
+	 *
+	 * Certain PHB HW failure causes phyp/hypervisor to recover PHB and
+	 * until that recovery completes, the PE's state is temporarily
+	 * unavailable (EEH_STATE_UNAVAILABLE). In this state the slot
+	 * presence check must be avoided since it may not return valid
+	 * status. Mark this PE status as temporarily unavailable so
+	 * that we can check it later.
 	 */
+
 	if ((ret < 0) ||
 	    (ret == EEH_STATE_NOT_SUPPORT) || eeh_state_active(ret)) {
 		eeh_stats.false_positives++;
 		pe->false_positives++;
 		rc = 0;
 		goto dn_unlock;
-	}
+	} else if (ret == EEH_STATE_UNAVAILABLE)
+		eeh_pe_state_mark(pe, EEH_PE_TEMP_UNAVAIL);
 
 	/*
 	 * It should be corner case that the parent PE has been
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 3eff6a4888e79..a0913768f33de 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -851,6 +851,17 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		return;
 	}
 
+	/*
+	 * When PE's state is temporarily unavailable, the slot
+	 * presence check returns as DR connector empty. This leads
+	 * to assumption that the device is hot-removed and causes EEH
+	 * recovery to stop leaving the device in failed state forever.
+	 * Hence skip the slot presence check if PE's state is
+	 * temporarily unavailable and go down EEH recovery path.
+	 */
+	if (pe->state & EEH_PE_TEMP_UNAVAIL)
+		goto skip_slot_presence_check;
+
 	/*
 	 * When devices are hot-removed we might get an EEH due to
 	 * a driver attempting to touch the MMIO space of a removed
@@ -871,6 +882,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		goto out; /* nothing to recover */
 	}
 
+skip_slot_presence_check:
 	/* Log the event */
 	if (pe->type & EEH_PE_PHB) {
 		pr_err("EEH: Recovering PHB#%x, location: %s\n",
@@ -953,6 +965,12 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		}
 	}
 
+	/*
+	 * Now that we finished waiting for PE state as per PAPR,
+	 * clear the PE temporarily unavailable state.
+	 */
+	eeh_pe_state_clear(pe, EEH_PE_TEMP_UNAVAIL, true);
+
 	/* Since rtas may enable MMIO when posting the error log,
 	 * don't post the error log until after all dev drivers
 	 * have been informed.



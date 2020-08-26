Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320C25293B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 10:31:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bbzc33JFGzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 18:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PUnIUVxZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbzYV4T9vzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 18:29:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q82aPu130867; Wed, 26 Aug 2020 04:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Y9P5BWzOUt8HFbZCzRH08lsl6F+ct9Iazl8gkfdueXk=;
 b=PUnIUVxZ4NUzu8fhjBMc/Gbg7xJaBL6TMtzTMeo4lwFjRZp+GKUmL3PlpjA+NOLKFh6N
 AHGqn+G7OidniuHzNEwcW/NOnTyghHwbnlj6QM5ICY6pWkR6+e+1yMDvY0anAbfeDNx6
 WoJzmVW0PouTfNTLvvuX4wrirU3KCTx/oWAamktKohvN82jwb2/p+PGGKr5cgDgwCWRD
 z9t3j5pF2Nuceo/aGrhItaKPxOi3GHkUOpkfhLceeqQ0lu4C+Ofy22YqW1kW+yoF7RM5
 V+i+1OmjgCWgqkyDauPiK66grL3QkBXVucZiv93k51zUPxC2NIadfFcmsW2N5TS7kw6o 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335ks10y1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 04:29:27 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q82hes131790;
 Wed, 26 Aug 2020 04:29:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335ks10y0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 04:29:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q8Rfxt025561;
 Wed, 26 Aug 2020 08:29:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 33498ua823-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 08:29:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07Q8TLLa24248578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Aug 2020 08:29:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3689011C05B;
 Wed, 26 Aug 2020 08:29:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9002211C050;
 Wed, 26 Aug 2020 08:29:19 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.74.150])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Aug 2020 08:29:19 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 mikey@neuling.org, ego@linux.vnet.ibm.com, svaidy@linux.ibm.com,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com,
 psampat@linux.ibm.com
Subject: [PATCH] Revert "powerpc/powernv/idle: Replace CPU feature check with
 PVR check"
Date: Wed, 26 Aug 2020 13:59:18 +0530
Message-Id: <20200826082918.89306-1-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_03:2020-08-25,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260058
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cpuidle stop state implementation has minor optimizations for P10
where hardware preserves more SPR registers compared to P9.
The current P9 driver works for P10, although does few extra
save-restores. P9 driver can provide the required power management
features like SMT thread folding and core level power savings
on a P10 platform.

Until the P10 stop driver is available, revert the commit which
allows for only P9 systems to utilize cpuidle and blocks all
idle stop states for P10.
Cpu idle states are enabled and tested on the P10 platform
with this fix.

This reverts commit 8747bf36f312356f8a295a0c39ff092d65ce75ae.

Fixes: 8747bf36f312 ("powerpc/powernv/idle: Replace CPU feature check with PVR check")
Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 @mpe: This revert would resolve a staging issue wherein the P10 stop
 driver is not yet ready while cpuidle stop states need not be blocked
 on 5.9 for Power10 systems which could cause SMT folding related
 performance issues.

 The P10 stop driver is in the works here:
 https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html

 arch/powerpc/platforms/powernv/idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 77513a80cef9..345ab062b21a 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1223,7 +1223,7 @@ static void __init pnv_probe_idle_states(void)
 		return;
 	}
 
-	if (pvr_version_is(PVR_POWER9))
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		pnv_power9_idle_init();
 
 	for (i = 0; i < nr_pnv_idle_states; i++)
-- 
2.25.4


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1073A7684
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 07:32:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3xlh0Q5Dz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:32:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=otetFQyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=otetFQyb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3xl83sJmz3023
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 15:31:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F52two066095; Tue, 15 Jun 2021 01:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4Jo+wloOhTVpusr0tEvEX1Il4b2ovzD+qqFolo8u2Qw=;
 b=otetFQybVWYPMWV9+gjzOVHXhIKEvv9WfEl7CxaLjEdmQiCoZPWJLVgtV+4IsXGq1i4D
 60C0tJlqDUSsnkOgNeLizN03/3IiEVC1Iuh2oOozM7TB0Imr9U4RgRcOwFhdH78uzQBu
 ZO++809G9UrjNJy7YVW2nAIwJ8KCFRFmGQNC6yujOHT/cEFU39e52xsrQmtNnSaT8cME
 hE10jclvpBk8cGUoW9MDz2h02vbNRzqUQr3kFuoNFyZfx1+Gn4UgfsAtT5DmKEgzaOTK
 8jjLqlcRPy5bahDu7CSXKdoUI8KKSeTLjJWYhbVfiazoV/dPLZ8QnhaoM5KbMNiF2zbL eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396jvqm919-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 01:31:43 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F53F8E067435;
 Tue, 15 Jun 2021 01:31:42 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396jvqm90e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 01:31:42 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F54F88011819;
 Tue, 15 Jun 2021 05:09:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 394mj8gpse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:09:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F59qp923462324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 05:09:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B12EEAE053;
 Tue, 15 Jun 2021 05:09:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B498AAE045;
 Tue, 15 Jun 2021 05:09:50 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.73.10])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 05:09:50 +0000 (GMT)
From: "Pratik R. Sampat" <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, rjw@rjwysocki.net, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH] cpufreq:powernv: Fix init_chip_info initialization in numa=off
Date: Tue, 15 Jun 2021 10:39:49 +0530
Message-Id: <20210615050949.10071-1-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SKDaanE3us43nTJ6FyQPr1iywCTVjCJa
X-Proofpoint-ORIG-GUID: lfsQl-IxXxWbt6VI71loKXch2L3mrSBW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150029
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

In the numa=off kernel command-line configuration init_chip_info() loops
around the number of chips and attempts to copy the cpumask of that node
which is NULL for all iterations after the first chip.

Hence adding a check to bail out after the first initialization if there
is only one node.

Fixes: 053819e0bf84 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>
Reported-by: Shirisha Ganta <shirishaganta1@ibm.com>
---
 drivers/cpufreq/powernv-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index e439b43c19eb..663f9c4b5e3a 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -1078,6 +1078,8 @@ static int init_chip_info(void)
 		INIT_WORK(&chips[i].throttle, powernv_cpufreq_work_fn);
 		for_each_cpu(cpu, &chips[i].mask)
 			per_cpu(chip_info, cpu) =  &chips[i];
+		if (num_possible_nodes() == 1)
+			break;
 	}
 
 free_and_return:
-- 
2.30.2


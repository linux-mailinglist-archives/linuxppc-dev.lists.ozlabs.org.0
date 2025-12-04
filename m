Return-Path: <linuxppc-dev+bounces-14617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E570CA4D48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyZ3vgCz2ySq;
	Fri, 05 Dec 2025 04:56:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870982;
	cv=none; b=El0mT6TPPFe8h1SpxWq667Nl/a7hT0RCLtg9l38v8KHa57SBOcREyXNc9svOV/teZikCy+gCd3RH0Q85mGLgsYVI0mj6CrEtty4PbiX8s4Rix3Amf9p03K4UG9jy0vnI3MtiygfvbU+BUEhCCXGrsllbGTyjNbcI0e/5lKpol8YQlupUPTQDNbA1N7aPDaHCvdh3jO/0+gftfoyF4nEosrC//KLLgu9ukIHUEkklgHhwhBcsXIUDg7QOQDraKJOsbPV9iJeRo8DBFY4UwvsYKdS1Of/j2OsQxrqUyvOvPOgMTsyC8TZFvdwYo7srMRMiTT1KBuBdf1t5sgl5atZq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870982; c=relaxed/relaxed;
	bh=h9HJXLAxAr/bNBAaj1O+oB5I9KnYyrsRbt+7/zL5d4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frGzJn4cv8fJMejgtN0+oczbA0PXX1IcEVnv4+1s4TSFyGneF828f32eJgTqglq9JLCoSsRyqVZ2s3t+Y1Fpb1syoUjas0BjVJvDBE5rr/SIlrcANgvP4sRAbZFQSFztLCecYlLLzGF7MIhVkYbVfs9XAbWZFBH6sn/LABG8rZueFa3AI4Cee1wwwNffqcm6OFF4PFMIzRuFuoOJJUVXnQvWpM8XHTIHKbg5+yYPEsA6QUiGk6AjQPG61YUhdHTY8NjRJGayfYz9tVhJHi6XiYORjBRVoc6xdhqXu5caqnCktTBfdkb7xG4IhXqfUeRpyIy0ikUV1KgVshr+g8Qfwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ri4SSvC7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ri4SSvC7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyY5Rcnz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:21 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4BFo4q008018;
	Thu, 4 Dec 2025 17:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=h9HJXLAxAr/bNBAaj
	1O+oB5I9KnYyrsRbt+7/zL5d4U=; b=ri4SSvC7QthVZQf5pwdQnzBEU+V41P/rs
	VYaqKfd8Dokr57buu8lTff185Fqu7e7Ho+PLniNM2SJORQZwMIM+ZjXvCf9l5svh
	3Dn2Nwr6iAC4QvZw/VTA7UuY0OxjMf0iUb80O5mkjYU74dVwsMSuezZ5aOzk3SXV
	2+D+SExhAAW3nO9DzQ24hnMSobgiKYALdWjskCkIhrUlEAwVqQmzIN/icuTgFaXg
	jLhBABRj/2frCkF15M8En9d2mO+50iIef7uaS4j6C70GCdb7gZMBn2oTd2qeSEFf
	WOQ0iQfjzFG8XWpecLCb3XCyzUf4U2YFA4QDXkaBhAyUxbXJLHGtQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1tae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HtR2T009837;
	Thu, 4 Dec 2025 17:55:56 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1ta9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4Hik3w024102;
	Thu, 4 Dec 2025 17:55:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5ss9uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HtpmI22544774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9291D20043;
	Thu,  4 Dec 2025 17:55:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CB1620040;
	Thu,  4 Dec 2025 17:55:48 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:47 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 10/17] powerpc/smp: Define arch_update_cpu_topology for shared LPARs
Date: Thu,  4 Dec 2025 23:23:58 +0530
Message-ID: <20251204175405.1511340-11-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251204175405.1511340-1-srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
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
X-Proofpoint-GUID: l4JR9jDM1pD_VA4oSlDEXPnrt15NScFv
X-Proofpoint-ORIG-GUID: DCiUbeQ79lvHy67x1YWZza-xc7CBBPuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX8SYKDMWgd3GQ
 oN4rZspFHqoQgfoySF1m2+eIdRy1frSAqnrblMPIf+Yjbl/hh6LF0hBjL05szRY1paKR+Rvr353
 vmxCneLf5Wa8qf9QrcotBXGdRc0rspvfuLgIf/VSW0cj+m6qseYjy1Gn08ZrfU5rbb+q6Vtueqr
 Ql+fUbHhWrrzAiv2b2R7gCPOkEylRyKgpmMscqo6pIvkc0YCwhgpTI3Ok3eMBLTDgguFo+0LvF/
 BcjzWCsZue7VbZM9XjjTRFWEZbaWzjh7iEyP6b6iunNI4aqP29XNe0EZ8DbSHYcE8+a87k2DOiO
 4v68nobU8HnA/sp8B+zx3p5U/N7Bu1JW2SXkK3/xNS11BIwF/zBIS+0LnauBnfgRQKlevt6xGYs
 tNhT7W35ygM/QstneYLzfg+ujDwPIw==
X-Authority-Analysis: v=2.4 cv=dYGNHHXe c=1 sm=1 tr=0 ts=6931cb2d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=1omYuK1FgZOeepGw4pQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While rebuilding a sched-domain, arch_update_cpu_topology() is a way for
the architecture to tell the scheduler that there are asymmetric CPU
capacities that need to be taken care.

If arch_update_cpu_topology() returns non-zero, then scheduler shall
rebuild the topology post scanning the CPU capacities.

On Powerpc, If there are soft-offlined CPUs, then inform the scheduler
to scan for possible asymmetric CPU capacities.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/include/asm/smp.h | 3 +++
 arch/powerpc/kernel/smp.c      | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index fe6315057474..92842eda1a03 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -269,6 +269,9 @@ extern char __secondary_hold;
 extern unsigned int booting_thread_hwid;
 
 extern void __early_start(void);
+#ifdef CONFIG_PPC_SPLPAR
+int arch_update_cpu_topology(void);
+#endif /* CONFIG_PPC_SPLPAR */
 #endif /* __ASSEMBLER__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c269b38dcba5..478847d6ab7c 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1827,4 +1827,12 @@ unsigned long arch_scale_cpu_capacity(int cpu)
 	}
 	return SCHED_CAPACITY_SCALE;
 }
+
+int arch_update_cpu_topology(void)
+{
+	if (is_shared_processor() && !is_kvm_guest())
+		return (num_online_cpus() != cpumask_weight(cpu_active_mask));
+
+	return 0;
+}
 #endif /* CONFIG_PPC_SPLPAR */
-- 
2.43.7



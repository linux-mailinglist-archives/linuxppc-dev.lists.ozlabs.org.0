Return-Path: <linuxppc-dev+bounces-11824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD3B472ED
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:53:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyRr1g2nz3cZn;
	Sun,  7 Sep 2025 01:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174008;
	cv=none; b=h2SCUTvLdzyt+aO1IH/sxKx5lK4u3+khH+hy+6oXDO74eBzYm1LXrpqo4J1+t2xYNKl/qQuHY3CpyiYVuUq7VOPBTB6XLpkl1gk3xfw/lPl0TvAE7CT6KHy4fIIUFlXMNFzFxAbkQMIU5n2EgR0ZQ/MMNNya3M4FE1iHG4QcdNh9Ga27z6vzDVpIHroG6V4bnktyVvTaZx4pXl5BtpSasWBB6n+2qPwCfWedmZz2zll4NJreTZTJIFzyLWUDFYxXWjKOErI3BG0HRHZFhvZhsNWcn5CZbRZG1rPQcxKfqPlmAHMXVWcKShw19PhXyBsFpOlmX2E6JKW6lDjiJKNUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174008; c=relaxed/relaxed;
	bh=SW2OJZVB/u/sr0oFk10AQs3JP8Vbln3FuZBU/SlkQ10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhwHIeV6qj+q6Ja7sOC17ej3Uxb9SNUs8SPNm5LhX2dz2edzF4TuwknsDwnPKPT+Octv+ZON2gG93JL9/R7DrZqOE+mh/qkvufJo5sbX4OkC/XuSIYqFtpJ43AC1nAnI7TQ9MihXRSy4w4kMzWf2h96B3xzShiZag+m18Jlpu91PShEqiS23vooP+zS60QFDEnJXZocHmbuRRWb6jtiaFn8vupLWme87rHvcnlzYYVkFmO1j4aDAJ2Kcde5Cmr8U7IltXk6ehWtamTSRDVwZARmhznlJA1CcnTBcmodaA64mFgZvOpC64XsoLaBiM34A/BkJgg/EOyYOo+gSMAM1eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kb+Ha7LL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kb+Ha7LL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyRq2Twwz3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:27 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586EqUfU018499;
	Sat, 6 Sep 2025 15:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SW2OJZ
	VB/u/sr0oFk10AQs3JP8Vbln3FuZBU/SlkQ10=; b=Kb+Ha7LLtP81SmiN64dQ3k
	d2idKocWj+tJedU+SF/IPprNevpnxKHjDqqrgistF43APNksD3y2n2B+CjQWyrdO
	SukujeV5nmnKkS9Zi0rdGMXID3ObOB7xv+vzqchzqXAW3cBGK5/4FtyrdcsnHfzJ
	oIaxa+y+P7YO01yM7CkVTxFulV6c+53syXlPq3nCLxbZ11XAwUrLMrlsBJP3HdAh
	MIhJ3fZ9hnDWdH9zmMGNd4tJxpEnRqSOgozCNPDu02E5846JDXOlMQpx6SCu/KL8
	7nvrVHepbJra7eK655bdZmNppaNaX654t8p3acGUk3/hFH/TzwITJ8sB2iGOOfjw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490fgd9dfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:19 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586FrIxm026586;
	Sat, 6 Sep 2025 15:53:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490fgd9dfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586F0SDv014145;
	Sat, 6 Sep 2025 15:53:17 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3wytr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:17 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrE1f27722290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D6095805A;
	Sat,  6 Sep 2025 15:53:14 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFFA55803F;
	Sat,  6 Sep 2025 15:53:13 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:13 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 2/9] powerpc/pseries: Define HVPIPE specific macros
Date: Sat,  6 Sep 2025 08:53:00 -0700
Message-ID: <20250906155308.705926-3-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906155308.705926-1-haren@linux.ibm.com>
References: <20250906155308.705926-1-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rsoK9fZ3j6TnvJD1v0eySxbMVJByVFtA
X-Proofpoint-ORIG-GUID: KyExy9_OPdiCN4Hcqbiy_deoNTy8QCOS
X-Authority-Analysis: v=2.4 cv=b+2y4sGx c=1 sm=1 tr=0 ts=68bc58ef cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=tbc-j6YToYFr3fHOiCYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDA1MCBTYWx0ZWRfX3EjxI5z9YsP/
 Sd96X8d44UVBDqbrTM386dI/R0ej8jJRYTpLKspHQU/096kwMUv99yofJm1uCgZvAwRVOA8AFjv
 dQNtEc5Vg1y+fMdz/lfa5LvRWCabD02uWmLYaS/sO0eluKuWdeR6bm/j7ZyFMGH47W5mPhMNjeb
 M3LABfm2R/fsGhBuQsZBvBtBdnsK31oj1uVMIibsWga2IJT+NhBLduUifaHwTK/G8k+JPHuAdjl
 Q62BNWSXjwbJHRjFJzO0H5EG+TjMuQ4dekrtwKigR+9kwLl8H/IQgoKYpUmlBFAingTmcFu2H9V
 YJisMd68G5Hk2Trjmb7Btjdj0lLCdPq9isMpHrMbyD6N0nhNxb1GurZW8qjWdDVXgw7bffDg/tK
 tf8EjsvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060050
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Define HVPIPE specific macros which are needed to support
ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg RTAS calls
and used to handle HVPIPE message events.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  9 +++++++++
 arch/powerpc/kernel/rtas.c      | 24 ++++++++++++++++++++++++
 arch/powerpc/kernel/rtasd.c     |  2 ++
 3 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 75fa0293c508..d046bbd5017d 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -68,9 +68,11 @@ enum rtas_function_index {
 	RTAS_FNIDX__IBM_READ_PCI_CONFIG,
 	RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE,
 	RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2,
+	RTAS_FNIDX__IBM_RECEIVE_HVPIPE_MSG,
 	RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW,
 	RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW,
 	RTAS_FNIDX__IBM_SCAN_LOG_DUMP,
+	RTAS_FNIDX__IBM_SEND_HVPIPE_MSG,
 	RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR,
 	RTAS_FNIDX__IBM_SET_EEH_OPTION,
 	RTAS_FNIDX__IBM_SET_SLOT_RESET,
@@ -163,9 +165,11 @@ typedef struct {
 #define RTAS_FN_IBM_READ_PCI_CONFIG               rtas_fn_handle(RTAS_FNIDX__IBM_READ_PCI_CONFIG)
 #define RTAS_FN_IBM_READ_SLOT_RESET_STATE         rtas_fn_handle(RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE)
 #define RTAS_FN_IBM_READ_SLOT_RESET_STATE2        rtas_fn_handle(RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2)
+#define RTAS_FN_IBM_RECEIVE_HVPIPE_MSG		  rtas_fn_handle(RTAS_FNIDX__IBM_RECEIVE_HVPIPE_MSG)
 #define RTAS_FN_IBM_REMOVE_PE_DMA_WINDOW          rtas_fn_handle(RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW)
 #define RTAS_FN_IBM_RESET_PE_DMA_WINDOW           rtas_fn_handle(RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW)
 #define RTAS_FN_IBM_SCAN_LOG_DUMP                 rtas_fn_handle(RTAS_FNIDX__IBM_SCAN_LOG_DUMP)
+#define RTAS_FN_IBM_SEND_HVPIPE_MSG		  rtas_fn_handle(RTAS_FNIDX__IBM_SEND_HVPIPE_MSG)
 #define RTAS_FN_IBM_SET_DYNAMIC_INDICATOR         rtas_fn_handle(RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR)
 #define RTAS_FN_IBM_SET_EEH_OPTION                rtas_fn_handle(RTAS_FNIDX__IBM_SET_EEH_OPTION)
 #define RTAS_FN_IBM_SET_SLOT_RESET                rtas_fn_handle(RTAS_FNIDX__IBM_SET_SLOT_RESET)
@@ -217,6 +221,7 @@ typedef struct {
 #define RTAS_HARDWARE_ERROR             -1 /* Hardware or other unspecified error. */
 #define RTAS_BUSY                       -2 /* Retry immediately. */
 #define RTAS_INVALID_PARAMETER          -3 /* Invalid indicator/domain/sensor etc. */
+#define	RTAS_FUNC_NOT_SUPPORTED		-5 /* Function not supported */
 #define RTAS_UNEXPECTED_STATE_CHANGE    -7 /* Seems limited to EEH and slot reset. */
 #define RTAS_EXTENDED_DELAY_MIN       9900 /* Retry after delaying for ~1ms. */
 #define RTAS_EXTENDED_DELAY_MAX       9905 /* Retry after delaying for ~100s. */
@@ -233,6 +238,7 @@ typedef struct {
 #define RTAS_EPOW_WARNING		0x40000000 /* set bit 1 */
 #define RTAS_HOTPLUG_EVENTS		0x10000000 /* set bit 3 */
 #define RTAS_IO_EVENTS			0x08000000 /* set bit 4 */
+#define RTAS_HVPIPE_MSG_EVENTS		0x04000000 /* set bit 5 */
 #define RTAS_EVENT_SCAN_ALL_EVENTS	0xffffffff
 
 /* RTAS event severity */
@@ -282,6 +288,7 @@ typedef struct {
 #define RTAS_TYPE_DEALLOC		0xE3
 #define RTAS_TYPE_DUMP			0xE4
 #define RTAS_TYPE_HOTPLUG		0xE5
+#define RTAS_TYPE_HVPIPE		0xE6
 /* I don't add PowerMGM events right now, this is a different topic */
 #define RTAS_TYPE_PMGM_POWER_SW_ON	0x60
 #define RTAS_TYPE_PMGM_POWER_SW_OFF	0x61
@@ -374,6 +381,7 @@ inline uint32_t rtas_ext_event_company_id(struct rtas_ext_event_log_v6 *ext_log)
 #define PSERIES_ELOG_SECT_ID_HMC_ID		(('H' << 8) | 'M')
 #define PSERIES_ELOG_SECT_ID_EPOW		(('E' << 8) | 'P')
 #define PSERIES_ELOG_SECT_ID_IO_EVENT		(('I' << 8) | 'E')
+#define PSERIES_ELOG_SECT_ID_HVPIPE_EVENT	(('P' << 8) | 'E')
 #define PSERIES_ELOG_SECT_ID_MANUFACT_INFO	(('M' << 8) | 'I')
 #define PSERIES_ELOG_SECT_ID_CALL_HOME		(('C' << 8) | 'H')
 #define PSERIES_ELOG_SECT_ID_USER_DEF		(('U' << 8) | 'D')
@@ -519,6 +527,7 @@ extern struct mutex rtas_ibm_get_indices_lock;
 extern struct mutex rtas_ibm_set_dynamic_indicator_lock;
 extern struct mutex rtas_ibm_get_dynamic_sensor_state_lock;
 extern struct mutex rtas_ibm_physical_attestation_lock;
+extern struct mutex rtas_ibm_send_hvpipe_msg_lock;
 
 #define GLOBAL_INTERRUPT_QUEUE 9005
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index e61245c4468e..8d81c1e7a8db 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -98,6 +98,8 @@ DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
 DEFINE_MUTEX(rtas_ibm_get_indices_lock);
 DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
 DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
+DEFINE_MUTEX(rtas_ibm_receive_hvpipe_msg_lock);
+DEFINE_MUTEX(rtas_ibm_send_hvpipe_msg_lock);
 
 static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__CHECK_EXCEPTION] = {
@@ -373,6 +375,17 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2] = {
 		.name = "ibm,read-slot-reset-state2",
 	},
+	[RTAS_FNIDX__IBM_RECEIVE_HVPIPE_MSG] {
+		.name = "ibm,receive-hvpipe-msg",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = 1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+		/*
+		 * PAPR+ v2.13 R1–7.3.32.1
+		 */
+		.lock = &rtas_ibm_receive_hvpipe_msg_lock,
+	},
 	[RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW] = {
 		.name = "ibm,remove-pe-dma-window",
 	},
@@ -391,6 +404,17 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
 	},
+	[RTAS_FNIDX__IBM_SEND_HVPIPE_MSG] {
+		.name = "ibm,send-hvpipe-msg",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+		/*
+		 * PAPR+ v2.13 R1–7.3.32.2
+		 */
+		.lock = &rtas_ibm_send_hvpipe_msg_lock,
+	},
 	[RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR] = {
 		.name = "ibm,set-dynamic-indicator",
 		.filter = &(const struct rtas_filter) {
diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index 9bba469239fc..6336ec9aedd0 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -89,6 +89,8 @@ static char *rtas_event_type(int type)
 			return "Platform Resource Reassignment Event";
 		case RTAS_TYPE_HOTPLUG:
 			return "Hotplug Event";
+		case RTAS_TYPE_HVPIPE:
+			return "Hypervisor Pipe Notification event";
 	}
 
 	return rtas_type[0];
-- 
2.50.1



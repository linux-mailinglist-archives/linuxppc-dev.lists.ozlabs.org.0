Return-Path: <linuxppc-dev+bounces-10893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E69B23C17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 00:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1n2m2Jcbz2xHp;
	Wed, 13 Aug 2025 08:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755039456;
	cv=none; b=TjkxKI2GdHKejf5AWQGBAh3KQWzPa98M1lgtPA39/zDBKN7+Glafzvndn2YFnwZEhk/8VmGas8H/TBERzh+lnOt5zvleDivAl9dYQjgLqguZ7+O3R+GS3OpJhTDgoSlpwK5sAHN+VnWFu1yPQyASe2zH8oMDypFjxYjEDrW79zhiY3pih99xB3zrOve34vzugWBXkbhpNfxZKd3CH0RqD/EA+y+Fj8gGzuDbASlnwzKbap5W0pPLLn2mgu5OnAth2lvfp1wDHWZaSaourFhYs4XrHN4Kb/TDRK05upATOgyukWXazODwiBvCAvYVXAjXDhnv0FLWNvuBlO93SBU8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755039456; c=relaxed/relaxed;
	bh=a+ST6H8yPcVqh7br5RTabrMYCzQgi1W8QR8Lo+/uTtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ajxKsmP33xr30aooE3SlLQPPJEWUxkEztPGAMPd6vJe4Mwr/H8/t4oydW/j7cx/mFTq5Xm51salISplM8aSVXuzJB1Mr9Ht37hNkFN3w5ZOOYMDEFNKZsuiDKm/lMFhYoSY1FXkcUeeqSdwMVFMFe1K1/9JhEjQNKJX6DKoMmI2+PPXTxQjqJXdu5vuJpSXhRAc17wIpzUOGl3PgG40yBF9AUewXOhPDfsAKPY7phbAJzwzASIyzYU8owtg0vEKEOLH5B3bZDaKdb4i3SQjeEwV9fKZNfMfodzHaSUsH/xMaxS2kPVD90UFbbSIOj8Xfwd+1rie/sgsTgQTvngAhpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sFfryP/7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sFfryP/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1n2l2rbgz2xK2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 08:57:35 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CJOjNB027712;
	Tue, 12 Aug 2025 22:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a+ST6H
	8yPcVqh7br5RTabrMYCzQgi1W8QR8Lo+/uTtc=; b=sFfryP/7wZlEb1BGEo5HDz
	j6WwHNXfKd/LGBSWtoxE+OmtGdQ6IPRmQYgip/1DLcr9qJI/7Bou+J5eRxumZg+3
	3deGHWlb0Q/utujwZutfZ6tt/kM5bV1q6tiWuMAqhUQAs8GKCnhYZUlv1LtnHGy0
	pgAZKJfuJMuSjDEW8e1Artn7/7Y1ebkaoNF2iGiuEhFGcE236iUNSwM1OyBn/Kj6
	xQImusHjs374ax96bZrNU+6BpOOEiHsie2uusrCJJyMqiSvjKi7UWpMdDmxULK7o
	KG0/ocwvCHZepuGF9e++pZTr/VG5wubrUV3xmiiLzRW5eEPuYZTqZcp/Qe9JMepA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru9bku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:27 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57CMrg82010524;
	Tue, 12 Aug 2025 22:57:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru9bkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CIj6wY017600;
	Tue, 12 Aug 2025 22:57:26 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3maqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:26 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CMvOKj22938244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 22:57:24 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFD835805C;
	Tue, 12 Aug 2025 22:57:23 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 895F858058;
	Tue, 12 Aug 2025 22:57:22 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.44.118])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 22:57:22 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 2/9] powerpc/pseries: Define HVPIPE specific macros
Date: Tue, 12 Aug 2025 15:57:06 -0700
Message-ID: <20250812225715.339225-3-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250812225715.339225-1-haren@linux.ibm.com>
References: <20250812225715.339225-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: 5LrJ7DyNJxPPg_zNvCqOEI8JUD-ZG7Jq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX17QMG7L+W3e5
 R+Dn7kA8R6nWjSH6a4/Tt9433J0Ifc5fpcYNA52GwMmRezMw0bRm5BXcc71HxukaFszhkq7ttHH
 LtwhpRmt7hAEbcWqJA/+95tdDeY9vmn6oDwhyNmry42WJegof4JYNlp5KV55ajXg6lIICeYCdrv
 vaMHAuOwW88iVjZyMQlBx/6U3LdCwSV2MWKDF9Rj8un7/+9eN0TNh0Y7lf/CpfIMYFGO8PO5RSV
 6qcY3FD3h2kGXm8GsV3MU73zp++fJeo0ao/BsAfmuq0LX/XmRStv4O+auTo1LeCiSWTJjk7rPn7
 dmWXUq+9uWmhvw+R5iDXmPH0rsUifwciqonL2IQAa7jg+zIP0Q9cIaufZeJs1P90JELuvuYbIWw
 Hf1s/ECnDr54ctjmcsDi/Hhy9kTxq6Uhq0PmZUUhUK45QKAPzTvm2wsz/Vb637J8l3aKVxni
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689bc6d7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=tbc-j6YToYFr3fHOiCYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: e1Gh-osHlm2QkPIasKbECR3_8zXuKzEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120219
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Define HVPIPE specific macros which are needed to support
ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg RTAS calls
and used to handle HVPIPE message events.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
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
2.43.5



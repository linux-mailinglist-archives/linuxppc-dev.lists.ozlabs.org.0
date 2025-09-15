Return-Path: <linuxppc-dev+bounces-12212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAFCB57651
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:30:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLsX65zRz3dWY;
	Mon, 15 Sep 2025 20:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932256;
	cv=none; b=WQoYI9EzOancu6e2OcBUw1ZMcfMUZfvhHea40QHDHUbew/AXB3Xr29n7VnRf+HvSn+cxzo7GVZQwSOXyQ09XwzJoIliDbdobS8fzAR9eUzex/tSLQxb+CtD3TzEdyIuDVUkWDKIqB+j4Cnr5BXBIXtEg1DCMJOP3LamT20CVfhxdQ9ch1jkVxRzV2zDq5XkaidABvIMS+6xPcqONaTvZ6Ek/XawYVhGUP2mPPHimLgm1uoydbzUdckqDu3oZ0mFu+PAhTBUvUQgw3CCnSQgEUPIhQxVJqTvQNCAere8E7WST2FIKdrFyX3kR/vZwEQ92EcRDXdzHOHWV6zIb/xJUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932256; c=relaxed/relaxed;
	bh=XrTlagykJyYeNAwipOxZi1Cu06ok1VzUusYmB76hwmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d5+hbhOorCxSqfI3Pmj6eFrPhwyGKYT/buIe84h9zYVn3w/pGgf7O3ZF9vlLLCq7YZbLnb4wrRADYF9n2iU+Gv58CATT5Oo0so50NKV6uJkYd3BT3FrY5cNph40GZ1WWDHfYx84ezKEhS2lp4CecXk187PUV3jXwnT5BK/RKefaHPkp8niMt0teouVAUPcZi0FzcnEKu2gHDmSZW2s8dj2+dGsvS62117uNBYYsH1QkaqlLp/eop1DH9A/UR84IQ3gejSO92R1/1XaJlCbsPq+Ds3Apm0OFp3M4LBbdEpOmWR4YO7cQMQDpbeUSpmQi1Wq5MeebY/B4puJjSceNyMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qgH7nBQA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qgH7nBQA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLsX07WNz3dLh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:55 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9PQ2B020960;
	Mon, 15 Sep 2025 10:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=XrTlagykJyYeNAwip
	OxZi1Cu06ok1VzUusYmB76hwmg=; b=qgH7nBQAsdQZD+JzG/wMYNpx2UdMbYa4s
	C15PLk2SkFEO+kzhlnEV/xACZcv4Ecma55LFS9RZK7TO0v7l5H4SKrgcUhjC8Api
	3oBHVTx1PLq1q8Onb5vRK+rEG7sGCYMXeJM0II8to5scFxH+xQGEidyFdSekX1tN
	SF7+OZtSKOR/L+SxTm/jcb/31iAnGJBsMJwM1dx8xogpIWWURNW2aw4VO6+TKqC+
	0N7hFMoKIlbuZAKjaPJePqKPoPM46M1M2X347Wg8Dz1Ojbh90Vg67xyAUUGF76lU
	CvFxkgnsytGQpZbL0uJDpNUCFw5KqoCMuj26orpGFG9Cr6kNqiYfw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496g530bqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:46 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FAUkUk030999;
	Mon, 15 Sep 2025 10:30:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496g530bqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F81f79027358;
	Mon, 15 Sep 2025 10:30:45 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495memwutm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:45 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FAUfj443319690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:30:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D96420043;
	Mon, 15 Sep 2025 10:30:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A62E2004B;
	Mon, 15 Sep 2025 10:30:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:30:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 6/7] powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake up is needed
Date: Mon, 15 Sep 2025 15:59:46 +0530
Message-Id: <20250915102947.26681-7-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: Ok9GRbk2-Wrw7wK7wkJQmx8b7Cs9e5q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX5lLSrqyOxrMT
 RQSuwDUT632I7UXXE++pi1s/vg0xc3QpBjnQ7LorN6hub6K5XQsCdnBYBWU2LE43QQymjDE1kgg
 eYpUNWDJIDjCd/FAhqWoZihbjXUZ4+nqXkxYl4LPJCvAWmIt16oJoCtYi0sT5JSEl49LjBHs429
 NpGoYg8sm3ENB9H5pc1A+rYr7XjGejg99PK7R0Hggg2pUm+V5h8RhIg/RvucxGYgWXGhQiCt9qW
 N3ofGmU9LL/K8tSGWEDIkveVQZkPydeGgjrWCoufHKdqON0o8D93G+VrWnjJSXWLwzEY/ekHUnc
 A97vxtLl4jIuixAhMac/Rb8vK+iJSGuc5MXJBgdR6SlRmBFGs7U3T0/OA7FqltJtFS7WcO8mfTD
 n3NIuWD5
X-Proofpoint-ORIG-GUID: LihI9MdTHobZXbgNd33FiWPPQBmFizoH
X-Authority-Analysis: v=2.4 cv=UJ7dHDfy c=1 sm=1 tr=0 ts=68c7ead6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zOIRyJVu6_AfguVy:21 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8
 a=PO_t9PzmMro4mNfVNWgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Handle the case when the aux buffer is going to be full and
data needs to be written to the data file. perf_aux_output_begin()
function checks if there is enough space depending on the values of
aux_wakeup and aux_watermark which is part of "struct perf_buffer".
Inorder to maintain where to write to aux buffer, add two fields
to "struct vpa_pmu_buf". Field "threshold" to indicate total possible
DTL entries that can be contained in aux buffer and field "full" to
indicate anytime when buffer is full. In perf_aux_output_end, there
is check to see if wake up is needed based on aux head value.

In vpa_dtl_capture_aux(), check if there is enough space to contain the
DTL data. If not, save the data for available memory and set full to true.
Set head of private aux to zero when buffer is full so that next data
will be copied to beginning of the buffer. The address used for copying
to aux is "aux_copy_buf + buf->head". So once buffer is full, set head
to zero, so that next time it will be written from start of the buffer.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/perf/vpa-dtl.c | 54 +++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
index ead96af37997..3c1d1c28deb9 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -85,8 +85,11 @@ struct vpa_pmu_buf {
 	u64     *base;
 	u64     size;
 	u64     head;
+	u64	head_size;
 	/* boot timebase and frequency needs to be saved only at once */
 	int	boottb_freq_saved;
+	u64	threshold;
+	bool	full;
 };
 
 /*
@@ -120,11 +123,31 @@ static void vpa_dtl_capture_aux(long *n_entries, struct vpa_pmu_buf *buf,
 {
 	struct dtl_entry *aux_copy_buf = (struct dtl_entry *)buf->base;
 
+	/*
+	 * check if there is enough space to contain the
+	 * DTL data. If not, save the data for available
+	 * memory and set full to true.
+	 */
+	if (buf->head + *n_entries >= buf->threshold) {
+		*n_entries = buf->threshold - buf->head;
+		buf->full = 1;
+	}
+
 	/*
 	 * Copy to AUX buffer from per-thread address
 	 */
 	memcpy(aux_copy_buf + buf->head, &dtl->buf[index], *n_entries * sizeof(struct dtl_entry));
 
+	if (buf->full) {
+		/*
+		 * Set head of private aux to zero when buffer is full
+		 * so that next data will be copied to beginning of the
+		 * buffer
+		 */
+		buf->head = 0;
+		return;
+	}
+
 	buf->head += *n_entries;
 
 	return;
@@ -178,6 +201,7 @@ static void vpa_dtl_dump_sample_data(struct perf_event *event)
 	struct vpa_pmu_buf *aux_buf;
 
 	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
+	u64 size;
 
 	cur_idx = be64_to_cpu(lppaca_of(event->cpu).dtl_idx);
 	last_idx = dtl->last_idx;
@@ -222,13 +246,37 @@ static void vpa_dtl_dump_sample_data(struct perf_event *event)
 		n_req -= read_size;
 		n_read += read_size;
 		i = 0;
+		if (aux_buf->full) {
+			size = (n_read * sizeof(struct dtl_entry));
+			if ((size +  aux_buf->head_size) > aux_buf->size) {
+				size = aux_buf->size - aux_buf->head_size;
+				perf_aux_output_end(&vpa_ctx->handle, size);
+				aux_buf->head = 0;
+				aux_buf->head_size = 0;
+			} else {
+				aux_buf->head_size += (n_read * sizeof(struct dtl_entry));
+				perf_aux_output_end(&vpa_ctx->handle, n_read * sizeof(struct dtl_entry));
+			}
+			goto out;
+		}
 	}
 
 	/* .. and now the head */
 	vpa_dtl_capture_aux(&n_req, aux_buf, dtl, i);
 
-	/* Move the aux->head to indicate size of data in aux buffer */
-	perf_aux_output_end(&vpa_ctx->handle, (n_req + n_read) * sizeof(struct dtl_entry));
+	size = ((n_req + n_read) * sizeof(struct dtl_entry));
+	if ((size +  aux_buf->head_size) > aux_buf->size) {
+		size = aux_buf->size - aux_buf->head_size;
+		perf_aux_output_end(&vpa_ctx->handle, size);
+		aux_buf->head = 0;
+		aux_buf->head_size = 0;
+	} else {
+		aux_buf->head_size += ((n_req + n_read) * sizeof(struct dtl_entry));
+		/* Move the aux->head to indicate size of data in aux buffer */
+		perf_aux_output_end(&vpa_ctx->handle, (n_req + n_read) * sizeof(struct dtl_entry));
+	}
+out:
+	aux_buf->full = 0;
 }
 
 /*
@@ -491,7 +539,9 @@ static void *vpa_dtl_setup_aux(struct perf_event *event, void **pages,
 
 	buf->size = nr_pages << PAGE_SHIFT;
 	buf->head = 0;
+	buf->head_size = 0;
 	buf->boottb_freq_saved = 0;
+	buf->threshold = ((buf->size - 32) / sizeof(struct dtl_entry));
 	return no_free_ptr(buf);
 }
 
-- 
2.47.1



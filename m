Return-Path: <linuxppc-dev+bounces-11048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFBB27B25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Fmj6HpPz3cZt;
	Fri, 15 Aug 2025 18:35:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246933;
	cv=none; b=M4NlWNIs3DRl87ppn1Oom5B3ifV1nItJ/2aGu+C2bA/LgPQgZTP8RKpLC+6/CjAMKR9ai9I2vwZ/tcW9DGsTctmcpCHQaBxT9G2YHCtHdNIH71ImW8qh7CjQ7Icfda/J1yDd1kXdoqijGKOn00HAdS93udqtEhPF1CW9bsnfFlkDFPc9/+lX3V8O63nHXGOZ28hCJNl5IIg+MJIZmVc+j3xRlxZC4gC78T2bxD2JtizsqPR63xeNVJ14KpCeYUwmep9mkZLdqYYvtdFHvQ+A2HXdI4EiiJKCzyylMl6r5bvC50xfHhJcJqvR/udaOwxD9q0cs4lYFkvZuOABfsgvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246933; c=relaxed/relaxed;
	bh=xuy1SoTYUjLOJkn9Wwdm/tTZ4hqB2tje+ej1pg5rVkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OQSZtza8ws4CZrVK3PY+q9cGH8IKXR7FkcuLnaLuTs/RBY05jY1K6nltIeEtlh1eh2AF1R3Vi5PGN09EJcEpHvSJlzmwCYQqBjEDwsoYYZHQtde9ytky/nKDFt6dTkhIvHsloBk2uyL6eEch3sdiORyADQSFBTEqOpqhwGpy7UBRPZjlFLIZARBW14XlsJ90AJOubhSpzOdzQQWkeqD+FcBjD0XnPjgjOBgOvIMp6+oetukdB6vhjRdkv45+XKpfv8TuNKmL9vAEBirwrljTLuwU7qiilK52M/mAyXDxWw+n92dEj0YmRAuYfWpu2tJbXqzigO8gD0iECtPJliVi6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EnC62XR4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EnC62XR4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Fmj1Vp8z3cZR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:35:33 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F2UZci015916;
	Fri, 15 Aug 2025 08:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=xuy1SoTYUjLOJkn9W
	wdm/tTZ4hqB2tje+ej1pg5rVkE=; b=EnC62XR44Y2RUCI/4LlN1CcrjnXeYmWmH
	jPFZgR47YHcdlJlzu21GiULyjeoHoe7ID0jvQpGfyKlCwgBk8NM+9x9ZB1yl0Sla
	bwNd1n/8V6dEVuUupBupLJAvlkOfGDsnOhFtlN2Vbyxa9lW72EShdimGoGL8DQks
	sTtOSVeqKNDgCbF+YiVWq0tozswn3wP5Z8ZqdgA22kQLPw+Ii/yNoDxm/YZMAWw5
	cxIfVdrCCKzp5xnH09bawiAlwgfgokz+Pk+4nEqVkzJu/okKg9hnW9qrswDSyz9h
	OsGVh0tEArEhfO5qItunr0Deo1SwVkwmioULLcBP6+hzwLx7Ys8yw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14xgw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:29 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8ZTDl001528;
	Fri, 15 Aug 2025 08:35:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14xgw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F6Ur07026270;
	Fri, 15 Aug 2025 08:35:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh21g9ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:27 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8ZOSW48562494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:35:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E306920043;
	Fri, 15 Aug 2025 08:35:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 701B620040;
	Fri, 15 Aug 2025 08:35:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:35:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 06/14] powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake up is needed
Date: Fri, 15 Aug 2025 14:03:59 +0530
Message-Id: <20250815083407.27953-7-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 8V05YX2yrKLVNzJn5-nRGL8xBrkwHfZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfXxrbigPj326U9
 C6xpJT8qS/oLCXjSI5QBmGfdjRFOonpBID38HhUaBR8I2DAWzUMtr6DY35Uw/RaDvO1CFoxGgwz
 Qw6MeD3DqoGQHTwLTVooTYn2dO6Y+EIxkvq2u3U4BjTyGiZQpRoFsB/MYTp8tuFNPc8zBMte15M
 EurXOdn6ZHY9H40j9yYKWv1qQ5K8f1RfxY7aqUeRwRnBaTWAhe0ShkwbvLAuHdwejKwXpjMMLVJ
 JjmsPxAM9R1UgdbOl5vXsDNqbJ907UsxEAGjh/kmTFUIPzRosNLUwmjqyn1PZaZ/+7QhSbtuSvq
 HYFggv/JptNMaP2l9KQ4H2MfmcCHDrpXd1F/cJJEgu0n9b060wigFtfpIaUX/EoISGt7lm/BniU
 61Y2Ayrr
X-Proofpoint-GUID: y3BbZdkOchVZDyIK-XkAFX0lE8-X0uQf
X-Authority-Analysis: v=2.4 cv=fLg53Yae c=1 sm=1 tr=0 ts=689ef151 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=zOIRyJVu6_AfguVy:21 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8
 a=PO_t9PzmMro4mNfVNWgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
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
index ce17beddd4b4..d9651c5ef215 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -86,8 +86,11 @@ struct vpa_pmu_buf {
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
@@ -121,11 +124,31 @@ static void vpa_dtl_capture_aux(long *n_entries, struct vpa_pmu_buf *buf,
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
@@ -179,6 +202,7 @@ static void vpa_dtl_dump_sample_data(struct perf_event *event)
 	struct vpa_pmu_buf *aux_buf;
 
 	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
+	u64 size;
 
 	cur_idx = be64_to_cpu(lppaca_of(event->cpu).dtl_idx);
 	last_idx = dtl->last_idx;
@@ -223,13 +247,37 @@ static void vpa_dtl_dump_sample_data(struct perf_event *event)
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
@@ -500,7 +548,9 @@ static void *vpa_dtl_setup_aux(struct perf_event *event, void **pages,
 
 	buf->size = nr_pages << PAGE_SHIFT;
 	buf->head = 0;
+	buf->head_size = 0;
 	buf->boottb_freq_saved = 0;
+	buf->threshold = ((buf->size - 32) / sizeof(struct dtl_entry));
 	return no_free_ptr(buf);
 }
 
-- 
2.47.1



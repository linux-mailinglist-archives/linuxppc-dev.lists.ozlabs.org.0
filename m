Return-Path: <linuxppc-dev+bounces-5515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A38A1A3D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 13:08:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf08R3Hdjz30D3;
	Thu, 23 Jan 2025 23:08:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737634103;
	cv=none; b=mLdoWtjhuj2lJaerFBhr5ubYTRlWRO+jNGard0Z2njFiSBvfeJ6fqtLapgniPKnEb0y47vc17NfZmBBOOKYFZcQBttYOwD/YpLBNzKbWvS82pmJ7318IWXMOU1BonMJ09TDGWvJ+EMpmtl6RoG9q5534zyTWOxcpGazSVtqJyk6C3+5qUJliNDp/hAPDenRNs1M2XrFaLZMZAMXrG/H6VNS6f8kdiTnOdbd7mU/hEXTMws97/D3a9MEfmwYTLCBYtlNC/cqoAcgDXqwOOE0FImqy7iVFzWoWWl0tlusOuiiMOp9gALpNU3Avo9vTiaGRViomrfMJKLpkKj3LVjJ20A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737634103; c=relaxed/relaxed;
	bh=PKuuKY0yVEDGdneo7vXWwZM4qx/CBnGz2x8CC7y8Z3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khnE5ozLfr7AJI+LfEHkn1mJAVARw4uIUgFXgSE9qTD9QpLHdmacplO3HgkTjTaD11ruy1a0FtOPBjgWYnr8y3b0mlkVTtM3LAPah5O/52SNWYzubk9EiUrVFxmWgoX9mTqZINSbNvAE8Eud7HCGs0PjNwxy/NFMiTQ40KFz0HIG+0kbfn96C5BlR36PyZ7Ctzn5g8ayubVgK0Q1v3b+MOtnVV4f2Aav8ubBSITO/ao+5irMK85lov0IEkV/ijY2OatKipV9jRFbYzdnuFOZsESD/HG5QtL+X0e193yhwQLd3WiYwGT+SdR3L5AgffXFEQrHKVUwK/G0hwbKQNAkug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgfEG4sv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgfEG4sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf08Q5DV9z305G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 23:08:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N20tSo027716;
	Thu, 23 Jan 2025 12:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PKuuKY0yVEDGdneo7
	vXWwZM4qx/CBnGz2x8CC7y8Z3Q=; b=TgfEG4sv5auIPaQjKASxy32sJVw9r9G1C
	h1nnD/AHFGxWJGbG29UMd746EaV8b0QeCNWFdci3eZY018L6mWaBYrBy2Su+go2m
	9i0Ibk9FW9/nU//+sf3saKxFHR0OyEhZsEaO5TZWUXfvQR8j3ZqOusbBc7poJYN8
	5rrafF8LWOwImW3xT6nWMkfTHQQFW5t6XbQqXFZ3g9KXRJObieuy4oAz3L4/eNgP
	oJQIfdMLGB9DrtDR/ZG0AAp467jN1ldXpLtp7+8qXZKeZN3HCf9xjL1d84USmzC3
	4Qb2WP5WV/JXe/sQlnhlP+y2ljJnyXQ874n9tM6f2MW4eD3CGUfiw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xynbdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50NC89VM027340;
	Thu, 23 Jan 2025 12:08:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xynbdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NAc33V022387;
	Thu, 23 Jan 2025 12:08:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4kdad1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NC89ok18743800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 12:08:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 100F920043;
	Thu, 23 Jan 2025 12:08:09 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CE5320040;
	Thu, 23 Jan 2025 12:08:05 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.34])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 23 Jan 2025 12:08:05 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Thu, 23 Jan 2025 17:38:04 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
Subject: [PATCH v3 3/6] kvm powerpc/book3s-apiv2: Add kunit tests for Hostwide GSB elements
Date: Thu, 23 Jan 2025 17:37:45 +0530
Message-ID: <20250123120749.90505-4-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123120749.90505-1-vaibhav@linux.ibm.com>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0oz5S0HLWXSzRYhN_uA8vRRKKg8do5NF
X-Proofpoint-ORIG-GUID: eI0gTpcgx2dbYDsdh6iIwbE0KAAbLKqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Update 'test-guest-state-buffer.c' to add two new KUNIT test cases for
validating correctness of changes to Guest-state-buffer management
infrastructure for adding support for Hostwide GSB elements.

The newly introduced test test_gs_hostwide_msg() checks if the Hostwide
elements can be set and parsed from a Guest-state-buffer. The second kunit
test test_gs_hostwide_counters() checks if the Hostwide GSB elements can be
send to the L0-PowerVM hypervisor via the H_GUEST_SET_STATE hcall and
ensures that the returned guest-state-buffer has all the 5 Hostwide stat
counters present.

Below is the KATP test report with the newly added KUNIT tests:

KTAP version 1
    # Subtest: guest_state_buffer_test
    # module: test_guest_state_buffer
    1..7
    ok 1 test_creating_buffer
    ok 2 test_adding_element
    ok 3 test_gs_bitmap
    ok 4 test_gs_parsing
    ok 5 test_gs_msg
    ok 6 test_gs_hostwide_msg
    # test_gs_hostwide_counters: Guest Heap Size=0 bytes
    # test_gs_hostwide_counters: Guest Heap Size Max=10995367936 bytes
    # test_gs_hostwide_counters: Guest Page-table Size=2178304 bytes
    # test_gs_hostwide_counters: Guest Page-table Size Max=2147483648 bytes
    # test_gs_hostwide_counters: Guest Page-table Reclaim Size=0 bytes
    ok 7 test_gs_hostwide_counters
 # guest_state_buffer_test: pass:7 fail:0 skip:0 total:7
 # Totals: pass:7 fail:0 skip:0 total:7
 ok 1 guest_state_buffer_test

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog

v2->v3:
None

v1->v2:
None
---
 arch/powerpc/kvm/test-guest-state-buffer.c | 210 +++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/arch/powerpc/kvm/test-guest-state-buffer.c b/arch/powerpc/kvm/test-guest-state-buffer.c
index bfd225329a18..99a3d4b12843 100644
--- a/arch/powerpc/kvm/test-guest-state-buffer.c
+++ b/arch/powerpc/kvm/test-guest-state-buffer.c
@@ -141,6 +141,16 @@ static void test_gs_bitmap(struct kunit *test)
 		i++;
 	}
 
+	for (u16 iden = KVMPPC_GSID_L0_GUEST_HEAP;
+	     iden <= KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM; iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
 	for (u16 iden = KVMPPC_GSID_RUN_INPUT; iden <= KVMPPC_GSID_VPA;
 	     iden++) {
 		kvmppc_gsbm_set(&gsbm, iden);
@@ -309,12 +319,212 @@ static void test_gs_msg(struct kunit *test)
 	kvmppc_gsm_free(gsm);
 }
 
+/* Test data struct for hostwide/L0 counters */
+struct kvmppc_gs_msg_test_hostwide_data {
+	u64 guest_heap;
+	u64 guest_heap_max;
+	u64 guest_pgtable_size;
+	u64 guest_pgtable_size_max;
+	u64 guest_pgtable_reclaim;
+};
+
+static size_t test_hostwide_get_size(struct kvmppc_gs_msg *gsm)
+
+{
+	size_t size = 0;
+	u16 ids[] = {
+		KVMPPC_GSID_L0_GUEST_HEAP,
+		KVMPPC_GSID_L0_GUEST_HEAP_MAX,
+		KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE,
+		KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX,
+		KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(ids); i++)
+		size += kvmppc_gse_total_size(kvmppc_gsid_size(ids[i]));
+	return size;
+}
+
+static int test_hostwide_fill_info(struct kvmppc_gs_buff *gsb,
+				   struct kvmppc_gs_msg *gsm)
+{
+	struct kvmppc_gs_msg_test_hostwide_data *data = gsm->data;
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_HEAP))
+		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_HEAP,
+				   data->guest_heap);
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX))
+		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_HEAP_MAX,
+				   data->guest_heap_max);
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE))
+		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE,
+				   data->guest_pgtable_size);
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX))
+		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX,
+				   data->guest_pgtable_size_max);
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM))
+		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM,
+				   data->guest_pgtable_reclaim);
+
+	return 0;
+}
+
+static int test_hostwide_refresh_info(struct kvmppc_gs_msg *gsm,
+				      struct kvmppc_gs_buff *gsb)
+{
+	struct kvmppc_gs_parser gsp = { 0 };
+	struct kvmppc_gs_msg_test_hostwide_data *data = gsm->data;
+	struct kvmppc_gs_elem *gse;
+	int rc;
+
+	rc = kvmppc_gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP);
+	if (gse)
+		data->guest_heap = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	if (gse)
+		data->guest_heap_max = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	if (gse)
+		data->guest_pgtable_size = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	if (gse)
+		data->guest_pgtable_size_max = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+	if (gse)
+		data->guest_pgtable_reclaim = kvmppc_gse_get_u64(gse);
+
+	return 0;
+}
+
+static struct kvmppc_gs_msg_ops gs_msg_test_hostwide_ops = {
+	.get_size = test_hostwide_get_size,
+	.fill_info = test_hostwide_fill_info,
+	.refresh_info = test_hostwide_refresh_info,
+};
+
+static void test_gs_hostwide_msg(struct kunit *test)
+{
+	struct kvmppc_gs_msg_test_hostwide_data test_data = {
+		.guest_heap = 0xdeadbeef,
+		.guest_heap_max = ~0ULL,
+		.guest_pgtable_size = 0xff,
+		.guest_pgtable_size_max = 0xffffff,
+		.guest_pgtable_reclaim = 0xdeadbeef,
+	};
+	struct kvmppc_gs_msg *gsm;
+	struct kvmppc_gs_buff *gsb;
+
+	gsm = kvmppc_gsm_new(&gs_msg_test_hostwide_ops, &test_data, GSM_SEND,
+			     GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsm);
+
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+
+	kvmppc_gsm_fill_info(gsm, gsb);
+
+	memset(&test_data, 0, sizeof(test_data));
+
+	kvmppc_gsm_refresh_info(gsm, gsb);
+	KUNIT_EXPECT_EQ(test, test_data.guest_heap, 0xdeadbeef);
+	KUNIT_EXPECT_EQ(test, test_data.guest_heap_max, ~0ULL);
+	KUNIT_EXPECT_EQ(test, test_data.guest_pgtable_size, 0xff);
+	KUNIT_EXPECT_EQ(test, test_data.guest_pgtable_size_max, 0xffffff);
+	KUNIT_EXPECT_EQ(test, test_data.guest_pgtable_reclaim, 0xdeadbeef);
+
+	kvmppc_gsm_free(gsm);
+}
+
+/* Test if the H_GUEST_GET_STATE for hostwide counters works */
+static void test_gs_hostwide_counters(struct kunit *test)
+{
+	struct kvmppc_gs_msg_test_hostwide_data test_data;
+	struct kvmppc_gs_parser gsp = { 0 };
+
+	struct kvmppc_gs_msg *gsm;
+	struct kvmppc_gs_buff *gsb;
+	struct kvmppc_gs_elem *gse;
+	int rc;
+
+	gsm = kvmppc_gsm_new(&gs_msg_test_hostwide_ops, &test_data, GSM_SEND,
+			     GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsm);
+
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+
+	kvmppc_gsm_fill_info(gsm, gsb);
+
+	/* With HOST_WIDE flags guestid and vcpuid will be ignored */
+	rc = kvmppc_gsb_recv(gsb, KVMPPC_GS_FLAGS_HOST_WIDE);
+	KUNIT_ASSERT_EQ(test, rc, 0);
+
+	/* Parse the guest state buffer is successful */
+	rc = kvmppc_gse_parse(&gsp, gsb);
+	KUNIT_ASSERT_EQ(test, rc, 0);
+
+	/* Parse the GSB and get the counters */
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, gse, "L0 Heap counter missing");
+	kunit_info(test, "Guest Heap Size=%llu bytes",
+		   kvmppc_gse_get_u64(gse));
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, gse, "L0 Heap counter max missing");
+	kunit_info(test, "Guest Heap Size Max=%llu bytes",
+		   kvmppc_gse_get_u64(gse));
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, gse, "L0 page-table size missing");
+	kunit_info(test, "Guest Page-table Size=%llu bytes",
+		   kvmppc_gse_get_u64(gse));
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, gse, "L0 page-table size-max missing");
+	kunit_info(test, "Guest Page-table Size Max=%llu bytes",
+		   kvmppc_gse_get_u64(gse));
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, gse, "L0 page-table reclaim size missing");
+	kunit_info(test, "Guest Page-table Reclaim Size=%llu bytes",
+		   kvmppc_gse_get_u64(gse));
+
+	kvmppc_gsm_free(gsm);
+	kvmppc_gsb_free(gsb);
+}
+
 static struct kunit_case guest_state_buffer_testcases[] = {
 	KUNIT_CASE(test_creating_buffer),
 	KUNIT_CASE(test_adding_element),
 	KUNIT_CASE(test_gs_bitmap),
 	KUNIT_CASE(test_gs_parsing),
 	KUNIT_CASE(test_gs_msg),
+	KUNIT_CASE(test_gs_hostwide_msg),
+	KUNIT_CASE(test_gs_hostwide_counters),
 	{}
 };
 
-- 
2.48.1



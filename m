Return-Path: <linuxppc-dev+bounces-9263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA70AD44A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 23:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH1rm1Kdmz30LS;
	Wed, 11 Jun 2025 07:19:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749590376;
	cv=none; b=ZHBkvX3vZe3SWw7VheIRi0pvzQlCrodVzDkLUapbiyX6gFcLu8KNlav237l87bIo9PHk8MBnOOkEqRLQ/0KqqTu62mogBPf5Ubou6jufTAl2i9A9LCg+pVwuYSqG8mVP/YdK8VZxt09PMC8W8447v2z+PPGlEriKpmrhxGIlDNMsJJFrQqnvi+UkVCwpBt8o8HEWWPSYlVAQ+1fHhxGIJD5b3eT53ttnKhhg/gOvcZMQTeyXLF5kd2xmXBmV0XlyZc1JG7j7IUP7QwxHx1pWHKyCYRxN697+N2TmCLaGu6gdbXZc1CCFEsGxB/SKYeDHaLazr0kxXBFgoZe15CKOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749590376; c=relaxed/relaxed;
	bh=Ror2umoeh/9LFHu5sOpmgQ+S2h8VWYq2WrP0ryPKE4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GA+1nGdeKQjlATC+jnIKBZIawmO82aeMzaZzLYpT3Qf+ek1B0W4jcq35lSbtEyRLblnJkaYfDo0QUtxqc31c9qUE/nNEGn+3XqARkxSVLC61od/pCSV3aGqYqUiIxs5nZcxmtfMYkGkLkD5Few+JyvrpTSWv9REDY7eOR5w2rpJpfW0UIAyW36dwseuLVI47u+y2rXl72OuDxPaPb/CUIMp92+HnNixvQgzRmrGlpJJIKCudFsLD7pI7esunphfsU45KVMRNFdSTmxZcR7metPPzj72FQxlzw9eAmwnX2tgw96+XRzJdXCiNgXu7Plip+UuSnmWRG7VihHSVDGokzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFTFUzxS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFTFUzxS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH1rl4T4Bz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 07:19:35 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AKd0hn001143;
	Tue, 10 Jun 2025 21:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Ror2umoeh/9LFHu5s
	OpmgQ+S2h8VWYq2WrP0ryPKE4w=; b=RFTFUzxSa6kPd20FtGdBPaCb9K2WpYd6H
	DttT6ZlnKh4wScd4N2ZvzE36UC/YsPVO2mLvsyKb4l8/x8kqqW37xxdGuBPzDYLl
	PjVSQFxwtkJbxoeCfXbk99OsT08TiQbdiDURWCq6GjjNvlNKyztd10/zU4sVgKQ8
	2ttLBRkZaB25FTXLgZRQBQauS6Ejt7h3DfjuTE/lBzF1ZtImWKAeWR4bFsaapbBT
	tCqtO2vFjz29C3P1C7mRdatq0XJ2EAfNthgiJ6MTAIeWtL1EDuxh9Su6Gz4F11Bp
	ryWpMIX5PYt82JGcWl87a7OVNm2AoVsmLRlBRjhuH53Ie9WVUxSFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wynhar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 21:19:24 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55ALGsrF003360;
	Tue, 10 Jun 2025 21:19:24 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wynhak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 21:19:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55AK684V021836;
	Tue, 10 Jun 2025 21:19:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47504yvkg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 21:19:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55ALJIao59703664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 21:19:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 861EB2004E;
	Tue, 10 Jun 2025 21:19:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E7E020043;
	Tue, 10 Jun 2025 21:19:15 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.26.197])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 21:19:15 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        msuchanek@suse.de, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] powerpc/secvar: Expose secvars relevant to the key management mode
Date: Wed, 11 Jun 2025 02:49:06 +0530
Message-ID: <20250610211907.101384-3-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211907.101384-1-ssrish@linux.ibm.com>
References: <20250610211907.101384-1-ssrish@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: rV0kdsEIElMXerPPdLa6gv_mff9PxzjD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE3NCBTYWx0ZWRfX050Zr9yBr/fI n5qBXuyXN8n6Mk1nggrlj4wzCrkfnVTE4hgXisqiERwzo5RUFTm9feh/kcZ9FrMTqcHlgdvZMQI HGblqaxZUhbfjY4myzvcOg1BYuQufpbyteICBh/lV/78YbbaSvihnxmErCyyTeAoRsmaFtcpzMb
 xc9f4Jt5EfZXa7NhC0xcyoc1j9JNiFmd5iQwczVn8DxgWGshNAZupgqERBhBVKjwLTygAVK0E8u z0walBzkDuDRMspmYN5mWRyY6Iui4mlQkPzVcwJryAGMP/GdfHlec31sz6lL//YxF1lcDqq5mP3 TetqP7RScAADzyc0t3sg9qD1V2UAN/duwS4qMnHCQP2P2mKsr3E25RsVkOZ75U6axymZx1N6/2S
 FENU7xZ1Xj3g5nr31cCciekY3uSv44H3v9Cba32omBrWQXtv7FEoMbdHFMefAhf6RqfvGjs8
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=6848a15c cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=2qXihy3qlzCNzDExuI8A:9
X-Proofpoint-GUID: PIaYAC_5LnNIxIl-BvyJgG32MCmkBQEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100174
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
secvars irrespective of the key management mode.

The PowerVM LPAR supports static and dynamic key management for secure
boot. The key management option can be updated in the management
console. The secvars PK, trustedcadb, and moduledb can be consumed both
in the static and dynamic key management modes for the loading of signed
third-party kernel modules. However, other secvars i.e. KEK, grubdb,
grubdbx, sbat, db and dbx, which are used to verify the grub and kernel
images, are consumed only in the dynamic key management mode.

Expose only PK, trustedcadb, and moduledb in the static key management
mode.

Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-secvar        |  7 +++++
 arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++---
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
index f001a4f4bd2e..1016967a730f 100644
--- a/Documentation/ABI/testing/sysfs-secvar
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -38,6 +38,13 @@ Description:	Each secure variable is represented as a directory named as
 		representation. The data and size can be determined by reading
 		their respective attribute files.
 
+		Only secvars relevant to the key management mode are exposed.
+		Only in the dynamic key management mode should the user have
+		access (read and write) to the secure boot secvars db, dbx,
+		grubdb, grubdbx, and sbat. These secvars are not consumed in the
+		static key management mode. PK, trustedcadb and moduledb are the
+		secvars common to both static and dynamic key management modes.
+
 What:		/sys/firmware/secvar/vars/<variable_name>/size
 Date:		August 2019
 Contact:	Nayna Jain <nayna@linux.ibm.com>
diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
index 767e5e8c6990..f9e9cc40c9d0 100644
--- a/arch/powerpc/platforms/pseries/plpks-secvar.c
+++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
@@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
 		return PLPKS_SIGNEDUPDATE;
 }
 
-static const char * const plpks_var_names[] = {
+static const char * const plpks_var_names_static[] = {
+	"PK",
+	"moduledb",
+	"trustedcadb",
+	NULL,
+};
+
+static const char * const plpks_var_names_dynamic[] = {
 	"PK",
 	"KEK",
 	"db",
@@ -213,21 +220,34 @@ static int plpks_max_size(u64 *max_size)
 	return 0;
 }
 
+static const struct secvar_operations plpks_secvar_ops_static = {
+	.get = plpks_get_variable,
+	.set = plpks_set_variable,
+	.format = plpks_secvar_format,
+	.max_size = plpks_max_size,
+	.config_attrs = config_attrs,
+	.var_names = plpks_var_names_static,
+};
 
-static const struct secvar_operations plpks_secvar_ops = {
+static const struct secvar_operations plpks_secvar_ops_dynamic = {
 	.get = plpks_get_variable,
 	.set = plpks_set_variable,
 	.format = plpks_secvar_format,
 	.max_size = plpks_max_size,
 	.config_attrs = config_attrs,
-	.var_names = plpks_var_names,
+	.var_names = plpks_var_names_dynamic,
 };
 
 static int plpks_secvar_init(void)
 {
+	u8 mode;
+
 	if (!plpks_is_available())
 		return -ENODEV;
 
-	return set_secvar_ops(&plpks_secvar_ops);
+	mode = plpks_get_sb_keymgmt_mode();
+	if (mode)
+		return set_secvar_ops(&plpks_secvar_ops_dynamic);
+	return set_secvar_ops(&plpks_secvar_ops_static);
 }
 machine_device_initcall(pseries, plpks_secvar_init);
-- 
2.47.1



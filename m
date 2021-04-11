Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562235B0F2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 02:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHtJt6Tznz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 10:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ew5oMcW2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ew5oMcW2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHtJR5XbBz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 10:38:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13B0X0YH080397; Sat, 10 Apr 2021 20:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=aJ6vjjC786MTHJjzsddAsFQowBXH0hlUgF+uJXi8Epo=;
 b=Ew5oMcW2m2pVgLGctjZABCYpCxWTxC/EoJDGEdYYPKd2jz6QAlhzAc1AKk2K9BDmCfHR
 GiLGmqvf6Cvy4OE78VtTBQNbVaLSR08GYaHD9TLhthR5SQTJk5fRySryFUZE1ST/Jf8r
 vmKBom0nQXGivrm5wEs2MREKIsSKVi9odIxUClHn+Yvhcmu9t9fvEERIblI7rPo9Foec
 3irdPgXhSbY7768MvIWEx7QankfeFCbO5d2urZZfNwVt0OOJ9/lOzdXvEGk1pjTeF5o/
 Tp1zRAOLlWXTvx7UkHEZ2u3dVwI82fE9JIuCc1FfVAV13yUVxDQA51port2wlPxZCtUZ 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37u7vyvafu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 20:38:09 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13B0XX7K081893;
 Sat, 10 Apr 2021 20:38:08 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37u7vyvafr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 20:38:08 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13B0Rxh6017306;
 Sun, 11 Apr 2021 00:38:08 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 37u3n955gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Apr 2021 00:38:08 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13B0c7Tr16843128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Apr 2021 00:38:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DE62112064;
 Sun, 11 Apr 2021 00:38:07 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70BC3112063;
 Sun, 11 Apr 2021 00:38:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 11 Apr 2021 00:38:06 +0000 (GMT)
Message-ID: <7782d98999a8753b023b133ee43387da392cfefb.camel@linux.ibm.com>
Subject: [PATCH 09/16] powerpc/pseries/vas: Implement to get all capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 10 Apr 2021 17:38:04 -0700
In-Reply-To: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
References: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4KlPZVl7LUd8pu9cE1tnpD5dCp6W5AIS
X-Proofpoint-GUID: jsEtlXGv5UhZmdea5s4KLb0GNpH-bNPD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_07:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104110000
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
Cc: haren@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


pHyp provides various VAS capabilities such as GZIP default and QoS
capabilities which are used to determine total number of credits
available in LPAR, maximum window credits, maximum LPAR credits,
whether usermode copy/paste is supported, and etc.

So first retrieve overall vas capabilities using
H_QUERY_VAS_CAPABILITIES HCALL which tells the specific features that
are available. Then retrieve the specific capabilities by using the
feature type in H_QUERY_VAS_CAPABILITIES HCALL.

pHyp supports only GZIP default and GZIP QoS capabilities right now.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 130 +++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 06960151477c..35946fb02995 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -30,6 +30,13 @@
 /* phyp allows one credit per window right now */
 #define DEF_WIN_CREDS		1
 
+static struct vas_all_capabs capabs_all;
+static int copypaste_feat;
+
+struct vas_capabs vcapabs[VAS_MAX_FEAT_TYPE];
+
+DEFINE_MUTEX(vas_pseries_mutex);
+
 static int64_t hcall_return_busy_check(int64_t rc)
 {
 	/* Check if we are stalled for some time */
@@ -215,3 +222,126 @@ int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
 		return -EIO;
 	}
 }
+
+/*
+ * Get the specific capabilities based on the feature type.
+ * Right now supports GZIP default and GZIP QoS capabilities.
+ */
+static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
+				struct vas_ct_capabs_be *capab_be)
+{
+	struct vas_ct_capabs *capab;
+	struct vas_capabs *vcapab;
+	int rc = 0;
+
+	vcapab = &vcapabs[type];
+	memset(vcapab, 0, sizeof(*vcapab));
+	INIT_LIST_HEAD(&vcapab->list);
+
+	capab = &vcapab->capab;
+
+	rc = plpar_vas_query_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
+					  (u64)virt_to_phys(capab_be));
+	if (rc)
+		return rc;
+
+	capab->user_mode = capab_be->user_mode;
+	if (!(capab->user_mode & VAS_COPY_PASTE_USER_MODE)) {
+		pr_err("User space COPY/PASTE is not supported\n");
+		return -ENOTSUPP;
+	}
+
+	snprintf(capab->name, VAS_DESCR_LEN + 1, "%.8s",
+		 (char *)&capab_be->descriptor);
+	capab->descriptor = be64_to_cpu(capab_be->descriptor);
+	capab->win_type = capab_be->win_type;
+	if (capab->win_type >= VAS_MAX_FEAT_TYPE) {
+		pr_err("Unsupported window type %u\n", capab->win_type);
+		return -EINVAL;
+	}
+	capab->max_lpar_creds = be16_to_cpu(capab_be->max_lpar_creds);
+	capab->max_win_creds = be16_to_cpu(capab_be->max_win_creds);
+	atomic_set(&capab->target_lpar_creds,
+		   be16_to_cpu(capab_be->target_lpar_creds));
+	if (feat == VAS_GZIP_DEF_FEAT) {
+		capab->def_lpar_creds = be16_to_cpu(capab_be->def_lpar_creds);
+
+		if (capab->max_win_creds < DEF_WIN_CREDS) {
+			pr_err("Window creds(%u) > max allowed window creds(%u)\n",
+			       DEF_WIN_CREDS, capab->max_win_creds);
+			return -EINVAL;
+		}
+	}
+
+	copypaste_feat = 1;
+
+	return 0;
+}
+
+static int __init pseries_vas_init(void)
+{
+	struct vas_ct_capabs_be *ct_capabs_be;
+	struct vas_all_capabs_be *capabs_be;
+	int rc;
+
+	/*
+	 * Linux supports user space COPY/PASTE only with Radix
+	 */
+	if (!radix_enabled()) {
+		pr_err("API is supported only with radix page tables\n");
+		return -ENOTSUPP;
+	}
+
+	capabs_be = kmalloc(sizeof(*capabs_be), GFP_KERNEL);
+	if (!capabs_be)
+		return -ENOMEM;
+	/*
+	 * Get VAS overall capabilities by passing 0 to feature type.
+	 */
+	rc = plpar_vas_query_capabilities(H_QUERY_VAS_CAPABILITIES, 0,
+					  (u64)virt_to_phys(capabs_be));
+	if (rc)
+		goto out;
+
+	snprintf(capabs_all.name, VAS_DESCR_LEN, "%.7s",
+		 (char *)&capabs_be->descriptor);
+	capabs_all.descriptor = be64_to_cpu(capabs_be->descriptor);
+	capabs_all.feat_type = be64_to_cpu(capabs_be->feat_type);
+
+	ct_capabs_be = kmalloc(sizeof(*ct_capabs_be), GFP_KERNEL);
+	if (!ct_capabs_be) {
+		rc = -ENOMEM;
+		goto out;
+	}
+	/*
+	 * QOS capabilities available
+	 */
+	if (capabs_all.feat_type & VAS_GZIP_QOS_FEAT_BIT) {
+		rc = get_vas_capabilities(VAS_GZIP_QOS_FEAT,
+					  VAS_GZIP_QOS_FEAT_TYPE, ct_capabs_be);
+
+		if (rc)
+			goto out_ct;
+	}
+	/*
+	 * Default capabilities available
+	 */
+	if (capabs_all.feat_type & VAS_GZIP_DEF_FEAT_BIT) {
+		rc = get_vas_capabilities(VAS_GZIP_DEF_FEAT,
+					  VAS_GZIP_DEF_FEAT_TYPE, ct_capabs_be);
+		if (rc)
+			goto out_ct;
+	}
+
+	if (!copypaste_feat)
+		pr_err("GZIP feature is not supported\n");
+
+	pr_info("GZIP feature is available\n");
+
+out_ct:
+	kfree(ct_capabs_be);
+out:
+	kfree(capabs_be);
+	return rc;
+}
+machine_device_initcall(pseries, pseries_vas_init);
-- 
2.18.2



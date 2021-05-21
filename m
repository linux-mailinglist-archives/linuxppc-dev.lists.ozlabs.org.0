Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E838C36A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:39:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhQD42nMz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:39:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ssHPUPhF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ssHPUPhF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhPl5m36z2xxk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:38:51 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YKRE135909; Fri, 21 May 2021 05:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=6qpsYRM7SdSzsr/04hAGbz0BvbpaZjVFG1T/rcUESMg=;
 b=ssHPUPhFqrZZqOslu+ukYiL7IHU7br0MuPzPdXcr4mo8TPk6WwnG+n3JdUNrVhUpRHBj
 of4VisSHIi1o64f8KD9mRZ0EmS2Yht3IkQZLBWeaFMuKZ17me7L5GH3zrnWl9GMGkFRk
 XeetKeKX7mixz/t/L/dMtWmbPElu7whNQFmn9FvIxTRuogndKRIPTrafnMOIIsZ9JzWk
 AFC6phFhKbt7hlxUqkMRDS+Op0DNVX+cxK3fVmr5GUfe7VI8iDh4huJf0w/azk7n6SVn
 HXiSfucCIWv68sgps2BEOY7N7wFNMsgYDDQhdaK26zB1BzR7Fa47GzE8D+AY/xft8RaM Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa92g7nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:38:44 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9ZK22142931;
 Fri, 21 May 2021 05:38:44 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa92g7nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:38:44 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9X57G003222;
 Fri, 21 May 2021 09:38:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 38j7tbp2vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:38:43 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9chYB30933498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:38:43 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27B2EB2065;
 Fri, 21 May 2021 09:38:43 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6DD4B205F;
 Fri, 21 May 2021 09:38:41 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:38:41 +0000 (GMT)
Message-ID: <38548221cc275e0ab7c88fc545fb2f087830af3a.camel@linux.ibm.com>
Subject: [PATCH v4 10/16] powerpc/pseries/vas: Implement getting
 capabilities from hypervisor
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:38:39 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U8vppd0CtucjqDK9B6bUQDshxRJYI5d7
X-Proofpoint-GUID: ad4lcpXEwQZzKCkc9p0i5g35Vwz0UeMf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210061
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


The hypervisor provides VAS capabilities for GZIP default and QoS
features. These capabilities gives information for the specific
features such as total number of credits available in LPAR,
maximum credits allowed per window, maximum credits allowed in
LPAR, whether usermode copy/paste is supported, and etc.

This patch adds the following:
- Retrieve all features that are provided by hypervisor using
  H_QUERY_VAS_CAPABILITIES hcall with 0 as feature type.
- Retrieve capabilities for the specific feature using the same
  hcall and the feature type (1 for QoS and 2 for default type).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 127 +++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 06960151477c..9976f6b614b9 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -30,6 +30,13 @@
 /* phyp allows one credit per window right now */
 #define DEF_WIN_CREDS		1
 
+static struct vas_all_caps caps_all;
+static bool copypaste_feat;
+
+static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
+
+static DEFINE_MUTEX(vas_pseries_mutex);
+
 static int64_t hcall_return_busy_check(int64_t rc)
 {
 	/* Check if we are stalled for some time */
@@ -215,3 +222,123 @@ int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
 		return -EIO;
 	}
 }
+
+/*
+ * Get the specific capabilities based on the feature type.
+ * Right now supports GZIP default and GZIP QoS capabilities.
+ */
+static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
+				struct hv_vas_ct_caps *hv_caps)
+{
+	struct vas_ct_caps *caps;
+	struct vas_caps *vcaps;
+	int rc = 0;
+
+	vcaps = &vascaps[type];
+	memset(vcaps, 0, sizeof(*vcaps));
+	INIT_LIST_HEAD(&vcaps->list);
+
+	caps = &vcaps->caps;
+
+	rc = plpar_vas_query_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
+					  (u64)virt_to_phys(hv_caps));
+	if (rc)
+		return rc;
+
+	caps->user_mode = hv_caps->user_mode;
+	if (!(caps->user_mode & VAS_COPY_PASTE_USER_MODE)) {
+		pr_err("User space COPY/PASTE is not supported\n");
+		return -ENOTSUPP;
+	}
+
+	snprintf(caps->name, VAS_DESCR_LEN + 1, "%.8s",
+		 (char *)&hv_caps->descriptor);
+	caps->descriptor = be64_to_cpu(hv_caps->descriptor);
+	caps->win_type = hv_caps->win_type;
+	if (caps->win_type >= VAS_MAX_FEAT_TYPE) {
+		pr_err("Unsupported window type %u\n", caps->win_type);
+		return -EINVAL;
+	}
+	caps->max_lpar_creds = be16_to_cpu(hv_caps->max_lpar_creds);
+	caps->max_win_creds = be16_to_cpu(hv_caps->max_win_creds);
+	atomic_set(&caps->target_lpar_creds,
+		   be16_to_cpu(hv_caps->target_lpar_creds));
+	if (feat == VAS_GZIP_DEF_FEAT) {
+		caps->def_lpar_creds = be16_to_cpu(hv_caps->def_lpar_creds);
+
+		if (caps->max_win_creds < DEF_WIN_CREDS) {
+			pr_err("Window creds(%u) > max allowed window creds(%u)\n",
+			       DEF_WIN_CREDS, caps->max_win_creds);
+			return -EINVAL;
+		}
+	}
+
+	copypaste_feat = true;
+
+	return 0;
+}
+
+static int __init pseries_vas_init(void)
+{
+	struct hv_vas_ct_caps *hv_ct_caps;
+	struct hv_vas_all_caps *hv_caps;
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
+	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
+	if (!hv_caps)
+		return -ENOMEM;
+	/*
+	 * Get VAS overall capabilities by passing 0 to feature type.
+	 */
+	rc = plpar_vas_query_capabilities(H_QUERY_VAS_CAPABILITIES, 0,
+					  (u64)virt_to_phys(hv_caps));
+	if (rc)
+		goto out;
+
+	snprintf(caps_all.name, VAS_DESCR_LEN, "%.7s",
+		 (char *)&hv_caps->descriptor);
+	caps_all.descriptor = be64_to_cpu(hv_caps->descriptor);
+	caps_all.feat_type = be64_to_cpu(hv_caps->feat_type);
+
+	hv_ct_caps = kmalloc(sizeof(*hv_ct_caps), GFP_KERNEL);
+	if (!hv_ct_caps) {
+		rc = -ENOMEM;
+		goto out;
+	}
+	/*
+	 * QOS capabilities available
+	 */
+	if (caps_all.feat_type & VAS_GZIP_QOS_FEAT_BIT) {
+		rc = get_vas_capabilities(VAS_GZIP_QOS_FEAT,
+					  VAS_GZIP_QOS_FEAT_TYPE, hv_ct_caps);
+
+		if (rc)
+			goto out_ct;
+	}
+	/*
+	 * Default capabilities available
+	 */
+	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT) {
+		rc = get_vas_capabilities(VAS_GZIP_DEF_FEAT,
+					  VAS_GZIP_DEF_FEAT_TYPE, hv_ct_caps);
+		if (rc)
+			goto out_ct;
+	}
+
+	pr_info("GZIP feature is available\n");
+
+out_ct:
+	kfree(hv_ct_caps);
+out:
+	kfree(hv_caps);
+	return rc;
+}
+machine_device_initcall(pseries, pseries_vas_init);
-- 
2.18.2



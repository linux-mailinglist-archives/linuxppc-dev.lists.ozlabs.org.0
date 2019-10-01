Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18231C2D5F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 08:18:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46j8Gr5VnjzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 16:18:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46j87d0GcMzDqFw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 16:12:28 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9168HXV105034; Tue, 1 Oct 2019 02:12:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vby1m3cc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 02:12:23 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9169JPp114050;
 Tue, 1 Oct 2019 02:12:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vby1m3cbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 02:12:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x916A4v4019415;
 Tue, 1 Oct 2019 06:12:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 2v9y580v73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 06:12:21 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x916CLj448234960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 06:12:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C354112064;
 Tue,  1 Oct 2019 06:12:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AA3A112061;
 Tue,  1 Oct 2019 06:12:20 +0000 (GMT)
Received: from ltcalpine2-lp18.aus.stglabs.ibm.com (unknown [9.40.195.201])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 06:12:20 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au, bhelgaas@google.com
Subject: [RFC PATCH 2/9] powerpc/pseries: fix bad drc_index_start value
 parsing of drc-info entry
Date: Tue,  1 Oct 2019 01:12:07 -0500
Message-Id: <1569910334-5972-3-git-send-email-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569910334-5972-1-git-send-email-tyreld@linux.ibm.com>
References: <1569910334-5972-1-git-send-email-tyreld@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=679 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010060
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
Cc: nathanl@linux.ibm.com, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ibm,drc-info property is an array property that contains drc-info
entries such that each entry is made up of 2 string encoded elements
followed by 5 int encoded elements. The of_read_drc_info_cell()
helper contains comments that correctly name the expected elements
and their encoding. However, the usage of of_prop_next_string() and
of_prop_next_u32() introduced a subtle skippage of the first u32.
This is a result of of_prop_next_string() returns a pointer to the
next property value which is not a string, but actually a (__be32 *).
As, a result the following call to of_prop_next_u32() passes over the
current int encoded value and actually stores the next one wrongly.

Simply endian swap the current value in place after reading the first
two string values. The remaining int encoded values can then be read
correctly using of_prop_next_u32().

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/of_helpers.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/of_helpers.c b/arch/powerpc/platforms/pseries/of_helpers.c
index 6df192f..66dfd82 100644
--- a/arch/powerpc/platforms/pseries/of_helpers.c
+++ b/arch/powerpc/platforms/pseries/of_helpers.c
@@ -45,14 +45,14 @@ struct device_node *pseries_of_derive_parent(const char *path)
 int of_read_drc_info_cell(struct property **prop, const __be32 **curval,
 			struct of_drc_info *data)
 {
-	const char *p;
+	const char *p = (char *)(*curval);
 	const __be32 *p2;
 
 	if (!data)
 		return -EINVAL;
 
 	/* Get drc-type:encode-string */
-	p = data->drc_type = (char*) (*curval);
+	data->drc_type = (char *)p;
 	p = of_prop_next_string(*prop, p);
 	if (!p)
 		return -EINVAL;
@@ -65,9 +65,7 @@ int of_read_drc_info_cell(struct property **prop, const __be32 **curval,
 
 	/* Get drc-index-start:encode-int */
 	p2 = (const __be32 *)p;
-	p2 = of_prop_next_u32(*prop, p2, &data->drc_index_start);
-	if (!p2)
-		return -EINVAL;
+	data->drc_index_start = be32_to_cpu(*p2);
 
 	/* Get drc-name-suffix-start:encode-int */
 	p2 = of_prop_next_u32(*prop, p2, &data->drc_name_suffix_start);
-- 
2.7.4


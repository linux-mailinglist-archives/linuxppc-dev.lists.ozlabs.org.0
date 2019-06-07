Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A038495
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 08:48:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KtQc04XVzDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 16:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KtMG0tZfzDqjh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 16:45:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x576cKUY141133
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jun 2019 02:45:26 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sygxcw234-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 02:45:25 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Fri, 7 Jun 2019 07:45:24 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 07:45:22 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x576jLdv40305038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 06:45:21 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1149D28066;
 Fri,  7 Jun 2019 06:45:21 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 692A628058;
 Fri,  7 Jun 2019 06:45:19 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.207])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 06:45:19 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au, oohall@gmail.com
Subject: [PATCH v2] powerpc/nvdimm: Add support for multibyte read/write for
 metadata
Date: Fri,  7 Jun 2019 12:15:11 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060706-0072-0000-0000-00000438CDA4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011227; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214406; UDB=6.00638362; IPR=6.00995492; 
 MB=3.00027216; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-07 06:45:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060706-0073-0000-0000-00004C893D68
Message-Id: <20190607064511.25083-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070047
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SCM_READ/WRITE_MEATADATA hcall supports multibyte read/write. This patch
updates the metadata read/write to use 1, 2, 4 or 8 byte read/write as
mentioned in PAPR document.

READ/WRITE_METADATA hcall supports the 1, 2, 4, or 8 bytes read/write.
For other values hcall results H_P3.

Hypervisor stores the metadata contents in big-endian format and in-order
to enable read/write in different granularity, we need to switch the contents
to big-endian before calling HCALL.

Based on an patch from Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 104 +++++++++++++++++-----
 1 file changed, 82 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0176ce66673f..80fbab118ef1 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -97,42 +97,102 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
 }
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
-			struct nd_cmd_get_config_data_hdr *hdr)
+			     struct nd_cmd_get_config_data_hdr *hdr)
 {
 	unsigned long data[PLPAR_HCALL_BUFSIZE];
+	unsigned long offset, data_offset;
+	int len, read;
 	int64_t ret;
 
-	if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
+	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
 		return -EINVAL;
 
-	ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
-			hdr->in_offset, 1);
-
-	if (ret == H_PARAMETER) /* bad DRC index */
-		return -ENODEV;
-	if (ret)
-		return -EINVAL; /* other invalid parameter */
-
-	hdr->out_buf[0] = data[0] & 0xff;
-
+	for (len = hdr->in_length; len; len -= read) {
+
+		data_offset = hdr->in_length - len;
+		offset = hdr->in_offset + data_offset;
+
+		if (len >= 8)
+			read = 8;
+		else if (len >= 4)
+			read = 4;
+		else if (len >= 2)
+			read = 2;
+		else
+			read = 1;
+
+		ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
+				  offset, read);
+
+		if (ret == H_PARAMETER) /* bad DRC index */
+			return -ENODEV;
+		if (ret)
+			return -EINVAL; /* other invalid parameter */
+
+		switch (read) {
+		case 8:
+			*(uint64_t *)(hdr->out_buf + data_offset) = be64_to_cpu(data[0]);
+			break;
+		case 4:
+			*(uint32_t *)(hdr->out_buf + data_offset) = be32_to_cpu(data[0] & 0xffffffff);
+			break;
+
+		case 2:
+			*(uint16_t *)(hdr->out_buf + data_offset) = be16_to_cpu(data[0] & 0xffff);
+			break;
+
+		case 1:
+			*(uint8_t *)(hdr->out_buf + data_offset) = (data[0] & 0xff);
+			break;
+		}
+	}
 	return 0;
 }
 
 static int papr_scm_meta_set(struct papr_scm_priv *p,
-			struct nd_cmd_set_config_hdr *hdr)
+			     struct nd_cmd_set_config_hdr *hdr)
 {
+	unsigned long offset, data_offset;
+	int len, wrote;
+	unsigned long data;
+	__be64 data_be;
 	int64_t ret;
 
-	if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
+	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
 		return -EINVAL;
 
-	ret = plpar_hcall_norets(H_SCM_WRITE_METADATA,
-			p->drc_index, hdr->in_offset, hdr->in_buf[0], 1);
-
-	if (ret == H_PARAMETER) /* bad DRC index */
-		return -ENODEV;
-	if (ret)
-		return -EINVAL; /* other invalid parameter */
+	for (len = hdr->in_length; len; len -= wrote) {
+
+		data_offset = hdr->in_length - len;
+		offset = hdr->in_offset + data_offset;
+
+		if (len >= 8) {
+			data = *(uint64_t *)(hdr->in_buf + data_offset);
+			data_be = cpu_to_be64(data);
+			wrote = 8;
+		} else if (len >= 4) {
+			data = *(uint32_t *)(hdr->in_buf + data_offset);
+			data &= 0xffffffff;
+			data_be = cpu_to_be32(data);
+			wrote = 4;
+		} else if (len >= 2) {
+			data = *(uint16_t *)(hdr->in_buf + data_offset);
+			data &= 0xffff;
+			data_be = cpu_to_be16(data);
+			wrote = 2;
+		} else {
+			data_be = *(uint8_t *)(hdr->in_buf + data_offset);
+			data_be &= 0xff;
+			wrote = 1;
+		}
+
+		ret = plpar_hcall_norets(H_SCM_WRITE_METADATA, p->drc_index,
+					 offset, data_be, wrote);
+		if (ret == H_PARAMETER) /* bad DRC index */
+			return -ENODEV;
+		if (ret)
+			return -EINVAL; /* other invalid parameter */
+	}
 
 	return 0;
 }
@@ -154,7 +214,7 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		get_size_hdr = buf;
 
 		get_size_hdr->status = 0;
-		get_size_hdr->max_xfer = 1;
+		get_size_hdr->max_xfer = 8;
 		get_size_hdr->config_size = p->metadata_size;
 		*cmd_rc = 0;
 		break;
-- 
2.21.0


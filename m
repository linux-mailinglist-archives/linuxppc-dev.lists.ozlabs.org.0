Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34509C35CD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 15:34:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jKxt4dWpzDqSs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 23:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jKr54sCtzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 23:29:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91DR5wL120433
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Oct 2019 09:29:35 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vc5upmjd3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2019 09:29:35 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Tue, 1 Oct 2019 14:29:33 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 1 Oct 2019 14:29:31 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91DTTG545088888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 13:29:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52C934C073;
 Tue,  1 Oct 2019 13:29:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4D734C075;
 Tue,  1 Oct 2019 13:29:28 +0000 (GMT)
Received: from pomme.tls.ibm.com (unknown [9.101.4.33])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 13:29:28 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: sfr@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/pseries: Remove confusing warning message.
Date: Tue,  1 Oct 2019 15:29:28 +0200
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100113-0008-0000-0000-0000031CC5B7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100113-0009-0000-0000-00004A3B701D
Message-Id: <20191001132928.72555-1-ldufour@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010122
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

Since the commit 1211ee61b4a8 ("powerpc/pseries: Read TLB Block Invalidate
Characteristics"), a warning message is displayed when booting a guest on
top of KVM:

lpar: arch/powerpc/platforms/pseries/lpar.c pseries_lpar_read_hblkrm_characteristics Error calling get-system-parameter (0xfffffffd)

This message is displayed because this hypervisor is not supporting the
H_BLOCK_REMOVE hcall and thus is not exposing the corresponding feature.

Reading the TLB Block Invalidate Characteristics should not be done if the
feature is not exposed.

Fixes: 1211ee61b4a8 ("powerpc/pseries: Read TLB Block Invalidate Characteristics")
Reported-by: Stephen Rothwell <sfr@linux.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index b53359258d99..f87a5c64e24d 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1419,6 +1419,9 @@ void __init pseries_lpar_read_hblkrm_characteristics(void)
 	unsigned char local_buffer[SPLPAR_TLB_BIC_MAXLENGTH];
 	int call_status, len, idx, bpsize;
 
+	if (!firmware_has_feature(FW_FEATURE_BLOCK_REMOVE))
+		return;
+
 	spin_lock(&rtas_data_buf_lock);
 	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
 	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
-- 
2.23.0


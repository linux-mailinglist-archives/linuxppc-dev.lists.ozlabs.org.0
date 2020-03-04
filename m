Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD9179A6E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 21:51:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XmJ74Wd3zDqlL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 07:51:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XmCC1kfLzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 07:47:02 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024KfSZh117785; Wed, 4 Mar 2020 15:46:53 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhsv48xgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 15:46:52 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 024KgQCB121390;
 Wed, 4 Mar 2020 15:46:52 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhsv48xgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 15:46:52 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 024KjNsi001672;
 Wed, 4 Mar 2020 20:46:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 2yffk6nuf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 20:46:51 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024Kkpne56492366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 20:46:51 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4086E04C;
 Wed,  4 Mar 2020 20:46:51 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C9E66E052;
 Wed,  4 Mar 2020 20:46:50 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 20:46:50 +0000 (GMT)
Subject: [PATCH V6 03/14] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1583353283.18705.2112.camel@hbabu-laptop>
References: <1583353283.18705.2112.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Mar 2020 12:45:47 -0800
Message-ID: <1583354747.18705.2140.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_08:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=809 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=1 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040134
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Kernel sets fault address and status in CRB for NX page fault on user
space address after processing page fault. User space gets the signal
and handles the fault mentioned in CRB by bringing the page in to
memory and send NX request again.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/icswx.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
index 9872f85..b233d1e 100644
--- a/arch/powerpc/include/asm/icswx.h
+++ b/arch/powerpc/include/asm/icswx.h
@@ -108,6 +108,17 @@ struct data_descriptor_entry {
 	__be64 address;
 } __packed __aligned(DDE_ALIGN);
 
+/* 4.3.2 NX-stamped Fault CRB */
+
+#define NX_STAMP_ALIGN          (0x10)
+
+struct nx_fault_stamp {
+	__be64 fault_storage_addr;
+	__be16 reserved;
+	__u8   flags;
+	__u8   fault_status;
+	__be32 pswid;
+} __packed __aligned(NX_STAMP_ALIGN);
 
 /* Chapter 6.5.2 Coprocessor-Request Block (CRB) */
 
@@ -135,7 +146,12 @@ struct coprocessor_request_block {
 
 	struct coprocessor_completion_block ccb;
 
-	u8 reserved[48];
+	union {
+		struct nx_fault_stamp nx;
+		u8 reserved[16];
+	} stamp;
+
+	u8 reserved[32];
 
 	struct coprocessor_status_block csb;
 } __packed __aligned(CRB_ALIGN);
-- 
1.8.3.1




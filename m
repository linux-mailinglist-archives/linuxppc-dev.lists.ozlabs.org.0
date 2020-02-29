Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1F174660
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 12:14:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48V3gx020YzDrGw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 22:14:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48V3dy5g1zzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 22:12:22 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01TB42Dq024771; Sat, 29 Feb 2020 06:12:13 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfn04j7cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Feb 2020 06:12:12 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01TB45mZ024872;
 Sat, 29 Feb 2020 06:12:12 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfn04j7ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Feb 2020 06:12:12 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01TB56vg007291;
 Sat, 29 Feb 2020 11:12:11 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2yffk5aaf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Feb 2020 11:12:11 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01TBCAvs61931998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 11:12:10 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73DC06A04F;
 Sat, 29 Feb 2020 11:12:10 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17FB76A054;
 Sat, 29 Feb 2020 11:12:10 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 29 Feb 2020 11:12:09 +0000 (GMT)
Subject: [PATCH V2 1/9] powerpc/vas: Initialize window attributes for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: herbert@gondor.apana.org.au
In-Reply-To: <1582974266.18705.28.camel@hbabu-laptop>
References: <1582974266.18705.28.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 29 Feb 2020 03:11:14 -0800
Message-ID: <1582974674.18705.37.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_03:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002290086
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
Cc: mikey@neuling.org, npiggin@gmail.com, linux-crypto@vger.kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Initialize send and receive window attributes for GZIP high and
normal priority types.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-window.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 5f9c915..b6572af 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -817,7 +817,8 @@ void vas_init_rx_win_attr(struct vas_rx_win_attr *rxattr, enum vas_cop_type cop)
 {
 	memset(rxattr, 0, sizeof(*rxattr));
 
-	if (cop == VAS_COP_TYPE_842 || cop == VAS_COP_TYPE_842_HIPRI) {
+	if (cop == VAS_COP_TYPE_842 || cop == VAS_COP_TYPE_842_HIPRI ||
+		cop == VAS_COP_TYPE_GZIP || cop == VAS_COP_TYPE_GZIP_HIPRI) {
 		rxattr->pin_win = true;
 		rxattr->nx_win = true;
 		rxattr->fault_win = false;
@@ -892,7 +893,8 @@ void vas_init_tx_win_attr(struct vas_tx_win_attr *txattr, enum vas_cop_type cop)
 {
 	memset(txattr, 0, sizeof(*txattr));
 
-	if (cop == VAS_COP_TYPE_842 || cop == VAS_COP_TYPE_842_HIPRI) {
+	if (cop == VAS_COP_TYPE_842 || cop == VAS_COP_TYPE_842_HIPRI ||
+		cop == VAS_COP_TYPE_GZIP || cop == VAS_COP_TYPE_GZIP_HIPRI) {
 		txattr->rej_no_credit = false;
 		txattr->rx_wcred_mode = true;
 		txattr->tx_wcred_mode = true;
@@ -976,9 +978,14 @@ static bool tx_win_args_valid(enum vas_cop_type cop,
 	if (attr->wcreds_max > VAS_TX_WCREDS_MAX)
 		return false;
 
-	if (attr->user_win &&
-			(cop != VAS_COP_TYPE_FTW || attr->rsvd_txbuf_count))
-		return false;
+	if (attr->user_win) {
+		if (attr->rsvd_txbuf_count)
+			return false;
+
+		if (cop != VAS_COP_TYPE_FTW && cop != VAS_COP_TYPE_GZIP &&
+			cop != VAS_COP_TYPE_GZIP_HIPRI)
+			return false;
+	}
 
 	return true;
 }
-- 
1.8.3.1




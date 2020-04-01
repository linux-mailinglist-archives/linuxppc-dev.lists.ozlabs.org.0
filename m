Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437B19B813
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:02:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0YT2kk9zDrC8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:02:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0T440BZzDr7N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:58:48 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031Lcv2q070344; Wed, 1 Apr 2020 17:58:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304sws992t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:58:37 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031LqILx095764;
 Wed, 1 Apr 2020 17:58:37 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304sws992m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:58:37 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031LpMfC024124;
 Wed, 1 Apr 2020 21:58:36 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 301x77431j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 21:58:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031Lwa1n53215624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 21:58:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DA142805A;
 Wed,  1 Apr 2020 21:58:36 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 438E72805C;
 Wed,  1 Apr 2020 21:58:35 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 21:58:35 +0000 (GMT)
Subject: [PATCH v5 1/9] powerpc/vas: Initialize window attributes for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585777592.10664.462.camel@hbabu-laptop>
References: <1585777592.10664.462.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 14:57:49 -0700
Message-ID: <1585778269.10664.476.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010174
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
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
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
index be900ad..d239c4b 100644
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




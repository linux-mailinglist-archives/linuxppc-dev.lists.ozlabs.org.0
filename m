Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55035A42DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 08:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGKZR5sXjz3f7N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 16:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tRmQDPEL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tRmQDPEL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGKPh3jngz3bln
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 15:54:00 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T4rPfA022603;
	Mon, 29 Aug 2022 05:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lKk9hXY4r5Sb9mtQLCxL0NSSp+74V2pNwg5U79uSRjk=;
 b=tRmQDPELyIRzYygwh8Kv9DRRYkmVq8GgIGZQwrKgkGtlNBKbNQFC2G1vxXdfJenKSTay
 Tgkq7njGgSF5lux1BRW0k7qWFfYNVfEG+i4Pn0/dxaDw/6X5ocveKRZbaeNVaLeBGNEs
 s2MyDf5UufiBYD39kfjQbH7a3Byjym+G74pGpQDUbhZEidp0sodxy+QHfihPN9Jr3P7g
 oqIfPP2FY4upfmSr6Km6ot8BsBAYM2rI7ivmDpIYnRD133vx4bvRPrcxyfXHGHIHvWxK
 GDmflkPeCizZ9F8YpwGXkQUUfw3n53GM13x5kLjaZB2NsanPtXGsYi8h1UV6K0iKIiof Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8pu09ams-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:53:40 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27T5hjon023689;
	Mon, 29 Aug 2022 05:53:39 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8pu09am8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:53:39 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T5pANI016410;
	Mon, 29 Aug 2022 05:53:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3j7aw8sbx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:53:37 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T5rZ7u39584076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 05:53:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E7F74C040;
	Mon, 29 Aug 2022 05:53:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 797894C044;
	Mon, 29 Aug 2022 05:53:31 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.67.34])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 05:53:31 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/16] objtool: Read special sections with alts only when specific options are selected
Date: Mon, 29 Aug 2022 11:22:19 +0530
Message-Id: <20220829055223.24767-13-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220829055223.24767-1-sv@linux.ibm.com>
References: <20220829055223.24767-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n9AeO9N8EvBDc_Dn3haV8Resg3I19Bhw
X-Proofpoint-ORIG-GUID: wXmQ8h6RHH9xzxUydDwWpZltM8kXski2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290026
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch reads special sections which have alternate
instructions, only when stackval or orc or uaccess or
noinstr options are passed to objtool.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/check.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3cea58f73878..5298a143ceac 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2370,9 +2370,11 @@ static int decode_sections(struct objtool_file *file)
 	 * Must be before add_jump_destinations(), which depends on 'func'
 	 * being set for alternatives, to enable proper sibling call detection.
 	 */
-	ret = add_special_section_alts(file);
-	if (ret)
-		return ret;
+	if (opts.stackval || opts.orc || opts.uaccess || opts.noinstr) {
+		ret = add_special_section_alts(file);
+		if (ret)
+			return ret;
+	}
 
 	ret = add_jump_destinations(file);
 	if (ret)
-- 
2.31.1


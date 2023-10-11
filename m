Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF57C4953
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:43:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NzSIU3YP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51s529k6z3vtl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NzSIU3YP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kQ4vxWz3c5K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:34 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5WPSX012206
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=lQgzzfK1lFVFZt4zcwxkRG4mfbzayVysLttRtMx4Lkw=;
 b=NzSIU3YPLSbD+H4bFqeKMu9GXq62C24BafHYDEgP1PaMlFJzip6JKoISs/aRyTfGFCiB
 gZj/zcvAEo3U+GwMfanDOC3Yixkq39QCLZjjUegR5RlE2LKaX85tNhW0rffK7Gt5UeFF
 2KjoNiwLOPQj6H/l9QyGrjjynX9/27kPcol0emO+ZMZqzKnsxe3IYeQ9gq7rjwzx2Eir
 i/0UqSpvz/k4/GEyhK6n5tFa49h8maw8cfX5+QXCqcP8EbIUHOxxGi/4PELl8REPVaTD
 Zw3vXKLiAV0HFmJ2fSXycW3zq2jdHccolpThBh7aWlAYNhWTHJRxiA235y4cxc23PEO4 QA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnn2g4sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B43cCC023021
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc1ndnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bTug8651266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DC202004B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CD0220040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8688560808;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/12] powerpc/opal: Annotate out param endianness
Date: Wed, 11 Oct 2023 16:37:07 +1100
Message-ID: <20231011053711.93427-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c2WUv7_1oJaOM2VPpm1ueg--dE8p1RTC
X-Proofpoint-GUID: c2WUv7_1oJaOM2VPpm1ueg--dE8p1RTC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_03,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=954 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110050
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports an endian mismatch with args to opal_int_get_xirr().
Checking the skiboot source[1] shows the function takes a __be32*
(as expected), so update the function declaration to reflect this.

[1]: https://github.com/open-power/skiboot/blob/80e2b1dc73/hw/xive.c#L3479

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/opal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index a9b31cc258fc..b66b0c615f4f 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -227,7 +227,7 @@ int64_t opal_pci_set_power_state(uint64_t async_token, uint64_t id,
 				 uint64_t data);
 int64_t opal_pci_poll2(uint64_t id, uint64_t data);
 
-int64_t opal_int_get_xirr(uint32_t *out_xirr, bool just_poll);
+int64_t opal_int_get_xirr(__be32 *out_xirr, bool just_poll);
 int64_t opal_int_set_cppr(uint8_t cppr);
 int64_t opal_int_eoi(uint32_t xirr);
 int64_t opal_int_set_mfrr(uint32_t cpu, uint8_t mfrr);
-- 
2.39.2


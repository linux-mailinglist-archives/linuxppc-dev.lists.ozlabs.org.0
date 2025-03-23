Return-Path: <linuxppc-dev+bounces-7299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7777A6D008
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 17:36:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLMJY2Wyvz2ygd;
	Mon, 24 Mar 2025 03:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742747789;
	cv=none; b=CGO0hIAtAYnbShGjUIVBn8BbX9P8AKXwpWTVfQRT/NKIw6Cr+xFJ9swrptLKp/Q8SWfvBBhF8KFcB+vnM0vi+177ePCd6T6p9rDJO8V1QWgi0aVywd5WHJ2X5sO+Zn4MO53xJK7VfA4Hhro8o5WCjPVUpKh0xN4OvbF93yQVVSEny8PpQ87mH3zxfh8SijlhscNsB9htzZcrQHXoCbwz67G8Xl4NLW6Ced9E3Dlqv6IS68ra63XUkQhgv6Hxdy3k29bA4GW+w+o5BLNPhaQyuozVif9uCSQGlVEZBNYhcEr8eAo84eIytkIeGEhelDGly+Bbtdp0Od5k6GbkVJbssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742747789; c=relaxed/relaxed;
	bh=sM/ybHruEmdSlSR/k3rexBzIxeb6dE4m6RLkYIDagPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQCE7r38+v48PBr6vUVW4h3oK7ibM5r7OllVy2wWU+P7EwEOHirDHKr7XKqDyO3lR8Qot5K7jYYiaYfoKWTKDK3jfXYEmfSNJvALyh/iYlW0Hu0L91GQr7f97OF5E46ystDGEhKktxSQRT8MEXfkYDJq+kooJaw7oEOQ8q4YbgE7cSUt07/UAZAimfJRGsFx/g0ZOYYyIug1hV6zQrrj1GusLLRjT8SKAl9wjRPytVEnVEl9iE/gG2DsKzy3ffXQNlTm5AvElyo/BasCREoIjmBxagiuN7i+IVkcGDlYRfyzfhYJ87/xt/rVSuaOSOXvIQ3T6+fAUCd+qlR1KgmwXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qwWXMvyf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qwWXMvyf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLMJX025Hz2yfR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 03:36:27 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52NEAG40007193;
	Sun, 23 Mar 2025 16:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sM/ybH
	ruEmdSlSR/k3rexBzIxeb6dE4m6RLkYIDagPQ=; b=qwWXMvyf9wX0cxJIkb6Ztu
	BA1GfkDev9DjjCl4y1ZqmeK2xrKJvjmaLhNPyt/Ms2CSLcrbt7NgGyPKswG3dLHF
	YVmoWz4KLghr9djr9DCuZv9zS7Rg5WaW7kGACuW8AXaqrKy42bN6Mw6rGZpwkyM2
	qM610NNRNFpLQExr648moeZUpYylKMjKnClFQIcsr/8HkG2Owsn4WT+DeyZuqDtv
	R+8aX/taYfE7mbCxG9nh45hXryp2feN0IIQ/RudVLdYplCS3GNCbgRmp0+bRu/8m
	f8ArvBeANxIuuGBfvhIJGBUzB3URu4+MCh8V/vM8eCXE2scS00wGXbHC2mvlrkNA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45j4cp2u3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 16:36:15 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52NGXTfL009795;
	Sun, 23 Mar 2025 16:36:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45j4cp2u3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 16:36:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52NDTAnq009694;
	Sun, 23 Mar 2025 16:36:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j9rka89y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 16:36:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52NGaANF13369850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Mar 2025 16:36:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A962B20043;
	Sun, 23 Mar 2025 16:36:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E3D220040;
	Sun, 23 Mar 2025 16:36:09 +0000 (GMT)
Received: from ltcden6-lp1.aus.stglabs.ibm.com (unknown [9.3.101.155])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Mar 2025 16:36:09 +0000 (GMT)
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arch/powerpc: Remove redundant typedef for bool
Date: Sun, 23 Mar 2025 11:36:07 -0500
Message-ID: <20250323163607.537270-2-misanjum@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250323163607.537270-1-misanjum@linux.ibm.com>
References: <20250323163607.537270-1-misanjum@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2CiNiKEF0Y0ptND0lguePAc19oiyAy3m
X-Proofpoint-GUID: 715rgrEjQYfMiu-wbW7z75spDO1Pdkt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_08,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=614
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503230115
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The custom 'bool' typedef in arch/powerpc/boot/types.h is incompatible with
the C23 standard, where 'bool', 'true', and 'false' are now reserved keywords.
With newer GCC versions (such as GCC 15), redefining 'bool' leads to compilation
errors. For example:
    error: 'bool' cannot be defined via 'typedef'

Since 'stdbool.h' is already included and provides a standard definition for
'bool', this typedef is redundant and can be removed to avoid conflicts.

Compilation Error:
    $ make -j$(nproc)
    ....
    In file included from arch/powerpc/boot/ops.h:13,
                     from arch/powerpc/boot/cuboot.c:12:
    arch/powerpc/boot/types.h:43:13: error: ‘bool’ cannot be defined via ‘typedef’
    43 | typedef int bool;
        |             ^~~~
    arch/powerpc/boot/types.h:43:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
    arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declaration
    43 | typedef int bool;
        | ^~~~~~~
    ....
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/devtree.o] Error 1
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/ofconsole.o] Error 1
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/ns16550.o] Error 1
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/main.o] Error 1
    make[1]: *** [arch/powerpc/Makefile:236: zImage] Error 2
    make: *** [Makefile:251: __sub-make] Error 2

Signed-off-by: Misbah Anjum N <misanjum@linux.ibm.com>
---
 arch/powerpc/boot/types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/types.h b/arch/powerpc/boot/types.h
index 8a4c418b7..6f34b31b8 100644
--- a/arch/powerpc/boot/types.h
+++ b/arch/powerpc/boot/types.h
@@ -40,7 +40,9 @@ typedef s64 int64_t;
 #define min_t(type, a, b) min(((type) a), ((type) b))
 #define max_t(type, a, b) max(((type) a), ((type) b))
 
+#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202300L
 typedef int bool;
+#endif
 
 #ifndef true
 #define true 1
-- 
2.49.0



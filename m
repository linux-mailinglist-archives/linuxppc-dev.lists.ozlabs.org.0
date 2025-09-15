Return-Path: <linuxppc-dev+bounces-12189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F6B5713B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGhZ0syzz3dCy;
	Mon, 15 Sep 2025 17:22:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757920974;
	cv=none; b=dnJH42MH5d+lb5Qn9+zAMBf4le7WhRsvEsf1p3RHx0TO0MRlCfiEujIFqxr5CXaIsl0Aaq45ejqy4i+OophUCB4qcZfLX7+mC0/EprO1GwnRh+TxrPB0nhy9g8O2WYrKtwLmJ2lXedQrXMUvagY4UJ0d44KDPY7a8RCo52YbMYE/0eO/KysGanagiFKBcSIuy1BjQKsB2MUcpGeMZjuJeA1yiZN+Dk3UwCxb2giVTNCWtDkRZP56d/oGUsECF2DxoOsBTR9nkCbG1f9d7MhfRKRytXrhqoK6x6BoViUSZCc9xwazQVU7GJcAxjAS4FdKXTHlJwKCuJ9RKCuGsSZeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757920974; c=relaxed/relaxed;
	bh=9pUHNULlmkLRqKtdbIbTPC4WrxXBd1DhJ4v015qNlr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gO4SOd9Bj/s900iLH6ChYZo52sb3JdfxMwcpbYnbTHwEjNFzfxs1vSeBsYJLN2z+kRneSmF7QNUsKbjgE/XdYfjUqUagAtPjCWjhDiUITUe4gU83C1GVSYP8svOuYiF+7IDeVX/K6xADC9OvwPvlBkMVTbZPGG4j1pS7TMKlcHR/E7I4qj7ZN2PhuPzH7TDTZTM8Ga6GT8P8UhqP3UUr1gSN2XKCARvO4R1S9sAvDBuQpQF/LOU7o8y3nYUN/Aedze2/h4S5+xCuF3Uvi2QZQl/yWMZwDm0dIDpy17ywLoIev73E7fbcQpfVqKxhgCONmV2etbNi39jDbfH+WQ7RVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMak0YFA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMak0YFA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGhY2nhRz3d2B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:22:53 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENLPxX001292;
	Mon, 15 Sep 2025 07:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9pUHNULlmkLRqKtdb
	IbTPC4WrxXBd1DhJ4v015qNlr4=; b=dMak0YFANcJ10gcQ/hWxZGUWcxDzpuy2+
	uG9DHUFT5J0am/Pr+SiaoxYpEdRUlNhMUHqS0Cqjed1HzSRGB93NTht9mrda/GvS
	Jh/eotf0BRHnrGHBgFxzjkGr9thP27kRUAlB5znXTsfgnhMKpjIzFjCTLcDITsaZ
	rt/uPx8JIytU0cmzKp06ih1bU52EhMe7FvZORrzm2OT5CpxcHF9cwzo6MOReuvfF
	t6hJXJQ8NbM4AEx6pBi+HIS6FhEUxf4BAwNMhP9jTE+jGbJ46N7+L8Ieda8ZWYef
	6bmVw2AC+1HMT/HXxWcLceEjCC/K03xLmEfa197r/SQMO4TQ7764g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y11pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:22:49 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7GtkZ026556;
	Mon, 15 Sep 2025 07:22:49 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y11p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:22:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F34P6C022300;
	Mon, 15 Sep 2025 07:22:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kxpd6ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:22:47 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7Mi9i18088358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:22:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EA4D20043;
	Mon, 15 Sep 2025 07:22:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF50C20040;
	Mon, 15 Sep 2025 07:22:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:22:37 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V2 1/7] powerpc/time: Expose boot_tb via accessor
Date: Mon, 15 Sep 2025 12:52:18 +0530
Message-Id: <20250915072224.98958-2-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072224.98958-1-atrajeev@linux.ibm.com>
References: <20250915072224.98958-1-atrajeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX93aW90e9MRBK
 tQqUYAoU3GafpRWn2XfWe4Dj5AdACssafKuQf8pIEU6lH/5od4jv1MhsRIaUzfHO+hC5cgfUc+i
 U/3g2oVfXG9pjslMA549efP8W83/A4+0CTPmt72kwmstsqw0IeXR1M8Xt7hjuVS0oOXU4hZnhwk
 DGBYWkv5JS+C5TJlP/IefqjA6Ah6UtStHWaaD9iKvawBhGcSdPJFa7RfKtyJlD7Vk0dy7MKaeTb
 J4GP/dvn6ztSy4jI8JGqVLjluoI3zsMx85XddVhQgVjR2jEvWLcnvrFLGy3P7rf1FgS7ohrQhz3
 7lQd3Kwl+RdBjSs+b/ROL7fMS7f7V/b1j0oPirt4v69GzJkoc6kpz0lSQjZrPn86p9joAKRJV8c
 iWjuk+WB
X-Authority-Analysis: v=2.4 cv=OPYn3TaB c=1 sm=1 tr=0 ts=68c7bec9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=cbn_3OFnJLNrDsZptFIA:9
X-Proofpoint-GUID: C1HEYCOR1T-KSXuYF5vsX0R24JMmFCS_
X-Proofpoint-ORIG-GUID: dzbAZb9npxcF9MkOYqjspO7zDEL3p7dx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Aboorva Devarajan <aboorvad@linux.ibm.com>

- Define accessor function get_boot_tb() to safely return boot_tb value,
  this is only needed when running in SPLPAR environments, so the
  accessor is built conditionally under CONFIG_PPC_SPLPAR.

- Tag boot_tb as __ro_after_init since it is written once at initialized
  and never updated afterwards.

Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
---
Changelog:
As suggested by Maddy, wrap boot_tb under
CONFIG_PPC_SPLPAR

 arch/powerpc/include/asm/time.h | 4 ++++
 arch/powerpc/kernel/time.c      | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index f8885586efaf..7991ab1d4cb8 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -29,6 +29,10 @@ extern u64 decrementer_max;
 
 extern void generic_calibrate_decr(void);
 
+#ifdef CONFIG_PPC_SPLPAR
+extern u64 get_boot_tb(void);
+#endif
+
 /* Some sane defaults: 125 MHz timebase, 1GHz processor */
 extern unsigned long ppc_proc_freq;
 #define DEFAULT_PROC_FREQ	(DEFAULT_TB_FREQ * 8)
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 8224381c1dba..4bbeb8644d3d 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -137,7 +137,7 @@ EXPORT_SYMBOL_GPL(rtc_lock);
 
 static u64 tb_to_ns_scale __read_mostly;
 static unsigned tb_to_ns_shift __read_mostly;
-static u64 boot_tb __read_mostly;
+static u64 boot_tb __ro_after_init;
 
 extern struct timezone sys_tz;
 static long timezone_offset;
@@ -639,6 +639,12 @@ notrace unsigned long long sched_clock(void)
 	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
 }
 
+#ifdef CONFIG_PPC_SPLPAR
+u64 get_boot_tb(void)
+{
+	return boot_tb;
+}
+#endif
 
 #ifdef CONFIG_PPC_PSERIES
 
-- 
2.47.1



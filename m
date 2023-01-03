Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625E65BE69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 11:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmTzn3NPbz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 21:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSJleZlG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ojaswin@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSJleZlG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmSpY5sR7z30hl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 20:57:57 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3036NxG8038590;
	Tue, 3 Jan 2023 09:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YnVV25GPduJNGRyUDB4bFnWdwPvGy6QVBIvQ/oA/+5A=;
 b=NSJleZlG1L3ghZL1+837YSMjrsM5v4wPXI7r3yBTZPDAmxG9BSH6+kqxaCdEY83++14+
 aBKi91OhzxTzL1//wddbPDcrSobRTX2IXTseNCsurumbItYiZTjgvPTqMg9RQYfFFIn0
 ahj8JXcbqBWmpWXPv2zIZt3QJsJypRwVb/0SGdwD1MnCDmaS3Qlh1Yz0go/J95HuN6g+
 Xql1PqewHmWHFHXRqEA6Az7s9OpWatnbLTEdXSJCWbPNpAewdD2lEAt93skEx7XIJlZK
 BD18Hfd36neBXXNjThjouSXTcQ2EisFmqd1XuBIeY2ebZfXU0j49GwkXNrf+wBhN0Ai/ UQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvf2fbk0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 09:57:49 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3038kjQC001428;
	Tue, 3 Jan 2023 09:57:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbfbm9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 09:57:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3039vjmt43909494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jan 2023 09:57:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E820020043;
	Tue,  3 Jan 2023 09:57:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C35820049;
	Tue,  3 Jan 2023 09:57:44 +0000 (GMT)
Received: from li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.in.ibm.com (unknown [9.109.253.169])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Jan 2023 09:57:43 +0000 (GMT)
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Fix a wrong version calculation issue in ld_version
Date: Tue,  3 Jan 2023 15:27:40 +0530
Message-Id: <20230103095740.916038-1-ojaswin@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tm3X5iefYWe7aIXWlH4s1F4S5nJ5fo_D
X-Proofpoint-ORIG-GUID: tm3X5iefYWe7aIXWlH4s1F4S5nJ5fo_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030084
X-Mailman-Approved-At: Tue, 03 Jan 2023 21:50:14 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

** The Issue **

The ld_version() function seems to compute the wrong version value for
certain ld versions like the following:

$ ld --version GNU ld (GNU Binutils; SUSE Linux Enterprise 15)
2.37.20211103-150100.7.37

For input 2.37.20211103, the value computed is 202348030000 which is way
more the value for a higher version like 2.39.0, that is 23900000.

This issue was highlighted because with the above ld version, my powerpc
kernel build started failing with ld error: "unrecognized option
--no-warn-rwx-segments".  This was caused due to the recent patch
579aee9fc594 added --no-warn-rwx-segments linker flag if the ld version
was greater than 2.39.

Due to the bug in ld_version(), my ld version (2.37.20111103) was
wrongly calculated to be greater than 2.39 and the unsupported flag was
added.

** The fix **

If version is of the form x.y.z and length(z) == 8, then most probably
it is a date [yyyymmdd]. As an approximation, discard the dd and yyyy
parts and keep the mm part in the version.

Signed-off-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
---

This is just an approximation since I'm not sure how common such release
versions for ld are and I didn't wan't to uneccassarily complicate the
logic. In case we want more accuracy we can try to use the last 4/5
digits to represent a more accurate date.  Let me know if that would be
the preferred way.

PS: This issue also exists in ./scripts/ld-version.sh and I can look
into fixing that after this patch.

 arch/powerpc/boot/wrapper | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index af04cea82b94..af2688f79224 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -210,6 +210,10 @@ ld_version()
 	gsub(".*version ", "");
 	gsub("-.*", "");
 	split($1,a, ".");
+	if( length(a[3]) == "8" )
+		# a[3] is probably a date of format yyyymmdd. An 8 digit number will break
+		# the function so just keep the "mm" part as an approximation
+		a[3] = substr(a[3],5,2);
 	print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
 	exit
     }'
-- 
2.31.1


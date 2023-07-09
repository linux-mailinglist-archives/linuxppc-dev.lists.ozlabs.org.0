Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E8574C72D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:36:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kC86HY6E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzbS52qNQz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:36:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kC86HY6E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHT1jwJz3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:37 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IMvUY007703;
	Sun, 9 Jul 2023 18:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UqAO3PubnZ0hxIJg58NVAAxh7lsx/3vQlxBnmE6xzSE=;
 b=kC86HY6EEPkD1+Qr2UUcIZ0D7452pO7TzIaoUi55blI6198Al/xRyVENkPdPpdmtiNDY
 WtY36rHuJrVpWI6fFs3HcZfcdWASV+DLnRsR15KSss6m5FcMx93XlM7jJhYAYnbN/gT1
 BNMYyEQEahDpPCKWf/jHoZh3LYXFiNR+Mjg0D8bmBReO4f4t7XE6Oa0p5Tq/VZIMpuTG
 3NLqeMiuaMv1duRGThSHOOyEJfc+gUGIB1xjF5qrwRzJtmDGQtwTUNgL5LIgHvtc3I99
 dxrNF5h6yUxMWLDK82gONF/CHsomhQbU3TYsfq2s19/16zakEMLJYdHkSEgDRHyjLbO8 wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr24181f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:33 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369IPWSX013707;
	Sun, 9 Jul 2023 18:28:32 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr24181er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369ISUV8011580;
	Sun, 9 Jul 2023 18:28:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rpye50mpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISR0I19726934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7274A2004B;
	Sun,  9 Jul 2023 18:28:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41F5920043;
	Sun,  9 Jul 2023 18:28:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 08/26] tools/perf/tests: fix shellcheck warning for test_perf_data_converter_json.sh testcase
Date: Sun,  9 Jul 2023 23:57:42 +0530
Message-Id: <20230709182800.53002-9-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PKH6pAqwRWki9Yya__srZdRqMwo_OGa0
X-Proofpoint-ORIG-GUID: H2z5_WL9NreuUJZ-dUSj-yBrTV15oymq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=989 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307090169
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running shellcheck on test_perf_data_converter_json.sh throws
below warning:

   In tests/shell/test_perf_data_converter_json.sh line 42:
   	if [ $(cat "${result}" | wc -l) -gt "0" ] ; then
                ^------------------------^ SC2046 (warning): Quote this to prevent word splitting.

Fixed the warning by adding quotes to avoid word splitting.

ShellCheck result with patch:
    # shellcheck -S warning test_perf_data_converter_json.sh
    #

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/test_perf_data_converter_json.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/test_perf_data_converter_json.sh b/tools/perf/tests/shell/test_perf_data_converter_json.sh
index 72ac6c83231c..6ded58f98f55 100755
--- a/tools/perf/tests/shell/test_perf_data_converter_json.sh
+++ b/tools/perf/tests/shell/test_perf_data_converter_json.sh
@@ -39,7 +39,7 @@ test_json_converter_command()
 	echo "Testing Perf Data Convertion Command to JSON"
 	perf record -o "$perfdata" -F 99 -g -- perf test -w noploop > /dev/null 2>&1
 	perf data convert --to-json "$result" --force -i "$perfdata" >/dev/null 2>&1
-	if [ $(cat "${result}" | wc -l) -gt "0" ] ; then
+	if [ "$(cat ${result} | wc -l)" -gt "0" ] ; then
 		echo "Perf Data Converter Command to JSON [SUCCESS]"
 	else
 		echo "Perf Data Converter Command to JSON [FAILED]"
-- 
2.39.1


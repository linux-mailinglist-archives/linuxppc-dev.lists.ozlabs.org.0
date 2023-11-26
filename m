Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B327F91B6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 08:16:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouHE+qHJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdKkt1B97z3cYj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 18:16:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ouHE+qHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdKjz2RFXz3cCS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 18:15:18 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AQ6eaJm027758;
	Sun, 26 Nov 2023 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=WY6h/tmdE4HeZvaHgqTTueAm8o4h4g187iAQ5G/36CI=;
 b=ouHE+qHJb0QGotXYTZIGHm9A+398QsLaA1wMf1OHHCigw/d2eAmtvtalXztJEV99Baul
 0QPwYXld9GGsQoMKYdJ7/E8ES6lABTIJmg7kWzdiUdky4WAaus7hTonyFYSucGZDGbQZ
 Cbar/xg8BQMG0jlNdCK2hxqMB1CJiZ6I5e80J97ZVRoBv9Qozo9XscyfMCZ9rIGZasDv
 FxmS8+oU+Nmid9Yur8Uk1lsaExE3/qZUUbMmETnkpOG685xcdT1FL7dn8ejogZllI3rD
 4rXyKs3uMZDOzGl6FpAy4meVtN3VIOU0dbwB1gp5sxuN7/kNUcy6+vuofqGOrJHNR+c8 Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukyr49jtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Nov 2023 07:15:00 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AQ7A92L006529;
	Sun, 26 Nov 2023 07:15:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukyr49jt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Nov 2023 07:15:00 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AQ54JKv016595;
	Sun, 26 Nov 2023 07:14:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8shmm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Nov 2023 07:14:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AQ7EuDv61800750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 26 Nov 2023 07:14:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 520132004B;
	Sun, 26 Nov 2023 07:14:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08D9C20040;
	Sun, 26 Nov 2023 07:14:54 +0000 (GMT)
Received: from ltcden12-lp10.aus.stglabs.ibm.com (unknown [9.40.195.121])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 26 Nov 2023 07:14:53 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, james.clark@arm.com, namhyung@kernel.org
Subject: [PATCH] perf test record+probe_libc_inet_pton: Fix call chain match on powerpc
Date: Sun, 26 Nov 2023 02:09:14 -0500
Message-Id: <20231126070914.175332-1-likhitha@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6Sz3_eJznTKIDP9xJX-XLJqjAFSYDRcq
X-Proofpoint-GUID: Qti3jEb68miCrsB0R9kYs-XJtfeZaN5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-26_05,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311260049
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
Cc: atrajeev@linux.vnet.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, Likhitha Korrapati <likhitha@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The perf test "probe libc's inet_pton & backtrace it with ping" fails on
powerpc as below:

root@xxx perf]# perf test -v "probe libc's inet_pton & backtrace it with
ping"
 85: probe libc's inet_pton & backtrace it with ping                 :
--- start ---
test child forked, pid 96028
ping 96056 [002] 127271.101961: probe_libc:inet_pton: (7fffa1779a60)
7fffa1779a60 __GI___inet_pton+0x0
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
7fffa172a73c getaddrinfo+0x121c
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
FAIL: expected backtrace entry
"gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power10/libc.so.6\)$"
got "7fffa172a73c getaddrinfo+0x121c
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
test child finished with -1
---- end ----
probe libc's inet_pton & backtrace it with ping: FAILED!

This test installs a probe on libc's inet_pton function, which will use
uprobes and then uses perf trace on a ping to localhost. It gets 3
levels deep backtrace and checks whether it is what we expected or not.

The test started failing from RHEL 9.4 where as it works in previous
distro version (RHEL 9.2). Test expects gaih_inet function to be part of
backtrace. But in the glibc version (2.34-86) which is part of distro
where it fails, this function is missing and hence the test is failing.

From nm and ping command output we can confirm that gaih_inet function
is not present in the expected backtrace for glibc version glibc-2.34-86

[root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep gaih_inet
00000000001273e0 t gaih_inet_serv
00000000001cd8d8 r gaih_inet_typeproto

[root@xxx perf]# perf script -i /tmp/perf.data.6E8
ping  104048 [000] 128582.508976: probe_libc:inet_pton: (7fff83779a60)
            7fff83779a60 __GI___inet_pton+0x0
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
            7fff8372a73c getaddrinfo+0x121c
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
               11dc73534 [unknown] (/usr/bin/ping)
            7fff8362a8c4 __libc_start_call_main+0x84
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)

FAIL: expected backtrace entry
"gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power10/libc.so.6\)$"
got "7fff9d52a73c getaddrinfo+0x121c
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)"

With version glibc-2.34-60 gaih_inet function is present as part of the
expected backtrace. So we cannot just remove the gaih_inet function from
the backtrace.

[root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep gaih_inet
0000000000130490 t gaih_inet.constprop.0
000000000012e830 t gaih_inet_serv
00000000001d45e4 r gaih_inet_typeproto

[root@xxx perf]# ./perf script -i /tmp/perf.data.b6S
ping   67906 [000] 22699.591699: probe_libc:inet_pton_3: (7fffbdd80820)
            7fffbdd80820 __GI___inet_pton+0x0
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
            7fffbdd31160 gaih_inet.constprop.0+0xcd0
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
            7fffbdd31c7c getaddrinfo+0x14c
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
               1140d3558 [unknown] (/usr/bin/ping)

This patch solves this issue by doing a conditional skip. If there is a
gaih_inet function present in the libc then it will be added to the
expected backtrace else the function will be skipped from being added
to the expected backtrace.

Output with the patch

[root@xxx perf]# ./perf test -v "probe libc's inet_pton & backtrace it
with ping"
 83: probe libc's inet_pton & backtrace it with ping                 :
--- start ---
test child forked, pid 102662
ping 102692 [000] 127935.549973: probe_libc:inet_pton: (7fff93379a60)
7fff93379a60 __GI___inet_pton+0x0
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
7fff9332a73c getaddrinfo+0x121c
(/usr/lib64/glibc-hwcaps/power10/libc.so.6)
11ef03534 [unknown] (/usr/bin/ping)
test child finished with 0
---- end ----
probe libc's inet_pton & backtrace it with ping: Ok

Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
Reported-by: Disha Goel <disgoel@linux.ibm.com>
---
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index eebeea6bdc76..72c65570db37 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -45,7 +45,10 @@ trace_libc_inet_pton_backtrace() {
 		;;
 	ppc64|ppc64le)
 		eventattr='max-stack=4'
-		echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
+		# Add gaih_inet to expected backtrace only if it is part of libc.
+		if nm $libc | grep -F -q gaih_inet.; then
+			echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
+		fi
 		echo "getaddrinfo\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
 		echo ".*(\+0x[[:xdigit:]]+|\[unknown\])[[:space:]]\(.*/bin/ping.*\)$" >> $expected
 		;;
-- 
2.39.1


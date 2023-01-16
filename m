Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0666B6C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 06:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwKg80smsz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 16:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=InAVUucn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=InAVUucn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwKd70kQsz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 16:02:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G2c0al010325;
	Mon, 16 Jan 2023 05:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=vFP/ofaQdyiHcfaJkBrXVx2CsKRiOZMHTG2Jh6PjjMs=;
 b=InAVUucnnQmnXPhH8QGz5hENBCYV8vEL1io/9WEICL/6N7WwulOeWOhQxhjc69dug2O0
 riAp9WejvDuaduhubI7qm2qLrZ6Aqj49Rdws/h14yNLxpIvp7YkJ7huB+2lQf0Zc6Igp
 CRcsraoh7cLGEzNVcTphY9eSCIX5kEKoT9RhYkPmxtRxuFpzxJsdlwtpBQ1kjiP8DsyW
 vss475m/o3Gtx3AY0gOh0+Jv8WC0Dtc/CA4PurXvR4DvTEAU5N5lKnro8S4fXo60WKfQ
 ge9/6npfUiln3cGrryKRI8VAUDnOsHXHMZKvtaW1JkfnMQVySL0o/wywRy0rBiYqowbS cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed2fdbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:01:42 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30G4wBYS025752;
	Mon, 16 Jan 2023 05:01:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed2fdb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:01:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30G3KHNT009464;
	Mon, 16 Jan 2023 05:01:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n3m16hd08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:01:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30G51a2K23658776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 05:01:36 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED02B20040;
	Mon, 16 Jan 2023 05:01:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A2D220043;
	Mon, 16 Jan 2023 05:01:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.122.245])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Jan 2023 05:01:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 1/2] tools/perf: Fix the file mode with copyfile while adding file to build-id cache
Date: Mon, 16 Jan 2023 10:31:30 +0530
Message-Id: <20230116050131.17221-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gBAPYv_OXbpIQwAIMiOHGeE8EdTBm314
X-Proofpoint-ORIG-GUID: kzRJrxQUX8P7GjwRwSXx2HS9DS83obRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_02,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301160033
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test "build id cache operations" fails on powerpc
As below:

	Adding 5a0fd882b53084224ba47b624c55a469 ./tests/shell/../pe-file.exe: Ok
	build id: 5a0fd882b53084224ba47b624c55a469
	link: /tmp/perf.debug.ZTu/.build-id/5a/0fd882b53084224ba47b624c55a469
	file: /tmp/perf.debug.ZTu/.build-id/5a/../../root/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf
	failed: file /tmp/perf.debug.ZTu/.build-id/5a/../../root/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf does not exist
	test child finished with -1
	---- end ----
	build id cache operations: FAILED!

The failing test is when trying to add pe-file.exe to
build id cache.

Perf buildid-cache can be used to add/remove/manage
files from the build-id cache. "-a" option is used to
add a file to the build-id cache.

Simple command to do so for a PE exe file:
 # ls -ltr tests/pe-file.exe
 -rw-r--r--. 1 root root 75595 Jan 10 23:35 tests/pe-file.exe
 The file is in home directory.

 # mkdir  /tmp/perf.debug.TeY1
 # perf --buildid-dir /tmp/perf.debug.TeY1 buildid-cache -v
   -a tests/pe-file.exe

The above will create ".build-id" folder in build id
directory, which is /tmp/perf.debug.TeY1. Also adds file
to this folder under build id. Example:

 # ls -ltr /tmp/perf.debug.TeY1/.build-id/5a/0fd882b53084224ba47b624c55a469/
 total 76
 -rw-r--r--. 1 root root     0 Jan 11 00:38 probes
 -rwxr-xr-x. 1 root root 75595 Jan 11 00:38 elf

We can see in the results that file mode for original
file and file in build id directory is different. ie,
build id file has executable permission whereas original
file doesn’t have.

The code path and function ( build_id_cache__add ) to
add file to cache is in "util/build-id.c". In
build_id_cache__add() function, it first attempts to link
the original file to destination cache folder. If linking
the file fails ( which can happen if the destination and
source is on a different mount points ), it will copy the
file to destination. Here copyfile() routine explicitly uses
mode as "755" and hence file in the destination will have
executable permission.

Code snippet:

 if (link(realname, filename) && errno != EEXIST &&
                               copyfile(name, filename))

Strace logs:

	172285 link("/home/<user_name>/linux/tools/perf/tests/pe-file.exe", "/tmp/perf.debug.TeY1/home/<user_name>/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf") = -1 EXDEV (Invalid cross-device link)
	172285 newfstatat(AT_FDCWD, "tests/pe-file.exe", {st_mode=S_IFREG|0644, st_size=75595, ...}, 0) = 0
	172285 openat(AT_FDCWD, "/tmp/perf.debug.TeY1/home/<user_name>/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/.elf.KbAnsl", O_RDWR|O_CREAT|O_EXCL, 0600) = 3
	172285 fchmod(3, 0755)                  = 0
	172285 openat(AT_FDCWD, "tests/pe-file.exe", O_RDONLY) = 4
	172285 mmap(NULL, 75595, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7fffa5cd0000
	172285 pwrite64(3, "MZ\220\0\3\0\0\0\4\0\0\0\377\377\0\0\270\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 75595, 0) = 75595

Whereas if the link succeeds, it succeeds in the first
attempt itself and the file in the build-id dir will
have same permission as original file.

Example, above uses /tmp. Instead if we use
"--buildid-dir /home/build", linking will work here
since mount points are same. Hence the destination file
will not have executable permission.

Since the testcase "tests/shell/buildid.sh" always looks
for executable file, test fails in powerpc environment
when test is run from /root.

The patch adds a change in build_id_cache__add to use
copyfile_mode which also passes the file’s original mode as
argument. This way the destination file mode also will
be same as original file.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/build-id.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index a839b30c981b..ea9c083ab1e3 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -715,9 +715,13 @@ build_id_cache__add(const char *sbuild_id, const char *name, const char *realnam
 		} else if (nsi && nsinfo__need_setns(nsi)) {
 			if (copyfile_ns(name, filename, nsi))
 				goto out_free;
-		} else if (link(realname, filename) && errno != EEXIST &&
-				copyfile(name, filename))
-			goto out_free;
+		} else if (link(realname, filename) && errno != EEXIST) {
+			struct stat f_stat;
+
+			if (!(stat(name, &f_stat) < 0) &&
+					copyfile_mode(name, filename, f_stat.st_mode))
+				goto out_free;
+		}
 	}
 
 	/* Some binaries are stripped, but have .debug files with their symbol
-- 
2.31.1


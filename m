Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE57A0210
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 14:42:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JQNz5xZBzDqyv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 22:42:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JQKt1B3zzDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 22:39:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7SCahdi106083
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 08:39:25 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2unsptrauh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 08:39:25 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <zohar@linux.ibm.com>;
 Wed, 28 Aug 2019 13:39:23 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 28 Aug 2019 13:39:19 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7SCdHOH55574588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Aug 2019 12:39:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E37EA4064;
 Wed, 28 Aug 2019 12:39:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1646CA4060;
 Wed, 28 Aug 2019 12:39:16 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.85.129.156])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Aug 2019 12:39:15 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH] sefltest/ima: support appended signatures (modsig)
Date: Wed, 28 Aug 2019 08:39:06 -0400
X-Mailer: git-send-email 2.7.5
X-TM-AS-GCONF: 00
x-cbid: 19082812-0012-0000-0000-00000343E072
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082812-0013-0000-0000-0000217E1D40
Message-Id: <1566995946-6582-1-git-send-email-zohar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=753 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908280134
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
Cc: Dave Young <dyoung@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Petr Vorel <pvorel@suse.cz>, linux-kselftest@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, shuah <shuah@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Detect and allow appended signatures.

Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
---
 .../selftests/kexec/test_kexec_file_load.sh        | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index fa7c24e8eefb..2ff600388c30 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -37,11 +37,20 @@ is_ima_sig_required()
 	# sequentially.  As a result, a policy rule may be defined, but
 	# might not necessarily be used.  This test assumes if a policy
 	# rule is specified, that is the intent.
+
+	# First check for appended signature (modsig), then xattr
 	if [ $ima_read_policy -eq 1 ]; then
 		check_ima_policy "appraise" "func=KEXEC_KERNEL_CHECK" \
-			"appraise_type=imasig"
+			"appraise_type=imasig|modsig"
 		ret=$?
-		[ $ret -eq 1 ] && log_info "IMA signature required";
+		if [ $ret -eq 1 ]; then
+			log_info "IMA or appended(modsig) signature required"
+		else
+			check_ima_policy "appraise" "func=KEXEC_KERNEL_CHECK" \
+				"appraise_type=imasig"
+			ret=$?
+			[ $ret -eq 1 ] && log_info "IMA signature required";
+		fi
 	fi
 	return $ret
 }
@@ -84,6 +93,22 @@ check_for_imasig()
 	return $ret
 }
 
+# Return 1 for appended signature (modsig) found and 0 for not found.
+check_for_modsig()
+{
+	local module_sig_string="~Module signature appended~"
+	local sig="$(tail --bytes $((${#module_sig_string} + 1)) $KERNEL_IMAGE)"
+	local ret=0
+
+	if [ "$sig" == "$module_sig_string" ]; then
+		ret=1
+		log_info "kexec kernel image modsig signed"
+	else
+		log_info "kexec kernel image not modsig signed"
+	fi
+	return $ret
+}
+
 kexec_file_load_test()
 {
 	local succeed_msg="kexec_file_load succeeded"
@@ -98,7 +123,8 @@ kexec_file_load_test()
 		# In secureboot mode with an architecture  specific
 		# policy, make sure either an IMA or PE signature exists.
 		if [ $secureboot -eq 1 ] && [ $arch_policy -eq 1 ] && \
-			[ $ima_signed -eq 0 ] && [ $pe_signed -eq 0 ]; then
+			[ $ima_signed -eq 0 ] && [ $pe_signed -eq 0 ] \
+			  && [ $ima_modsig -eq 0 ]; then
 			log_fail "$succeed_msg (missing sig)"
 		fi
 
@@ -107,7 +133,8 @@ kexec_file_load_test()
 			log_fail "$succeed_msg (missing PE sig)"
 		fi
 
-		if [ $ima_sig_required -eq 1 ] && [ $ima_signed -eq 0 ]; then
+		if [ $ima_sig_required -eq 1 ] && [ $ima_signed -eq 0 ] \
+		     && [ $ima_modsig -eq 0 ]; then
 			log_fail "$succeed_msg (missing IMA sig)"
 		fi
 
@@ -204,5 +231,8 @@ pe_signed=$?
 check_for_imasig
 ima_signed=$?
 
+check_for_modsig
+ima_modsig=$?
+
 # Test loading the kernel image via kexec_file_load syscall
 kexec_file_load_test
-- 
2.7.5


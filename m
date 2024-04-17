Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E88A8222
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:30:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JAAAqCcr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJcv16k9z3vwv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:30:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JAAAqCcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJT11D5vz3vYG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:24:05 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBCSGm029726;
	Wed, 17 Apr 2024 11:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XOqerwa8Lt1BpfScOYH950wK8Ld8HbKk9IwT9ounoAE=;
 b=JAAAqCcrgz1bnF/wJSFbLrZ1IVjC/O6TXz9VMIdeL5mvNsMxQrPJciKEmIcWws9wOJ9H
 L+DM/tgLfM8f39E2LeivmznrZZirKDpfATGfdQGDDmrID3IPPX5pqVaqGGg0S1txfwjG
 dkMRu77wgRrs2Et+IahnqzcFNc1uPr1GMZSDfRvtRIRTXasErjvQ5lM6A0J1kTSEiZp1
 GSY6miwdWf+lMb+9/7C3Vv4Tc/PIORO9PH5hLTMpMqAXL16QlIz8wJJbO42+nio6cN3M
 laev+9MVYdvLXd2ihlK4h2kfyWY2xTB/7UW8ERaLVaG/kmT+9BtIxrgAnD0ihHcsF7ON bg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjdbar0un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:24:01 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43HAlfC8011161;
	Wed, 17 Apr 2024 11:24:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg732khvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:24:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNu3m48038186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 778A620043;
	Wed, 17 Apr 2024 11:23:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA6BA20040;
	Wed, 17 Apr 2024 11:23:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:55 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 27C9C61013;
	Wed, 17 Apr 2024 21:23:52 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 9/9] Documentation: Document PowerPC kernel dynamic DEXCR interface
Date: Wed, 17 Apr 2024 21:23:25 +1000
Message-ID: <20240417112325.728010-10-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xkqvXtJHYacY4AwoR9GzhLdd3SF8qct2
X-Proofpoint-GUID: xkqvXtJHYacY4AwoR9GzhLdd3SF8qct2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404170078
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

Documents how to use the PR_PPC_GET_DEXCR and PR_PPC_SET_DEXCR prctl()'s
for changing a process's DEXCR or its process tree default value.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 Documentation/arch/powerpc/dexcr.rst | 141 ++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/powerpc/dexcr.rst b/Documentation/arch/powerpc/dexcr.rst
index 615a631f51fa..ab0724212fcd 100644
--- a/Documentation/arch/powerpc/dexcr.rst
+++ b/Documentation/arch/powerpc/dexcr.rst
@@ -36,8 +36,145 @@ state for a process.
 Configuration
 =============
 
-The DEXCR is currently unconfigurable. All threads are run with the
-NPHIE aspect enabled.
+prctl
+-----
+
+A process can control its own userspace DEXCR value using the
+``PR_PPC_GET_DEXCR`` and ``PR_PPC_SET_DEXCR`` pair of
+:manpage:`prctl(2)` commands. These calls have the form::
+
+    prctl(PR_PPC_GET_DEXCR, unsigned long which, 0, 0, 0);
+    prctl(PR_PPC_SET_DEXCR, unsigned long which, unsigned long ctrl, 0, 0);
+
+The possible 'which' and 'ctrl' values are as follows. Note there is no relation
+between the 'which' value and the DEXCR aspect's index.
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 7 1
+
+   * - ``prctl()`` which
+     - Aspect name
+     - Aspect index
+
+   * - ``PR_PPC_DEXCR_SBHE``
+     - Speculative Branch Hint Enable (SBHE)
+     - 0
+
+   * - ``PR_PPC_DEXCR_IBRTPD``
+     - Indirect Branch Recurrent Target Prediction Disable (IBRTPD)
+     - 3
+
+   * - ``PR_PPC_DEXCR_SRAPD``
+     - Subroutine Return Address Prediction Disable (SRAPD)
+     - 4
+
+   * - ``PR_PPC_DEXCR_NPHIE``
+     - Non-Privileged Hash Instruction Enable (NPHIE)
+     - 5
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 8
+
+   * - ``prctl()`` ctrl
+     - Meaning
+
+   * - ``PR_PPC_DEXCR_CTRL_EDITABLE``
+     - This aspect can be configured with PR_PPC_SET_DEXCR (get only)
+
+   * - ``PR_PPC_DEXCR_CTRL_SET``
+     - This aspect is set / set this aspect
+
+   * - ``PR_PPC_DEXCR_CTRL_CLEAR``
+     - This aspect is clear / clear this aspect
+
+   * - ``PR_PPC_DEXCR_CTRL_SET_ONEXEC``
+     - This aspect will be set after exec / set this aspect after exec
+
+   * - ``PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC``
+     - This aspect will be clear after exec / clear this aspect after exec
+
+Note that
+
+* which is a plain value, not a bitmask. Aspects must be worked with individually.
+
+* ctrl is a bitmask. ``PR_PPC_GET_DEXCR`` returns both the current and onexec
+  configuration. For example, ``PR_PPC_GET_DEXCR`` may return
+  ``PR_PPC_DEXCR_CTRL_EDITABLE | PR_PPC_DEXCR_CTRL_SET |
+  PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC``. This would indicate the aspect is currently
+  set, it will be cleared when you run exec, and you can change this with the
+  ``PR_PPC_SET_DEXCR`` prctl.
+
+* The set/clear terminology refers to setting/clearing the bit in the DEXCR.
+  For example::
+
+      prctl(PR_PPC_SET_DEXCR, PR_PPC_DEXCR_IBRTPD, PR_PPC_DEXCR_CTRL_SET, 0, 0);
+
+  will set the IBRTPD aspect bit in the DEXCR, causing indirect branch prediction
+  to be disabled.
+
+* The status returned by ``PR_PPC_GET_DEXCR`` represents what value the process
+  would like applied. It does not include any alternative overrides, such as if
+  the hypervisor is enforcing the aspect be set. To see the true DEXCR state
+  software should read the appropriate SPRs directly.
+
+* The aspect state when starting a process is copied from the parent's state on
+  :manpage:`fork(2)`. The state is reset to a fixed value on
+  :manpage:`execve(2)`. The PR_PPC_SET_DEXCR prctl() can control both of these
+  values.
+
+* The ``*_ONEXEC`` controls do not change the current process's DEXCR.
+
+Use ``PR_PPC_SET_DEXCR`` with one of ``PR_PPC_DEXCR_CTRL_SET`` or
+``PR_PPC_DEXCR_CTRL_CLEAR`` to edit a given aspect.
+
+Common error codes for both getting and setting the DEXCR are as follows:
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 8
+
+   * - Error
+     - Meaning
+
+   * - ``EINVAL``
+     - The DEXCR is not supported by the kernel.
+
+   * - ``ENODEV``
+     - The aspect is not recognised by the kernel or not supported by the
+       hardware.
+
+``PR_PPC_SET_DEXCR`` may also report the following error codes:
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 8
+
+   * - Error
+     - Meaning
+
+   * - ``EINVAL``
+     - The ctrl value contains unrecognised flags.
+
+   * - ``EINVAL``
+     - The ctrl value contains mutually conflicting flags (e.g.,
+       ``PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_CLEAR``)
+
+   * - ``EPERM``
+     - This aspect cannot be modified with prctl() (check for the
+       PR_PPC_DEXCR_CTRL_EDITABLE flag with PR_PPC_GET_DEXCR).
+
+   * - ``EPERM``
+     - The process does not have sufficient privilege to perform the operation.
+       For example, clearing NPHIE on exec is a privileged operation (a process
+       can still clear its own NPHIE aspect without privileges).
+
+This interface allows a process to control its own DEXCR aspects, and also set
+the initial DEXCR value for any children in its process tree (up to the next
+child to use an ``*_ONEXEC`` control). This allows fine-grained control over the
+default value of the DEXCR, for example allowing containers to run with different
+default values.
 
 
 coredump and ptrace
-- 
2.44.0


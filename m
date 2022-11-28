Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB65639FD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL97x3Rryz3f4c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:55:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KiNoGg/m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KiNoGg/m;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wn2pwzz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:46:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1nkEj029029;
	Mon, 28 Nov 2022 02:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wBLegpuMtb+lx7WzDFtoFBhbZz5Ftj7V700Zzn0VSw4=;
 b=KiNoGg/m8KMsP35nt+nGyW2mGTN9GrAlRW+SAmryViW8uxcqtUee0vdDsLv0cMFk+PQD
 lxBNjkp+A/Ec3bH7d4E50x7eeev8T6fzyntbcA5dcpNRD63ycC69RFB0jUzPQApkIY1p
 yWQzhkUXlfdUDV0nnaOm9AmDPdKvpEGtATCNBU3aOXd4U2pJRiQWoNxLFd0fp7a1SWFw
 23wyh+2jcTemVSrLdfsEc8rYNCJfKj0fNRb2Qqs0BOPlkGiURUCGTsZRIzR6RdBpuNdc
 9jHyRztIfoTJ89QNx+0JbQbOxTZHO18LmhhPkEKxnZ8PqQUlUPNFVkuFauBAZFUlc+ZK 5Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn6ups8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:49 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2Zs8x003685;
	Mon, 28 Nov 2022 02:45:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3m3ae8sbe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jjBR918192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5095911C04A;
	Mon, 28 Nov 2022 02:45:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5E3F11C04C;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 80C9F6096D;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 13/13] Documentation: Document PowerPC kernel DEXCR interface
Date: Mon, 28 Nov 2022 13:44:58 +1100
Message-Id: <20221128024458.46121-14-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GfeC96U5pF5Oj3u0DLQTSbxYSW_nkHkN
X-Proofpoint-ORIG-GUID: GfeC96U5pF5Oj3u0DLQTSbxYSW_nkHkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Describe the DEXCR and document how to interact with it via the
prctl and sysctl interfaces.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 Documentation/powerpc/dexcr.rst | 183 ++++++++++++++++++++++++++++++++
 Documentation/powerpc/index.rst |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 Documentation/powerpc/dexcr.rst

diff --git a/Documentation/powerpc/dexcr.rst b/Documentation/powerpc/dexcr.rst
new file mode 100644
index 000000000000..3c995f4b9fe0
--- /dev/null
+++ b/Documentation/powerpc/dexcr.rst
@@ -0,0 +1,183 @@
+==========================================
+DEXCR (Dynamic Execution Control Register)
+==========================================
+
+Overview
+========
+
+The DEXCR is a privileged special purpose register (SPR) introduced in
+PowerPC ISA 3.1B (Power10) that allows per-cpu control over several dynamic
+execution behaviours. These behaviours include speculation (e.g., indirect
+branch target prediction) and enabling return-oriented programming (ROP)
+protection instructions.
+
+The execution control is exposed in hardware as up to 32 bits ('aspects') in
+the DEXCR. Each aspect controls a certain behaviour, and can be set or cleared
+to enable/disable the aspect. There are several variants of the DEXCR for
+different purposes:
+
+DEXCR
+    A priviliged SPR that can control aspects for userspace and kernel space
+HDEXCR
+    A hypervisor-privileged SPR that can control aspects for the hypervisor and
+    enforce aspects for the kernel and userspace.
+UDEXCR
+    An optional ultravisor-privileged SPR that can control aspects for the ultravisor.
+
+Userspace can examine the current DEXCR state using a dedicated SPR that
+provides a non-privileged read-only view of the userspace DEXCR aspects.
+There is also an SPR that provides a read-only view of the hypervisor enforced
+aspects, which ORed with the userspace DEXCR view gives the effective DEXCR
+state for a process.
+
+
+User API
+========
+
+prctl()
+-------
+
+A process can control its own userspace DEXCR value using the
+``PR_PPC_GET_DEXCR`` and ``PR_PPC_SET_DEXCR`` pair of
+:manpage:`prctl(2)` commands. These calls have the form::
+
+    prctl(PR_PPC_GET_DEXCR, unsigned long aspect, 0, 0, 0);
+    prctl(PR_PPC_SET_DEXCR, unsigned long aspect, unsigned long flags, 0, 0);
+
+Where ``aspect`` (``arg1``) is a constant and ``flags`` (``arg2``) is a bifield.
+The possible aspect and flag values are as follows. Note there is no relation
+between aspect value and ``prctl()`` constant value.
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 7 1
+
+   * - ``prctl()`` constant
+     - Aspect name
+     - Aspect bit
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
+   * - ``prctl()`` flag
+     - Meaning
+
+   * - ``PR_PPC_DEXCR_PRCTL``
+     - This aspect can be configured with ``prctl(PR_PPC_SET_DEXCR, ...)``
+
+   * - ``PR_PPC_DEXCR_SET_ASPECT``
+     - This aspect is set
+
+   * - ``PR_PPC_DEXCR_FORCE_SET_ASPECT``
+     - This aspect is set and cannot be undone. A subsequent
+       ``prctl(..., PR_PPC_DEXCR_CLEAR_ASPECT)`` will fail.
+
+   * - ``PR_PPC_DEXCR_CLEAR_ASPECT``
+     - This aspect is clear
+
+Note that
+
+* The ``*_SET_ASPECT`` / ``*_CLEAR_ASPECT`` refers to setting/clearing the bit in the DEXCR.
+  For example::
+
+      prctl(PR_PPC_SET_DEXCR, PR_PPC_DEXCR_IBRTPD, PR_PPC_DEXCR_SET_ASPECT, 0, 0);
+
+  will set the IBRTPD aspect bit in the DEXCR, causing indirect branch prediction
+  to be disabled.
+
+* The status returned by ``PR_PPC_GET_DEXCR`` does not include any alternative
+  config overrides. To see the true DEXCR state software should read the appropriate
+  SPRs directly.
+
+* A forced aspect will still report ``PR_PPC_DEXCR_PRCTL`` if it would
+  otherwise be editable.
+
+* The aspect state when starting a process is copied from the parent's
+  state on :manpage:`fork(2)` and :manpage:`execve(2)`. Aspects may also be set
+  or cleared by the kernel on process creation.
+
+Use ``PR_PPC_SET_DEXCR`` with one of ``PR_PPC_DEXCR_SET_ASPECT``,
+``PR_PPC_DEXCR_FORCE_SET_ASPECT``, or ``PR_PPC_DEXCR_CLEAR_ASPECT`` to edit a
+ given aspect.
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
+     - The aspect is not recognised by the kernel or not supported by the hardware.
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
+   * - ``ERANGE``
+     - ``arg2`` is incorrect. E.g., it does not select an action (set/clear),
+       or the flags are not recognised by the kernel.
+
+   * - ``ENXIO``
+     - The aspect is not editable via ``prctl()``.
+
+   * - ``EPERM``
+     - The process does not have sufficient privilege to modify this aspect,
+       or the aspect has been force set and cannot be modified.
+
+
+sysctl
+------
+
+Some aspects can be modified globally via :manpage:`sysctl(8)` entries. Such global
+modifications are applied after any process modifications. Any ``prctl()`` call to
+an overridden aspect this aspect may still report it as editable. The prctl setting
+will take effect again if the global override is restored to its default state.
+
+A global SBHE config is exposed in ``/proc/sys/kernel/speculative_branch_hint_enable``.
+Any process can read the current config value from it. Privileged processes can
+write to it to change the config. The new config is applied to all current and future
+processes (though note the kernel cannot override any hypervisor enforced aspects).
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 8
+
+   * - Value
+     - Meaning
+
+   * - ``-1``
+     - Do not change from default or ``prctl()`` config.
+
+   * - ``0``
+     - Force clear aspect.
+
+   * - ``1``
+     - Force set aspect.
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 85e80e30160b..d33b554ca7ba 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -15,6 +15,7 @@ powerpc
     cxl
     cxlflash
     dawr-power9
+    dexcr
     dscr
     eeh-pci-error-recovery
     elf_hwcaps
-- 
2.38.1


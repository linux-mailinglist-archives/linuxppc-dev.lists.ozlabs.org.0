Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFDC07A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 16:33:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fvS26ttszDqjp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 00:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fvHY04nXzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 00:26:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46fvHX1nlwz8swt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 00:26:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46fvHW6wBjz9sN1; Sat, 28 Sep 2019 00:26:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46fvHV47zRz9sPZ
 for <linuxppc-dev@ozlabs.org>; Sat, 28 Sep 2019 00:26:30 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8REM9Gr037393
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Sep 2019 10:26:27 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w271w3u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Sep 2019 10:26:25 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Fri, 27 Sep 2019 15:26:22 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 15:26:17 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8REQF7K42860618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 14:26:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34113A405C;
 Fri, 27 Sep 2019 14:26:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 539D2A405B;
 Fri, 27 Sep 2019 14:26:11 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.207.173])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 14:26:11 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 1/9] dt-bindings: ibm,
 secureboot: secure boot specific properties for PowerNV
Date: Fri, 27 Sep 2019 10:25:52 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092714-0028-0000-0000-000003A3417C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092714-0029-0000-0000-0000246563D6
Message-Id: <1569594360-7141-2-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270134
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerNV represents both the firmware and Host OS secureboot state of the
system via device tree. This patch adds the documentation to give
the definition of the nodes and the properties.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 .../bindings/powerpc/ibm,secureboot.rst       | 76 ++++++++++++++++
 .../devicetree/bindings/powerpc/secvar.rst    | 89 +++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
 create mode 100644 Documentation/devicetree/bindings/powerpc/secvar.rst

diff --git a/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
new file mode 100644
index 000000000000..03d32099d2eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0
+*** NOTE ***
+This document is copied from OPAL firmware
+(skiboot/doc/device-tree/ibm,secureboot.rst)
+************
+.. _device-tree/ibm,secureboot:
+
+ibm,secureboot
+==============
+
+The ``ìbm,secureboot`` node provides secure boot and trusted boot information
+up to the target OS. Further information can be found in :ref:`stb-overview`.
+
+Required properties
+-------------------
+
+.. code-block:: none
+
+    compatible:         Either one of the following values:
+
+                        ibm,secureboot-v1  :  The container-verification-code
+                                              is stored in a secure ROM memory.
+
+                        ibm,secureboot-v2  :  The container-verification-code
+                                              is stored in a reserved memory.
+                                              It described by the ibm,cvc child
+                                              node.
+
+                        ibm,secureboot-v3  :  The container-verification-code
+                                              is stored in a reserved memory.
+                                              It described by the ibm,cvc child
+                                              node. Secure variables are
+                                              supported. `secvar` node should
+                                              be created.
+
+    secure-enabled:     this property exists when the firmware stack is booting
+                        in secure mode (hardware secure boot jumper asserted).
+
+    trusted-enabled:    this property exists when the firmware stack is booting
+                        in trusted mode.
+
+    hw-key-hash:        hash of the three hardware public keys trusted by the
+                        platformw owner. This is used to verify if a firmware
+                        code is signed with trusted keys.
+
+    hw-key-hash-size:   hw-key-hash size
+
+    secvar:             this node is created if the platform supports secure
+                        variables. Contains information about the current
+                        secvar status, see 'secvar.rst'.
+
+Obsolete properties
+-------------------
+
+.. code-block:: none
+
+    hash-algo:          Superseded by the hw-key-hash-size property in
+                        'ibm,secureboot-v2'.
+
+Example
+-------
+
+.. code-block:: dts
+
+    ibm,secureboot {
+        compatible = "ibm,secureboot-v2";
+        secure-enabled;
+        trusted-enabled;
+        hw-key-hash-size = <0x40>;
+        hw-key-hash = <0x40d487ff 0x7380ed6a 0xd54775d5 0x795fea0d 0xe2f541fe
+                       0xa9db06b8 0x466a42a3 0x20e65f75 0xb4866546 0x0017d907
+                       0x515dc2a5 0xf9fc5095 0x4d6ee0c9 0xb67d219d 0xfb708535
+                       0x1d01d6d1>;
+        phandle = <0x100000fd>;
+        linux,phandle = <0x100000fd>;
+    };
diff --git a/Documentation/devicetree/bindings/powerpc/secvar.rst b/Documentation/devicetree/bindings/powerpc/secvar.rst
new file mode 100644
index 000000000000..47793ab9c2a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/secvar.rst
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0
+*** NOTE ***
+This document is copied from OPAL firmware
+(skiboot/doc/device-tree/secvar.rst)
+************
+.. _device-tree/ibm,secureboot/secvar:
+
+secvar
+======
+
+The ``secvar`` node provides secure variable information for the secure
+boot of the target OS.
+
+Required properties
+-------------------
+
+.. code-block:: none
+
+    compatible:         this property is set based on the current secure
+                        variable scheme as set by the platform.
+
+    status:             set to "fail" if the secure variables could not
+                        be initialized, validated, or some other
+                        catastrophic failure.
+
+    update-status:      contains the return code of the update queue
+                        process run during initialization. Signifies if
+                        updates were processed or not, and if there was
+                        an error. See table below
+
+    secure-mode:        a u64 bitfield set by the backend to determine
+                        what secure mode we should be in, and if host
+                        secure boot should be enforced.
+
+Example
+-------
+
+.. code-block:: dts
+
+    secvar {
+        compatible = "ibm,edk2-compat-v1";
+        status = "okay";
+        secure-mode = "1";
+    };
+
+Update Status
+-------------
+
+The update status property should be set by the backend driver to a value
+that best fits its error condtion. The following table defines the
+general intent of each error code, check backend specific documentation
+for more detail.
+
++-----------------+-----------------------------------------------+
+| update-status   | Generic Reason                                |
++-----------------|-----------------------------------------------+
+| OPAL_SUCCESS    | Updates were found and processed successfully |
++-----------------|-----------------------------------------------+
+| OPAL_EMPTY      | No updates were found, none processed         |
++-----------------|-----------------------------------------------+
+| OPAL_PARAMETER  | Unable to parse data in the update section    |
++-----------------|-----------------------------------------------+
+| OPAL_PERMISSION | Update failed to apply, possible auth failure |
++-----------------|-----------------------------------------------+
+| OPAL_HARDWARE   | Misc. storage-related error                   |
++-----------------|-----------------------------------------------+
+| OPAL_RESOURCE   | Out of space (somewhere)                      |
++-----------------|-----------------------------------------------+
+| OPAL_NO_MEM     | Out of memory                                 |
++-----------------+-----------------------------------------------+
+
+Secure Mode
+-----------
+
++-----------------------+------------------------+
+| backend specific-bits |      generic mode bits |
++-----------------------+------------------------+
+64                     32                        0
+
+The secure mode property should be set by the backend driver. The least
+significant 32 bits are reserved for generic modes, shared across all
+possible backends. The other 32 bits are open for backends to determine
+their own modes. Any kernel must be made aware of any custom modes.
+
+At the moment, only one general-purpose bit is defined:
+
+``#define SECVAR_SECURE_MODE_ENFORCING  0x1``
+
+which signals that a kernel should enforce host secure boot.
-- 
2.20.1


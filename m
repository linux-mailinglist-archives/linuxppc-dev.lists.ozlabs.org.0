Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 099AA1F90AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:53:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lk8c1gWkzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:53:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cBzHdbks; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lhhf3kYpzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:47:14 +1000 (AEST)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26B4C2098B;
 Mon, 15 Jun 2020 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592203632;
 bh=bt2XIege4yj8u/sYLDroVzue0wsprC/fD/oatgGW5aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cBzHdbksckzZyCOWbCB3hDnzGp5OQYEIDBbI/DD9LxfHR5AcmBTU2Ht3tcLZpts08
 /ZuZDaFeSjrMYv6HGcSgItebuP22UR5lQmHiyDrkAUvy2vcooN1/1HLF9QwAMRHAiH
 8lMHLxkt9zbZ562Hk1BTop/N+hR7s7ddy+jXIkow=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jkith-009nnH-Vz; Mon, 15 Jun 2020 08:47:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 18/29] docs: powerpc: fix some issues at vas-api.rst
Date: Mon, 15 Jun 2020 08:46:57 +0200
Message-Id: <e449da7a4f5140ccc09e91627f9722260a766dfb.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Haren Myneni <haren@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a few issues on this document, when built via the
building with ``make htmldocs``:

    Documentation/powerpc/vas-api.rst:116: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:116: WARNING: Inline emphasis start-string without end-string.
    Documentation/powerpc/vas-api.rst:117: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:117: WARNING: Inline emphasis start-string without end-string.
    Documentation/powerpc/vas-api.rst:120: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:124: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:133: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:135: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:150: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:151: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:161: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:176: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:253: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:253: WARNING: Inline emphasis start-string without end-string.
    Documentation/powerpc/vas-api.rst:259: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:261: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:266: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:267: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:270: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:271: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:273: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:274: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:277: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:278: WARNING: Definition list ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:280: WARNING: Unexpected indentation.
    Documentation/powerpc/vas-api.rst:287: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/powerpc/vas-api.rst:289: WARNING: Block quote ends without a blank line; unexpected unindent.

Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/powerpc/vas-api.rst | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
index 1217c2f1595e..b7fdbe560010 100644
--- a/Documentation/powerpc/vas-api.rst
+++ b/Documentation/powerpc/vas-api.rst
@@ -87,6 +87,7 @@ Applications may chose a specific instance of the NX co-processor using
 the vas_id field in the VAS_TX_WIN_OPEN ioctl as detailed below.
 
 A userspace library libnxz is available here but still in development:
+
 	 https://github.com/abalib/power-gzip
 
 Applications that use inflate / deflate calls can link with libnxz
@@ -110,6 +111,7 @@ Applications should use the VAS_TX_WIN_OPEN ioctl as follows to establish
 a connection with NX co-processor engine:
 
 	::
+
 		struct vas_tx_win_open_attr {
 			__u32   version;
 			__s16   vas_id; /* specific instance of vas or -1
@@ -119,8 +121,10 @@ a connection with NX co-processor engine:
 			__u64   reserved2[6];
 		};
 
-	version: The version field must be currently set to 1.
-	vas_id: If '-1' is passed, kernel will make a best-effort attempt
+	version:
+		The version field must be currently set to 1.
+	vas_id:
+		If '-1' is passed, kernel will make a best-effort attempt
 		to assign an optimal instance of NX for the process. To
 		select the specific VAS instance, refer
 		"Discovery of available VAS engines" section below.
@@ -129,7 +133,8 @@ a connection with NX co-processor engine:
 	and must be set to 0.
 
 	The attributes attr for the VAS_TX_WIN_OPEN ioctl are defined as
-	follows:
+	follows::
+
 		#define VAS_MAGIC 'v'
 		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 1,
 						struct vas_tx_win_open_attr)
@@ -141,6 +146,8 @@ a connection with NX co-processor engine:
 	returns -1 and sets the errno variable to indicate the error.
 
 	Error conditions:
+
+		======	================================================
 		EINVAL	fd does not refer to a valid VAS device.
 		EINVAL	Invalid vas ID
 		EINVAL	version is not set with proper value
@@ -149,6 +156,7 @@ a connection with NX co-processor engine:
 		ENOSPC	System has too many active windows (connections)
 			opened
 		EINVAL	reserved fields are not set to 0.
+		======	================================================
 
 	See the ioctl(2) man page for more details, error codes and
 	restrictions.
@@ -158,11 +166,13 @@ mmap() NX-GZIP device
 
 The mmap() system call for a NX-GZIP device fd returns a paste_address
 that the application can use to copy/paste its CRB to the hardware engines.
+
 	::
 
 		paste_addr = mmap(addr, size, prot, flags, fd, offset);
 
 	Only restrictions on mmap for a NX-GZIP device fd are:
+
 		* size should be PAGE_SIZE
 		* offset parameter should be 0ULL
 
@@ -170,10 +180,12 @@ that the application can use to copy/paste its CRB to the hardware engines.
 	In addition to the error conditions listed on the mmap(2) man
 	page, can also fail with one of the following error codes:
 
+		======	=============================================
 		EINVAL	fd is not associated with an open window
 			(i.e mmap() does not follow a successful call
 			to the VAS_TX_WIN_OPEN ioctl).
 		EINVAL	offset field is not 0ULL.
+		======	=============================================
 
 Discovery of available VAS engines
 ==================================
@@ -210,7 +222,7 @@ In case if NX encounters translation error (called NX page fault) on CSB
 address or any request buffer, raises an interrupt on the CPU to handle the
 fault. Page fault can happen if an application passes invalid addresses or
 request buffers are not in memory. The operating system handles the fault by
-updating CSB with the following data:
+updating CSB with the following data::
 
 	csb.flags = CSB_V;
 	csb.cc = CSB_CC_TRANSLATION;
@@ -223,7 +235,7 @@ the application can resend this request to NX.
 
 If the OS can not update CSB due to invalid CSB address, sends SEGV signal
 to the process who opened the send window on which the original request was
-issued. This signal returns with the following siginfo struct:
+issued. This signal returns with the following siginfo struct::
 
 	siginfo.si_signo = SIGSEGV;
 	siginfo.si_errno = EFAULT;
@@ -248,6 +260,7 @@ Simple example
 ==============
 
 	::
+
 		int use_nx_gzip()
 		{
 			int rc, fd;
-- 
2.26.2


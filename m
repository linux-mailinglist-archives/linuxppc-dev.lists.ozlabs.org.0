Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67138886A85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 11:39:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bZegdW74;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Jjp1Kpmz3vZ0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 21:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bZegdW74;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1Jj53GLlz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 21:39:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711103945;
	bh=HD112TNTbRVZLtfZOIpkn/lmLRdJwknsbN5jUYRctuc=;
	h=From:To:Cc:Subject:Date:From;
	b=bZegdW74w4kqZoMKtDP4hBjq5tJshHahtsugx7Gmt7f01Ectl+xVc2NjcS6HCA23o
	 xmNtuEKHKQ8jSs3iMWHYZYPrHRrcH6JoEjr6WubYrAuv3kcJoQwpge3cICm0J4i7V/
	 SCUVFMs8X1RqPanFlomTSmGTfjQ8ASIYi5t/Hm37AN2S0jg/C2Gbx7p+KsaOGd01WN
	 YLCh7QzQwqalrxnEcoAC05SUoEsjcOpCy3k7cQhVNs/D5fX1uDezQqgL/1nhlk+AWn
	 oWVkW+DTWuW7PRPbbXqrUy6YHRmqXtxVPfj0H02GrEQg4lZIqdHRnKT94LCAdG7qcH
	 8J/UgHfigZ3FQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V1Jj45xZRz4wx5;
	Fri, 22 Mar 2024 21:39:04 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <corbet@lwn.net>,
	<anton@ozlabs.org>
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself for Power
Date: Fri, 22 Mar 2024 21:38:40 +1100
Message-ID: <20240322103840.668746-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
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
Cc: ajd@linux.ibm.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, torvalds@linux-foundation.org, workflows@vger.kernel.org, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unfortunately Anton has left IBM. Add myself as the contact for Power,
until someone else volunteers.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/process/embargoed-hardware-issues.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index bb2100228cc7..6e9a4597bf2c 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -252,7 +252,7 @@ an involved disclosed party. The current ambassadors list:
   AMD		Tom Lendacky <thomas.lendacky@amd.com>
   Ampere	Darren Hart <darren@os.amperecomputing.com>
   ARM		Catalin Marinas <catalin.marinas@arm.com>
-  IBM Power	Anton Blanchard <anton@linux.ibm.com>
+  IBM Power	Michael Ellerman <ellerman@au.ibm.com>
   IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
   Intel		Tony Luck <tony.luck@intel.com>
   Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
-- 
2.44.0


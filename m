Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7758B6985
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 06:44:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CVf2bn01;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT6zj1TjSz3cLL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 14:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CVf2bn01;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT6z04sc4z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 14:43:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714452217;
	bh=p1Z98Nll64va/XikfjzgYHrDnlZjDKxfBwA4QojG/wo=;
	h=From:To:Cc:Subject:Date:From;
	b=CVf2bn01+dI3XbQmkOHbNhLEQLvwvOhgv5sK2f/TdjWGoivQ8G9ffnN9GUMpJSP0E
	 MmtkkSQTjc/G8ZQnC/fznUWoAnxsiE5TwC2Gda8EoyUNYTUhmBykcjbypiTnjb/6xI
	 myUC5tELV+Udy3yePvPTWMnam8p6xA+Jv2yUl/NIeRNs+cz1dSvyozrdDnw6nwwt3h
	 7aEz8bA8oTz4g3EMRFTIH36feF7jNtSFb3RybANHaleO17GjBVOjS9mMpMu0mi1j0M
	 ST87kygQgCAxMuJ6BH6B3j4x7SBivL6p2jm0lWjaqbc1ROWniWoTFbyCsQ6qBsXMdR
	 sJK5il06FNu9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VT6yx3W3Wz4wyk;
	Tue, 30 Apr 2024 14:43:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: MMU GATHER: Update Aneesh's address
Date: Tue, 30 Apr 2024 14:43:27 +1000
Message-ID: <20240430044327.49363-1-mpe@ellerman.id.au>
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
Cc: aneesh.kumar@kernel.org, will@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh's IBM address no longer works, switch to his preferred kernel.org
address.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93af33ee8541..f096c9fff5b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14898,7 +14898,7 @@ F:	drivers/phy/marvell/phy-pxa-usb.c
 
 MMU GATHER AND TLB INVALIDATION
 M:	Will Deacon <will@kernel.org>
-M:	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
+M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Nick Piggin <npiggin@gmail.com>
 M:	Peter Zijlstra <peterz@infradead.org>
-- 
2.44.0


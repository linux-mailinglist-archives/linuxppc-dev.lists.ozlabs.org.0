Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614F70B1D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 00:49:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPbPN1RvXz3c9Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 08:49:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QFKc5N8V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QFKc5N8V;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPbNP15hGz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 08:48:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Gt7eAaz60O9ddrcN7cZOXzCyhIJbxCHtRLFEQS4tDho=; b=QFKc5N8VaY3M3I13SLeTsnV2Hh
	VrgyXHx/TLXyLRn3Pu4BB3OiCgWaXv6JZXoq8doGw4i7YHTZaipd26MBV6wQf9yf1I+rCqj5EHIjB
	4iqxGEEW110OMSSW6ZgOLJs0f87pzpoOCOJRiV2ea5DsVkCtEZrgp7oUGCk/2PUFwnMmOxLIhVUm+
	Dv+b0fBCHcdxEMh68ytebYTTfpM2Ib5wVOHMfqUTuilydmpVOn8IsHOCK+ggZSZUGxMPbu/gRw6lB
	VVEfzfGDnDvnPV56hqPJahuON2wHs6iYmuJrfEN8Bt/rykcZ5uQ9JOepqhvIDIhD/+L5P9qhneQSi
	MtCYMVAw==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q0rr2-004myJ-2D;
	Sun, 21 May 2023 22:48:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] powerpc: delete empty config entry for PPC_86xx
Date: Sun, 21 May 2023 15:48:43 -0700
Message-Id: <20230521224843.12720-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Kumar Gala <galak@kernel.crashing.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop an unused and empty "config" entry for PPC_86xx.
It has no keyword entries under it and the following line's
"menuconfig" for the same Kconfig symbol is what kconfig uses.

Fixes: d8267c1a3686 ("powerpc: Add 82xx/83xx/86xx to 6xx Multiplatform")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/86xx/Kconfig |    1 -
 1 file changed, 1 deletion(-)

diff -- a/arch/powerpc/platforms/86xx/Kconfig b/arch/powerpc/platforms/86xx/Kconfig
--- a/arch/powerpc/platforms/86xx/Kconfig
+++ b/arch/powerpc/platforms/86xx/Kconfig
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-config PPC_86xx
 menuconfig PPC_86xx
 	bool "86xx-based boards"
 	depends on PPC_BOOK3S_32

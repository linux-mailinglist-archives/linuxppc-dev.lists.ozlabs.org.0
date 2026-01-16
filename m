Return-Path: <linuxppc-dev+bounces-15890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F8D3106F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 13:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dszY64pGWz2xnj;
	Fri, 16 Jan 2026 23:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768566234;
	cv=none; b=lfpAkH1qLxO+y8VXNM+Qcm3VdK+i/A2uJ/buanPrNoRIp1aTgddK+Aw57jGhxhqjBXxiXJsa9K10QU3QZpqSWUUk5VCVp2pgHBSbjst/fwz2yMyFEzwz5rjt3OTfwixECuWRl62kzLbVa/GCouSZXaTv60axygmJ4GIW3c+K1bTQxi7ozX+T42FJYDbrgDZigndL9mK1xCBjHfXT470w/J54yRovXDApZLkD/OeFXtgWATU3SvXsduACcBquGhFjEo5JONAcUNuj9qpeQ1P4oysFvME9Mz7OO9+j8Flu3R8nIY6qV8xlflkHe23ZK4fr3obcvzfOs1/5GdwWJDiCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768566234; c=relaxed/relaxed;
	bh=Kli5HydauTDl1lbbXXNhZxK29dM2rVfYGLkPTVkyIZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f/4uDCWijYA93JZ7yE6octrHcoVseFFynxmJGzzXWOW9LdeY3Azca6tn7cxRUJp9WFfB2q5WWcemJ1nKprO1WB5stuZjLaxUR85dU7vqFaXbDoko+Ynp9I9VQaI/5rIYgD/4aN65QqK4ktr6ES2jSnm7uYwwNcjf5YGztu2Fwplum+48S9o51V75WTUZo0A/TnWI9rQgiU4hLJrsfBexbxqy+wWlJzEh6f3UxEIpyMbHVJ3hlIBkyV4DYeHQIWNLmBzEM4Xcl2aQ/PPABmW0fF8lF+bwyeKWalergGfbdOTNpOVJd61Su5faEAGKu+W9TlnrfiKhR3CgM5ALquwa7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AD1Go/tC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AD1Go/tC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dszY53PcCz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 23:23:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77FC760193;
	Fri, 16 Jan 2026 12:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BC6C19423;
	Fri, 16 Jan 2026 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768566230;
	bh=dJZzs6Lq3VkI/+4oIUplrnQa2CPvD2BKKJWygkxU/1A=;
	h=From:To:Cc:Subject:Date:From;
	b=AD1Go/tCTnfRAnzZCmOYxeVLw5/Igv4MLnvo+PeHoJUX0je47inqvion3jWdly6CL
	 M+5+++4JQt8T/dJIp391EG9N8o2Y5/n5kRsM+Mqgv35Y9lExJW5CnMoHVsWyH4njDU
	 0ktITN7WPLAj2LUgSX+j+ETzI1EBJk+p6bl3W2hfS+E6YusmA5JYYnF3A8410Vgr63
	 obals6rpp66+i8jb+4OXuP5hpIZ4/LWSjxjDneS3vFSzWbEDD7+0Pdwr7jba/b/T63
	 HAObmxucjPfBWnwjukyt7PvxVx0qmcrLCcginlLZtV52J5Q4zsXqB823c8lIUHnGnY
	 QrKY/M/zttSCQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: declare fsl_mc_bus_dpdbg_type static
Date: Fri, 16 Jan 2026 13:23:33 +0100
Message-ID: <628c49881b3a1df76cfd2f8fd2aad976692a465a.1768566053.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=chleroy@kernel.org; h=from:subject:message-id; bh=dJZzs6Lq3VkI/+4oIUplrnQa2CPvD2BKKJWygkxU/1A=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRm6R5dk3G4vHJBzpQjkz/LnX/xuOdQf47UDIV5eQbxH 2YtTy7i7ChlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQAT+X2VkWHt4j/by1hfCElN nTI3q1XTXFLyuKOYuNMJ7kPyWslHF1cy/BVsXbbkQNsX/cwam44+cefDny0YZcrPRVi4Jj/8vmG VKAcA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix following sparse warning:

  CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?

fsl_mc_bus_dpdbg_type is not used outside of fsl-mc-bus.c

Remove the EXPORT_SYMBOL and declare it static.

Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 08b99b0b342f3..d9d7f006f92ba 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -432,10 +432,9 @@ const struct device_type fsl_mc_bus_dpdmai_type = {
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdmai_type);
 
-const struct device_type fsl_mc_bus_dpdbg_type = {
+static const struct device_type fsl_mc_bus_dpdbg_type = {
 	.name = "fsl_mc_bus_dpdbg"
 };
-EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdbg_type);
 
 static const struct device_type *fsl_mc_get_device_type(const char *type)
 {
-- 
2.49.0



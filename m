Return-Path: <linuxppc-dev+bounces-7810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F330A9484E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 18:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgZ6p6lcWz2yFK;
	Mon, 21 Apr 2025 02:42:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745167362;
	cv=none; b=eqa5Uc/FzKAKCDjLNihM1OA2qqMObX7ZACvUeP2wqgVLc+Sn3gbqU8+RAowwN2/rMXfQNNn8rRweoTEyXfZKch0N8vNONBcBYYbNwNfjnp4QnzwAN47NKfxd2Clo4gU7Wp8It1R7qyr+1ma5V2kJ6/bvHeM9E9nstGNzATQHqrasCssr1sAxn/Yfc/pfqnWiWV921qIqRdMpvr/Hu4fjOqT4D2yyQhiQkwmta03ZzhwlwNePAINHUp/UiFXYGZ0QyrvB53lffupKA64f36701kj70wdIxPlHVlwjyF2IeetZ8S/75kJHEW4dgOwe8vgqF+5czN0NWDI6/EgudeQ+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745167362; c=relaxed/relaxed;
	bh=9HvLmorj1z4IpjUg7H7VP9nADmfvZYH7oNRJ9MeYHac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EWU67OjKugiNJ3fi5c82cS2OTPxPhcrWfLSt6EilTtZeptRmyzSidPxBNc0lO4TbBFYtu3OiTNXJJrLRfrfwkmsEN9JAxhZImFh6SgVf/6BEe4ij6yI78xN2qySg//csQA5IygeKwoCo0j6vwXJ7B8P+yQXMyg4UKbVQqPjg46zqGoXoDKhLvt+xneAHJkfOgQvCHG0EKTo1Y/DlO20hKczycr5WsTirRKuWLCFZcETEPsE3pvAbVxY2Ya/YxSBjnHOjOPqL9xD/PNPOGsGac59qXTGAlgqMT6IIIWdXQm++Wvncwc5SkkDIjR5bpazTtXGcLEMvalZbNqkCXtmdOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q/ePGSjR; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q/ePGSjR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 106533 seconds by postgrey-1.37 at boromir; Mon, 21 Apr 2025 02:42:41 AEST
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZgZ6n3tb6z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 02:42:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92BD461138;
	Sun, 20 Apr 2025 16:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FBC4CEE2;
	Sun, 20 Apr 2025 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745167356;
	bh=BaEmSTuXRJevWzz/N41Rq5W7x8MH4iqiqAifsq5dAfw=;
	h=From:To:Cc:Subject:Date:From;
	b=Q/ePGSjRyoc6U3suVSmxd6jPwuz0x4KjE5PpgpHJ+O9I/7LIvG7JjTSuEvlrKVECF
	 DVl9bfqo7JY+hL4EmgBb5NgtorTR9cH6OpOkieQ3B/66aFd4bL0SDJtmKU0kCgHRQe
	 5R5XtjtYO1QnvrIxfH+m/SgkrsML7GMmi+uVQR3dqsX08uxMb4GlWDdGuRZS+pvXUM
	 moG48ySwfAjN2z/fbMfKF7Zi+tedJcY03gkoFlvtvHns3l5WQu+qNRR/N6l+F3TvdX
	 x5ldapcFF0ooi0zi1YDXue3OoJFBnZTsFyDRQDpqvy8OjpfWqF4G5mEwHQ0u60e4Dg
	 ArfqYF2AI5UOQ==
From: "Naveen N Rao (AMD)" <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] MAINTAINERS: powerpc: Remove myself as a reviewer
Date: Sun, 20 Apr 2025 22:02:48 +0530
Message-ID: <20250420163248.1746379-1-naveen@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I haven't been able to participate and help with this as much as I had
hoped, and it doesn't look like I will be able to spend time on powerpc
going forward.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f..64970c02059e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13626,7 +13626,6 @@ M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
-R:	Naveen N Rao <naveen@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki

base-commit: 0c4e661bce65262fbda69ad8b3bfc4777aa2efab
-- 
2.49.0



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB31066DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 08:13:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K71R6VVXzDrF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 18:12:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="bjcDTCLM"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5Rm1SvTzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 17:02:12 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAC7C2068F;
 Fri, 22 Nov 2019 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574402530;
 bh=ET+DFIQMOkHhXcT1P7hHhRmwzDhIgs682udKVkzTbRU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bjcDTCLMG3sI1fIWov1IdJEku6bUuRnyy0UI7oDVzrslCEfh+WCsZUcohrSwR6XDU
 W+5264EZQKxl9z2fC+Iw+30sgqzlktkAGE5iQLe9I2gtiL9tQhsoc45hw/jDcj0Axx
 d6fBHkfzyZvG55S5EjKyCAGfd62soqZwpFQMSbjI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 38/91] powerpc/xmon: fix dump_segments()
Date: Fri, 22 Nov 2019 01:00:36 -0500
Message-Id: <20191122060129.4239-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122060129.4239-1-sashal@kernel.org>
References: <20191122060129.4239-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

[ Upstream commit 32c8c4c621897199e690760c2d57054f8b84b6e6 ]

mfsrin() takes segment num from bits 31-28 (IBM bits 0-3).

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
[mpe: Clarify bit numbering]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 687e8b8bf5c67..899288b71145e 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3043,7 +3043,7 @@ void dump_segments(void)
 
 	printf("sr0-15 =");
 	for (i = 0; i < 16; ++i)
-		printf(" %x", mfsrin(i));
+		printf(" %x", mfsrin(i << 28));
 	printf("\n");
 }
 #endif
-- 
2.20.1


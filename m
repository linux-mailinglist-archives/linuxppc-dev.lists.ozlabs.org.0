Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD05FEFBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpp9G2NvCz3dx8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:06:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dRH3vaNH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dRH3vaNH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpnsM4XyMz3dw8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:53:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D41961B4E;
	Fri, 14 Oct 2022 13:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1567EC433D6;
	Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755588;
	bh=BOeUAW08y22Ui11TSsJcGyob9iBOvUvzBgY7Wtfqjlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dRH3vaNHhOiKFbPfYl735iy8u2dC6Oy4xQLUuOmvz5tWzoKNq8FC7tXNwIoz3+nvG
	 MJzR+gXW0XAFGd8y2ru9yqGhyLL2IZikMz0nVdJFhiI3ssDyLsoeih3kkSVxVgP/SL
	 MDalpq0deWf/9zWPZIXOq4kcNCRx3SZ12lVKxckkkLkah1/6h+JBYwcmMXPf0JhTUJ
	 ZQtGckk9M2MmfP5sJCEscJwQ/Xnk7BZLaAM8oMrAdm2WIfLvtgSfV8KYqHk1M8jQbC
	 FPL5mXMj84j7a9FTJT9EvDScT/WQFzRY7EUV8q/S0uEE7dif/MObgsODysfDaZAIWC
	 dFr+JBjXVIjoQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/8] powerpc/selftests: Use timersub() for gettimeofday()
Date: Fri, 14 Oct 2022 09:52:55 -0400
Message-Id: <20221014135302.2109489-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135302.2109489-1-sashal@kernel.org>
References: <20221014135302.2109489-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

[ Upstream commit c814bf958926ff45a9c1e899bd001006ab6cfbae ]

Use timersub() function to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220816105106.82666-1-ye.xingchen@zte.com.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/benchmarks/gettimeofday.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c b/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c
index 6b415683357b..580fcac0a09f 100644
--- a/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c
+++ b/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c
@@ -12,7 +12,7 @@ static int test_gettimeofday(void)
 {
 	int i;
 
-	struct timeval tv_start, tv_end;
+	struct timeval tv_start, tv_end, tv_diff;
 
 	gettimeofday(&tv_start, NULL);
 
@@ -20,7 +20,9 @@ static int test_gettimeofday(void)
 		gettimeofday(&tv_end, NULL);
 	}
 
-	printf("time = %.6f\n", tv_end.tv_sec - tv_start.tv_sec + (tv_end.tv_usec - tv_start.tv_usec) * 1e-6);
+	timersub(&tv_start, &tv_end, &tv_diff);
+
+	printf("time = %.6f\n", tv_diff.tv_sec + (tv_diff.tv_usec) * 1e-6);
 
 	return 0;
 }
-- 
2.35.1


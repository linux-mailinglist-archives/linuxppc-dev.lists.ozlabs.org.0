Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD5F6E2477
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyczJ4CPYz3g6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:41:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GrXnrseU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccv5C94z3fT6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GrXnrseU;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccv4Q7xz4xFd;
	Fri, 14 Apr 2023 23:25:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478703;
	bh=WGjtStinLz6d1ypWIGoKc6r9HruuC7g8ng97aoe/LUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GrXnrseUd52OGiZHFYrh7dXfonFgzidNI99Ej+Y0ytsvk+57Ane9K48XFdEoFYQhK
	 kVLuUAZZBNS4p6z7guGFBOIC7ABEP7EEc8h5dZ/WIf72lgdMbTcx8pFazCF50ySWT4
	 DxT0PzqnIUAeBTNnS/ATh6qiJYLH0dKFldBZJxGEMbrSGD9FT7Jyaa91x8AVEQ3LAn
	 P2j9+mcSJvFOzIHiAJf3j+gLiXZ+YGbews9j8oc3ugJfhHvoIBB4zoNiphNdFHIqa+
	 5LwMdGk1W0tMH6jo7Hp84l4HzRmoMlQ0yoUZlKAxJt0MWTUfdIv0DyuOoybKb48sPP
	 uYOUD1XkNIPwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 21/32] powerpc/configs/64s: Enable SCHEDSTATS
Date: Fri, 14 Apr 2023 23:24:04 +1000
Message-Id: <20230414132415.821564-21-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Distros enable it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 3154f307bba6..2cee399d3abc 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -407,6 +407,7 @@ CONFIG_DEBUG_VM=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
+CONFIG_SCHEDSTATS=y
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_FUNCTION_TRACER=y
 CONFIG_LOCK_TORTURE_TEST=m
-- 
2.39.2


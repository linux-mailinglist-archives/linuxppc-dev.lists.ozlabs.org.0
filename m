Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC755F602
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 08:08:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXrcy6DnNz3dpV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:08:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qEWtu9/X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrcP5cQSz3bm2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 16:08:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qEWtu9/X;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXrcP4xQSz4xD9;
	Wed, 29 Jun 2022 16:08:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656482901;
	bh=hLCV0pABv8NBiW5hoPRTAd2IAuzUPtRw16ZnxbrB/IE=;
	h=From:To:Cc:Subject:Date:From;
	b=qEWtu9/XcfBL2ZmfAOga19DwNxNYHchSMVq03HPK5shvgbeUOMLxbUvxBBEtM8s8E
	 ohyPSDzHnqOSw/P4U1GCFSB31GNAlLguqe1FEyEFPa95hQLuq2C7fhMpEXcCsZu3Rg
	 V+XQh43rbo6VB8HxJWLP750ePhLHwSEj70EsfFC8krvxok7s2nxUaa2M9jvXkcKD9R
	 /x7ltdkoealjwE/NRNMtOtQMcMrUijwlCoV/o/Ml6b8gh8KoqBrDU8TFezXZvrpaNn
	 Yhwb/wISpv8cLiuIn8x3omQ49mSmkhIg5xFs0c3+X5k3IscarDnE5ZsP0csLNdAG1m
	 OFBcQ2G2NODlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Update reviewers
Date: Wed, 29 Jun 2022 16:08:17 +1000
Message-Id: <20220629060817.2943966-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: paulus@samba.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe and Nick have been active in recent years on the mailing list
and making contributions, add them as reviewers.

Paul and Ben are no longer actively reviewing powerpc patches, remove
them from the reviewers, they're still on linuxppc-dev if needed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2a..af4cfeec9d0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11345,8 +11345,8 @@ F:	drivers/macintosh/
 
 LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
-R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
-R:	Paul Mackerras <paulus@samba.org>
+R:	Nicholas Piggin <npiggin@gmail.com>
+R:	Christophe Leroy <christophe.leroy@csgroup.eu>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
-- 
2.35.3


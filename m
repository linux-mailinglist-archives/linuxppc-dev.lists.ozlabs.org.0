Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E603838ED8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:52:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZevWN0+i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK6SV6Cw0z3dD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZevWN0+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK6Rh0Vq6z3cZG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:52:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BFA961B8D;
	Tue, 23 Jan 2024 12:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17638C433C7;
	Tue, 23 Jan 2024 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706014315;
	bh=sax3ws7XUZKyWXxJBC7b3ZD6Aa6CF5mlJzTwof2xdms=;
	h=From:To:Cc:Subject:Date:From;
	b=ZevWN0+iPQKKsn7lg02tsr18gh7ODMTlRGsilAwxwAsFItbLISX5tvqQeCEEwREqQ
	 FvA+stW9oaTkC4+C2m5eRqxEkZbRqQqgP7YBlQrnbWsD/X7ZxLvg4sxa4TH+AvI3FZ
	 BWFqHZVn7BQvbUeQvqkCwA4BiASl9RlRvYP9ze78nE5UJBcxi+HzxpWgibqQviTKO7
	 LFR+dgr3egejb0YxOO59CMtsLgRh4FVBx7DyKnINJZbkZ6cPnSr8aU/3YxkjfgGL3b
	 P7NoDEkAuFd+TZUh6cV+vjmfUBRk1owGP0fKfXNowMRhgzI+wlTHgNgHDzMOqWjg/m
	 CfyXW76vbZcbw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc: udbg_memcons: mark functions static
Date: Tue, 23 Jan 2024 13:51:41 +0100
Message-Id: <20240123125148.2004648-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

ppc64_book3e_allmodconfig has one more driver that triggeres a
few missing-prototypes warnings:

arch/powerpc/sysdev/udbg_memcons.c:44:6: error: no previous prototype for 'memcons_putc' [-Werror=missing-prototypes]
arch/powerpc/sysdev/udbg_memcons.c:57:5: error: no previous prototype for 'memcons_getc_poll' [-Werror=missing-prototypes]
arch/powerpc/sysdev/udbg_memcons.c:80:5: error: no previous prototype for 'memcons_getc' [-Werror=missing-prototypes]

Mark all these function static as there are no other users.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/sysdev/udbg_memcons.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/udbg_memcons.c b/arch/powerpc/sysdev/udbg_memcons.c
index 5020044400dc..4de57ba52236 100644
--- a/arch/powerpc/sysdev/udbg_memcons.c
+++ b/arch/powerpc/sysdev/udbg_memcons.c
@@ -41,7 +41,7 @@ struct memcons memcons = {
 	.input_end = &memcons_input[CONFIG_PPC_MEMCONS_INPUT_SIZE],
 };
 
-void memcons_putc(char c)
+static void memcons_putc(char c)
 {
 	char *new_output_pos;
 
@@ -54,7 +54,7 @@ void memcons_putc(char c)
 	memcons.output_pos = new_output_pos;
 }
 
-int memcons_getc_poll(void)
+static int memcons_getc_poll(void)
 {
 	char c;
 	char *new_input_pos;
@@ -77,7 +77,7 @@ int memcons_getc_poll(void)
 	return -1;
 }
 
-int memcons_getc(void)
+static int memcons_getc(void)
 {
 	int c;
 
-- 
2.39.2


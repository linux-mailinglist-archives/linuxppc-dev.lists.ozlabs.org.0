Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9546393F9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 06:12:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK0Gb3pgQz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 16:12:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=KEDJviVm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=KEDJviVm;
	dkim-atps=neutral
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK0Db0FBqz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 16:10:36 +1100 (AEDT)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1669439427;
	bh=XbTFOdNwEbWCIbMTsixNKHLPlvR9YwQ8MRhGh7pfdfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KEDJviVmcGIoAZ29qGUwhmhoiEhAX4R99+RJOa0pX3LwziRnhS14JR7qWiRMhagC7
	 RTbfctuyrS3IPQo/sVTKDw81mG+becR4zmDCNMYB9N3A1rBeX7DfUOjIcZZ8S/LfTH
	 86xGSlJQ5wkJEljiuHPDwnUDFfi7aGL7tQWlpjH8=
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russell.h.weight@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/book3e: remove #include <generated/utsrelease.h>
Date: Sat, 26 Nov 2022 06:10:00 +0100
Message-Id: <20221126051002.123199-2-linux@weissschuh.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221126051002.123199-1-linux@weissschuh.net>
References: <20221126051002.123199-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669439380; l=805; i=linux@weissschuh.net; s=20211113; h=from:subject; bh=XbTFOdNwEbWCIbMTsixNKHLPlvR9YwQ8MRhGh7pfdfU=; b=kQK8DpdAJ/pYABAEO/dZmoDkwDFnpINyHc1jyw1qTilCAmJpLLJRpKINy3k9dz5MqbyUr/+hYBKJ iTPoLnosAwMI6k89cxFEhMZxKlZHsRXKfsKe5Deam2d+h6WWLtiI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519; pk=9LP6KM4vD/8CwHW7nouRBhWLyQLcK1MkP6aTZbzUlj4=
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 7ad4bd887d27 ("powerpc/book3e: get rid of #include <generated/compile.h>")
removed the usage of the define UTS_VERSION but forgot to drop the
include.

Fixes: 7ad4bd887d27 ("powerpc/book3e: get rid of #include <generated/compile.h>")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/mm/nohash/kaslr_booke.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 0d04f9d5da8d..2fb3edafe9ab 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -19,7 +19,6 @@
 #include <asm/cacheflush.h>
 #include <asm/kdump.h>
 #include <mm/mmu_decl.h>
-#include <generated/utsrelease.h>
 
 struct regions {
 	unsigned long pa_start;
-- 
2.38.1


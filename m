Return-Path: <linuxppc-dev+bounces-4134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC99F2919
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 05:07:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBRHW0W0dz2xb3;
	Mon, 16 Dec 2024 15:07:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734322070;
	cv=none; b=i/KVoA4+dKUe98WJa6Z7aforUdKavoHD/DgSLORIdJKUquXXO2ZSfabKCvySYp73kDFsAxlX71A0V6UkAHUvxG2ghseBamm3gYUGFoxOp+CTdMPQmxfAOEPVa8gZnO4zf0ZLA0KJqBdflJMUZn2fMeDN24f7vqFM2gPIaLoq7i4+8BSuswP6O1cJue5CXnGTM+6dYBPcz05iwxFhRUSuZB3VTIDxRTulNPwZdjegz76glTzu7oZQoYGHBA3WcG5y7oE7wgkWnUM8RavNcaKsHxCNFKHry/dt0TbT1AO1DRMj0btJ62p6CiAxpjYliGN6hwGlrtrYqWOgN7OMu+6k3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734322070; c=relaxed/relaxed;
	bh=XpuWKedY2uZmtVZsnD+BlQpzw+dATa8/sFhLlHQcrNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIqkHItg6BO1ryygsle0uc8VKv9PAPksY+hoNlhAPw2LjFwYnvCwVZYMLhyC28I7+rDtJ5c27FAQMJRlz8hvQB/+ksfmI5gEaNEEztLsOWpkmtVKQ2+D5JLlhbuPZp3uzyCRFI5F0Tp6mxhnJVWkUhcHrtoCktmzbKn2qiXIu7OXhRbql2kgARrlIrJF/MvlUf2BjlNyjQsDKC7JihydUANZ69iDrp0jAAG9TSFYs55+54VSQPwxcDh0JazXyDlVSwfPZG6mEzAkSb2542qipkIWqTyAldLabJlliofofvExh9ApiICzN1AffOjV75cNecwdpig+gYEi/dmWyQj3SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=gGd9+H1A; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=gGd9+H1A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBRHT6Mdpz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 15:07:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734322066;
	bh=lpG1ThR/8HH372NAoQFJS0Y3lxzTHbVf7kKGZfLomkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gGd9+H1ADEHjqWuudOxcGRWSv2b2PyMpyuCg6o0S2WV84iWtSMSm2qvDLMOKolW2s
	 Q/IdNHRLHFasCV5+TH9zJ0w92nniDVTmM7DSprZY+5DHHkBolzN4cl7nfbpwnhmzKP
	 KfwSBonKXmHfb+mJUa7E/j/aKDoXJDzZ4CSw75z4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 05:07:45 +0100
Subject: [PATCH 3/5] powerpc/powernv/ultravisor: Constify 'struct
 bin_attribute'
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-powerpc-v1-3-bbed8906f476@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734322065; l=1354;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lpG1ThR/8HH372NAoQFJS0Y3lxzTHbVf7kKGZfLomkc=;
 b=FR6JUSEBPQc3U3GGSnGW9IVHs/F4mGUD0E0I92qZILVDo9mi57GtkSXWbOOTSE0CLhtga7jBb
 uj4m3AdQMHfA7/3Q+odV/9RDms/AMYC661n9V0oi8z9qQYG0IepYkRi
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/platforms/powernv/ultravisor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ultravisor.c b/arch/powerpc/platforms/powernv/ultravisor.c
index 67c8c4b2d8b17c3662507121e97f48587d3ef82b..157d9a8134e445ed22be8ae58ff9181b45ac7ff0 100644
--- a/arch/powerpc/platforms/powernv/ultravisor.c
+++ b/arch/powerpc/platforms/powernv/ultravisor.c
@@ -32,15 +32,15 @@ int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
 static struct memcons *uv_memcons;
 
 static ssize_t uv_msglog_read(struct file *file, struct kobject *kobj,
-			      struct bin_attribute *bin_attr, char *to,
+			      const struct bin_attribute *bin_attr, char *to,
 			      loff_t pos, size_t count)
 {
 	return memcons_copy(uv_memcons, to, pos, count);
 }
 
-static struct bin_attribute uv_msglog_attr = {
+static struct bin_attribute uv_msglog_attr __ro_after_init = {
 	.attr = {.name = "msglog", .mode = 0400},
-	.read = uv_msglog_read
+	.read_new = uv_msglog_read
 };
 
 static int __init uv_init(void)

-- 
2.47.1



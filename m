Return-Path: <linuxppc-dev+bounces-3829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CC9E5D4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41kx6Rqbz30TP;
	Fri,  6 Dec 2024 04:35:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420153;
	cv=none; b=NUVjO0tgQkweVZlKoxqPANXF85Y0YOoYf8HfFugpw8M4jViK4bb0nJXOlOsGqcG1COxZ8L5prROwmSCLScCoNv3Bo9Ioer01nYSz1dww9rmJmDKaeP4sqIpbNQOQjnauKqO4XfqBW5YJlhPjbuEI8yQ0bGFCcihvYP7/hsOr4Jw7ik3Q4itLgJ+EVGsIV5NynYADDRFRhILIAhcNXCHEhLV74mqWyunNX1i0dCZlqDzm9umV4DgNPc2J8YGCWIanM0EcAMU+rF/zCWB8Yy5NGEOKZ5ti642B1nC9PjdTlUeGFuB/LNjPh/g8x6epPTQr09n6k6k4HCYRWiLikE6vDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420153; c=relaxed/relaxed;
	bh=k4lUB4Q4BEgd7djZEOoKEhe6hcDJl45q7y3Y79d2vaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCbmIKtSANhENeUnKe3fqU8vhM8Cstm3w6Lp+L+jhlohEFznKOFjEt+KCtlJoMK7W2857Q2//WJ3q1XA4Sn9vjbLYC2pWuTu0TAlHHSvdSMiNquxdiOFaTHEMQAEplRH+uCEZzMRpKYlEOidjhl5zHtJLERqdBnxIRav8MJ0bD4lbfX6h1zlcTES/llKqoS3VaLkZaXC1dmKbuUFasnzumLkIL/aMV1TAPmQ3aRd2ko2eNx/8k/uQHZN5x5X8LwbVbSVy/KXjAP0E5M2HBqVmEqHelCs5Z9hP5LhqIJNhf0KjgrGWlJkgimkQoASart1Wd0zzElzHM/GH/irTk72vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=guoxc6ji; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=guoxc6ji;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41km6wRtz300V
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:35:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733420137;
	bh=cfuC4VjJZbJslwembV87HLGJheNWpA6IXa9jHRZu/TI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=guoxc6jiRIqYEGgM6BDygebSsXZ13mk0XDHwVPTvCXJki6yuOI+VMVHt/REiIuCp3
	 5PH3S7I1rR5ECLEBN+pPHNQKosnLzkuyeTaP0HRnoKS91a4VeTxCdX7qXj6M8oBX9J
	 pPlkZUr/1HRJkQYaW1Zp5F16MRkEAaHCkW1k8zbU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 05 Dec 2024 18:35:16 +0100
Subject: [PATCH 4/4] btf: Switch module BTF attribute to
 sysfs_bin_attr_simple_read()
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
Message-Id: <20241205-sysfs-const-bin_attr-simple-v1-4-4a4e4ced71e3@weissschuh.net>
References: <20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net>
In-Reply-To: <20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 bpf@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733420137; l=1356;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=cfuC4VjJZbJslwembV87HLGJheNWpA6IXa9jHRZu/TI=;
 b=e241/DoQXymqExeN+SMwvZ808XE79ecCrN8XFKqhJnW3U8HuphVENS4R6ai//luSj/YPr30lo
 NqTPg+Nmf9/Dvw7MuaG3SlMfMc+h0AAu8h+lEG2k3oNOjl5IwrAmm5N
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic function from the sysfs core can replace the custom one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/bpf/btf.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index e7a59e6462a9331d0acb17a88a4ebf641509c050..69caa86ae6085dce17e95107c4497d2d8cf81544 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -7870,17 +7870,6 @@ struct btf_module {
 static LIST_HEAD(btf_modules);
 static DEFINE_MUTEX(btf_module_mutex);
 
-static ssize_t
-btf_module_read(struct file *file, struct kobject *kobj,
-		struct bin_attribute *bin_attr,
-		char *buf, loff_t off, size_t len)
-{
-	const struct btf *btf = bin_attr->private;
-
-	memcpy(buf, btf->data + off, len);
-	return len;
-}
-
 static void purge_cand_cache(struct btf *btf);
 
 static int btf_module_notify(struct notifier_block *nb, unsigned long op,
@@ -7941,8 +7930,8 @@ static int btf_module_notify(struct notifier_block *nb, unsigned long op,
 			attr->attr.name = btf->name;
 			attr->attr.mode = 0444;
 			attr->size = btf->data_size;
-			attr->private = btf;
-			attr->read = btf_module_read;
+			attr->private = btf->data;
+			attr->read_new = sysfs_bin_attr_simple_read;
 
 			err = sysfs_create_bin_file(btf_kobj, attr);
 			if (err) {

-- 
2.47.1



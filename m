Return-Path: <linuxppc-dev+bounces-4499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C269FD983
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 09:44:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKwrX53spz2xfC;
	Sat, 28 Dec 2024 19:43:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735375436;
	cv=none; b=dF940hNJV6eg16FiV8YyNCaLN/7m3MDFvmRnBBiiqxkQ/EUKrAIgRaDbp3MdSY4LIA/uCGQYZL3p6dxabJhy42HnlkUWG2F6RiTaWzUAWaZtWHg0CFeWSaRugDeEX1f79ZGIofUxYKdc8y5Pvfqx1N+AwauE+Iwg9vVV70mV54nNavAS0sL/9x/BVLSUlgHyr5tc51gvNJUkVdPoyYVZd8Otayl0FSlJAJxev0VG9mpJW+quaSofDMgpaZSLxSCt0aX+nAE1DjK0380cO/xzAXA9E2BdWdZwAnYW7K7Y0ZYieJI1UvN79VrkDi56BGngCvhvV/4/M/KogMbqJ9bQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735375436; c=relaxed/relaxed;
	bh=W7h0IM79w7+8f3knSLohYqzkEYl9HDKTtXHSm5nc7go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDRiNPdtySc9xl0RXvxKcYleg9h6FcPFZGGj3oi0g1I74/4d8pVy2/MybNB3GkBn/KBsK59arWUAft8EK+awJrPMtEdts99A63jnSK/vChQw7kiDs3zHZzDo5W8x66HJ8gWyaru7If0sPyBhbnxnZCjV6r66e+Kc74O3NLQZw0P7mR41Iy/PvhcAEPOwz2CD1/ZgiDVAvy5TEctJjRPqFm5ynaBTshPd0MyMb5reUyWnk4c1HHmXWCEOIrGN7fR2k/PEnXPWF4NCXlNO5qdr0GYdi0Qg3QIOrGqPJLtY2ihogukfZm9GQUmACrLTMzWDP7XeHREStT1yzXSfEqWwjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UV3WCIbX; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UV3WCIbX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKwrT59zmz2xbP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 19:43:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735375425;
	bh=gRcd/2NnDUW8yE3a+tTaSfJ/jeKT2kVSJOjTrjbv+S8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UV3WCIbXhRbiALujdvDUk9ZM4zB7tpO9VebFbFOuccYusBQaf2J4ELPByd8UBEHA3
	 ENHNVPI+Hno0yud7S2HBR0WLgifRsdeWQzo6yND8RR7s3fGtyMxxyZ76hfkDSuD7nD
	 at7FpoeAxFV5lZ/1eaQDMaVvupeXIQWbCe8qdYT8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 28 Dec 2024 09:43:42 +0100
Subject: [PATCH v2 2/3] btf: Switch vmlinux BTF attribute to
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
Message-Id: <20241228-sysfs-const-bin_attr-simple-v2-2-7c6f3f1767a3@weissschuh.net>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
In-Reply-To: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735375424; l=1428;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gRcd/2NnDUW8yE3a+tTaSfJ/jeKT2kVSJOjTrjbv+S8=;
 b=BtXqo6i8vCr5QAYdIlXIl+3WSU3SgWVu5TpzrjNOkwFjCUERadq3za52tID68UV/JrxVcA6mQ
 nYt2NtudzxaB/Fis+COvXhk+ruHL01vQdXTR33R/DCv7MQA+RCsxCop
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic function from the sysfs core can replace the custom one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
---
This is a replacement for [0], as Alexei was not happy about BIN_ATTR_SIMPLE_RO()

[0] https://lore.kernel.org/lkml/20241122-sysfs-const-bin_attr-bpf-v1-1-823aea399b53@weissschuh.net/
---
 kernel/bpf/sysfs_btf.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
index fedb54c94cdb830a4890d33677dcc5a6e236c13f..81d6cf90584a7157929c50f62a5c6862e7a3d081 100644
--- a/kernel/bpf/sysfs_btf.c
+++ b/kernel/bpf/sysfs_btf.c
@@ -12,24 +12,16 @@
 extern char __start_BTF[];
 extern char __stop_BTF[];
 
-static ssize_t
-btf_vmlinux_read(struct file *file, struct kobject *kobj,
-		 struct bin_attribute *bin_attr,
-		 char *buf, loff_t off, size_t len)
-{
-	memcpy(buf, __start_BTF + off, len);
-	return len;
-}
-
 static struct bin_attribute bin_attr_btf_vmlinux __ro_after_init = {
 	.attr = { .name = "vmlinux", .mode = 0444, },
-	.read = btf_vmlinux_read,
+	.read_new = sysfs_bin_attr_simple_read,
 };
 
 struct kobject *btf_kobj;
 
 static int __init btf_vmlinux_init(void)
 {
+	bin_attr_btf_vmlinux.private = __start_BTF;
 	bin_attr_btf_vmlinux.size = __stop_BTF - __start_BTF;
 
 	if (bin_attr_btf_vmlinux.size == 0)

-- 
2.47.1



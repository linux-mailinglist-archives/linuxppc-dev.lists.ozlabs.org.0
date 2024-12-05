Return-Path: <linuxppc-dev+bounces-3831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D49E5D57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:36:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41kz1Vhrz30VQ;
	Fri,  6 Dec 2024 04:35:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420155;
	cv=none; b=aLHevuhKjcDZXtQ5yIgkvNAvvp+QVGEd4WuuSOtRBlv/8aMbee+fWzBk1GpmogZHVt+1l4ftPe67CqZh+Ym06/xI8STMcqhyynQrIUyJu4oA9ZpZAmyt63BfGBhHbV0olDEAzMfguOPhasbHlp5B+oBtq15aGlfWMjg79wPurKe0iazq+kDdFpnLG5n3AS6WtSBX1hFYaSaKBuOnr6vICa6PCfu+m2Yv75T+TwC4y5t8PPizUpyyAtfv4bW/qXKmTTwn5TVKlc1Lt0MUZlDGMkauNrHGal5gYNFjmVDc2fV6KyeCn7M+tKMMduQHgysrAaL2Ns1QpJf4rQNpvaQzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420155; c=relaxed/relaxed;
	bh=qiN8P4YPsvbOKpO8icgikt0q+xpQ31g9j9mEbKAAJiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SR+puHoijTpenfwFZfL+f+5dkW4pHnGatjKfAQ9N63R0RVACjjwiNJnkRyi8gNbA5i9JQc2DT5adyURePnUnBJG/uKBq/KDozoentf+TRxmOWo8UrrngQNUqbY7jVn1ard9fxJe1uPKnSnzN01clNLV1sgBDqJQ7tF2GtEFXg1av9q328AmYHV7SDmB8MC6GLEX+NAJYWo3LDdd+u+/M5xD+pAnVp2en1w3rCRPb8AI5oh1YG7ygI9xSdgOgVCIKqAPDPIUfU1Q39J+cqBmFjzt3Gmb5JJxdmKLO9apK7c7saofNot8G9U8AvSkcdZ4e9q/CXENFTsIzZ33D2waMvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=K6bno3Pi; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=K6bno3Pi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41km70rsz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:35:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733420137;
	bh=v54jOXPBj86EmdoK8VRH/WJTe91je7IjzNhdTGxTAGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K6bno3Pid1wQl8du0lNePJ95Kvvh7/8n5drvB2nGu7OHw9DcP/cBbyuGWw1foEg5Y
	 zAU2a1oj/zgo72VtMRKRrCdb4KgzJ0Umw1lBEe2d076qaJC9xwZRrqMPO9OuBNxt/z
	 Trex6yqGmkJCtKeeefG+X9DMpIdzov2ei2fbATzM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 05 Dec 2024 18:35:15 +0100
Subject: [PATCH 3/4] btf: Switch vmlinux BTF attribute to
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
Message-Id: <20241205-sysfs-const-bin_attr-simple-v1-3-4a4e4ced71e3@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733420137; l=1383;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=v54jOXPBj86EmdoK8VRH/WJTe91je7IjzNhdTGxTAGM=;
 b=z5q+mLaILrDgqDYwtsD48fkDkxpZ62jcajO3UKpxPz32mD8JI/2JI972ZU1lQwyNF3vSJQo0s
 6sYjAwPi+IUDoUGqDySD1CsWmyWtBNVzTIiDOk4iNPc9R3Rd/cj/9nF
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic function from the sysfs core can replace the custom one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

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



Return-Path: <linuxppc-dev+bounces-3828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6769E5D4E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:35:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41kx5cFFz30TJ;
	Fri,  6 Dec 2024 04:35:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420153;
	cv=none; b=iXBOs5cf2Ixeosvw/uh2EoiDblx6cQ3SE6/0Xqv5ltXPTH9i3nqMvBD32rfSvgx5pXUgXEXUkgsp98ZaU0gbbKt0sZqsEa9FHiIyAZydFGmuXcrbVUQm2fS6bfJ+xhwYor2rg8S0OI5vr46MI+iwhQ182L/Kw7q408FmZDQxmJx4NsLFjh6d61xPkuK1LOSARtmNfTDLL07nRMl7mSjSFHSCEIbUAe4yMzU0ganQ+I8SmLMzA/ijEBbQo53SHiU5EFJKhJhHRk41ShEk2k8vydjHi/u4O3rEdSefJvBXdWb42k6eeUsopDhRplCUVGlSIIUzPyBxhU9Pe08op+TwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420153; c=relaxed/relaxed;
	bh=0mMdKHR5uGeo90rsyNkTu9fOgli1kIh3uNhb5KkdBws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvmrTbEF69nRhHVviiMqhwT8f8V37BIWg5qcr41T6oxC37753NT66GQFBstDbnRKvsjoa129Y1Osz5BkgYGC4XR4Hp01Z/20AZVr4QR1opKGHusvZFUkFy9XLmX9q/oBg+4xpWEpr2MI1l6VuuR7Dx6UEU01J3ECS1PzqPOTdDEi6M5ZJLnuiEx5Fe6yaOKKz2QQqgMxjDqLx/v0IiC0JzRJXInnl69XjRRhmG9Wql/ix34Pww5IKBnrF8uKAAKwT8bVjbicfeU2NPUMcyDsoyeqVUNMOvBBQ02k2LWcrin/2W0CjVoZJE0APjW1edhhjgpYnOWXzquJsiU3wMnOlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=N3aE/who; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=N3aE/who;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41kq0gJkz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:35:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733420137;
	bh=5LgMscy8fNMxkSnBk89bFZtOweO+ubs1BjcR/pPmVkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N3aE/whoh0KniNiOdttnlBkPGxTSvIZRmCSS4tM8MAPBalxnpZjR3OoaUI3/xXTIo
	 fNNtedHUR+sbdbMnShhmacrx6v0eWcsU3TYdFPa16wzAGR6XJ7jGXiDVl6/n1HjBz+
	 JSalKw3c9i0jJhAAfKdCvzOzYA+mk+CgGniZjEaI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 05 Dec 2024 18:35:14 +0100
Subject: [PATCH 2/4] platform/x86: wmi-bmof: Switch to
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
Message-Id: <20241205-sysfs-const-bin_attr-simple-v1-2-4a4e4ced71e3@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733420137; l=1583;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5LgMscy8fNMxkSnBk89bFZtOweO+ubs1BjcR/pPmVkk=;
 b=FFE0LC+lWyL41OWKcLih/cJP43TX/qUmNdEXnIWxYkdVLt0K7dsR35ynGht17m6UhezsKb9iC
 ql1zd1NvQ0BAvkF0dWD1XVGmm/v8XCf3L6eiabSOtHoMnaMvizVK/An
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic function from the sysfs core can replace the custom one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/wmi-bmof.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
index df6f0ae6e6c7904f97c125297a21166f56d0b1f0..e6c217d70086a2896dc70cf8ac1c27dafb501a95 100644
--- a/drivers/platform/x86/wmi-bmof.c
+++ b/drivers/platform/x86/wmi-bmof.c
@@ -25,15 +25,6 @@ struct bmof_priv {
 	struct bin_attribute bmof_bin_attr;
 };
 
-static ssize_t read_bmof(struct file *filp, struct kobject *kobj, struct bin_attribute *attr,
-			 char *buf, loff_t off, size_t count)
-{
-	struct bmof_priv *priv = container_of(attr, struct bmof_priv, bmof_bin_attr);
-
-	return memory_read_from_buffer(buf, count, &off, priv->bmofdata->buffer.pointer,
-				       priv->bmofdata->buffer.length);
-}
-
 static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
 {
 	struct bmof_priv *priv;
@@ -60,7 +51,8 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
 	sysfs_bin_attr_init(&priv->bmof_bin_attr);
 	priv->bmof_bin_attr.attr.name = "bmof";
 	priv->bmof_bin_attr.attr.mode = 0400;
-	priv->bmof_bin_attr.read = read_bmof;
+	priv->bmof_bin_attr.read_new = sysfs_bin_attr_simple_read;
+	priv->bmof_bin_attr.private = priv->bmofdata->buffer.pointer;
 	priv->bmof_bin_attr.size = priv->bmofdata->buffer.length;
 
 	ret = device_create_bin_file(&wdev->dev, &priv->bmof_bin_attr);

-- 
2.47.1



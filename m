Return-Path: <linuxppc-dev+bounces-4501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E059FD98D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 09:44:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKwrb0WNbz2ytQ;
	Sat, 28 Dec 2024 19:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735375439;
	cv=none; b=i4XtpBdwGhhBZ+29H1y+Y2mjaoxlmE/FgKTNkLt4Is6WA7mhFeSn5i3XVSSRqqloUvnxoYJYEWuPxyrg8yLlK4rmCjl+D5uj+/tZbqzURQ2kEmn9F3ShjlLMxZYqBlK/OoIHJB0+zY8j5j+Dq0AS7X0gpJiV19JjhAnL1kSF7voAvwuQEwqVQpcjuQRYPQ3B05ZAeNCSTizs9h6bqeqBTgDq9jLPIiiwI/ZnCMuf6fviP4qiqSKx2qjwFWErKb/dTR3GA97iY06/GML9lVVf0V7IVYl4d4tmO1P6RHudd7V6PpWB7F+2oRhLC7QkzimpYDTl3v0S0HD7jWc4nsOsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735375439; c=relaxed/relaxed;
	bh=bTr6c4uKxBQJa6+6ydbYJ/hGkLqEdHHX3gqe82adwEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJHmqULftp1HvdOWc28MBBUz7IKBNB/czONXQCjtHKEWPnrWh/FTKutbkloI5iQvclVuNEEV+yy4NraJw2VROixIinZP2ilIkg/zzuC7FtT3kPaoeMXgoyP7EYPnsz0Fmo5ai1zpmB8MoYumVBr8rmf8QTkAF/lsMWomdp0RCVzsoCxgHFSXQ1tnKTqkRWpSrWq492W5Pc+tyOrP2+8VYcnj8KNwxFbXXTIJ9QjLUUT5+HmwGvw4IawqgqExuEUX08gGuycJ9+54dv64W80rdRPxOOM3p/vHOjdTheA0CTyZTewOp+zmi5fcxOLea5tY8Xj8lUwXJLIDBH/Vs5p85A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sK2qcuK+; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sK2qcuK+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKwrZ0T30z2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 19:43:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735375425;
	bh=wz1z8EiyfVhVbt4qr9tEdssHSlJmEHuAhD1PCW7Z+GY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sK2qcuK+yGlFRTv0drQ/tSHIXIlyiafpZODXd1Cm4O5wUM0gOva8V1J2ZyHzGqyoy
	 iZy7SI3bFvLtDdk878Dx750SrTZxWuL5i0r/kYrR2rRf8qG/y/DS699t4lbpoWqu0V
	 aGKj4YfwnkO+Jem/l+omRqCywWTpARWzAldhQV4Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 28 Dec 2024 09:43:43 +0100
Subject: [PATCH v2 3/3] btf: Switch module BTF attribute to
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
Message-Id: <20241228-sysfs-const-bin_attr-simple-v2-3-7c6f3f1767a3@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735375424; l=1403;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wz1z8EiyfVhVbt4qr9tEdssHSlJmEHuAhD1PCW7Z+GY=;
 b=H/wGBJzQrmCrKy2Y3Rb0Y68++ySdjfE7idPzg55qBSVH2MHWx1FPtKo8MlnyUx47kvNeGXYlQ
 vMM+NGIIRAUCUYj71p4EXyyMjvF47hbQPHq4QtNrPMIHcjM6PPWHOee
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
 kernel/bpf/btf.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index e5a5f023cedd5c288c2774218862c69db469917f..76de36d2552002d1e25c826d701340d9cde07ba1 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -8011,17 +8011,6 @@ struct btf_module {
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
@@ -8082,8 +8071,8 @@ static int btf_module_notify(struct notifier_block *nb, unsigned long op,
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



Return-Path: <linuxppc-dev+bounces-3832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 472459E5D5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:36:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41l25lH4z30Sv;
	Fri,  6 Dec 2024 04:35:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420158;
	cv=none; b=VO7X8g1Y0CYtX3ye5UjIIO5GpiCSKxHhAPwVeLKEV6QrjH9ZcYy1rAWRMOuKT0q6Ti7vr3t+g2QEQaMnt8z2ZhhKbQqplsv2G484xDZLTbqCq0w3yA0jcfEUnRM84oTWUGxrdeBZKPC2u8vhryCRBcAWwE0LmpWXmJAlqPpL1Tcj7leZdDa5B2sFyyG4+XLEsn1+nucyIESKxrhI0J2PFx6beCTebymFhA2axzHT/EuDynjwehEEHw7jtQY/zcbMjBpNTHNz4OmFFF4bGvT9nr7mErjGtzjQz+8qan2bOO7aE1rBn4BCfipRxJhryg1jZUoLwocGDPfkfJq5iAaf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420158; c=relaxed/relaxed;
	bh=jQl7PbCpEmVLxwpExhudqrT18v9lxMliD7l9b62ZdRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbce37SKL0Yp64IetE/T4ySTv+mgYSX+AFJLjd48nvgL/PupOQDiIKQFaDCdtPlURdEQbhrm363Gxalxpu6ya5HatRIPSg2hSqL4ZIlnFxD1ErY2NnDlTU25qh/u4B5yuBIbYjzcbpqXQ4mSSfEfBJWSeOx7gnxSZ8weNxrpBnivOzHWIQU1lBpjHu8uf2N7pnW72RyFbRW0aMtgQVh4iQ+k17aqgmTykiLP+X/NyuhChjxhVjqOf1aTZ6zNYWkqnGkOICU53Zl4CSnfNAL3TkdUTnGrczwmPXcGIik4nAhiBikebsQqzUez7mcwLEOi+HAp6Y9MQwYyVV+PzOv+Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=KG9tk7D3; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=KG9tk7D3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41km6ytvz30DL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:35:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733420137;
	bh=yFTZIDT/d9HKSr1VCybVUXBQPCUX/YWCdCVUCfZE2/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KG9tk7D3L7Uf0IUGoE1XT5UumEfJAlsFAfz8UVuSvsNm0D3SC3/fIgoGLxau2ZERH
	 mWMESJy6PDE+efZVb10E62JK6JebxXhDp9abmp90ylpbE6ROZkzRiglTfiN2Fx/5k+
	 W4pJX5dsjU6q3xn4Pjbdhsy3al2VGArAwS9ikGGY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 05 Dec 2024 18:35:13 +0100
Subject: [PATCH 1/4] sysfs: constify bin_attribute argument of
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
Message-Id: <20241205-sysfs-const-bin_attr-simple-v1-1-4a4e4ced71e3@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733420137; l=3142;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yFTZIDT/d9HKSr1VCybVUXBQPCUX/YWCdCVUCfZE2/M=;
 b=N6SLb2+eSyolUshM1oNp1SwAkyOJIwilUlfzAQ+W+1VNmN2Og70zO7PtWIR6lJLtiURIW0PKL
 lP9vrvVVQB8C6d3iPwEht3v7ttdLR6Ohcbgt+23W8yn/BbmOnet1+/p
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Most users use this function through the BIN_ATTR_SIMPLE* macros,
they can handle the switch transparently.
Also adapt the two non-macro users in the same change.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/platforms/powernv/opal.c | 2 +-
 fs/sysfs/file.c                       | 2 +-
 include/linux/sysfs.h                 | 4 ++--
 kernel/module/sysfs.c                 | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 5d0f35bb917ebced8c741cd3af2c511949a1d2ef..013637e2b2a8e6a4ec6b93a520f8d5d9d3245467 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -818,7 +818,7 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
 	sysfs_bin_attr_init(attr);
 	attr->attr.name = name;
 	attr->attr.mode = 0400;
-	attr->read = sysfs_bin_attr_simple_read;
+	attr->read_new = sysfs_bin_attr_simple_read;
 	attr->private = __va(vals[0]);
 	attr->size = vals[1];
 
diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 785408861c01c89fc84c787848243a13c1338367..6931308876c4ac3b4c19878d5e1158ad8fe4f16f 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -817,7 +817,7 @@ EXPORT_SYMBOL_GPL(sysfs_emit_at);
  * Returns number of bytes written to @buf.
  */
 ssize_t sysfs_bin_attr_simple_read(struct file *file, struct kobject *kobj,
-				   struct bin_attribute *attr, char *buf,
+				   const struct bin_attribute *attr, char *buf,
 				   loff_t off, size_t count)
 {
 	memcpy(buf, attr->private + off, count);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 0f2fcd244523f050c5286f19d4fe1846506f9214..2205561159afdb57d0a250bb0439b28c01d9010e 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -511,7 +511,7 @@ __printf(3, 4)
 int sysfs_emit_at(char *buf, int at, const char *fmt, ...);
 
 ssize_t sysfs_bin_attr_simple_read(struct file *file, struct kobject *kobj,
-				   struct bin_attribute *attr, char *buf,
+				   const struct bin_attribute *attr, char *buf,
 				   loff_t off, size_t count);
 
 #else /* CONFIG_SYSFS */
@@ -774,7 +774,7 @@ static inline int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
 
 static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
 						 struct kobject *kobj,
-						 struct bin_attribute *attr,
+						 const struct bin_attribute *attr,
 						 char *buf, loff_t off,
 						 size_t count)
 {
diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
index 456358e1fdc43e6b5b24f383bbefa37812971174..254017b58b645d4afcf6876d29bcc2e2113a8dc4 100644
--- a/kernel/module/sysfs.c
+++ b/kernel/module/sysfs.c
@@ -196,7 +196,7 @@ static int add_notes_attrs(struct module *mod, const struct load_info *info)
 			nattr->attr.mode = 0444;
 			nattr->size = info->sechdrs[i].sh_size;
 			nattr->private = (void *)info->sechdrs[i].sh_addr;
-			nattr->read = sysfs_bin_attr_simple_read;
+			nattr->read_new = sysfs_bin_attr_simple_read;
 			++nattr;
 		}
 		++loaded;

-- 
2.47.1



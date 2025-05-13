Return-Path: <linuxppc-dev+bounces-8531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B917AB4F26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 11:19:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxW9j5s3Fz2yqh;
	Tue, 13 May 2025 19:18:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747127913;
	cv=none; b=CZjPjkrj5WKZ1dVV6r800Q0QdR+JwS6N9RBAhpZfrERU8+UsKath8IDs3/vlRg0UpZMfgCLQgHzBGy9Pw2K8o71/vvsdB1zQNGNDoOYm9eyTrPwAvIDcrCakjJrov83XRl/PViituHdP9W6cZC9SQg5B0SnJrb8wIAxNZfutfBnp/vgk0Kka4no8siCcx62nxIlwQRQPUHgVrGjQ/wjfq2wk8iOBGB4AKDpu7PXCJlL155aOdNJ5T0i2zYkDkbmcMqioqcdl1XWy3RxR6XT1qmQyy8IDFA8ziwsRxjQXfgRdxRiRnvCePNBQXdfTQZB4nkFLspx+K33sAeOucxEXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747127913; c=relaxed/relaxed;
	bh=DTNboLswrf9jYl7R2fhkHc5Mf/EfkCXeYw0mqBAK6/s=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=dk3AxdJ1IV1dj/7lDsPt+35RsksNC2nkr/n6Cae76S9qYVV1dQirDNHXHHYDFYKlJVwC3ckskI2E8dWulwuw9l1rpRwfMKanjSwFe3CEaVm3NTQR15FHm4vnMWTEG1m1Alg9iRbA58Bib9I0rWA9Y0K05NI7sJGu3+mQLcgDAHoPAXkUyeufK4zoO1x+64m0E/q1bPsnr9Ct4gVz8f6aaDrUguu7rZxkiTQOIqAS2dPiRPU8m3YQaNUx0A2NVkWbtta5FGbRKNQPbs64JTjcdLS7QryBhoEcY/BDs14B30czk8bHdX6JVIeKEwnZ6iNQnc6w3sDv2A0y6b642+os5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IBNmZTYP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IBNmZTYP; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IBNmZTYP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IBNmZTYP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxW9j0Sd8z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 19:18:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTNboLswrf9jYl7R2fhkHc5Mf/EfkCXeYw0mqBAK6/s=;
	b=IBNmZTYPvhGTURipNTiBuSgT5xvo+/OCz0c5wIztc6G6KJU21BGbbntEkd9TwssAXhGABA
	CQ1MY8TPrmym+5tVplbHgUpjR23PvJ3EZPcKBFjzlElgZlQr+FnbdXpMiUZBZhG+GudqSp
	7/7HQZdnEzb+bD9GRxIpaAEG+euK5mg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTNboLswrf9jYl7R2fhkHc5Mf/EfkCXeYw0mqBAK6/s=;
	b=IBNmZTYPvhGTURipNTiBuSgT5xvo+/OCz0c5wIztc6G6KJU21BGbbntEkd9TwssAXhGABA
	CQ1MY8TPrmym+5tVplbHgUpjR23PvJ3EZPcKBFjzlElgZlQr+FnbdXpMiUZBZhG+GudqSp
	7/7HQZdnEzb+bD9GRxIpaAEG+euK5mg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-pRXI29mbPJO5bRP6HSgh8A-1; Tue, 13 May 2025 05:18:29 -0400
X-MC-Unique: pRXI29mbPJO5bRP6HSgh8A-1
X-Mimecast-MFC-AGG-ID: pRXI29mbPJO5bRP6HSgh8A_1747127908
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so26226735e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 02:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127908; x=1747732708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTNboLswrf9jYl7R2fhkHc5Mf/EfkCXeYw0mqBAK6/s=;
        b=ndGmgGnJjSeCqbOra8fdVGy21Qjr75bggK+819Uxrt6ez75DonDSyfnaZA1L++VyOX
         dURoSljm4GjRSZTW/lGnEnUnrp4djyfM0cfPAjGA1QuoEFHL4EStwFVvd/xPV41gthKs
         GM+b6ot/QTomSC5wyD2DjyDOr+n2y6E5sFcmHGDMXtWijnBsGKRzvoApOnRsu7TLATRR
         3Lr6hKYc2JmWs1Klcd6G4SaK/tyLOScdzJ90waO70sIn0y6rkdu+CDqkWPly1zihrsr2
         FiFz9JQ1GGETJJPLG+jIqWHq9a4mUmCUfhHnweLXrOugyHnBMAZrNo600alhbA0TwrBy
         wDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlNUkp3p9SnPvnf0aKBCB+PfaMvJfdeU6rfnoeTdjWeRNRjwEDO5YaHvs5DgbSLKJO5U4ZlMomIdU8TFI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyRylzUlp+97PTqhJLF4XJ1PlRe1MPJ0PdNy8R51WZXJMJ7q3g
	CbnpwZiEJ+YQcyDqWVVzVsBgE2KC/OEuMLckoYp3zOZPh68lZ6986uCC+h2LI34sFjEDZIiMDpo
	HRco/phegOJdjsTt8gPrwKe3UDj/LbqoXL7UFmBYGyzdc9lz4WPLLcHnFuEnF9Q==
X-Gm-Gg: ASbGncupv15MsFl7uPn8hUaoKi5QoZf314v8+2nHD+W5H//SyvWhczlxCndRulOr7/7
	V1Gxigjco+xRfHwNthfdp4FYtfLfpO1KxSNRsfPUDZo2aiHLAq3zhPkGkbo4WwR9IqVeMTZhK/8
	8TVJjOyc44tKnjkrLI7Q6lmKJc+HlZf5FwU/EpHz99wLMI4/CyqAvCTg6qK6Vx2IrPdwFAhTOL+
	4yoqjSESvmwRsk3IXKtETEMD8N3jOOstUseOJuvZXFNI7sB1+NfvS16VBacX6Qov0cEnQwcgKXf
	VhbVN5cw/tsxvm8QjTg8ORJTdfmp1pfc/C7RW8xrZvevZSI=
X-Received: by 2002:a05:600c:a44:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-442d6dc5328mr122857075e9.23.1747127907881;
        Tue, 13 May 2025 02:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSD3cBiAoSeE7mQdYxANptZgCWG/QkVumgW8cBneSabqw55k5N+mANgM6mplP1ZmV2IXy+GQ==
X-Received: by 2002:a05:600c:a44:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-442d6dc5328mr122856725e9.23.1747127907396;
        Tue, 13 May 2025 02:18:27 -0700 (PDT)
Received: from [127.0.0.2] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm12345655e9.18.2025.05.13.02.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:18:26 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Tue, 13 May 2025 11:17:59 +0200
Subject: [PATCH v5 6/7] fs: prepare for extending file_get/setattr()
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
Precedence: list
MIME-Version: 1.0
Message-Id: <20250513-xattrat-syscall-v5-6-22bb9c6c767f@kernel.org>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
 Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4058; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=9XBaUh9nVlDr1zwSfKo8V8Sk8eQqpQogexfwmlm0gVw=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMpT5vPOZks/wtDRVZEmxBIYe5ev8+dRYqU9jmV3pq
 7kMIixTrTpKWRjEuBhkxRRZ1klrTU0qkso/YlAjDzOHlQlkCAMXpwBMpFiC4X9p7J15fxbat9he
 mdT3SbJAs8nY5O8mm3bJBqPW/P+fSrMZGRa/jE7lPNT/+IYD18HcdxonZRZ9fZhVKzp94enez8E
 cOSwA2gRECg==
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Oj-DXHHylmIg45bHF3OlSXQmjIj7U09k6mf3X42IjoA_1747127908
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Amir Goldstein <amir73il@gmail.com>

We intend to add support for more xflags to selective filesystems and
We cannot rely on copy_struct_from_user() to detect this extension.

In preparation of extending the API, do not allow setting xflags unknown
by this kernel version.

Also do not pass the read-only flags and read-only field fsx_nextents to
filesystem.

These changes should not affect existing chattr programs that use the
ioctl to get fsxattr before setting the new values.

Link: https://lore.kernel.org/linux-fsdevel/20250216164029.20673-4-pali@kernel.org/
Cc: Pali Rohár <pali@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/file_attr.c           | 19 +++++++++++++------
 include/linux/fileattr.h | 22 +++++++++++++++++++++-
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index d696f440fa4ffcba8985cc4bfe22a1c0e612ac7c..6cd1e820f7b108c12c06654df843104f460b94cf 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -91,8 +91,10 @@ EXPORT_SYMBOL(vfs_fileattr_get);
 
 void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx)
 {
+	__u32 mask = FS_XFLAGS_MASK;
+
 	memset(fsx, 0, sizeof(struct fsxattr));
-	fsx->fsx_xflags = fa->fsx_xflags;
+	fsx->fsx_xflags = fa->fsx_xflags & mask;
 	fsx->fsx_extsize = fa->fsx_extsize;
 	fsx->fsx_nextents = fa->fsx_nextents;
 	fsx->fsx_projid = fa->fsx_projid;
@@ -119,13 +121,20 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 }
 EXPORT_SYMBOL(copy_fsxattr_to_user);
 
-void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa)
+int fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa)
 {
+	__u32 mask = FS_XFLAGS_MASK;
+
+	if (fsx->fsx_xflags & ~mask)
+		return -EINVAL;
+
 	fileattr_fill_xflags(fa, fsx->fsx_xflags);
+	fa->fsx_xflags &= ~FS_XFLAG_RDONLY_MASK;
 	fa->fsx_extsize = fsx->fsx_extsize;
-	fa->fsx_nextents = fsx->fsx_nextents;
 	fa->fsx_projid = fsx->fsx_projid;
 	fa->fsx_cowextsize = fsx->fsx_cowextsize;
+
+	return 0;
 }
 
 static int copy_fsxattr_from_user(struct fileattr *fa,
@@ -136,9 +145,7 @@ static int copy_fsxattr_from_user(struct fileattr *fa,
 	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
 		return -EFAULT;
 
-	fsxattr_to_fileattr(&xfa, fa);
-
-	return 0;
+	return fsxattr_to_fileattr(&xfa, fa);
 }
 
 /*
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 433efa0f47844ef063373eb390672812682b6388..f62a5143eb2dccd5ceedfe72439cc4cab823cb1d 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -14,6 +14,26 @@
 	 FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
 	 FS_XFLAG_PROJINHERIT)
 
+/* Read-only inode flags */
+#define FS_XFLAG_RDONLY_MASK \
+	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
+
+/* Flags to indicate valid value of fsx_ fields */
+#define FS_XFLAG_VALUES_MASK \
+	(FS_XFLAG_EXTSIZE | FS_XFLAG_COWEXTSIZE)
+
+/* Flags for directories */
+#define FS_XFLAG_DIRONLY_MASK \
+	(FS_XFLAG_RTINHERIT | FS_XFLAG_NOSYMLINKS | FS_XFLAG_EXTSZINHERIT)
+
+/* Misc settable flags */
+#define FS_XFLAG_MISC_MASK \
+	(FS_XFLAG_REALTIME | FS_XFLAG_NODEFRAG | FS_XFLAG_FILESTREAM)
+
+#define FS_XFLAGS_MASK \
+	(FS_XFLAG_COMMON | FS_XFLAG_RDONLY_MASK | FS_XFLAG_VALUES_MASK | \
+	 FS_XFLAG_DIRONLY_MASK | FS_XFLAG_MISC_MASK)
+
 /*
  * Merged interface for miscellaneous file attributes.  'flags' originates from
  * ext* and 'fsx_flags' from xfs.  There's some overlap between the two, which
@@ -35,7 +55,7 @@ struct fileattr {
 
 void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx);
 int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa);
-void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa);
+int fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa);
 
 void fileattr_fill_xflags(struct fileattr *fa, u32 xflags);
 void fileattr_fill_flags(struct fileattr *fa, u32 flags);

-- 
2.47.2



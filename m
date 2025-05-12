Return-Path: <linuxppc-dev+bounces-8509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E11AB386E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:19:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0ZK09kdz2yrm;
	Mon, 12 May 2025 23:19:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747055976;
	cv=none; b=VHASRa0klZWN/UpKKB9CXbFLwMDDv0wKF9WsJq8G66ARPXohenKk4l4b59LNLD2gPpZRtEOrSERJFTwMvhLW+yyb31u5hJZ3E8fYQlb3nI51aEClFvzzC/wwED/ojA7AKTUumCrv9qg3NPY4qG8mt0NH+nlYiYeBz3lf9dXYr84eu/js75EjEnhtFmWdSMnlcPBBEqJKITFcd/Y+XUSDoKW4pg80yZBvHo0wE4BjCSMeVVUSrxBunawLOsquRDNbHWkibbecmmSSiV2acbAu1hvwBPEdr6WkmmAs/EuNQKKERsLuNcKwTe3Cg1o8uMzmQBLvEsTtPIqAvTXmDIY50w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747055976; c=relaxed/relaxed;
	bh=KskbOtx9kmCL1KYjlinzqO2sdtLLS86YLm+BzmhHmDI=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=aOy0efXrZRJCeYsAc9qsnxfCbOwfabayVe2FkK9C5Imwdb8+udpa9jWLg/AJnN/z4wGrPVKIsOiBJzalpAaOZqGlpQ8QiDglIkSpotKwjpzyhjeuu/O7yir5zQSKIHEzsDU56E+1l+FyqFrsF7cCfaAjJmtCIBeMA4+94EriVj+A5LUayG/F4gS2zNuIq0K6ksTDK5QvJ2xxDkZTul9UGcPH/Ke7lJZq140EyImrRRiALieYaU4tMQCwgFRAqOx1E6DhUTBXUk6WDZ4Qr7RoSQVbh1XewxGsumpNyMr2mgiPQpYxjFkYkK+YDuJvgM0DUdSwx+XCnemEjsXZqIYGgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qmdt8inz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IidOZcYW; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qmdt8inz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IidOZcYW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0ZD510Yz2yrL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:19:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747055966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KskbOtx9kmCL1KYjlinzqO2sdtLLS86YLm+BzmhHmDI=;
	b=Qmdt8inzIndfDVeeAvCYmb1p6HFwYi14bFd+07Odxu/L5lSQ1RDvfjG4a4PJWp1+9d5jep
	C8SnTOMNIbAJwYefSJmO5fIyGZ2llo9B5TvoWCQZCIcZkCAOmkrEg4cIookxQ7RVXMw5RZ
	dbpwrjK1iqge+Fm1O3JhdUZ/qDUBu8w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747055968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KskbOtx9kmCL1KYjlinzqO2sdtLLS86YLm+BzmhHmDI=;
	b=IidOZcYWUjX0zm164Pu9VnHxF239VGKmsZ7nUfp7IQQ30di6i3mBFv8++kyKZnBkefwMYC
	6PnL5ZJ42l5CJkKME40kRQKkrPVIEPGRtXG8GD+PEl2u8+hdk2Hg/t3DHZYhR6aoImCsf9
	BDkOzmAeIZTrjSaNJghvxkPrMHoeKa8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-qOanpFSLNuucJdnR3hUk0A-1; Mon, 12 May 2025 09:19:24 -0400
X-MC-Unique: qOanpFSLNuucJdnR3hUk0A-1
X-Mimecast-MFC-AGG-ID: qOanpFSLNuucJdnR3hUk0A_1747055961
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb98b5b0bdso461930066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055960; x=1747660760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KskbOtx9kmCL1KYjlinzqO2sdtLLS86YLm+BzmhHmDI=;
        b=Wh+5g4CYjYuyqzntyUEdLiWa+2+EQrUaTJhfX9bw/mqDLo0lo5heG4olB6VotqbZGd
         YRvygmK7I6zNuYq6yXvB8xPyrffuhns/NY8E2Gu20Jfb6Dg2CA2EVF/j5R16VRYYTeuY
         AXKCzNrBC9x3urf/xUa6obnlmGGsYnuK4lOmu6MsGNskdnAEp8s15BGxMrUmjlRuCIaV
         UlPkg3VEbpsOOqrNngq55Q9oCUejvMkCZL/djRIGrxm2CcGf74Css9lJwz7Izv6Jxy4/
         kWyvUr0cZBvLE7J81lH6/bDf9fOASeiqAi+EsIo86lrQqLFFEbagLjJ4un4CNGzHi6qf
         eLJg==
X-Forwarded-Encrypted: i=1; AJvYcCWXrDgxBnOu2i0b9nKNgymIasw8GrUm2f3bBlp6jCVuo6aQkFTyJtflkmq9kYC4F0BEuQcc+CLuSodVcuo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBpOTCd+th4WwoqJ4U3LECW3fVb2cC9nVoqFQI5iPslGoCFIau
	NiEmGPpW4C9RvtUbCYO8oZPbstomtbT0zUuExT/M1FM/Y6yxwbmGfn8Qb5+SuHMhTj/KxzgcOSb
	NhkUbfe7pjAXbI3c/HUkJnb9unjVTBZ0z7w0W1e1kIquxzgvX16q2KWZy4fDhFn9A85cXsIE8vZ
	Egsfpd+2sPHE+pzSWIm4fhxr2vfWsKoJ8TaTG36+P3dsfKZ+C8
X-Gm-Gg: ASbGncujHO2d/Fz4Xd3vMmOGumvWssV3LOHss1fIOodobVRnB9xrs3T7BIsF8hfhEHY
	XbNrAJr+DeKhMB5t97eQL57kGdGjvQMaaWlSvmW+InNw00HdAgeOAsmu4pFQeBB80fmhLi9J98f
	O6txOsHGQxYjvG1EHIkQyrKiA3rZZ8jVx8Vmax9wIOAZSNPrQgDgskEvUxYTh5nIA97IYhXimPh
	LOPCmXZNpt1Q6ysE1+h9yh40WCvAofZAKADk1CJtLf0pHelCu13N8BQh3awYPVs/SoqMaysrIsB
	SwhteON98vd/WKhTIgfAwqKuPkU=
X-Received: by 2002:a17:906:988c:b0:ad2:1c70:3a8f with SMTP id a640c23a62f3a-ad21c703dadmr796170166b.53.1747055960009;
        Mon, 12 May 2025 06:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqOZcyX5mMzEBWWr5mk5cSzGkf5in4jrOwX2YFPFtHDQQJ6DlCpwuFwlIqKU4oi2/Nt0JmyQ==
X-Received: by 2002:a17:906:988c:b0:ad2:1c70:3a8f with SMTP id a640c23a62f3a-ad21c703dadmr796159666b.53.1747055959151;
        Mon, 12 May 2025 06:19:19 -0700 (PDT)
Received: from [127.0.0.1] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bde09sm612328766b.125.2025.05.12.06.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:19:16 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 May 2025 15:18:54 +0200
Subject: [PATCH v5 1/7] fs: split fileattr related helpers into separate
 file
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
Message-Id: <20250512-xattrat-syscall-v5-1-a88b20e37aae@kernel.org>
References: <20250512-xattrat-syscall-v5-0-a88b20e37aae@kernel.org>
In-Reply-To: <20250512-xattrat-syscall-v5-0-a88b20e37aae@kernel.org>
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
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=20201; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=p7jOeNk7/fWSjM5nR0sexrxO/5MDb/e1y548KGb8xZU=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMhS/+rU9Cv+vniLcvtTo3vawNz68sz7HeTMYTt3Mv
 NrcW8bCJ6GjlIVBjItBVkyRZZ201tSkIqn8IwY18jBzWJlAhjBwcQrARE5pMPwzXMFh6Brxxfbu
 iw+LRN32L2RhcnLXyvsZ55DB8q/gvt4zhv8pm6dUZ5zZJFH6ZsuykwzB66qOR5zl9WNaG72Y8bD
 VqieMAEXzRcI=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iM5BfnkHX_z9jKXpanJcTXAMyMGNm0jQJ0K6h3iaTJU_1747055961
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Andrey Albershteyn <aalbersh@kernel.org>

This patch moves function related to file extended attributes manipulations to
separate file. Just refactoring.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/Makefile              |   3 +-
 fs/file_attr.c           | 318 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/ioctl.c               | 309 ---------------------------------------------
 include/linux/fileattr.h |   4 +
 4 files changed, 324 insertions(+), 310 deletions(-)

diff --git a/fs/Makefile b/fs/Makefile
index 77fd7f7b5d02..2f1daaea86da 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -15,7 +15,8 @@ obj-y :=	open.o read_write.o file_table.o super.o \
 		pnode.o splice.o sync.o utimes.o d_path.o \
 		stack.o fs_struct.o statfs.o fs_pin.o nsfs.o \
 		fs_types.o fs_context.o fs_parser.o fsopen.o init.o \
-		kernel_read_file.o mnt_idmapping.o remap_range.o pidfs.o
+		kernel_read_file.o mnt_idmapping.o remap_range.o pidfs.o \
+		file_attr.o
 
 obj-$(CONFIG_BUFFER_HEAD)	+= buffer.o mpage.o
 obj-$(CONFIG_PROC_FS)		+= proc_namespace.o
diff --git a/fs/file_attr.c b/fs/file_attr.c
new file mode 100644
index 000000000000..2910b7047721
--- /dev/null
+++ b/fs/file_attr.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
+#include <linux/security.h>
+#include <linux/fscrypt.h>
+#include <linux/fileattr.h>
+
+/**
+ * fileattr_fill_xflags - initialize fileattr with xflags
+ * @fa:		fileattr pointer
+ * @xflags:	FS_XFLAG_* flags
+ *
+ * Set ->fsx_xflags, ->fsx_valid and ->flags (translated xflags).  All
+ * other fields are zeroed.
+ */
+void fileattr_fill_xflags(struct fileattr *fa, u32 xflags)
+{
+	memset(fa, 0, sizeof(*fa));
+	fa->fsx_valid = true;
+	fa->fsx_xflags = xflags;
+	if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)
+		fa->flags |= FS_IMMUTABLE_FL;
+	if (fa->fsx_xflags & FS_XFLAG_APPEND)
+		fa->flags |= FS_APPEND_FL;
+	if (fa->fsx_xflags & FS_XFLAG_SYNC)
+		fa->flags |= FS_SYNC_FL;
+	if (fa->fsx_xflags & FS_XFLAG_NOATIME)
+		fa->flags |= FS_NOATIME_FL;
+	if (fa->fsx_xflags & FS_XFLAG_NODUMP)
+		fa->flags |= FS_NODUMP_FL;
+	if (fa->fsx_xflags & FS_XFLAG_DAX)
+		fa->flags |= FS_DAX_FL;
+	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
+		fa->flags |= FS_PROJINHERIT_FL;
+}
+EXPORT_SYMBOL(fileattr_fill_xflags);
+
+/**
+ * fileattr_fill_flags - initialize fileattr with flags
+ * @fa:		fileattr pointer
+ * @flags:	FS_*_FL flags
+ *
+ * Set ->flags, ->flags_valid and ->fsx_xflags (translated flags).
+ * All other fields are zeroed.
+ */
+void fileattr_fill_flags(struct fileattr *fa, u32 flags)
+{
+	memset(fa, 0, sizeof(*fa));
+	fa->flags_valid = true;
+	fa->flags = flags;
+	if (fa->flags & FS_SYNC_FL)
+		fa->fsx_xflags |= FS_XFLAG_SYNC;
+	if (fa->flags & FS_IMMUTABLE_FL)
+		fa->fsx_xflags |= FS_XFLAG_IMMUTABLE;
+	if (fa->flags & FS_APPEND_FL)
+		fa->fsx_xflags |= FS_XFLAG_APPEND;
+	if (fa->flags & FS_NODUMP_FL)
+		fa->fsx_xflags |= FS_XFLAG_NODUMP;
+	if (fa->flags & FS_NOATIME_FL)
+		fa->fsx_xflags |= FS_XFLAG_NOATIME;
+	if (fa->flags & FS_DAX_FL)
+		fa->fsx_xflags |= FS_XFLAG_DAX;
+	if (fa->flags & FS_PROJINHERIT_FL)
+		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
+}
+EXPORT_SYMBOL(fileattr_fill_flags);
+
+/**
+ * vfs_fileattr_get - retrieve miscellaneous file attributes
+ * @dentry:	the object to retrieve from
+ * @fa:		fileattr pointer
+ *
+ * Call i_op->fileattr_get() callback, if exists.
+ *
+ * Return: 0 on success, or a negative error on failure.
+ */
+int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
+{
+	struct inode *inode = d_inode(dentry);
+
+	if (!inode->i_op->fileattr_get)
+		return -ENOIOCTLCMD;
+
+	return inode->i_op->fileattr_get(dentry, fa);
+}
+EXPORT_SYMBOL(vfs_fileattr_get);
+
+/**
+ * copy_fsxattr_to_user - copy fsxattr to userspace.
+ * @fa:		fileattr pointer
+ * @ufa:	fsxattr user pointer
+ *
+ * Return: 0 on success, or -EFAULT on failure.
+ */
+int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
+{
+	struct fsxattr xfa;
+
+	memset(&xfa, 0, sizeof(xfa));
+	xfa.fsx_xflags = fa->fsx_xflags;
+	xfa.fsx_extsize = fa->fsx_extsize;
+	xfa.fsx_nextents = fa->fsx_nextents;
+	xfa.fsx_projid = fa->fsx_projid;
+	xfa.fsx_cowextsize = fa->fsx_cowextsize;
+
+	if (copy_to_user(ufa, &xfa, sizeof(xfa)))
+		return -EFAULT;
+
+	return 0;
+}
+EXPORT_SYMBOL(copy_fsxattr_to_user);
+
+static int copy_fsxattr_from_user(struct fileattr *fa,
+				  struct fsxattr __user *ufa)
+{
+	struct fsxattr xfa;
+
+	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
+		return -EFAULT;
+
+	fileattr_fill_xflags(fa, xfa.fsx_xflags);
+	fa->fsx_extsize = xfa.fsx_extsize;
+	fa->fsx_nextents = xfa.fsx_nextents;
+	fa->fsx_projid = xfa.fsx_projid;
+	fa->fsx_cowextsize = xfa.fsx_cowextsize;
+
+	return 0;
+}
+
+/*
+ * Generic function to check FS_IOC_FSSETXATTR/FS_IOC_SETFLAGS values and reject
+ * any invalid configurations.
+ *
+ * Note: must be called with inode lock held.
+ */
+static int fileattr_set_prepare(struct inode *inode,
+			      const struct fileattr *old_ma,
+			      struct fileattr *fa)
+{
+	int err;
+
+	/*
+	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
+	 * the relevant capability.
+	 */
+	if ((fa->flags ^ old_ma->flags) & (FS_APPEND_FL | FS_IMMUTABLE_FL) &&
+	    !capable(CAP_LINUX_IMMUTABLE))
+		return -EPERM;
+
+	err = fscrypt_prepare_setflags(inode, old_ma->flags, fa->flags);
+	if (err)
+		return err;
+
+	/*
+	 * Project Quota ID state is only allowed to change from within the init
+	 * namespace. Enforce that restriction only if we are trying to change
+	 * the quota ID state. Everything else is allowed in user namespaces.
+	 */
+	if (current_user_ns() != &init_user_ns) {
+		if (old_ma->fsx_projid != fa->fsx_projid)
+			return -EINVAL;
+		if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
+				FS_XFLAG_PROJINHERIT)
+			return -EINVAL;
+	} else {
+		/*
+		 * Caller is allowed to change the project ID. If it is being
+		 * changed, make sure that the new value is valid.
+		 */
+		if (old_ma->fsx_projid != fa->fsx_projid &&
+		    !projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
+			return -EINVAL;
+	}
+
+	/* Check extent size hints. */
+	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
+			!S_ISDIR(inode->i_mode))
+		return -EINVAL;
+
+	if ((fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
+	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
+		return -EINVAL;
+
+	/*
+	 * It is only valid to set the DAX flag on regular files and
+	 * directories on filesystems.
+	 */
+	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
+	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
+		return -EINVAL;
+
+	/* Extent size hints of zero turn off the flags. */
+	if (fa->fsx_extsize == 0)
+		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
+	if (fa->fsx_cowextsize == 0)
+		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
+
+	return 0;
+}
+
+/**
+ * vfs_fileattr_set - change miscellaneous file attributes
+ * @idmap:	idmap of the mount
+ * @dentry:	the object to change
+ * @fa:		fileattr pointer
+ *
+ * After verifying permissions, call i_op->fileattr_set() callback, if
+ * exists.
+ *
+ * Verifying attributes involves retrieving current attributes with
+ * i_op->fileattr_get(), this also allows initializing attributes that have
+ * not been set by the caller to current values.  Inode lock is held
+ * thoughout to prevent racing with another instance.
+ *
+ * Return: 0 on success, or a negative error on failure.
+ */
+int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
+		     struct fileattr *fa)
+{
+	struct inode *inode = d_inode(dentry);
+	struct fileattr old_ma = {};
+	int err;
+
+	if (!inode->i_op->fileattr_set)
+		return -ENOIOCTLCMD;
+
+	if (!inode_owner_or_capable(idmap, inode))
+		return -EPERM;
+
+	inode_lock(inode);
+	err = vfs_fileattr_get(dentry, &old_ma);
+	if (!err) {
+		/* initialize missing bits from old_ma */
+		if (fa->flags_valid) {
+			fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
+			fa->fsx_extsize = old_ma.fsx_extsize;
+			fa->fsx_nextents = old_ma.fsx_nextents;
+			fa->fsx_projid = old_ma.fsx_projid;
+			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+		} else {
+			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
+		}
+		err = fileattr_set_prepare(inode, &old_ma, fa);
+		if (!err)
+			err = inode->i_op->fileattr_set(idmap, dentry, fa);
+	}
+	inode_unlock(inode);
+
+	return err;
+}
+EXPORT_SYMBOL(vfs_fileattr_set);
+
+int ioctl_getflags(struct file *file, unsigned int __user *argp)
+{
+	struct fileattr fa = { .flags_valid = true }; /* hint only */
+	int err;
+
+	err = vfs_fileattr_get(file->f_path.dentry, &fa);
+	if (!err)
+		err = put_user(fa.flags, argp);
+	return err;
+}
+EXPORT_SYMBOL(ioctl_getflags);
+
+int ioctl_setflags(struct file *file, unsigned int __user *argp)
+{
+	struct mnt_idmap *idmap = file_mnt_idmap(file);
+	struct dentry *dentry = file->f_path.dentry;
+	struct fileattr fa;
+	unsigned int flags;
+	int err;
+
+	err = get_user(flags, argp);
+	if (!err) {
+		err = mnt_want_write_file(file);
+		if (!err) {
+			fileattr_fill_flags(&fa, flags);
+			err = vfs_fileattr_set(idmap, dentry, &fa);
+			mnt_drop_write_file(file);
+		}
+	}
+	return err;
+}
+EXPORT_SYMBOL(ioctl_setflags);
+
+int ioctl_fsgetxattr(struct file *file, void __user *argp)
+{
+	struct fileattr fa = { .fsx_valid = true }; /* hint only */
+	int err;
+
+	err = vfs_fileattr_get(file->f_path.dentry, &fa);
+	if (!err)
+		err = copy_fsxattr_to_user(&fa, argp);
+
+	return err;
+}
+EXPORT_SYMBOL(ioctl_fsgetxattr);
+
+int ioctl_fssetxattr(struct file *file, void __user *argp)
+{
+	struct mnt_idmap *idmap = file_mnt_idmap(file);
+	struct dentry *dentry = file->f_path.dentry;
+	struct fileattr fa;
+	int err;
+
+	err = copy_fsxattr_from_user(&fa, argp);
+	if (!err) {
+		err = mnt_want_write_file(file);
+		if (!err) {
+			err = vfs_fileattr_set(idmap, dentry, &fa);
+			mnt_drop_write_file(file);
+		}
+	}
+	return err;
+}
+EXPORT_SYMBOL(ioctl_fssetxattr);
diff --git a/fs/ioctl.c b/fs/ioctl.c
index c91fd2b46a77..5bf1e4215252 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -453,315 +453,6 @@ static int ioctl_file_dedupe_range(struct file *file,
 	return ret;
 }
 
-/**
- * fileattr_fill_xflags - initialize fileattr with xflags
- * @fa:		fileattr pointer
- * @xflags:	FS_XFLAG_* flags
- *
- * Set ->fsx_xflags, ->fsx_valid and ->flags (translated xflags).  All
- * other fields are zeroed.
- */
-void fileattr_fill_xflags(struct fileattr *fa, u32 xflags)
-{
-	memset(fa, 0, sizeof(*fa));
-	fa->fsx_valid = true;
-	fa->fsx_xflags = xflags;
-	if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)
-		fa->flags |= FS_IMMUTABLE_FL;
-	if (fa->fsx_xflags & FS_XFLAG_APPEND)
-		fa->flags |= FS_APPEND_FL;
-	if (fa->fsx_xflags & FS_XFLAG_SYNC)
-		fa->flags |= FS_SYNC_FL;
-	if (fa->fsx_xflags & FS_XFLAG_NOATIME)
-		fa->flags |= FS_NOATIME_FL;
-	if (fa->fsx_xflags & FS_XFLAG_NODUMP)
-		fa->flags |= FS_NODUMP_FL;
-	if (fa->fsx_xflags & FS_XFLAG_DAX)
-		fa->flags |= FS_DAX_FL;
-	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
-		fa->flags |= FS_PROJINHERIT_FL;
-}
-EXPORT_SYMBOL(fileattr_fill_xflags);
-
-/**
- * fileattr_fill_flags - initialize fileattr with flags
- * @fa:		fileattr pointer
- * @flags:	FS_*_FL flags
- *
- * Set ->flags, ->flags_valid and ->fsx_xflags (translated flags).
- * All other fields are zeroed.
- */
-void fileattr_fill_flags(struct fileattr *fa, u32 flags)
-{
-	memset(fa, 0, sizeof(*fa));
-	fa->flags_valid = true;
-	fa->flags = flags;
-	if (fa->flags & FS_SYNC_FL)
-		fa->fsx_xflags |= FS_XFLAG_SYNC;
-	if (fa->flags & FS_IMMUTABLE_FL)
-		fa->fsx_xflags |= FS_XFLAG_IMMUTABLE;
-	if (fa->flags & FS_APPEND_FL)
-		fa->fsx_xflags |= FS_XFLAG_APPEND;
-	if (fa->flags & FS_NODUMP_FL)
-		fa->fsx_xflags |= FS_XFLAG_NODUMP;
-	if (fa->flags & FS_NOATIME_FL)
-		fa->fsx_xflags |= FS_XFLAG_NOATIME;
-	if (fa->flags & FS_DAX_FL)
-		fa->fsx_xflags |= FS_XFLAG_DAX;
-	if (fa->flags & FS_PROJINHERIT_FL)
-		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
-}
-EXPORT_SYMBOL(fileattr_fill_flags);
-
-/**
- * vfs_fileattr_get - retrieve miscellaneous file attributes
- * @dentry:	the object to retrieve from
- * @fa:		fileattr pointer
- *
- * Call i_op->fileattr_get() callback, if exists.
- *
- * Return: 0 on success, or a negative error on failure.
- */
-int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
-{
-	struct inode *inode = d_inode(dentry);
-
-	if (!inode->i_op->fileattr_get)
-		return -ENOIOCTLCMD;
-
-	return inode->i_op->fileattr_get(dentry, fa);
-}
-EXPORT_SYMBOL(vfs_fileattr_get);
-
-/**
- * copy_fsxattr_to_user - copy fsxattr to userspace.
- * @fa:		fileattr pointer
- * @ufa:	fsxattr user pointer
- *
- * Return: 0 on success, or -EFAULT on failure.
- */
-int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
-{
-	struct fsxattr xfa;
-
-	memset(&xfa, 0, sizeof(xfa));
-	xfa.fsx_xflags = fa->fsx_xflags;
-	xfa.fsx_extsize = fa->fsx_extsize;
-	xfa.fsx_nextents = fa->fsx_nextents;
-	xfa.fsx_projid = fa->fsx_projid;
-	xfa.fsx_cowextsize = fa->fsx_cowextsize;
-
-	if (copy_to_user(ufa, &xfa, sizeof(xfa)))
-		return -EFAULT;
-
-	return 0;
-}
-EXPORT_SYMBOL(copy_fsxattr_to_user);
-
-static int copy_fsxattr_from_user(struct fileattr *fa,
-				  struct fsxattr __user *ufa)
-{
-	struct fsxattr xfa;
-
-	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
-		return -EFAULT;
-
-	fileattr_fill_xflags(fa, xfa.fsx_xflags);
-	fa->fsx_extsize = xfa.fsx_extsize;
-	fa->fsx_nextents = xfa.fsx_nextents;
-	fa->fsx_projid = xfa.fsx_projid;
-	fa->fsx_cowextsize = xfa.fsx_cowextsize;
-
-	return 0;
-}
-
-/*
- * Generic function to check FS_IOC_FSSETXATTR/FS_IOC_SETFLAGS values and reject
- * any invalid configurations.
- *
- * Note: must be called with inode lock held.
- */
-static int fileattr_set_prepare(struct inode *inode,
-			      const struct fileattr *old_ma,
-			      struct fileattr *fa)
-{
-	int err;
-
-	/*
-	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
-	 * the relevant capability.
-	 */
-	if ((fa->flags ^ old_ma->flags) & (FS_APPEND_FL | FS_IMMUTABLE_FL) &&
-	    !capable(CAP_LINUX_IMMUTABLE))
-		return -EPERM;
-
-	err = fscrypt_prepare_setflags(inode, old_ma->flags, fa->flags);
-	if (err)
-		return err;
-
-	/*
-	 * Project Quota ID state is only allowed to change from within the init
-	 * namespace. Enforce that restriction only if we are trying to change
-	 * the quota ID state. Everything else is allowed in user namespaces.
-	 */
-	if (current_user_ns() != &init_user_ns) {
-		if (old_ma->fsx_projid != fa->fsx_projid)
-			return -EINVAL;
-		if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
-				FS_XFLAG_PROJINHERIT)
-			return -EINVAL;
-	} else {
-		/*
-		 * Caller is allowed to change the project ID. If it is being
-		 * changed, make sure that the new value is valid.
-		 */
-		if (old_ma->fsx_projid != fa->fsx_projid &&
-		    !projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
-			return -EINVAL;
-	}
-
-	/* Check extent size hints. */
-	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(inode->i_mode))
-		return -EINVAL;
-
-	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
-			!S_ISDIR(inode->i_mode))
-		return -EINVAL;
-
-	if ((fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
-	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
-		return -EINVAL;
-
-	/*
-	 * It is only valid to set the DAX flag on regular files and
-	 * directories on filesystems.
-	 */
-	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
-	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
-		return -EINVAL;
-
-	/* Extent size hints of zero turn off the flags. */
-	if (fa->fsx_extsize == 0)
-		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
-	if (fa->fsx_cowextsize == 0)
-		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
-
-	return 0;
-}
-
-/**
- * vfs_fileattr_set - change miscellaneous file attributes
- * @idmap:	idmap of the mount
- * @dentry:	the object to change
- * @fa:		fileattr pointer
- *
- * After verifying permissions, call i_op->fileattr_set() callback, if
- * exists.
- *
- * Verifying attributes involves retrieving current attributes with
- * i_op->fileattr_get(), this also allows initializing attributes that have
- * not been set by the caller to current values.  Inode lock is held
- * thoughout to prevent racing with another instance.
- *
- * Return: 0 on success, or a negative error on failure.
- */
-int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
-		     struct fileattr *fa)
-{
-	struct inode *inode = d_inode(dentry);
-	struct fileattr old_ma = {};
-	int err;
-
-	if (!inode->i_op->fileattr_set)
-		return -ENOIOCTLCMD;
-
-	if (!inode_owner_or_capable(idmap, inode))
-		return -EPERM;
-
-	inode_lock(inode);
-	err = vfs_fileattr_get(dentry, &old_ma);
-	if (!err) {
-		/* initialize missing bits from old_ma */
-		if (fa->flags_valid) {
-			fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
-			fa->fsx_extsize = old_ma.fsx_extsize;
-			fa->fsx_nextents = old_ma.fsx_nextents;
-			fa->fsx_projid = old_ma.fsx_projid;
-			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-		} else {
-			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
-		}
-		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (!err)
-			err = inode->i_op->fileattr_set(idmap, dentry, fa);
-	}
-	inode_unlock(inode);
-
-	return err;
-}
-EXPORT_SYMBOL(vfs_fileattr_set);
-
-static int ioctl_getflags(struct file *file, unsigned int __user *argp)
-{
-	struct fileattr fa = { .flags_valid = true }; /* hint only */
-	int err;
-
-	err = vfs_fileattr_get(file->f_path.dentry, &fa);
-	if (!err)
-		err = put_user(fa.flags, argp);
-	return err;
-}
-
-static int ioctl_setflags(struct file *file, unsigned int __user *argp)
-{
-	struct mnt_idmap *idmap = file_mnt_idmap(file);
-	struct dentry *dentry = file->f_path.dentry;
-	struct fileattr fa;
-	unsigned int flags;
-	int err;
-
-	err = get_user(flags, argp);
-	if (!err) {
-		err = mnt_want_write_file(file);
-		if (!err) {
-			fileattr_fill_flags(&fa, flags);
-			err = vfs_fileattr_set(idmap, dentry, &fa);
-			mnt_drop_write_file(file);
-		}
-	}
-	return err;
-}
-
-static int ioctl_fsgetxattr(struct file *file, void __user *argp)
-{
-	struct fileattr fa = { .fsx_valid = true }; /* hint only */
-	int err;
-
-	err = vfs_fileattr_get(file->f_path.dentry, &fa);
-	if (!err)
-		err = copy_fsxattr_to_user(&fa, argp);
-
-	return err;
-}
-
-static int ioctl_fssetxattr(struct file *file, void __user *argp)
-{
-	struct mnt_idmap *idmap = file_mnt_idmap(file);
-	struct dentry *dentry = file->f_path.dentry;
-	struct fileattr fa;
-	int err;
-
-	err = copy_fsxattr_from_user(&fa, argp);
-	if (!err) {
-		err = mnt_want_write_file(file);
-		if (!err) {
-			err = vfs_fileattr_set(idmap, dentry, &fa);
-			mnt_drop_write_file(file);
-		}
-	}
-	return err;
-}
-
 static int ioctl_getfsuuid(struct file *file, void __user *argp)
 {
 	struct super_block *sb = file_inode(file)->i_sb;
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 47c05a9851d0..6030d0bf7ad3 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -55,5 +55,9 @@ static inline bool fileattr_has_fsx(const struct fileattr *fa)
 int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa);
 int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct fileattr *fa);
+int ioctl_getflags(struct file *file, unsigned int __user *argp);
+int ioctl_setflags(struct file *file, unsigned int __user *argp);
+int ioctl_fsgetxattr(struct file *file, void __user *argp);
+int ioctl_fssetxattr(struct file *file, void __user *argp);
 
 #endif /* _LINUX_FILEATTR_H */

-- 
2.47.2



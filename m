Return-Path: <linuxppc-dev+bounces-8529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98770AB4F18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 11:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxW9c42H5z2ygm;
	Tue, 13 May 2025 19:18:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747127908;
	cv=none; b=nw/CdanVUiHFaL2NoZv5DE5Yyy2JbLrnmGTVqAG21NuFEnwtXLerBKf0KepQVYj3eVfISMNSLOMJ0rc62X8xxmeCy8qpnffIDL8jw8WAhuHDT+WXQRikC2Li4dN1Y7dhmMR9+0Ir+ioTtYShuua+f8bUV0pVyEWKnRNjalcnW6XOCuzDrobdquTld8LibRjRaD+74Gz0rt1WBc9/e2Tqvm5WP7NeMJh11WgLLe3WI4xDgcrv5K9KKF9SmJc6EBHL4ClSatj5Ri13BjP7hCV5Bz6XH+PsS2IEh1sDfZfQnv7Ny3CoXerhfprKFZB1CM3wgESMC8uLzWOrYQLCfWhNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747127908; c=relaxed/relaxed;
	bh=ls6EYzWLpzSyrbfDPukFujnVQKFcbGgB9h/N+wiqpNc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=eYLa1WHIE52oVPfgRWTj/wMfUOQQQmfq6CBMD5IGi4L3+PCN+xdvXpnX6jsC/rWuEofca1MbrrgyMIU7XUGokc7nnONPh19kcYC3W+cBn9Qzp4t6nJN6uECcvP/j0d8NmV6uYn1qXxGQw1ASCraltMSUai6jsIJ3Ls1Yb5l9rc48q+1Gf4s0hXYNxK0a9XCGHm4uL2HDqXblV1WYx9EQMdUVpsIqZIMsbo9CabUs9r4RhW5YSgerGEOvNQCD4pftTl3WERm+JlarArmmW16xvTGyo24SiMw9vI+Hb1wB8gxz1adoGkkctK1P45Y9zkKq7SU7DjHU8LsofJSrK/sBsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NwRn6GRH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NwRn6GRH; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NwRn6GRH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NwRn6GRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxW9b5xDSz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 19:18:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ls6EYzWLpzSyrbfDPukFujnVQKFcbGgB9h/N+wiqpNc=;
	b=NwRn6GRHautpzCamQJj5HCppOOMKHak9CpnTP8wm2MoOirnL7p3+z3uVZWHPTF4+ntwC4V
	ENJ5ml3Mwx34gelmCe3U6e4hamdvdV1gWHCzr43UndNKIR4XmxsFqoatCS9xymu1QAcfjf
	s8GwfKfBoDNgrcWF+QgTw4Ax/AKIG38=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ls6EYzWLpzSyrbfDPukFujnVQKFcbGgB9h/N+wiqpNc=;
	b=NwRn6GRHautpzCamQJj5HCppOOMKHak9CpnTP8wm2MoOirnL7p3+z3uVZWHPTF4+ntwC4V
	ENJ5ml3Mwx34gelmCe3U6e4hamdvdV1gWHCzr43UndNKIR4XmxsFqoatCS9xymu1QAcfjf
	s8GwfKfBoDNgrcWF+QgTw4Ax/AKIG38=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-PesGdxKLNI6KEj5kt7CfZA-1; Tue, 13 May 2025 05:18:23 -0400
X-MC-Unique: PesGdxKLNI6KEj5kt7CfZA-1
X-Mimecast-MFC-AGG-ID: PesGdxKLNI6KEj5kt7CfZA_1747127902
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso31673325e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 02:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127902; x=1747732702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ls6EYzWLpzSyrbfDPukFujnVQKFcbGgB9h/N+wiqpNc=;
        b=GqH6/OClAlkaY6j/ifUn0ybWPW271Zwq5kQymjKplqpfK39JVATTLJgQMkmtX945U8
         nwWHKBH/LJR2v3Epig0vyKf/fkyq6sFH4aTrBBiSawb8wsgpA5EBtX/z5d/8hLml+Xro
         l4qd64GuaFYNNkXyXcT5c159KiO4R8QmWbjfKQA3pshuJqKKqgFn9XzbglsA930sfzqq
         qzOvRQOkxYkhpyYcFWaWSDX7ccFK6SEzxlI2CJzvRRVfj9fRrwjvvz8yf5tFlf/bKpsb
         eWNNSDCFvGU5CK9Y0zuH8hJlRG5lZUs+Jbc0IHo85CbTREgwqU3PHNZeoi5TuMDhpT/M
         r47A==
X-Forwarded-Encrypted: i=1; AJvYcCX0/3PVVI11YkHHMO/CVKXMP/nu/Eq1u11WBK6DUYNV+sg/AublxDvPdW0sldcJByAeN97nuuD+bMq+GvY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzHuYnVSthiLPRFjrgy0aOMEDQfQCXACLiyO5kAn/tH8eANUNh
	erYOom0iyjpsfcU77jcwFC25TqAfnA7MPxK42p9AaPiZG5AGDoIKXn5vRGqSilJUhGFkzyGsjJ7
	zKTtYXlyfRl19RxugBS5Y4vvylNyTRmwr8llnlv7C11xf+Imk2DRKfpzJiOcHuw==
X-Gm-Gg: ASbGncvusHS7qMQZWYGozBzpeK+kmOitZddYFpAevKbO3xuy09j4ASJ5mZ2fWhdHTMb
	iaYdxPaU1mSsH6UIW1sAMOPYEdi2DWtwyfWh3YatsWZ7uPcaWk/Qhwa08g04yC5AvdmgSZYYGlz
	8h8zpRlZbuEPNSayR1KpCTVslpBFNqvjIXrU2gjSNs6X9iciCOfR6qzwgbwlYerZWsJFmk7FdHt
	vcI/aMSjjJEqAmmkXudl4vKfVfryE0QR5etBN0jamyNcm1D2504qi/3JXhDinCpT6MpUjIqIYX8
	+IRgk0DrpQJoCIqGYvPYRofxHReugYXrzvUnx+Q6e2PsQzY=
X-Received: by 2002:a05:600c:37c7:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-442d6d379b2mr155020135e9.14.1747127901732;
        Tue, 13 May 2025 02:18:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEEtHWgn5s898vXVMD6AEOwzulPPtHZtUMHxI74NvDZ3sPtiUYejsU22j+vwltmbRtQ8fYMg==
X-Received: by 2002:a05:600c:37c7:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-442d6d379b2mr155019705e9.14.1747127901297;
        Tue, 13 May 2025 02:18:21 -0700 (PDT)
Received: from [127.0.0.2] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm12345655e9.18.2025.05.13.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:18:20 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Tue, 13 May 2025 11:17:57 +0200
Subject: [PATCH v5 4/7] fs: split fileattr/fsxattr converters into helpers
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
Message-Id: <20250513-xattrat-syscall-v5-4-22bb9c6c767f@kernel.org>
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
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=7/qlLocSDGOnq9HanUewnfKPkCH1bdYdAp9tNZm+5GE=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMpT5vBmqeS9Of1kvckyD89yLKSHZd6cITHwR8ON6Q
 Krbn8kRqyw6SlkYxLgYZMUUWdZJa01NKpLKP2JQIw8zh5UJbAgXpwBMZHojI8Npu1fs2yWveYpu
 X75O9+PGOXL/F3U+vN7XHFJf5fdw0aozDH/lf/x993b3NibzczpnPr7ddd+5/McRwUl+3zqveq7
 g+LeWDwBTZEzV
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VZo-tYtQmGg4HkvUK_puMggTevPopFueodyiUDgNlPM_1747127902
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This will be helpful for file_get/setattr syscalls to convert
between fileattr and fsxattr.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/file_attr.c           | 32 +++++++++++++++++++++-----------
 include/linux/fileattr.h |  2 ++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index be62d97cc444a445deac1c8ac8331f4a3766126a..d9eab553dc250f84075ac74c1c7d8d6fd6588374 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -89,6 +89,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 }
 EXPORT_SYMBOL(vfs_fileattr_get);
 
+void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx)
+{
+	memset(fsx, 0, sizeof(struct fsxattr));
+	fsx->fsx_xflags = fa->fsx_xflags;
+	fsx->fsx_extsize = fa->fsx_extsize;
+	fsx->fsx_nextents = fa->fsx_nextents;
+	fsx->fsx_projid = fa->fsx_projid;
+	fsx->fsx_cowextsize = fa->fsx_cowextsize;
+}
+
 /**
  * copy_fsxattr_to_user - copy fsxattr to userspace.
  * @fa:		fileattr pointer
@@ -100,12 +110,7 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 {
 	struct fsxattr xfa;
 
-	memset(&xfa, 0, sizeof(xfa));
-	xfa.fsx_xflags = fa->fsx_xflags;
-	xfa.fsx_extsize = fa->fsx_extsize;
-	xfa.fsx_nextents = fa->fsx_nextents;
-	xfa.fsx_projid = fa->fsx_projid;
-	xfa.fsx_cowextsize = fa->fsx_cowextsize;
+	fileattr_to_fsxattr(fa, &xfa);
 
 	if (copy_to_user(ufa, &xfa, sizeof(xfa)))
 		return -EFAULT;
@@ -114,6 +119,15 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 }
 EXPORT_SYMBOL(copy_fsxattr_to_user);
 
+void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa)
+{
+	fileattr_fill_xflags(fa, fsx->fsx_xflags);
+	fa->fsx_extsize = fsx->fsx_extsize;
+	fa->fsx_nextents = fsx->fsx_nextents;
+	fa->fsx_projid = fsx->fsx_projid;
+	fa->fsx_cowextsize = fsx->fsx_cowextsize;
+}
+
 static int copy_fsxattr_from_user(struct fileattr *fa,
 				  struct fsxattr __user *ufa)
 {
@@ -122,11 +136,7 @@ static int copy_fsxattr_from_user(struct fileattr *fa,
 	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
 		return -EFAULT;
 
-	fileattr_fill_xflags(fa, xfa.fsx_xflags);
-	fa->fsx_extsize = xfa.fsx_extsize;
-	fa->fsx_nextents = xfa.fsx_nextents;
-	fa->fsx_projid = xfa.fsx_projid;
-	fa->fsx_cowextsize = xfa.fsx_cowextsize;
+	fsxattr_to_fileattr(&xfa, fa);
 
 	return 0;
 }
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 6030d0bf7ad32693a0f48a6f28475d97e768bb3e..433efa0f47844ef063373eb390672812682b6388 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -33,7 +33,9 @@ struct fileattr {
 	bool	fsx_valid:1;
 };
 
+void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx);
 int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa);
+void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa);
 
 void fileattr_fill_xflags(struct fileattr *fa, u32 xflags);
 void fileattr_fill_flags(struct fileattr *fa, u32 flags);

-- 
2.47.2



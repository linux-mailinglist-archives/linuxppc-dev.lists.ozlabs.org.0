Return-Path: <linuxppc-dev+bounces-7283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA15A6C397
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 20:49:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKCh661d8z30Vn;
	Sat, 22 Mar 2025 06:49:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742586566;
	cv=none; b=TGK5E/lVWN4SUn3lUQI/MEzwnnZnKcVMwuVX9BRpc6kyMkjm+QXiL4Jh2koyGFhPhF0zBZ3NhBJ2eTvAryxb9NO/SQc+RuhNIa97RDGVSjbQcFKYi4Rp4dqpK50MY3xaEko8RJpjydI6O4QlbTwLpsqT39huhJt02dT9mau7WwP3sMG4GEX9ZLaMNqf/q0VGBR4Ztziu/eh86IZlw/m3fPMLK0ooEimCxcuO4nyL6GZzjrsCHsvAxn707YYyZmINAS+dnAyc593uaortoFPvW6eEwDNE9ym2PsstV7MS8K6N0DcbTe4igyBMUFPIqK7/qQQEEJFcuiA9t3JK2/nigg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742586566; c=relaxed/relaxed;
	bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=XFJKPkJC8BiFDUAwapX3nyiGecjefOB22IGi3/BPZQpmgZpR8ab5+ZwqDBiNs0bmM/R7tJXIxyxi0/zZLjjkBi6GIJkg5fVOFLuBDiWzqjp63OH3sh09JXzhCDjA3KJNiiQihj0DCIdEl6mYj6/kYQ5LWroZbYyZKTT7nOn4Jdu3IJA/DF2isYRye50ptwBgYjKP0drzz9fiTfJY+sQOh5H7CZNBFNQPHMdXjHklw+b3MChVnbJhADdv0F7jXtKdcAd2qfPvT4Eh6cTeoNIvEOQ8zmwB+itDrJsa+WQIrGJrOieqY+uTmGXjHQJQ6DWhYQHYySpjh3p8AXIQ1XD79Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AoVSmLWx; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AoVSmLWx; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AoVSmLWx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AoVSmLWx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKCh56QX3z30VV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 06:49:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742586562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
	b=AoVSmLWx5YwJPEtLVi1Z6cNl8Jc31u1ef/LKGwe8yfwooSvSDGvrrvPoQ6wu3w1+HZU0Qy
	y+YXTLPqu/ezYvYpytSKqXsT8DuC6fguSzCSQdjLb84vXphbZpLuZYQR+/3sojd2lQ1wKz
	mMHgRmzcqVdO5xykTVNvjbQFrN0Ey54=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742586562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
	b=AoVSmLWx5YwJPEtLVi1Z6cNl8Jc31u1ef/LKGwe8yfwooSvSDGvrrvPoQ6wu3w1+HZU0Qy
	y+YXTLPqu/ezYvYpytSKqXsT8DuC6fguSzCSQdjLb84vXphbZpLuZYQR+/3sojd2lQ1wKz
	mMHgRmzcqVdO5xykTVNvjbQFrN0Ey54=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-3cb7gA2HMc-zJs_fMvtcwQ-1; Fri, 21 Mar 2025 15:49:17 -0400
X-MC-Unique: 3cb7gA2HMc-zJs_fMvtcwQ-1
X-Mimecast-MFC-AGG-ID: 3cb7gA2HMc-zJs_fMvtcwQ_1742586556
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3d3cd9accso227531366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742586556; x=1743191356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
        b=Rr4oGL8Il+tFuqmjVR8tAVZEwWVlODe/99q0HQOuIef4CKjS8MTMwwhic0/XQziHWa
         Ir5zOq1z/84keLgrbrpp4y3ns/Dbw1C9L6OeUYk4ABtmbJFFJDCDp8ziYT/5WQ8URVsY
         bhWRzZX2HR7NSPMV1tlhDGrO1uSNcFXdY+SMjsnn69cZq/WDBd8yEH/UNGDoyFEngibp
         lQSil/bvmmMN0iOXhukbQjlQOzlhSKF82sZ+xkcI9t5MrvaNffI5mN9+ZSBp7NZRDZsr
         ZCBACi71aAtaf4C3BnSfQ/l83AKqOE0b5Y2j9gMfYWqlIJOUhm0Q6+dpzhgDXtwBJ93v
         hcMA==
X-Forwarded-Encrypted: i=1; AJvYcCXMYAWYtg/K/b3gqKwG1RL7Mg+uum77gqEcP1ktNxBllgLXsbEnOX6aOF8f192GCQdwfdb6KI7xf2aChdE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzk1ESV58JuOunIDDY+c1GJp3wnYwG2nTkqtapmFO3S5Mm2OvOy
	Fwmj9JTZqKRftsdq9ykOgaqKXRDc6wjegqJblEFzHM+otrInfXDUWq3V0m5wlSNoz6BpD1fAA96
	WdC7MFwNrPN8nPxgGvxDp6+83TqJQfQlykcOyKMV6HJpB8vlgYTBwrHc1OnU9CA==
X-Gm-Gg: ASbGncvM6lc4IDEmOsVZ7YB+PuKdvglKSNbuezICL3KDJ8RIgt6d7fvd97CM4q86VgY
	Qd855lfS1QvhaExAjfv55O/8Ksw1xB6OT/J79k6hEjsDQahAU/wmxa4gM4JvaVn6KfFZXJkEaOM
	41mvjHoxxiFSE53hTrjNvwzRGk/dzdXbrYt6/92cuR1NFjVJkxughFhORclF6SmAWr25VYQpOyg
	Mc26NklVMOzSreXrSlBHKf8vM4X16Y9P7Rim2XNLxx0lRUwTA/eh4TyyETZnoEPcH60stYPMaDE
	jtuNL0eRO5bLB3G4X+MPTZV4he59c/EC9EUVfUSFGg==
X-Received: by 2002:a17:907:9482:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac3f2537a13mr417243166b.55.1742586555782;
        Fri, 21 Mar 2025 12:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE364/oBuyn+cE4ig5ONss+vPjSo5TWTy9RSOBlsLCFEbZLg0sVEvc8UiI6SNuN3e2vwFGwrA==
X-Received: by 2002:a17:907:9482:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac3f2537a13mr417237066b.55.1742586555219;
        Fri, 21 Mar 2025 12:49:15 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm204412266b.39.2025.03.21.12.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 12:49:13 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Fri, 21 Mar 2025 20:48:41 +0100
Subject: [PATCH v4 2/3] fs: split fileattr/fsxattr converters into helpers
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
Message-Id: <20250321-xattrat-syscall-v4-2-3e82e6fb3264@kernel.org>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
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
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=U65D6SohAEKFKir81pK5H51AE5x6/jUW8l5jaJk9nGM=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIY0u8e2nhsqffE2qNHBdc56kpaBv10/G5zKMBMNU5Y1
 7+08cOt3t6OUhYGMS4GWTFFlnXSWlOTiqTyjxjUyMPMYWUCGcLAxSkAF7Fl+MO39MOayUtjz0Xc
 Zf+S85RBZMPrQyk/IssaWQR3V917GlLI8D93Rvvtmb0TdxnrLdm5326CcYQxW4JKaaBU3XVFNfO
 V51kB1DlIeQ==
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l2E6WnfIAYhmPMyvTTeN_4tOJqNg2N7gUtpupXMMt3c_1742586556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This will be helpful for get/setfsxattrat syscalls to convert
between fileattr and fsxattr.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/ioctl.c               | 32 +++++++++++++++++++++-----------
 include/linux/fileattr.h |  2 ++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 4434c97bc5dff5a3e8635e28745cd99404ff353e..840283d8c406623d8d26790f89b62ebcbd39e2de 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -538,6 +538,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
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
@@ -549,12 +559,7 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
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
@@ -563,6 +568,15 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
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
@@ -571,11 +585,7 @@ static int copy_fsxattr_from_user(struct fileattr *fa,
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
index 47c05a9851d0600964b644c9c7218faacfd865f8..31888fa2edf10050be134f587299256088344365 100644
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



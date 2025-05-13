Return-Path: <linuxppc-dev+bounces-8530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5348AB4F1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 11:18:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxW9g2yRZz2ypV;
	Tue, 13 May 2025 19:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747127911;
	cv=none; b=fLj7o+hnQdHtbFOqlIik5JIkNHgDMqkm3XQp811kCG0ySiW5Px8kK0UKJmSy+Lz+8hT0LyjKVt4oVIDRvWgLu/YH6hcv7A8aie9ppVSEvbPNktrEUGEaS88L08B6gCJCX2+lnD6T6jiCzDMeuI4GWHCy3mqhMyy+l/9PhV0X5kZtbzNT88BfbydPJeA7rrjz+QEenWuaJ+tKk+OuvwrItE0tvQLjQLcmEZ8X/VwyXn0byxjpYSSShsnn7aANgkvaBvp0JBYAhuzvUz4S4EXs5mFR0Zx50PreetOduKapDIXv1w6jp0LBADZjWiq/BJ58bF/f4XNjQGz3/EIDXVaVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747127911; c=relaxed/relaxed;
	bh=NOc7n03QtvhEu44iPpxkG92PTjRYJg6Nm8X16D2kY0E=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Bk8J99lRbJV1cyNnuT72UHPFovzls/bavLKFSQGSZS5ObHB1Gk+oyJi/c4nygZwH9irYnIzhNT/d2bW3cV/KbmCEMUK0/jiDwYUB4etDL1FqrvJwKR6hRaS0MAGqc5qfu3mTNfp8LS6sJKJMFp7+3STut4baHwEbXX/nxB2asTCnCz2cKl0zrzQhBvkPvfyXN9JyaflwQndv2sVOixg5Qd8jehoBzCQGvAgIM+Pjx3KZisYelgVhuPG9wxItpvCwULpejk33pTf9PjLEy72TdbVSgbOsKQv1mIFsFJ4ksijv1K1nxiEFtO2Cr1/xwfbExwX/zCHXUXQaRomrJcuoSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWUtKsiy; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWUtKsiy; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWUtKsiy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWUtKsiy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxW9f4MCSz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 19:18:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOc7n03QtvhEu44iPpxkG92PTjRYJg6Nm8X16D2kY0E=;
	b=JWUtKsiyOCSkp9b7jELLmcblSS9joc79PNpGDMYcXiJspk8K6DlRHwzemymbyyhUouMEBl
	PR9iTTj4h3XwyWSxkzc/67IXu1/IyPv0K3+cUypYnES0BlmtGmwO3nkdQzDcSvlNj2JmDb
	wbVXSLymH5ZdBYX3TLU9OMmqCj4kT+Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOc7n03QtvhEu44iPpxkG92PTjRYJg6Nm8X16D2kY0E=;
	b=JWUtKsiyOCSkp9b7jELLmcblSS9joc79PNpGDMYcXiJspk8K6DlRHwzemymbyyhUouMEBl
	PR9iTTj4h3XwyWSxkzc/67IXu1/IyPv0K3+cUypYnES0BlmtGmwO3nkdQzDcSvlNj2JmDb
	wbVXSLymH5ZdBYX3TLU9OMmqCj4kT+Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-lp9MZ3z8MpiyKwM_ckRruw-1; Tue, 13 May 2025 05:18:26 -0400
X-MC-Unique: lp9MZ3z8MpiyKwM_ckRruw-1
X-Mimecast-MFC-AGG-ID: lp9MZ3z8MpiyKwM_ckRruw_1747127905
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442ccf0eb4eso39888465e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 02:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127905; x=1747732705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOc7n03QtvhEu44iPpxkG92PTjRYJg6Nm8X16D2kY0E=;
        b=nJCg7Wd6UxAd5YbRecDAQRafZqMkUSPW+VXD8dcmRYhTcTrJPA2R4dLEco2YQzr7Hh
         /iaFFS6xhOXqQV2z+FVo5YIPfCzVcNGH6aIOg+RrttnQ7M3xM/MfyIyUspYmrU9Jdk6q
         8lUEja/pHjE1UbPnjpTLUEuZ5dzpodqEbRoJceFxbI1r7ZFm7egWrjcLloeHMcU6u2zC
         UAODzJFRXhsZ73I9kBgsY1TdkU/+/E+zgvS8DtX+zUibG3KPJkHYKjMw3+Sj23FG0gcr
         G+L0YPEJwLr1C3oZL4JnbOzaF+2pkKy7wX+b3t30AISZYSC2FzMkIUwVUtwk890/8cJu
         W43A==
X-Forwarded-Encrypted: i=1; AJvYcCWlRuuaJB6KCww8elrl7NKp8D4CV95ep3yjmFVxFsRooeD1cll1peimqUcZDrlw9ZI+msU2ytv8mBtzW1g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysZyslht+OBSR8zyqxUM4JyofGlwuErCewFd7fuwwWfPkvraOO
	mLyObfyISW6IMHcMWpk/H1ay+eTVvnSmovlwNWVJePng4DeFhbIGn6BIUlHhnzZE45KV6TdoOD1
	ecQF+HlCESqF42JEyikBq12wh1vNrzaev/Hvog6X/yZZRi7s2WAnHo8oaLSuZbA==
X-Gm-Gg: ASbGncs6htVyIwvE/1HvFqcIvTIft3Rq9F1aVFOcqt/9Rg0TIbPy2jzgedT4uUZtrmC
	V1wnWbfBRQZjLKto8OFd3tb8odTEyuewcVTn7Q2HYOfYYPsaB08Zm/3j5cAkoeIEG6emNJ1CvJk
	cnA81DbH0/DUJVafprC4ZosMJEiO3mQdzgjoTOJVKEwIwZlfsOqugeV3ZCYI4/QUlcosGS6iMNP
	XfaF+hpXcbR3wrJ2hOvCclqWUOeOlEVWJ5AMWB3H24IUASbrFRyJcjxL4ti0oHlXmAsrHCgI5qY
	RTJWaSHu5eyyagtTx3vhsJaBqewfFvCUuSVmLEueVlkpugY=
X-Received: by 2002:a05:600c:4454:b0:440:6a5f:c308 with SMTP id 5b1f17b1804b1-442d6d44bd0mr165938675e9.13.1747127904728;
        Tue, 13 May 2025 02:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqiuvTxW0gPiYb5Yeg/YAPZpfvdIILgd83canCiQJJ8hwGNTheApWOvMPsjwENNn935UE4Tg==
X-Received: by 2002:a05:600c:4454:b0:440:6a5f:c308 with SMTP id 5b1f17b1804b1-442d6d44bd0mr165938225e9.13.1747127904260;
        Tue, 13 May 2025 02:18:24 -0700 (PDT)
Received: from [127.0.0.2] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm12345655e9.18.2025.05.13.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:18:23 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Tue, 13 May 2025 11:17:58 +0200
Subject: [PATCH v5 5/7] fs: make vfs_fileattr_[get|set] return -EOPNOSUPP
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
Message-Id: <20250513-xattrat-syscall-v5-5-22bb9c6c767f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=6GRgC9l31t4YtW1WpN15HEtI//c4dan1yl5qtYWAaXk=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMpT5vHeeSvx1XJ17VoznhbT1nNa68Vxah3ftytP4y
 xmmWH2hyqOjlIVBjItBVkyRZZ201tSkIqn8IwY18jBzWJlAhjBwcQrARCziGBkWnup90+qj/jDX
 J/7rpgO7jA7djNJlqpoYIWnU9Pi2iqsMwz9DVwXDCxlLHq56tKRp98R9l+e5LHztcHHptMMCT7x
 vsnLxAQC/ekWI
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SLNoJDWU1eh4MY7NVrRB1WtmwbXVQUo4sBKjQPM0eqc_1747127905
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Future patches will add new syscalls which use these functions. As
this interface won't be used for ioctls only the EOPNOSUPP is more
appropriate return code.

This patch coverts return code from ENOIOCTLCMD to EOPNOSUPP for
vfs_fileattr_get and vfs_fileattr_set. To save old behavior
translate EOPNOSUPP back for current users - overlayfs, encryptfs
and fs/ioctl.c.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/ecryptfs/inode.c  |  8 +++++++-
 fs/file_attr.c       | 12 ++++++++++--
 fs/overlayfs/inode.c |  2 +-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 51a5c54eb74026d8b2deec6e0608f3d2b3e9c092..6bf08ff4d7f71c5223b90f4cde57e380b68260fd 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -1124,7 +1124,13 @@ static int ecryptfs_removexattr(struct dentry *dentry, struct inode *inode,
 
 static int ecryptfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 {
-	return vfs_fileattr_get(ecryptfs_dentry_to_lower(dentry), fa);
+	int rc;
+
+	rc = vfs_fileattr_get(ecryptfs_dentry_to_lower(dentry), fa);
+	if (rc == -EOPNOTSUPP)
+		rc = -ENOIOCTLCMD;
+
+	return rc;
 }
 
 static int ecryptfs_fileattr_set(struct mnt_idmap *idmap,
diff --git a/fs/file_attr.c b/fs/file_attr.c
index d9eab553dc250f84075ac74c1c7d8d6fd6588374..d696f440fa4ffcba8985cc4bfe22a1c0e612ac7c 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -79,7 +79,7 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 	int error;
 
 	if (!inode->i_op->fileattr_get)
-		return -ENOIOCTLCMD;
+		return -EOPNOTSUPP;
 
 	error = security_inode_file_getattr(dentry, fa);
 	if (error)
@@ -239,7 +239,7 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 	int err;
 
 	if (!inode->i_op->fileattr_set)
-		return -ENOIOCTLCMD;
+		return -EOPNOTSUPP;
 
 	if (!inode_owner_or_capable(idmap, inode))
 		return -EPERM;
@@ -281,6 +281,8 @@ int ioctl_getflags(struct file *file, unsigned int __user *argp)
 	int err;
 
 	err = vfs_fileattr_get(file->f_path.dentry, &fa);
+	if (err == -EOPNOTSUPP)
+		err = -ENOIOCTLCMD;
 	if (!err)
 		err = put_user(fa.flags, argp);
 	return err;
@@ -302,6 +304,8 @@ int ioctl_setflags(struct file *file, unsigned int __user *argp)
 			fileattr_fill_flags(&fa, flags);
 			err = vfs_fileattr_set(idmap, dentry, &fa);
 			mnt_drop_write_file(file);
+			if (err == -EOPNOTSUPP)
+				err = -ENOIOCTLCMD;
 		}
 	}
 	return err;
@@ -314,6 +318,8 @@ int ioctl_fsgetxattr(struct file *file, void __user *argp)
 	int err;
 
 	err = vfs_fileattr_get(file->f_path.dentry, &fa);
+	if (err == -EOPNOTSUPP)
+		err = -ENOIOCTLCMD;
 	if (!err)
 		err = copy_fsxattr_to_user(&fa, argp);
 
@@ -334,6 +340,8 @@ int ioctl_fssetxattr(struct file *file, void __user *argp)
 		if (!err) {
 			err = vfs_fileattr_set(idmap, dentry, &fa);
 			mnt_drop_write_file(file);
+			if (err == -EOPNOTSUPP)
+				err = -ENOIOCTLCMD;
 		}
 	}
 	return err;
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index 6f0e15f86c21fc576fe1679e977597bd9f817e36..096d44712bb1130fd3e9673a61747b0fbf877d25 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -721,7 +721,7 @@ int ovl_real_fileattr_get(const struct path *realpath, struct fileattr *fa)
 		return err;
 
 	err = vfs_fileattr_get(realpath->dentry, fa);
-	if (err == -ENOIOCTLCMD)
+	if (err == -EOPNOTSUPP)
 		err = -ENOTTY;
 	return err;
 }

-- 
2.47.2



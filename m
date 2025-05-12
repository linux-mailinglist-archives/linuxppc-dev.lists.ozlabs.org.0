Return-Path: <linuxppc-dev+bounces-8510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E21AB38B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0fJ2ndlz2yqy;
	Mon, 12 May 2025 23:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747056184;
	cv=none; b=DR2+Mr7CCq/Oj9IIL9Y9dR6YXSWa37WFaRL7Ilf6+4OSIxBzIATycYqZwLjS4t64NDwLN/awOcWT+M1n/O8WuT4I4tqDriRhFEOVx4L55+TQpeuxOy75W6M2ATXLrsDcKlBRKLV6iKs51oYw1uZEiJzgegdqX0ZCN2m83P5psjcOKpuRebKAm78W0vBfqDelqKwxbRMWwVkyi0UnPDlJDTa0G+H/s3g/mHowImxpMPAbcPL7QjOzAgnt3sXXCFflGY12dbtPetg7JjsjkeS3t+pwU9wPyQpquCuuO5Pj/UBO426H9RaiaQbQL5SrfPTxpBDTvftkvnEBMXdtb1BqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747056184; c=relaxed/relaxed;
	bh=Rt9GtFBQJVx2og2U+6x9mcRi6vq6T7dh1csKu94DEVk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EF0AIzYv98vg4FWEtRws40kJ7HHDFHLYVxJ88Xo9Wpk5nQDEkif6i//9X3wg9aaoIUrUR3wMqog3YrAUA1dS/mnW9OgJHQQw1hd/1gg6A880C7lmQwCIVkpzhEe/L7Ozciw1cRcMJ7YlZyFXprsWk4eYONmmj0SmWGVuTsibD/IZ7u3KrDs0sXUtQR6SgMTipB1GPtycz8uUU7ZhVrHyCuOQDz2ZfWtRuWz08t9GnPTZSxeHHync2TXDMj6uQRYsCB5p7B3a02ccIzhl5Sssh+otwEkHbhg4n9Fha1gHKBpSqtJ5RXV576noxvJwePxInYCsAVl5M1IIO4Frbsk7sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjxywBk6; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjxywBk6; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjxywBk6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjxywBk6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0fH3Wmbz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:23:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rt9GtFBQJVx2og2U+6x9mcRi6vq6T7dh1csKu94DEVk=;
	b=cjxywBk644U0DxpUuyY2Kx8xYPDvlBmuILLenlJAZdwq7S6NqM6O/wep02ZjCykrEizxW9
	p8shIcprvwUQhHtT4EJIE7fGM10MiolVkwfM/E9ElwnDYEcOOGWfw1Jy086nESoiyYmuKC
	Exk+hz8inBAoNMpLLaOdDyEMtmOWmEU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rt9GtFBQJVx2og2U+6x9mcRi6vq6T7dh1csKu94DEVk=;
	b=cjxywBk644U0DxpUuyY2Kx8xYPDvlBmuILLenlJAZdwq7S6NqM6O/wep02ZjCykrEizxW9
	p8shIcprvwUQhHtT4EJIE7fGM10MiolVkwfM/E9ElwnDYEcOOGWfw1Jy086nESoiyYmuKC
	Exk+hz8inBAoNMpLLaOdDyEMtmOWmEU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Rbt9a4XqOC2_-_ELKaeS1Q-1; Mon, 12 May 2025 09:22:57 -0400
X-MC-Unique: Rbt9a4XqOC2_-_ELKaeS1Q-1
X-Mimecast-MFC-AGG-ID: Rbt9a4XqOC2_-_ELKaeS1Q_1747056176
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad2363a3949so228001866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056176; x=1747660976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt9GtFBQJVx2og2U+6x9mcRi6vq6T7dh1csKu94DEVk=;
        b=jwYfvpRdFhLnuC0J/4qPmYnHAGkPhgJsUYFixIqQHpHv40GPA/LoTXYLq2A+FjHdL8
         Ej/bDtW316G+BvCYqzuup9XZT49LUYoyiNtYy4L+dL3qS/u4mJ/lqOLWprZr6TBKbaYk
         +WYecX5bGvRCj0gbC2eRb0YuKjdCJHcvBsPnbKSfuJxPA5NJIR4qihHFZBJtLL8vyaaE
         mpHEr3OI44a6LkqwGxNMKUHES+99huMfBXCGvXs28OUI/GUJxDp6bFApnBXxshNqjAaJ
         nZcpx/umXSI3OKh+zYmxSOKIJ0jCsb5R6ySqbpmucFqZv23+Bn5K6U4vzEdqAoapSWNf
         tciw==
X-Forwarded-Encrypted: i=1; AJvYcCXmcaWFECuQa6AgQPhn+VDYRMSsf6bg7oH+muSdv/WI/J8P3f046vCq4aXqGk07ncLpZ0YDLFxli7tlu2I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFbk96jyROT/RUT/rp6DYV+OqfLJddk4QgyC4fBXWw5SsaLW11
	xinCxsU4UcuNRavCp8EAtjsJe3LfvBGeSs5rDUqfP5/83ojBQR1rzySl/h6mw8NR2ZGq8kdl2XA
	60k9zOXxVgLfoOuVUIQIEmSzm5w4Xka7EeO0JVCOKIIgd+o9oJfyHT3+DL1N0Yw==
X-Gm-Gg: ASbGncvORxNBclUY/LOAYsve5JwqO82qTqB0klujd8LsOm7YvYjdvDY5vJnze4f8IIk
	7ZnACu1U2NlCXJHZaWkrvjjO9VW9cW5xahApGFYeAMQqciSqC0vtQRXpUzfyQoc6u/WWFEvLmF7
	lqnozIk60RwHEz8oTUCHaSUSkkTqyj3KoByBIV/c07JW/4yGIJeyywrmexLUbPVfNNGgrQueHya
	a6hdBiZ0AhntNK/ZFAJkH7YF/ZP67iBAS9zxrZaYKGlKq8dgm2nM1u1rG9dbthzYhPyWNRVqNQe
	/VY3brtIQTHkrOLXj7mKQqzC+73kIm07HJdBzOMn
X-Received: by 2002:a17:907:6ea4:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-ad4d00fb8fcmr36841966b.50.1747056176258;
        Mon, 12 May 2025 06:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ1H/zptS/AHQGJ0FK52hePcKQfFfrpXhxDrhZE1E6E4AE2JiwqXtAXQ7n2gKkCn93DDW/NA==
X-Received: by 2002:a17:907:6ea4:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-ad4d00fb8fcmr36835166b.50.1747056175640;
        Mon, 12 May 2025 06:22:55 -0700 (PDT)
Received: from thinky (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd28dsm613933766b.128.2025.05.12.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:22:55 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 May 2025 15:22:52 +0200
To: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: [PATCH v5 5/7] fs: make vfs_fileattr_[get|set] return -EOPNOSUPP
Message-ID: <20250512-xattrat-syscall-v5-5-ffbc7c477332@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=xNZgMi4eRRk641oOEdpKdfQ/bF05YfbIRMmgusqStnI=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMhS/7gpUUlnz86nTDU79jiMuhmaSU5Y0X4uZXFdRe
 Vmc8dGRozkdpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJtIRzsjwXWjjY7HXi7bl
 PFdbzGTT97Nn+gxH75Rvx4wCZ9h+erijleGfefXLzfMlHhZ1SRydlrlHbP8WO6cPJmv/zTu7xuT
 VWu893ACrBku/
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
References: <20250512-xattrat-syscall-v5-0-ffbc7c477332@kernel.org>
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
In-Reply-To: <20250512-xattrat-syscall-v5-0-ffbc7c477332@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7VZ8BG6Wt0X55zW-PCK0xZFhezCHpNOPdCbmD-rF2sw_1747056176
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
index 51a5c54eb740..6bf08ff4d7f7 100644
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
index d9eab553dc25..d696f440fa4f 100644
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
index 6f0e15f86c21..096d44712bb1 100644
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


-- 
- Andrey



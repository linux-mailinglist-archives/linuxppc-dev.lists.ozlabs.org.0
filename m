Return-Path: <linuxppc-dev+bounces-8513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B9AB38D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0jF46rLz2yrQ;
	Mon, 12 May 2025 23:25:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747056337;
	cv=none; b=SXBtq4zkVQBzVQNBphpHi4hzdmMpqLEbXxn7gvo1sjGD6bvaubUAnCOd02x+XZY/2ohJpQ+fiYrDvr/JtAlVK+lcpBMfme9sO3NdVT0YBu2cAqrp+6xE+o42IeyheF7mKjolzIo5ZbSoKdcbMGrCXdb9gOVEXAvtHwJj1l86SklZJo2WrkDOCN/ghlBvn58hcWbzi29MbwP/0PcqCzqtQunFPCe2WUnontHsiW9srGmvPqfvhDOa+jZyrCrO3p2kS1EKV2Z02h01Sy1bjP0MCi7X7IiXEcB9iS5xg8UZB+9/v+nWIWjXhytJQ8Vz/G4b+9o3CyOKd1jaXd9Ps6IvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747056337; c=relaxed/relaxed;
	bh=9zdzYFU67QL/yrQjWemjUC5iC/W3DMR3kub6Fg2erUY=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=M4T0kVrAr09JcMY/phQLBDBfb6hzAIw3KKI9iGhDDP+cMd5gUTclTItNVfH/LV1le0LvFHsjFQkHNKjt7f5HxQLPcvoCERiH/VzFOL54pKKUcc+nD7ypaN3nGk3vgfyVUJj784JnVbgeWKdFh0wraJVKLUo8rF/T8mCAJGNQVP179Omfg3Qetnzk8ihDpBKtyQ6SFEL3UEln9+gY9B9ZR0lUb+mJBmrgKf8nxZnPiaEU1INtFU/hJbKEdiVKB+upPZsbhsOWrEeQNlSydiLAmwXiliyiaVNLrmKI+pIJKIOgHPTg+PWUPPO0liAWiR+5sjWI+1fxGJo+UqIboLfcTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvKuRFCT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvKuRFCT; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvKuRFCT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvKuRFCT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0jC6NhRz2yr8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:25:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zdzYFU67QL/yrQjWemjUC5iC/W3DMR3kub6Fg2erUY=;
	b=gvKuRFCTL3mIF1yNIPHpVxth285gXaq0iY3y/psfEzIVdPnAhqlev8J42z+bfBRRgGKkrH
	eywZLe3UXF28pmuNP/hyzZJzsG1MD6fy1GzztFpcVnFEBxFb+RyPFnQprWjhxNfVDK7n5u
	ot41tnUO9R/l4Vkg1DRuHL8wDzfbiPY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zdzYFU67QL/yrQjWemjUC5iC/W3DMR3kub6Fg2erUY=;
	b=gvKuRFCTL3mIF1yNIPHpVxth285gXaq0iY3y/psfEzIVdPnAhqlev8J42z+bfBRRgGKkrH
	eywZLe3UXF28pmuNP/hyzZJzsG1MD6fy1GzztFpcVnFEBxFb+RyPFnQprWjhxNfVDK7n5u
	ot41tnUO9R/l4Vkg1DRuHL8wDzfbiPY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-3eVJbPy7OUy4eS2D4LbJWw-1; Mon, 12 May 2025 09:25:31 -0400
X-MC-Unique: 3eVJbPy7OUy4eS2D4LbJWw-1
X-Mimecast-MFC-AGG-ID: 3eVJbPy7OUy4eS2D4LbJWw_1747056330
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5f638cacf63so3635624a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056330; x=1747661130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zdzYFU67QL/yrQjWemjUC5iC/W3DMR3kub6Fg2erUY=;
        b=s6Z3o3LHKqV223Ta9hpM8e+OOWn62TxP22UjIHwULUhgHSPzqa8cv9hUY1GWm6OumH
         L0JEZTpwhxM/2oK/2WH0J2orbcV56c1vA30uTa6W+Xpkl+3E8wG5cm2/EqA+8/mHNP9K
         y6o8JhyRie7EuMnS9UW9SzLvEf+2tOIiVvExcpAXKoygLBCZ1s6Yf4J9vn+EPfUHYOnJ
         hHSqLVzzCAVNJT9zAnvYZTaGU7yi+wwVx01CQh53eRlLdKqQGF/JC26H3edxCaSgPTjn
         ESGCJVszxATq11UGqYyN8MFNVKnkIJNqCA+sENke9raTPr1goubxdVjYlna76UhAR2PY
         0T6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3M2gmUA7fIX1jWOwbYn0Ii+DWQPFYN2gtRc8cJVSimnVKyl7yP6INCpoOzRj4O2JtyUUXyNettl6L/7w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxdS43HNRIi1ko8hqpacJGpV4rMKWh6YB+NSHPRnSfBQh0oGCHs
	nvM01UXu4vri+iAkEkp7vXQnE7Uod0CwrLtnZ83YhLAT4sQtLGdgUUQavXxOoTV/4RBIWS7ePZA
	ANTre4T+Za8ZYYenlRD8wVSyH5yMX6TYrADp9E8ByLdllzKs/q8AaqaZugZRlmg==
X-Gm-Gg: ASbGnctuzZM/RJjitzPDEvkgwqnyHn/+QkrcO++TZxBsPbZZe2JLcugvF8HQ9e2vgDc
	EXHP/CzQhGeVKLirKAOafQ6JIQRYOw6b9Y6e1Yx6zvV9P+6+nd4i8Iu3hclPCtqx58fKvtDAAKF
	1Kuk+9QP6k16kycg3L8+gNIDHMLa/hDlzYb8S437nM9yWvSP5l/8P7MIplX7thPHQjfuXkzoDvk
	ftIYC2cz49/HR2FbiDXC9559jtyJtucXH0U7wK5PLpCGxcqmdQCRbL8maqRviuaC2Oap7tAAeUt
	gXBPEbn122d/lz/MicQgjXPC338=
X-Received: by 2002:a05:6402:210b:b0:5fd:ef5d:cfc4 with SMTP id 4fb4d7f45d1cf-5fdef5ddcacmr4241543a12.32.1747056330169;
        Mon, 12 May 2025 06:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgyFRWpHIHyxLqyb63eiEMcoz6JMXZOSqP4STcTWiczoMtX+J1IqNwFoMZx8exSweSW5WJFw==
X-Received: by 2002:a05:6402:210b:b0:5fd:ef5d:cfc4 with SMTP id 4fb4d7f45d1cf-5fdef5ddcacmr4241498a12.32.1747056329623;
        Mon, 12 May 2025 06:25:29 -0700 (PDT)
Received: from [127.0.0.1] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc2633bsm5788360a12.20.2025.05.12.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:25:29 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 May 2025 15:25:13 +0200
Subject: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting inode
 fsxattr
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
Message-Id: <20250512-xattrat-syscall-v5-2-4cd6821e8ff7@kernel.org>
References: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
In-Reply-To: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5194; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=EE7KRw5zpeu2NPRaS4FGB5R9ATQBOE/dVjbJqb/tg1Q=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMhS/7eU/HpORlvbTw9rAc0Wgxfs73zR6Gn4y9my8L
 JR99sWJf4odpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJmI0m5Hhm6pb0gp73Yfh
 UZFnGpJLNFtbJ1621OupmDl/5aTt21rlGP47OGdl1BlEf2TxmvE1S5hl8oaj839ZcxyJ9dxwwts
 2fQ4rALHeR6U=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dIhVqiWHGWPrQYF_FtzZRQk-Tc2gR470efVnCUc5Wlo_1747056330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce new hooks for setting and getting filesystem extended
attributes on inode (FS_IOC_FSGETXATTR).

Cc: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/file_attr.c                | 19 ++++++++++++++++---
 include/linux/lsm_hook_defs.h |  2 ++
 include/linux/security.h      | 16 ++++++++++++++++
 security/security.c           | 30 ++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 2910b7047721..be62d97cc444 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -76,10 +76,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
 int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
+	int error;
 
 	if (!inode->i_op->fileattr_get)
 		return -ENOIOCTLCMD;
 
+	error = security_inode_file_getattr(dentry, fa);
+	if (error)
+		return error;
+
 	return inode->i_op->fileattr_get(dentry, fa);
 }
 EXPORT_SYMBOL(vfs_fileattr_get);
@@ -242,12 +247,20 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		} else {
 			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
 		}
+
 		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (!err)
-			err = inode->i_op->fileattr_set(idmap, dentry, fa);
+		if (err)
+			goto out;
+		err = security_inode_file_setattr(dentry, fa);
+		if (err)
+			goto out;
+		err = inode->i_op->fileattr_set(idmap, dentry, fa);
+		if (err)
+			goto out;
 	}
+
+out:
 	inode_unlock(inode);
-
 	return err;
 }
 EXPORT_SYMBOL(vfs_fileattr_set);
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index bf3bbac4e02a..9600a4350e79 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -157,6 +157,8 @@ LSM_HOOK(int, 0, inode_removexattr, struct mnt_idmap *idmap,
 	 struct dentry *dentry, const char *name)
 LSM_HOOK(void, LSM_RET_VOID, inode_post_removexattr, struct dentry *dentry,
 	 const char *name)
+LSM_HOOK(int, 0, inode_file_setattr, struct dentry *dentry, struct fileattr *fa)
+LSM_HOOK(int, 0, inode_file_getattr, struct dentry *dentry, struct fileattr *fa)
 LSM_HOOK(int, 0, inode_set_acl, struct mnt_idmap *idmap,
 	 struct dentry *dentry, const char *acl_name, struct posix_acl *kacl)
 LSM_HOOK(void, LSM_RET_VOID, inode_post_set_acl, struct dentry *dentry,
diff --git a/include/linux/security.h b/include/linux/security.h
index cc9b54d95d22..d2da2f654345 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -451,6 +451,10 @@ int security_inode_listxattr(struct dentry *dentry);
 int security_inode_removexattr(struct mnt_idmap *idmap,
 			       struct dentry *dentry, const char *name);
 void security_inode_post_removexattr(struct dentry *dentry, const char *name);
+int security_inode_file_setattr(struct dentry *dentry,
+			      struct fileattr *fa);
+int security_inode_file_getattr(struct dentry *dentry,
+			      struct fileattr *fa);
 int security_inode_need_killpriv(struct dentry *dentry);
 int security_inode_killpriv(struct mnt_idmap *idmap, struct dentry *dentry);
 int security_inode_getsecurity(struct mnt_idmap *idmap,
@@ -1053,6 +1057,18 @@ static inline void security_inode_post_removexattr(struct dentry *dentry,
 						   const char *name)
 { }
 
+static inline int security_inode_file_setattr(struct dentry *dentry,
+					      struct fileattr *fa)
+{
+	return 0;
+}
+
+static inline int security_inode_file_getattr(struct dentry *dentry,
+					      struct fileattr *fa)
+{
+	return 0;
+}
+
 static inline int security_inode_need_killpriv(struct dentry *dentry)
 {
 	return cap_inode_need_killpriv(dentry);
diff --git a/security/security.c b/security/security.c
index fb57e8fddd91..09c891e6027d 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2622,6 +2622,36 @@ void security_inode_post_removexattr(struct dentry *dentry, const char *name)
 	call_void_hook(inode_post_removexattr, dentry, name);
 }
 
+/**
+ * security_inode_file_setattr() - check if setting fsxattr is allowed
+ * @dentry: file to set filesystem extended attributes on
+ * @fa: extended attributes to set on the inode
+ *
+ * Called when file_setattr() syscall or FS_IOC_FSSETXATTR ioctl() is called on
+ * inode
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_inode_file_setattr(struct dentry *dentry, struct fileattr *fa)
+{
+	return call_int_hook(inode_file_setattr, dentry, fa);
+}
+
+/**
+ * security_inode_file_getattr() - check if retrieving fsxattr is allowed
+ * @dentry: file to retrieve filesystem extended attributes from
+ * @fa: extended attributes to get
+ *
+ * Called when file_getattr() syscall or FS_IOC_FSGETXATTR ioctl() is called on
+ * inode
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_inode_file_getattr(struct dentry *dentry, struct fileattr *fa)
+{
+	return call_int_hook(inode_file_getattr, dentry, fa);
+}
+
 /**
  * security_inode_need_killpriv() - Check if security_inode_killpriv() required
  * @dentry: associated dentry

-- 
2.47.2



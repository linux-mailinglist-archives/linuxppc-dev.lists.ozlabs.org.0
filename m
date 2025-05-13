Return-Path: <linuxppc-dev+bounces-8528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62966AB4F14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 11:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxW9Z6PS0z2yZS;
	Tue, 13 May 2025 19:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747127906;
	cv=none; b=Ul9ssD7ZcgP/WzviAA8D67epz67BINb7oF+loPQZGBhy3yC2knnbwowSMEb/L8/eOkLYyiVFEgBwAOzf6LLNrCSGn7qJIaFdvqDRNiWIRisp41oQ877zhj4qvbVYWyqSkm4jxkMgMGSLXOdoSlGJT8BRn1QR4OE2SHhOOegnD3V+PJpx67nODHXt/AqvzY3gFWsNfmJ69W+utJp6tTmdj3A9Eed0WpKdBUnZV3bGXXvUHq+lo1/Lf/5in7+NcQ0kh/tONAzFG2SgoHPZFKWlW5FEKWFNXjjvqK67Zah6ofUYtIn4Pwij9k77vMYiAC0PoS4t63wYDM+lYckEjKC+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747127906; c=relaxed/relaxed;
	bh=A7i9r0bj6CyLmaFmxt3qgx2Tj6vgASlaO3PK3g/iy20=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=R9KevRWnJgkZ03J/RAyXZ8dbR2vKOFWSyeEOQ8gonRlzUJF0aslMjnGJ/1YEQvWUZFunH0EIH1/hNFwQJdVKX6ep8lvRa+bfwGNmdooRsmrK/BK03Jihe4Y8v69ArqRJr71bCtcZXwQ1l91/njquHhxZU0cCoxjvyX7v4YwOc9YXft+UKXR4fRr7aEI5wISDtXLowO6YiajePPQ83SsoFThQMWRyzKsVkdFeaCttt6Qfgx6RAPyF83PeUhrfbsS4zkHjg8FL7PCNI0lzFRrEsHPfT5nIr/URELVSGNDPHXO1OqcsYvfXzxB4Qe/UH1EmimCNNIV9aHLU/PV6CRDNTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QAOQXD88; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QAOQXD88; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QAOQXD88;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QAOQXD88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxW9Z11dQz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 19:18:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7i9r0bj6CyLmaFmxt3qgx2Tj6vgASlaO3PK3g/iy20=;
	b=QAOQXD88rl5DzaQi3L1Hzu3GU9B4+CC6+GVWyRcC5lERERbwb6Auha0V7VJASUzkVputJL
	+JxMqXMyQdLG3sA9Q5NK5l4bar0pTdT/rRILBsDIsYsF6/Qhh8GsdvBh0bj7fVNJMsvsVx
	ov3AOBBeOn9q69+Sc2CJw8Uy8fNvK8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7i9r0bj6CyLmaFmxt3qgx2Tj6vgASlaO3PK3g/iy20=;
	b=QAOQXD88rl5DzaQi3L1Hzu3GU9B4+CC6+GVWyRcC5lERERbwb6Auha0V7VJASUzkVputJL
	+JxMqXMyQdLG3sA9Q5NK5l4bar0pTdT/rRILBsDIsYsF6/Qhh8GsdvBh0bj7fVNJMsvsVx
	ov3AOBBeOn9q69+Sc2CJw8Uy8fNvK8Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-MXvi3ey_OLy2k1r2O61mXw-1; Tue, 13 May 2025 05:18:21 -0400
X-MC-Unique: MXvi3ey_OLy2k1r2O61mXw-1
X-Mimecast-MFC-AGG-ID: MXvi3ey_OLy2k1r2O61mXw_1747127899
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so28145375e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 02:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127899; x=1747732699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7i9r0bj6CyLmaFmxt3qgx2Tj6vgASlaO3PK3g/iy20=;
        b=XXQXXl+X966l6jhjtpqrV87aiKI1agXLPvymaZhU2BFD7yiUXctmzA6zlFshWd7umv
         lMFiAyAvTCg/LSu7OtV0GkpJ7YSK0tzrpVGMhjzpSSCwgwRTL++JkSHC+GFZbPBnbP8l
         5+OxOH5Q5b6MgKRoRPPGtO33x9jLh11oVhX6hDuVquSMBv6EG3ZF3JZSoDuPAnO19tkf
         KKQ4eBnaDx+6iAiYh33crcFXz5kudf33RD4LxrAPAy8A9MQ9Y/MHt9RKb8GrfW2RHo7t
         Ma90U+5xRG3SAoOP6x7wZUNg9URK4mGJxLK038dUNKzbIUIwtVwW3oqb+is71nP2C63m
         O7cA==
X-Forwarded-Encrypted: i=1; AJvYcCU3SNb3tZQ6qOsTlXmDrh022CZQMVSUpryP9XROs5w/rXWR3aYUROYGuuSFEQGfqOQxPfGfB3c0M71A24g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/ORdVh9AqOMcwfOSJWDwgnNv3/nF1Kg5N6TX23eJ3Xa8qIyFo
	6+JtHdUm20uRmn3/Oi5+6OmJseyMKfmse77uDhPICOU553iowp80l1QXyOG/Ss9L3bxbRFRHCp0
	nWKOTxgHQvo7ZkZIXnjWLo2Co3ThMf0G+OY+PuGFHaczMUmWjXu4kCqyd85idzQ==
X-Gm-Gg: ASbGncsOjEqWZ5OSmQi2K8TBCzbFGI4ahy0+Ckio7x6IqWvdw/IzcniBHavG6ZsIO9F
	0gtN2RwntnuY1SQ/q2uaF1j3F6k5DjA34+KRxIqFv2N5S2K2rQvh30n/0mpXZEZBS3l1IeveC/A
	DP3v0zCW6uYA8SOmxQOFXhIN1ij9re7dASiyIFEJuNO6oFibdLw3MSrtu8rg64aPgrjZN11XZQj
	x2kLIMHuY9BFbIpAe1gcCcN1pesMKNu4iNaHgNeNlPIVORu8xtGJx/ZyjR/8RKq63s3oeURO1YC
	n/3K7kpDma2U+T1XiZ4rBG2kyyEG2wg99UTtA+aVPSvVupI=
X-Received: by 2002:a05:600c:b85:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-442d6dde9a5mr123282045e9.33.1747127898742;
        Tue, 13 May 2025 02:18:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH48YApAweQLr9FqjcxLWZAARsvWVI15CFcissyg+mEXGTlUmY2j0SDRus7eO6YNuUdP6jeRg==
X-Received: by 2002:a05:600c:b85:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-442d6dde9a5mr123281625e9.33.1747127898279;
        Tue, 13 May 2025 02:18:18 -0700 (PDT)
Received: from [127.0.0.2] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm12345655e9.18.2025.05.13.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:18:17 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Tue, 13 May 2025 11:17:56 +0200
Subject: [PATCH v5 3/7] selinux: implement inode_file_[g|s]etattr hooks
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
Message-Id: <20250513-xattrat-syscall-v5-3-22bb9c6c767f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=wSzH0WcqWhiy63ekDcp2P+4tMQ4i2gTZHqE6rCKQ++I=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMpT5vOcHL6x//4Yt+9EFwZyLxr/7Tz9ZpP5u3tO4V
 q6ORSUh1y53lLIwiHExyIopsqyT1pqaVCSVf8SgRh5mDisTyBAGLk4BmEiwPiND+6YnluEhu/Qc
 Cx5cnc3R+vvvJvuQL0V6fGyyUclCHH6VjAwT/JZona0OZVzwJvX/wlkFTstmX7ezC/yqzlmc01k
 tfZMVAGD5RU0=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BEJSvBZJiEq_qt74OcaLSXT___eB-8pkmvkdKm9OhpU_1747127899
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These hooks are called on inode extended attribute retrieval/change.

Cc: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 security/selinux/hooks.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index e7a7dcab81db6a8735877eeb911975e06a9de688..9c6e264b090f9038d6848546760860bfe74b7341 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3366,6 +3366,18 @@ static int selinux_inode_removexattr(struct mnt_idmap *idmap,
 	return -EACCES;
 }
 
+static int selinux_inode_file_setattr(struct dentry *dentry,
+				      struct fileattr *fa)
+{
+	return dentry_has_perm(current_cred(), dentry, FILE__SETATTR);
+}
+
+static int selinux_inode_file_getattr(struct dentry *dentry,
+				      struct fileattr *fa)
+{
+	return dentry_has_perm(current_cred(), dentry, FILE__GETATTR);
+}
+
 static int selinux_path_notify(const struct path *path, u64 mask,
 						unsigned int obj_type)
 {
@@ -7272,6 +7284,8 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(inode_getxattr, selinux_inode_getxattr),
 	LSM_HOOK_INIT(inode_listxattr, selinux_inode_listxattr),
 	LSM_HOOK_INIT(inode_removexattr, selinux_inode_removexattr),
+	LSM_HOOK_INIT(inode_file_getattr, selinux_inode_file_getattr),
+	LSM_HOOK_INIT(inode_file_setattr, selinux_inode_file_setattr),
 	LSM_HOOK_INIT(inode_set_acl, selinux_inode_set_acl),
 	LSM_HOOK_INIT(inode_get_acl, selinux_inode_get_acl),
 	LSM_HOOK_INIT(inode_remove_acl, selinux_inode_remove_acl),

-- 
2.47.2



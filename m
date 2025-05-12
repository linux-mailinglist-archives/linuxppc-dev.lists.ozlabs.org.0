Return-Path: <linuxppc-dev+bounces-8507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB30AB3864
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:19:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0ZF1Slcz2yrN;
	Mon, 12 May 2025 23:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747055973;
	cv=none; b=FtMYJB/ag4o4C2dTDuHRe5HXqPeoPFjYubuV8S+IEGvpgefvQ3vdHJnaeu0C2dlAyIok5CLEvU4N8dQQoMgDbjtnYD007xZkgJo2hxQjOxVt/Tcm1wGmZK5z1D4vR7S/WHOU7CKrfm+xbEABAOcT01jYXqv8G7UNETmbL50xVE3B63/9z13IoIw49LZZbK+MWqiM+GmbFC85Ey+YRDMqq5U9g8htEaODI9Ggx3l37cXI8DDV3sfSAWfISK936O+sbfmrB3M2vPIAsrAwMJE1jDq9FrUujb0Qj0exgRDnCldoSDKx5J0SRZgmHptUpssKsqVm0/qK4BQJXoClkSdlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747055973; c=relaxed/relaxed;
	bh=FLzO0UetENOl7ymbAc9ZwNTqK+089tCghqZXKpGiOB4=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=ETP19PTy9JRxp5ZGS00DcWly0geWy7LXOrxdRTH0JSIBTWPV+RXlZdfgfRG+X9TBJ6a+w8r5slcdiGrgKgvYRQAmECXYG55QR/4lntXvrXkGBcBmgsdwGL5wzmEAi+11Ajs899K5B+bqVd81xJGEDJckPrbK9B8ynMErovzaC/qpXl4cugJGLIeepbjquWkMJ1msrBtoVU5DlrvgbFRf/LFQnc+nRz5/n8zhCHwPXbGqAPOSVaSwkMcMTPBNjvoa1FfM7BCkP7nCjDv7KzR/I5QEsChbEX0RnIkD0JkS3KZchY6k2pwy0GuwTJEd9YX1278ulP1vRkPWlQDwikiHdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FPNyds4z; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UuAJIsvf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FPNyds4z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UuAJIsvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0ZD3KnFz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:19:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747055969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FLzO0UetENOl7ymbAc9ZwNTqK+089tCghqZXKpGiOB4=;
	b=FPNyds4zOtrGQz7d74WIEtWcOXUQrLNDmnsaV4f52/z8XVUk3DdXvgsDBozAki+LqT8E8k
	mDU0wxYS99G4qGCBTLbtzXmvNRpCOB+jWz6NCW8h2Fus79USoneGCwehaBc3QSHuz7uNoj
	Ui1KN7gTBf37Dzx4I6D+b/1gOmLjXZA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747055970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FLzO0UetENOl7ymbAc9ZwNTqK+089tCghqZXKpGiOB4=;
	b=UuAJIsvfW4+AoYzMO82WlQva0FNBss819kdie+Y1gla4xWXCXat4G4RChBnv7ipOq6oUxv
	Br6f+nJl0GuI5ai23EYG7EVia3zOcQ+et17ET2y1Qaeug5om/4rivcht+OFOQKat472D9k
	RG5xBweDySQrH4O0iZGNXQoexMF9E1c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-SWAS4v3WNmWFIacuB9s1nA-1; Mon, 12 May 2025 09:19:27 -0400
X-MC-Unique: SWAS4v3WNmWFIacuB9s1nA-1
X-Mimecast-MFC-AGG-ID: SWAS4v3WNmWFIacuB9s1nA_1747055966
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acf16746a74so481420966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055965; x=1747660765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLzO0UetENOl7ymbAc9ZwNTqK+089tCghqZXKpGiOB4=;
        b=bIfvVVkGVj7DCNUt1Q8W4+EmLxC9RYpI6C0RKBSOUQ7IJpy6m6pNKb7sgQY+j0lyy3
         1WEABJQjXkaJwSNVSewtcN2ERb6YcMZVJBdtdbXQJl7xs1NDXQBK8uxt0DRHEGiwpJUh
         siHdioJQieYGBe6IZ0PaXFnXHLWN46J3XvO1Fo5o2yXZkopKQ19B0IpGlLZJPv+cd5BB
         12TAkyIxdX1ENcczNTBSJ+3wh/mA2p1loMGhOAJoTXhs4SZzU+8F2s3Ak2aNKimys+XG
         jzK5Hxx8cZtXY0B6uyP+/trPJ9NUzRuBiAckUWD+MKD6eQ34UJUpSIpGp4y/h9WWglFm
         TfVg==
X-Forwarded-Encrypted: i=1; AJvYcCVlLtxCgHy0QI/axU41vn4tAD6lmqm6QgLGLMGDm9B3BtUJLKJo1bynOAMy2dzZ/2+EBxvPO8wIfshm65c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9SHVCJcVYgGnc7o5V60lxO1msaMI/8boDtgtI6fXKu9qls16l
	3QdheIM9wbIj8XSixaACEHZP7wRt95SxpFMd/0VrCslKQD/RSsDQGR+dlDFv7CPtjf/4kjJINJc
	ntVnmzGlqlse5oOQO74M6jpJgPwzN7ZH0TzGLxS9sJRJhgrmPUk+F8S+sGCCQwijlwrtElhkTPf
	e6JoZRQ3/lXhlaMQ/ezlDerpZZRn2SLMaq3lxhTgGExmvX5Bzf
X-Gm-Gg: ASbGncstGeS2/XR4r7iTsK13Ip5RYNBfwdioFTPsoxA+g0JpDasJJtOr8F7KCgMnheS
	ex4l1DCIo99/AIG4ffLCcAkImlhhdyvj/yxOwKd6YuIjLMdvpyXfDChSZmdCkqk4POodLQn6oiA
	OemFiAgOi4luDaS5gKikDHZXcf6cbidQRBqSdx4uQ8si8PDY0TPUjiHfohbayYTKs6UnbrxnRi6
	6ELVczCmuqCvvVT6IwWWsSKLOitwebRRAWgdgtBhHkS1MKQbHdJODYlQzi54Z8IKQJa4dFRdmJ3
	ZoohVA8nbwxpTBHklDfc9Wr/cuQ=
X-Received: by 2002:a17:907:8b99:b0:ad2:2d6e:4962 with SMTP id a640c23a62f3a-ad22d6e52c2mr855526566b.42.1747055965224;
        Mon, 12 May 2025 06:19:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa3ZpYdTF3qd17gWEoRTHMnv+pL5522+Z5nSX7r6uDpni86IH6A8IHgBLuulX9yc13mwfyKQ==
X-Received: by 2002:a17:907:8b99:b0:ad2:2d6e:4962 with SMTP id a640c23a62f3a-ad22d6e52c2mr855517166b.42.1747055964687;
        Mon, 12 May 2025 06:19:24 -0700 (PDT)
Received: from [127.0.0.1] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bde09sm612328766b.125.2025.05.12.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:19:24 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 May 2025 15:18:56 +0200
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
Message-Id: <20250512-xattrat-syscall-v5-3-a88b20e37aae@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=9gJF743RWK+bJ6m7oQyctUYpmbwhq5qenEdMjKDH0Lc=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMhS/+h/6tvS4ypammLpAoYZzNSvmXjrOE5DOrL33V
 8CXj52HDmR0lLIwiHExyIopsqyT1pqaVCSVf8SgRh5mDisTyBAGLk4BmMjE64wMK86tctk6J8PH
 5NWsT9K3ktK/ublm/c3lZ8k/wnjIVFi0kZHh8PaZrp7Ld+k+Z2N7UH7CtdSLJcq5zkrlWQO7dK2
 M72wWABsnReQ=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mx977XfcPE3C2PEMYM_oqb8_7SZmPxtr4GAn0Fyzk94_1747055966
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
index e7a7dcab81db..9c6e264b090f 100644
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



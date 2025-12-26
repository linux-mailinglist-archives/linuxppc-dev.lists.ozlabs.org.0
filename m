Return-Path: <linuxppc-dev+bounces-15014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8BCDEC03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Dec 2025 15:07:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dd6rr2GLbz2yFW;
	Sat, 27 Dec 2025 01:07:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766758076;
	cv=none; b=U6xMz7uspa7r9M8csKf6htlZmeKsJsDDyayI2qV0aUsMMhu3CSxyndMyMMF8g7XGudYm/hchss3+R0FEyrTxzyyVug75XEciIoyPqah6h8/DUhZgyRmWBtS0GnUMhM9oTolz76em9cAEI65J6jroA2ESr65Ps4sOGAb8YVzZxU9dpYPhywtSN2OF1OJVfQFvD01I+B3iAiCeud7JcKFh/iEK2Ry2TefUdxIzoCcIgZCFOfQoSnUA/cT76FlPCapnjfqeDq2wPvOMiSc/UznrDc4vVjQHJsWgsVrCrBMCYYrn5YOwPVMgwROJ7tEEOrYtRM3oAGcxmeWJ3DbLIPwhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766758076; c=relaxed/relaxed;
	bh=Y8CRsSUdURwt+1GZdBpSW/7VDn07syF3EYe9jZf8o5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=dTqkju+jqOQhemmR1D9Tb58Zd4WUxGIZe49CMHer/7K4tcb3FzJth54/eI7OXhfoav1FUYZ/bDFiDCVgjRoZth8yBmSmov+yhsXQAQWq1H1Ih99Otezyk1EFlXRA1Us0NDtAG9aD0HUJYtcVwqBO7c/b/QixH5llYVybmIuH25/8LnT2b2kXw8s323K0T6Ef68vefmyxLaNpXRjMZXOpvmijlFQvJlkkyluvR8ZwwaYz8i9LGz+FUWqyGZX8G2Wd8WC/Yy7685U2FZ7NmBVMYqeFsfj+UzaXRiClSMV6s0VbPB300VmIDgpZR8b/E/85FuOsWOGOZlXPl76s8d2h3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XyaTURVH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XyaTURVH; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XyaTURVH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XyaTURVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 27 Dec 2025 01:07:54 AEDT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dd6rp5Pk9z2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 01:07:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766758071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y8CRsSUdURwt+1GZdBpSW/7VDn07syF3EYe9jZf8o5o=;
	b=XyaTURVH3BxLolSJt9xIBchzkjvWMA1C+JCf8T4j8V6nzTw4pPYJWnSgLmeQaj0szY62Yp
	D+g7e9xIWTLHMMrh6MaoxAoihpadh3KfWT2rLbClBPnHryEYT62EmSIxI9ZafdpVF0SjSy
	mjNjqzjC1r70e7YrjElfAJdsT0nSkXs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766758071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y8CRsSUdURwt+1GZdBpSW/7VDn07syF3EYe9jZf8o5o=;
	b=XyaTURVH3BxLolSJt9xIBchzkjvWMA1C+JCf8T4j8V6nzTw4pPYJWnSgLmeQaj0szY62Yp
	D+g7e9xIWTLHMMrh6MaoxAoihpadh3KfWT2rLbClBPnHryEYT62EmSIxI9ZafdpVF0SjSy
	mjNjqzjC1r70e7YrjElfAJdsT0nSkXs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-ifffQ1d-PQuM9J_3qUrqPw-1; Fri, 26 Dec 2025 09:06:41 -0500
X-MC-Unique: ifffQ1d-PQuM9J_3qUrqPw-1
X-Mimecast-MFC-AGG-ID: ifffQ1d-PQuM9J_3qUrqPw_1766758001
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d5564057d0so16280024b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 06:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766758000; x=1767362800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8CRsSUdURwt+1GZdBpSW/7VDn07syF3EYe9jZf8o5o=;
        b=FS0XlRbBuoq2pgbC7Xhdlxhsq+1j3l2RQd0l8xfjqFGNxnfsnnP2hp6FLgjJrw0H0Q
         iniL7Chnk/gKXcG/mBgyl9nuzkMklIDYYN+iWq/9hvhxOgKzi6PDnBR83wKySIlf8qTw
         z1nq8/sQvRn/pZaDuL9yjf8LhoEAYo8tE2RmRkPstJZk1XOqxOUGiZ4/FAiaZ1T9dIGC
         ovEDJeDoNlblGpME6bg1HUbeShhDCyudKujV7Z64+TAdlyhIq1lGUSGTqQQc90SsRbFn
         vG9lqhWCct4k8Gp//pmcBvlAeRGtk/SiKUdBQDkJMhsvoCl009t2C3t4AwuDoXHbeY/c
         zsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlgpuFf1PP1mnN5JXGJfN1gFc/488gXykk9DKFt1BfQt7axkY0OJhyNE5ZcPINp7Vy5+M52R3KUC1jYog=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUZfQbEXZizTD6lcE/sd5B2czFrz4NBYzeV5bjtPwo6FIqnfC/
	KYDebrd33Y4buOkVv2m5KWNj0M6dQtJXbq10iXfy+u0joFH/S3+SlrzIgZr2xyeljRfIUbDdTYz
	q2AdgRWnjJGk1Gw2DKs6n9/momoPDtSvoKg/LRwQO43obYv9b9y/pUIE1Og6qWy/BC8k=
X-Gm-Gg: AY/fxX7E/i/4RrIjQqYgEbSryuLHL1A8iYh7VB8T5bnZgtpAgTSlknjpw3yb2vrp3dj
	yckWpqF/pvIFfFhIxCQewa0mY5bp56Nn6z+XZT/4oHxV2bZj8YVVHzEpzRFuuxgo1XjVWW18PTd
	XgSg7KA8CF+VuSEsOiZJOie5EMUDa1HTrsbOuJ6gFXzGXrxCohhLpdDs+DgDmHUs04fkUig5/uw
	sBYMHxWOIEpmt5iPpbyh3SX5Egid8u0dt3JkvUIV9hQoc5c2xsu5qa1+hF7bk1DO433e0goXiBO
	Ar75muuaE+GfSLaJUj3GD5IszW61+dFShBN3On8XT8fKmkRu7InPTT7Bi5t2EY36AJRzPmVyWMB
	5
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id d2e1a72fcca58-7ff650ce054mr23365524b3a.31.1766758000361;
        Fri, 26 Dec 2025 06:06:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq+tXbblae0dYr+YzPkKL41WZvOiKNnm8s7B4kCO2PLoNLBs1kWxXZWgS2A7pofhp162TWMw==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id d2e1a72fcca58-7ff650ce054mr23365480b3a.31.1766757999833;
        Fri, 26 Dec 2025 06:06:39 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm22379085b3a.51.2025.12.26.06.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 06:06:39 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Thomas Staudt <tstaudt@de.ibm.com>,
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Baoquan he <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
Date: Fri, 26 Dec 2025 22:06:35 +0800
Message-ID: <20251226140636.1378505-1-coxu@redhat.com>
X-Mailer: git-send-email 2.52.0
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jWwwKD7Lj4Iouf9QafMb1qH9vqSjKltJISBbri-HOqQ_1766758001
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds
LUKS-encrypted device dump target support to PowerPC by addressing two
challenges [1],
 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump.

1st kernel will build up the kernel command parameter dmcryptkeys as
similar to elfcorehdr to pass the memory address of the stored info of
dm-crypt keys to the kdump kernel.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/

Cc: Thomas Staudt <tstaudt@de.ibm.com>
Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Kairui Song <ryncsn@gmail.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/powerpc/include/asm/kexec.h |  3 ++-
 arch/powerpc/kexec/elf_64.c      | 26 +++++++++++++++++++++++++-
 arch/powerpc/kexec/file_load.c   | 19 +++++++++++--------
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bd4a6c42a5f3..f3d098d543b4 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -80,7 +80,8 @@ struct kimage_arch {
 };
 
 char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
-			  unsigned long cmdline_len);
+			  unsigned long cmdline_len,
+			  char *name, unsigned long addr);
 int setup_purgatory(struct kimage *image, const void *slave_code,
 		    const void *fdt, unsigned long kernel_load_addr,
 		    unsigned long fdt_load_addr);
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5d6d616404cf..57cb3361d91b 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -81,13 +81,37 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 		/* Setup cmdline for kdump kernel case */
 		modified_cmdline = setup_kdump_cmdline(image, cmdline,
-						       cmdline_len);
+						       cmdline_len,
+						       "elfcorehdr",
+						       image->elf_load_addr);
 		if (!modified_cmdline) {
 			pr_err("Setting up cmdline for kdump kernel failed\n");
 			ret = -EINVAL;
 			goto out;
 		}
 		cmdline = modified_cmdline;
+		cmdline_len = strlen(cmdline) + 1;
+
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret == -ENOENT) {
+			kexec_dprintk("No dm crypt key to load\n");
+		} else if (ret) {
+			pr_err("Failed to load dm crypt keys\n");
+			return ERR_PTR(ret);
+		}
+
+		if (image->dm_crypt_keys_addr != 0) {
+			modified_cmdline = setup_kdump_cmdline(image, cmdline,
+							       cmdline_len,
+							       "dmcryptkeys",
+							       image->dm_crypt_keys_addr);
+			if (!modified_cmdline) {
+				pr_err("Setting up cmdline for kdump kernel failed\n");
+				ret = -EINVAL;
+				goto out;
+			}
+			cmdline = modified_cmdline;
+		}
 	}
 
 	if (initrd != NULL) {
diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index 4284f76cbef5..e1c08050286d 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -23,38 +23,41 @@
 #define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
 
 /**
- * setup_kdump_cmdline - Prepend "elfcorehdr=<addr> " to command line
+ * setup_kdump_cmdline - Prepend "<name>=<addr> " to command line
  *                       of kdump kernel for exporting the core.
  * @image:               Kexec image
  * @cmdline:             Command line parameters to update.
  * @cmdline_len:         Length of the cmdline parameters.
+ * @name:                Name e.g elfcorehdr.
+ * @addr:                Memory address.
  *
  * kdump segment must be setup before calling this function.
  *
  * Returns new cmdline buffer for kdump kernel on success, NULL otherwise.
  */
 char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
-			  unsigned long cmdline_len)
+			  unsigned long cmdline_len,
+			  char *name, unsigned long addr)
 {
-	int elfcorehdr_strlen;
+	unsigned long parameter_len;
 	char *cmdline_ptr;
 
 	cmdline_ptr = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
 	if (!cmdline_ptr)
 		return NULL;
 
-	elfcorehdr_strlen = sprintf(cmdline_ptr, "elfcorehdr=0x%lx ",
-				    image->elf_load_addr);
+	parameter_len = sprintf(cmdline_ptr, "%s=0x%lx ", name, addr);
 
-	if (elfcorehdr_strlen + cmdline_len > COMMAND_LINE_SIZE) {
-		pr_err("Appending elfcorehdr=<addr> exceeds cmdline size\n");
+	if (parameter_len + cmdline_len > COMMAND_LINE_SIZE) {
+		pr_err("Appending %s=<addr> exceeds cmdline size\n", name);
 		kfree(cmdline_ptr);
 		return NULL;
 	}
 
-	memcpy(cmdline_ptr + elfcorehdr_strlen, cmdline, cmdline_len);
+	memcpy(cmdline_ptr + parameter_len, cmdline, cmdline_len);
 	// Ensure it's nul terminated
 	cmdline_ptr[COMMAND_LINE_SIZE - 1] = '\0';
+	kfree(cmdline);
 	return cmdline_ptr;
 }
 

base-commit: ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
-- 
2.52.0



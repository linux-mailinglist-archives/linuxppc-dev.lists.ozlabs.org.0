Return-Path: <linuxppc-dev+bounces-15296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089BCF7140
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 08:40:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dljl93VCwz2yKr;
	Tue, 06 Jan 2026 18:40:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767685253;
	cv=none; b=jVP8H68m8vDLzQgKm6x0jfL/GDIHmOtkmKhHxv9XTgYVOgK/z+RdpmlreRXJg52skYLY9GNXJdnWbVaXuQuxHuZVEmBrdZLXhLaiz9JS4onSOgmoHixo3uHCip/99g0ubIZPT4XW/rM/dMpUMHzVbzrLFetpYc17gU+mc7ir97Upbu3xLfoLqsR475Wi0iNlv6sIlhP8lzovE/URWPZ1XsrbXVtnvXwaRsGKDqNIbU3TgV/M6E8y2m2zYhizrmHM92D0gpNm1NO+VWiwCoOnFQjyrlAE14gegWOr6S4RxrE5IeKB33H5cXKFRtLso611Afi8+QN5VaY+4o3eP10WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767685253; c=relaxed/relaxed;
	bh=T2K+6XYuDT2faPkgFNRf0MMgXkPW9/hzNvicOemZ75A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=VzPukUyg9JOWev82nxAsrQT23m7ka8V4Xerlxq4c4tj5OLdSz1PvYQn3sHwbWoDvbRFdJGbUX3bCfxUWuegSbt2Ju/508InuK56Xm6awvjB9uvn6jSwqtFKF8Iy3kROVQVFESze2ChbJkSZVAHT/7SxkQqvxpeShEC1VKnl2k0CFqVsU5+5OTYevuMC+iPerO4u+WIKs55Qb2jtyVIsyyTBzwyeEEm/ix9Iwgj/vXIi6TOLKsbp6fK4pCKD0P0jlSh4KZe7q3vyUpMvrdljPQXRp8Kf4sR4l+DkCGbL3OqIKQf7mK94fx6QpJKbQJmog5GWa8C3QenRyhkRAnkUfLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=At4LGi6Q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=At4LGi6Q; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=At4LGi6Q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=At4LGi6Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dljl81K3zz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 18:40:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767685247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2K+6XYuDT2faPkgFNRf0MMgXkPW9/hzNvicOemZ75A=;
	b=At4LGi6QRfqkI0AQfk55/zKYlYLb3H3ICSMZaCTUEyRp6IqLqNGVS55Vji0xBBAfWZ+Y11
	mJgbh+5gx58UvhM/XuDbOkt3g0EnslY1/xXY0GKvZJoDgSBV+KT65rsllEHVtvl05Yp8H2
	a5Hz1jgcX6jWcga4R2xqpBI6PO14l4I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767685247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2K+6XYuDT2faPkgFNRf0MMgXkPW9/hzNvicOemZ75A=;
	b=At4LGi6QRfqkI0AQfk55/zKYlYLb3H3ICSMZaCTUEyRp6IqLqNGVS55Vji0xBBAfWZ+Y11
	mJgbh+5gx58UvhM/XuDbOkt3g0EnslY1/xXY0GKvZJoDgSBV+KT65rsllEHVtvl05Yp8H2
	a5Hz1jgcX6jWcga4R2xqpBI6PO14l4I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-aDpN5sOxNueGtijma9ZzDg-1; Tue, 06 Jan 2026 02:40:45 -0500
X-MC-Unique: aDpN5sOxNueGtijma9ZzDg-1
X-Mimecast-MFC-AGG-ID: aDpN5sOxNueGtijma9ZzDg_1767685244
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so2181819a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685244; x=1768290044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2K+6XYuDT2faPkgFNRf0MMgXkPW9/hzNvicOemZ75A=;
        b=u/PxWAYN5ioMCm+fdPBppSIhfkWBXZGx2QjoPygchQIgvq9krX2tFaIFr9CCiDbq23
         ejH4mWcHKj2Uq62rWbiR58XrEL1uBYEHFdefPlCPVEf7jAfRwQpzpJORHTYAVsNJpru+
         me7fmxrKDLguCqnFiriAyYyFK7Xjc5sWR8BrVCVK4q1s8GgAA9Q5/ffYajArwble9HGF
         0LfNiFOmQu8LLFA8WrH1VU9V9OBzrtwHwFzTOQNFr6GKgnCFalFW+kd/OsZVLR7zjh9Z
         15+NLm7ntrsf6xPZftxSiPfNrg2Iipf+6nchBvyROL2dQ23JMeS4fT0CoAQfQg0JG4+J
         +yyw==
X-Forwarded-Encrypted: i=1; AJvYcCWzaJ07IY1FDiXV/3Wp9U6asuI35zimd90+6yhpIhvDd43bCBv87vgb5rntkvRM+gK2SyprOa95iDqIeGQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwScfpVbnz81WmsskjKLeery8Cr1l4xppCw8USRKnfN0oPUvo7a
	Npqd51xyyo06qn5JcbyTncCs0+J8hF/bERFuBnwkBVHl/D7z2gqCvallfj6PBi51gcsqyr1I18K
	mFUI0Q1beY1FWopGG2FMICKqhdGXtOTQecvDMNhdYn1giTOhQE+o8ZrEFaV2ubndDxU0=
X-Gm-Gg: AY/fxX4zOK06BSL6K8z9UQcebYmibsCCrLc9Dfu5cm2fikgeAYBlevQUQwQhck9NINb
	ifR1AbBHZZyfBNLnh8od+i5835QAt5eHBJ+mtXp/UhuSyU2ezlv7Gtc5NWBDPilwv621rkW3Muj
	ult/54+dvIGeSP8BedOf2j7i4uMB38COlJKdg9DS8WjAZV/PDJdRAnyefML6g3z2e/JJmCnraDx
	g1An7PxZF4gYNy5PdOGFEvqmCNEP/N5ILFmd8k0LBW9RpARxzu9Hv1Bk7EtTuZlQQ71zX62k1Wd
	b+YKd9U2eWcdc1c7yzbk+waVXRNh7pI9+nUH6V3JBI+B7xWIAeZvdb9NKmulLFdsV/cOTIEP1SR
	s
X-Received: by 2002:a05:6a21:6d98:b0:35d:c68e:1b07 with SMTP id adf61e73a8af0-389823e5d3fmr1735572637.54.1767685244275;
        Mon, 05 Jan 2026 23:40:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVUzWKzSkNqbLbBe+L/snCjJ0oavUrUixh1GN3s9rZlQu+O972p1pSFAutekovPq/olCdVFQ==
X-Received: by 2002:a05:6a21:6d98:b0:35d:c68e:1b07 with SMTP id adf61e73a8af0-389823e5d3fmr1735547637.54.1767685243733;
        Mon, 05 Jan 2026 23:40:43 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2a3sm13338605ad.13.2026.01.05.23.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:40:43 -0800 (PST)
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
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Vivek Goyal <vgoyal@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] powerpc/kdump: pass dm-crypt keys to kdump kernel
Date: Tue,  6 Jan 2026 15:40:38 +0800
Message-ID: <20260106074039.564707-1-coxu@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226140636.1378505-1-coxu@redhat.com>
References: <20251226140636.1378505-1-coxu@redhat.com>
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
X-Mimecast-MFC-PROC-ID: c43Sj8o6WiLKha30CxaMV7ya_zuaNkQKL33BRYDRdL0_1767685244
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
device dump target by addressing two challenges [1],
 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump.

To also enable this feature for PowerPC, we only need to let 1st kernel
build up the kernel command parameter dmcryptkeys as similar to
elfcorehdr to pass the memory address of the stored info of dm-crypt
keys to the kdump kernel.

Note to avoid a building failure [2] caused by undeclared function
crash_load_dm_crypt_keys when CONFIG_CRASH_DUMP is not enabled,
realign the function declaration with CONFIG_CRASH_DM_CRYPT.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/

Cc: Thomas Staudt <tstaudt@de.ibm.com>
Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Kairui Song <ryncsn@gmail.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
v2:
- fix double kfree issue [Sourabh]
- corretly kfree old modified_cmdline
- use imperative mood for commit message
- fix a compiling error caught by kernel test robot

 arch/powerpc/include/asm/kexec.h |  3 ++-
 arch/powerpc/kexec/elf_64.c      | 27 ++++++++++++++++++++++++++-
 arch/powerpc/kexec/file_load.c   | 18 ++++++++++--------
 include/linux/crash_core.h       | 14 +++++++-------
 4 files changed, 45 insertions(+), 17 deletions(-)

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
index 5d6d616404cf..995d7e8e98e1 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -81,13 +81,38 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
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
+			kfree(cmdline);
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
index 4284f76cbef5..9964c57785f5 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -23,36 +23,38 @@
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
 	return cmdline_ptr;
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index d35726d6a415..e128270c703f 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -34,13 +34,6 @@ static inline void arch_kexec_protect_crashkres(void) { }
 static inline void arch_kexec_unprotect_crashkres(void) { }
 #endif
 
-#ifdef CONFIG_CRASH_DM_CRYPT
-int crash_load_dm_crypt_keys(struct kimage *image);
-ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
-#else
-static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
-#endif
-
 #ifndef arch_crash_handle_hotplug_event
 static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
@@ -96,4 +89,11 @@ static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
 #endif /* CONFIG_CRASH_DUMP*/
 
+#ifdef CONFIG_CRASH_DM_CRYPT
+int crash_load_dm_crypt_keys(struct kimage *image);
+ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
+#else
+static inline int crash_load_dm_crypt_keys(struct kimage *image) { return 0; }
+#endif
+
 #endif /* LINUX_CRASH_CORE_H */

base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
-- 
2.52.0



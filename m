Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C34FF1BC057
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 15:56:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BNTd6L2HzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 23:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uugDtdaa; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BMjN3zwmzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:21:12 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c21so7545856plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vloW/Le5uTQWcHYDSa4UBFwJd+x/1yJE7+IrW0Uir68=;
 b=uugDtdaaPea9Qem1yWXNMLi9gRG0GI/Vgl/Z+2D8dNgR0YSKpud6IPhbq5RS8gDIWD
 zdrj7X8QwHwITgj6rGtnWk9zsSUe+HdFNCjSJgQycxot+o2TGvW23sKBdrguYrSdNXYW
 kyPeeRIVqQ4jme4VsO/ZAU0BbglFDS24Lg4v/vb9GO3GmRnykawt7JA36rysNz8P02yx
 QChX37YVxcMRuhA6NgC8s81uDJU3cyxsab1R1vx0DHFubvApL6dvSBOXChEPEbdHtvlb
 rUrB40lVSAlmD+hrnrNFidfvV/YfhQjh3KiwIOO5XfmR3Sy8QiL2HnXDuhL7p0kxD2Hf
 2/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vloW/Le5uTQWcHYDSa4UBFwJd+x/1yJE7+IrW0Uir68=;
 b=fD+hMVtJ8zRUUtFAOClySTZ9JYY7TW0RvsC0ul9FekAHs1LzuS4VyZJnBoVs1lBSi4
 zg3FzhG8M9lJulsr2MWv67WICoF3rCLG2HlunY/Uuj7OpzJrBEwkifRGuo3tti1zNst0
 GI+yTQkNDjE/w0jj6yTOABOJx/lyRIl/amGtu7g29LaM5ODqzxnv5P12sUH4uyQwnYel
 P4odOQmUKL5gUD9eilk6RaK8Se+z5dtQ69hjlfkAkRfxxo5ZtJuSuGyr4LiRyd7GKwEh
 ZAQPAi9tNfzKwiQTYmAPb92mzmWHkEwPAVc0TFR+GSjfOpxXwpKZc1Z2dCax/3Q2qEMu
 YVeQ==
X-Gm-Message-State: AGi0Pua1S8IWgoeFDKzPKuxAyFrXCFKoMwgpBQC76i+nEXE8ixgQOUYE
 mjVATlOhd0Bm4fMRa7paF9E=
X-Google-Smtp-Source: APiQypIcd+DvKwzZS/3gA8jfo7SAiP8Tv8dawrVg3z4qxHYJvH/TJSd8+LSZgGW5y8rVr0Og2hpZLQ==
X-Received: by 2002:a17:90a:3268:: with SMTP id
 k95mr4895519pjb.185.1588080067940; 
 Tue, 28 Apr 2020 06:21:07 -0700 (PDT)
Received: from gnu-cfl-2.localdomain (c-69-181-90-243.hsd1.ca.comcast.net.
 [69.181.90.243])
 by smtp.gmail.com with ESMTPSA id r12sm12957662pgv.59.2020.04.28.06.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 06:21:07 -0700 (PDT)
Received: from gnu-cfl-2.localdomain (localhost [IPv6:::1])
 by gnu-cfl-2.localdomain (Postfix) with ESMTP id 511E7C037D;
 Tue, 28 Apr 2020 06:21:06 -0700 (PDT)
From: "H.J. Lu" <hjl.tools@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Discard .note.gnu.property sections in generic NOTES
Date: Tue, 28 Apr 2020 06:21:05 -0700
Message-Id: <20200428132105.170886-2-hjl.tools@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200428132105.170886-1-hjl.tools@gmail.com>
References: <20200428132105.170886-1-hjl.tools@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Mackerras <paulus@samba.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the command-line option, -mx86-used-note=yes, the x86 assembler
in binutils 2.32 and above generates a program property note in a note
section, .note.gnu.property, to encode used x86 ISAs and features.  But
kernel linker script only contains a single NOTE segment:

PHDRS {
 text PT_LOAD FLAGS(5);
 data PT_LOAD FLAGS(6);
 percpu PT_LOAD FLAGS(6);
 init PT_LOAD FLAGS(7);
 note PT_NOTE FLAGS(0);
}
SECTIONS
{
...
 .notes : AT(ADDR(.notes) - 0xffffffff80000000) { __start_notes = .; KEEP(*(.not
e.*)) __stop_notes = .; } :text :note
...
}

The NOTE segment generated by kernel linker script is aligned to 4 bytes.
But .note.gnu.property section must be aligned to 8 bytes on x86-64 and
we get

[hjl@gnu-skx-1 linux]$ readelf -n vmlinux

Displaying notes found in: .notes
  Owner                Data size Description
  Xen                  0x00000006 Unknown note type: (0x00000006)
   description data: 6c 69 6e 75 78 00
  Xen                  0x00000004 Unknown note type: (0x00000007)
   description data: 32 2e 36 00
  xen-3.0              0x00000005 Unknown note type: (0x006e6558)
   description data: 08 00 00 00 03
readelf: Warning: note with invalid namesz and/or descsz found at offset 0x50
readelf: Warning:  type: 0xffffffff, namesize: 0x006e6558, descsize:
0x80000000, alignment: 8
[hjl@gnu-skx-1 linux]$

Since note.gnu.property section in kernel image is never used, this patch
discards .note.gnu.property sections in kernel linker script by adding

/DISCARD/ : {
  *(.note.gnu.property)
}

before kernel NOTE segment in generic NOTES.

Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/asm-generic/vmlinux.lds.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 71e387a5fe90..95cd678428f4 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -833,7 +833,14 @@
 #define TRACEDATA
 #endif
 
+/*
+ * Discard .note.gnu.property sections which are unused and have
+ * different alignment requirement from kernel note sections.
+ */
 #define NOTES								\
+	/DISCARD/ : {							\
+		*(.note.gnu.property)					\
+	}								\
 	.notes : AT(ADDR(.notes) - LOAD_OFFSET) {			\
 		__start_notes = .;					\
 		KEEP(*(.note.*))					\
-- 
2.25.4


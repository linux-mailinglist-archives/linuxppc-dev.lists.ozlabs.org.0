Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F51BB39C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 03:52:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B4R06ZynzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 11:52:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tMY7Nqx0; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4Ln2xp8zDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:49:04 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s18so6875033pgl.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vloW/Le5uTQWcHYDSa4UBFwJd+x/1yJE7+IrW0Uir68=;
 b=tMY7Nqx0yqobkZe58YFhx1OG8yv4pf1IV9qs+bvamO0ssZ2DNHnvG9NWFBdyJ9zDhq
 3NhdKMcuGNglY0QeMweyW3U2rebJhB5xvUW03S8hTpb2axpkIL4LmSie7xv3Bz62ZwM1
 2BMffB9lJb7ZswTHs481noJ5CUOIo//yGyCBf6lVS0VEEeSowKcgM/eOn9EdY2nFKUkq
 OuxDgnm0HxCUwwMHMvGyGKQwpiGmQzpwRM23EMdJHC83mqrQ09+TuyCh8iShhOD/Uad0
 QE8Zuj8UnFf0Ani8mhF33kVeWYBepv5F7VAhs2ZOz2yfKR8tuVrSbpNaAa/3885mDRi5
 uMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vloW/Le5uTQWcHYDSa4UBFwJd+x/1yJE7+IrW0Uir68=;
 b=WpiQERMqsW+eUPzxcxueKSKF9XrGyq6yk7u2fiRqUm8vbi6d21zDSQoG9agzDv67Kf
 A80MfU7EF2D5QBU2/EFC7QZQ5PDwCF8LZiIMSL3JhZ2J3GXEYxkisWbbjyn4odBwWigo
 Q2NB0Cxtfp78FcMIpVIQXR2yGM4SKeIKPMYMgoB+iIMqltGFWp+xJ9YbuCJGll46rQh7
 7Or0aritPb5ratjG6TLRkmxOJKjr7GE80EJU++UXqM+gx/gwLyfkfggdZw4H9kQY1vST
 MW2d+/GwID0XyctXWbSDW80i8ZjwJ9mjIurBvU+O55VL+NcD73VnYPDVUMHz6uUL824o
 4lsw==
X-Gm-Message-State: AGi0PuafYHAqjNjE5goU8zAp+vCf1nFv1s+IFQ9qi8czWUp2PrYx+P/K
 Okv6u4zneYUHpISDJyPVIpQ=
X-Google-Smtp-Source: APiQypIrs/KyEZGo9isIYbNHduvrckXj0XCrJMMoQhBOT/pJSBv9dMK3h8aO2de9vySF1HvRt3aMWg==
X-Received: by 2002:a63:f958:: with SMTP id q24mr6909810pgk.338.1588038542846; 
 Mon, 27 Apr 2020 18:49:02 -0700 (PDT)
Received: from gnu-cfl-2.localdomain (c-69-181-90-243.hsd1.ca.comcast.net.
 [69.181.90.243])
 by smtp.gmail.com with ESMTPSA id t188sm11667641pgb.80.2020.04.27.18.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:49:01 -0700 (PDT)
Received: from gnu-cfl-2.localdomain (localhost [IPv6:::1])
 by gnu-cfl-2.localdomain (Postfix) with ESMTP id 9E060C034D;
 Mon, 27 Apr 2020 18:49:00 -0700 (PDT)
From: "H.J. Lu" <hjl.tools@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Discard .note.gnu.property sections in generic NOTES
Date: Mon, 27 Apr 2020 18:49:00 -0700
Message-Id: <20200428014900.407098-2-hjl.tools@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200428014900.407098-1-hjl.tools@gmail.com>
References: <20200428014900.407098-1-hjl.tools@gmail.com>
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


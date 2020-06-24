Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C56206AD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 06:01:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s8Zz2bYkzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 14:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OKiltaF1; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s8Y90lhZzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:59:39 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id p70so642244oic.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 20:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnEdc0adKymab+qTSEaLkwtzD9ZgZSbPfaKonk964fY=;
 b=OKiltaF1uMCaw3/rXHHtnDBJq6LDvUOveCzJD8ZGFs3252odcaMZM+EWC1P5hQVuj+
 +dCZcBqeK9VpAr4JzKe7Ipid7gGEWu0QpazZSY7IDTV3pdEpyVdeL4ZgYW4w78TcaTbb
 QVeTm5wzTZXwn8jqVd6Hu5K/wnUooTFiOc3f6c1rO/EeNK2H5kCJG4eCLC/Iak1kTBI0
 D+afQNI7Xn4vkw2TVyp+n8Jr9awtSpGiDbcfmWatJgOiXgiYejsdQWr34mGkRkBtp9OE
 wB469Ra0RALYhJkazPozIBZE7pkqgaRCUkTw1bAxLI7Olzdz7UtT4MCpddyqyB9kl+fR
 mi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnEdc0adKymab+qTSEaLkwtzD9ZgZSbPfaKonk964fY=;
 b=X5qHKcZwwAkpVosScpbE9HASXU33Z54JBFx8qGjUZj2TBiTH8C/Cy2karpzHYco8kM
 JaSmk/A7xnlqBm/Ea7ydKatWCjv04aL2SHj7H/8cfg0wMoXT6cQYBbV/+t4x4vceGGgz
 aBuk4TDNfVxh4NBnsaPxYXDuIfTiAO3q/wrsu9PvuKzjhYdLlm58emqlXn2mNtbNajqa
 +4OjXNE8GSM2C9VJKzAn6HFfQZeVI2TfLdK2cfnxACMe9XaPJmDfozBJ6Z8uX6qu0oMY
 CUDzV+W2mBKF4uU6jcQIXGrAUOoWSYF0Kxf4qlxhu2lUU/xOM/dmmS/Fk9tcm0GJAQ02
 U4sA==
X-Gm-Message-State: AOAM531yqbv4teoV6ZplsxAQVVSMwvCH7Da9+DHyNNFe92X8iXLg7XhN
 rWs8kLdJao7ZAiBiUXPJcyc=
X-Google-Smtp-Source: ABdhPJw2T7FOEBgquf/Z1s88BHwaqOlkic9kTzx/Dy1aJI7YmtncjwU5hZZUgPhTjGDmapGzZaM5bQ==
X-Received: by 2002:aca:1e0b:: with SMTP id m11mr19113749oic.147.1592971176070; 
 Tue, 23 Jun 2020 20:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id m20sm4538380ots.13.2020.06.23.20.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 20:59:35 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/boot: Use address-of operator on section symbols
Date: Tue, 23 Jun 2020 20:59:20 -0700
Message-Id: <20200624035920.835571-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

arch/powerpc/boot/main.c:107:18: warning: array comparison always
evaluates to a constant [-Wtautological-compare]
        if (_initrd_end > _initrd_start) {
                        ^
arch/powerpc/boot/main.c:155:20: warning: array comparison always
evaluates to a constant [-Wtautological-compare]
        if (_esm_blob_end <= _esm_blob_start)
                          ^
2 warnings generated.

These are not true arrays, they are linker defined symbols, which are
just addresses.  Using the address of operator silences the warning
and does not change the resulting assembly with either clang/ld.lld
or gcc/ld (tested with diff + objdump -Dr).

Link: https://github.com/ClangBuiltLinux/linux/issues/212
Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/boot/main.c | 4 ++--
 arch/powerpc/boot/ps3.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index a9d209135975..cae31a6e8f02 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -104,7 +104,7 @@ static struct addr_range prep_initrd(struct addr_range vmlinux, void *chosen,
 {
 	/* If we have an image attached to us, it overrides anything
 	 * supplied by the loader. */
-	if (_initrd_end > _initrd_start) {
+	if (&_initrd_end > &_initrd_start) {
 		printf("Attached initrd image at 0x%p-0x%p\n\r",
 		       _initrd_start, _initrd_end);
 		initrd_addr = (unsigned long)_initrd_start;
@@ -152,7 +152,7 @@ static void prep_esm_blob(struct addr_range vmlinux, void *chosen)
 	unsigned long esm_blob_addr, esm_blob_size;
 
 	/* Do we have an ESM (Enter Secure Mode) blob? */
-	if (_esm_blob_end <= _esm_blob_start)
+	if (&_esm_blob_end <= &_esm_blob_start)
 		return;
 
 	printf("Attached ESM blob at 0x%p-0x%p\n\r",
diff --git a/arch/powerpc/boot/ps3.c b/arch/powerpc/boot/ps3.c
index c52552a681c5..6e4efbdb6b7c 100644
--- a/arch/powerpc/boot/ps3.c
+++ b/arch/powerpc/boot/ps3.c
@@ -127,7 +127,7 @@ void platform_init(void)
 	ps3_repository_read_rm_size(&rm_size);
 	dt_fixup_memory(0, rm_size);
 
-	if (_initrd_end > _initrd_start) {
+	if (&_initrd_end > &_initrd_start) {
 		setprop_val(chosen, "linux,initrd-start", (u32)(_initrd_start));
 		setprop_val(chosen, "linux,initrd-end", (u32)(_initrd_end));
 	}

base-commit: 3e08a95294a4fb3702bb3d35ed08028433c37fe6
-- 
2.27.0


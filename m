Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8E2742E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 03:58:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458Xj507c2zDqRh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 11:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="f+KA8NLB"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458Xgk1FvbzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 11:57:19 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id go2so1944948plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 18:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KBz4SPboR1t+ROthTDIJtlbAEsKh+bVnmWyrNYyeyfM=;
 b=f+KA8NLBP9hAdcMbs6K9uzmnFmldENkfQNbdZhqmN6Bkr+2bHoaeYP+mFdbZMSZGaX
 mkkI4ZVu63Xno+nmh0dAY5giGkySl8KfN7HrRT3YzETBCMAn2dkYolapWgN/bLVkv6F4
 XodQ7Fl+MuVVTC0fjcberzqn8iegAevozxIg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KBz4SPboR1t+ROthTDIJtlbAEsKh+bVnmWyrNYyeyfM=;
 b=dYo2iPyjlmAxbYOS/YLuQM+MVL6EhcixtbUyDcn7XonsDlhc38dw1eKTOoRiIwEi8p
 unFA0OafHmSEBZM0hcgvzao4wTAP8MrApBCA4+S9g4sgnMLJJXw/SvWIKashMcok7wi5
 XHgOUmgcjUCjJD+BBO4iIkBPkBQCfhx6OUAp/qnSTYuSSTU1Y5BZe9exsvCbOc7oluXD
 N/nIkzRek2VSEJ57rRMygSkTd55YJyEotuYfWurLzNNpO+eePupufqGTx/C0NQsgd7Rh
 jC9S6wp1bRw9BdRT4uSguiyWn4V+cJgJnnWwN4wkE3HUe92H9uW56q8Ufqmfyskj+dgT
 5JWQ==
X-Gm-Message-State: APjAAAX2es4L9koEfqy2OaSKw0TW0ckrDeqO1txiy9LhlVypPOv/pdLD
 81n5iEhMccYS+IQJg+xc72tiQjUVApg=
X-Google-Smtp-Source: APXvYqzlwCnTHo91dA97n7nMhnqCuilMZNisdppat7tvEIftdSNv0m7L6RbU9JZiWxJzEtwTB+1VYg==
X-Received: by 2002:a17:902:2924:: with SMTP id
 g33mr68009406plb.57.1558576635771; 
 Wed, 22 May 2019 18:57:15 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id u134sm37551279pfc.61.2019.05.22.18.57.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 18:57:15 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: pseries/hvconsole: fix stack overread
Date: Thu, 23 May 2019 11:57:08 +1000
Message-Id: <20190523015708.20395-1-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
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
Cc: Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While developing kasan for 64-bit book3s, I hit the following stack
over-read.

It occurs because the hypercall to put characters onto the terminal
takes 2 longs (128 bits/16 bytes) of characters at a time, and so
hvc_put_chars would unconditionally copy 16 bytes from the argument
buffer, regardless of supplied length. However, sometimes
hvc_put_chars is called with less than 16 characters, leading to the
error.

Use memcpy to copy the correct length.

==================================================================
BUG: KASAN: stack-out-of-bounds in hvc_put_chars+0x44/0xc0
Read of size 8 at addr c00000000169fac0 by task swapper/0

CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0-rc2-00065-g7e26a58cb076 #43
Call Trace:
[c00000000169f770] [c000000000e83900] dump_stack+0xc4/0x114 (unreliable)
[c00000000169f7c0] [c0000000003f3034] print_address_description+0xd0/0x3cc
[c00000000169f850] [c0000000003f2c0c] kasan_report+0x20c/0x224
[c00000000169f920] [c0000000003f4808] __asan_load8+0x198/0x330
[c00000000169f9c0] [c0000000000d7264] hvc_put_chars+0x44/0xc0
[c00000000169fa40] [c00000000089b998] hvterm_raw_put_chars+0x78/0xb0
[c00000000169fa80] [c00000000089bff0] udbg_hvc_putc+0x110/0x1a0
[c00000000169fb30] [c000000000036610] udbg_write+0xa0/0x1a0
[c00000000169fb80] [c0000000001b9cd4] console_unlock+0x694/0x810
[c00000000169fc80] [c0000000001bc5ec] vprintk_emit+0x24c/0x310
[c00000000169fcf0] [c0000000001bde04] vprintk_func+0xd4/0x250
[c00000000169fd40] [c0000000001bd088] printk+0x38/0x4c
[c00000000169fd60] [c0000000012ec4a0] kasan_init+0x330/0x350
[c00000000169fde0] [c0000000012dc304] setup_arch+0x4b4/0x504
[c00000000169fe70] [c0000000012d3e50] start_kernel+0x10c/0x868
[c00000000169ff90] [c00000000000b360] start_here_common+0x1c/0x53c

Memory state around the buggy address:
 c00000000169f980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 c00000000169fa00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>c00000000169fa80: 00 00 00 00 f1 f1 f1 f1 01 f2 f2 f2 00 00 00 00
                                           ^
 c00000000169fb00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 c00000000169fb80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================

CC: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/platforms/pseries/hvconsole.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hvconsole.c b/arch/powerpc/platforms/pseries/hvconsole.c
index 74da18de853a..c39907b635eb 100644
--- a/arch/powerpc/platforms/pseries/hvconsole.c
+++ b/arch/powerpc/platforms/pseries/hvconsole.c
@@ -67,9 +67,10 @@ EXPORT_SYMBOL(hvc_get_chars);
  */
 int hvc_put_chars(uint32_t vtermno, const char *buf, int count)
 {
-	unsigned long *lbuf = (unsigned long *) buf;
+	unsigned long lbuf[2];
 	long ret;
 
+	memcpy(lbuf, buf, count);
 
 	/* hcall will ret H_PARAMETER if 'count' exceeds firmware max.*/
 	if (count > MAX_VIO_PUT_CHARS)
-- 
2.19.1


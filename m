Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDF5E934
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:34:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f6Bh4ygHzDqB9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 02:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=huangfq.daxian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bf5rKFF1"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6443VmjzDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 02:28:36 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u14so346765pfn.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q6zTyc1nJv74vcvWUitF7l7G4qhmg90JLY7Dww6BU2M=;
 b=bf5rKFF1VVweUEDVW7/N2C3+96UepGoqntMuJ4l8GRvxYH48sUaPglMQlPBIH/8i2S
 FU0TPl/G/Z0sVcAdC3x3GOuQ+OeE8U21/fO576KyFmLgdvn2p646emSbQcmqaAW2M0i0
 jfBrfPrROSgiaSh2UUF/g0AxZ8bzLYhGYgWb6F8gm6fnAFM43OMfX0eUbjcv8FE0+blB
 7WzuZ3luopqlqQ3CLP+//cnVWFcOdnD8mg6JYjBOEJTSNS+IJ7mXhpVX/ZykYfn3F2Kb
 BmDJ/ZGJn8QhyQlpD0dkGWCoLyLYFyNkDsMoXbxsy4M9J17gyVbrVTWFm8rNkGTNiCjt
 YEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q6zTyc1nJv74vcvWUitF7l7G4qhmg90JLY7Dww6BU2M=;
 b=Th/vJcjqAz7lg+jsh59Ufr7zIoqyh2clT1dXDwQXkuQGryVlSjjW6ImQPxegkFb9kv
 Fdw3xCZkHohIq2BAx31BDpouH6u8QKxWqrvYRULvHwG368+E/hMjPD2DeGT/yf+6YeWQ
 fHeeL6JfqOlO8UlnDkNE5yqH4yD1rVXs/YrbPSqTeEi+j5yLQbNZjSwVlODLRbrsxPi0
 ovxkDXXuHo1yvs8j340BborpqkKmfcpgBSTmO7ufnAyDFRpTcvetQF3DFluBf6VhW+qv
 XzN7ehBJSImQfT+Cm1cGX9Nj8zmFuZqUKFM217cVEEmpUDbSFd+QIF7TRzYvvzEjHLiL
 NFKg==
X-Gm-Message-State: APjAAAWKRjckYjBFce+SkoIjda9XGK88RHBP5ZA2um4h/ymNph8Y5BwB
 qs+XHwoOw2kB3QDe5pI412U=
X-Google-Smtp-Source: APXvYqzuBu3lAhBxTAQpWu9qrEW9LmiH0SxWOGf/XoqbG/JYoGdIN8FmDpjEURl3KtjESfKXkb8GMw==
X-Received: by 2002:a63:1e0b:: with SMTP id e11mr15175199pge.402.1562171313251; 
 Wed, 03 Jul 2019 09:28:33 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id e11sm6589912pfm.35.2019.07.03.09.28.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:28:32 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 10/35] macintosh: Use kmemdup rather than duplicating its
 implementation
Date: Thu,  4 Jul 2019 00:28:21 +0800
Message-Id: <20190703162821.32322-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 drivers/macintosh/adbhid.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index 75482eeab2c4..5d14bebfb58f 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -789,7 +789,8 @@ adbhid_input_register(int id, int default_id, int original_handler_id,
 
 	switch (default_id) {
 	case ADB_KEYBOARD:
-		hid->keycode = kmalloc(sizeof(adb_to_linux_keycodes), GFP_KERNEL);
+		hid->keycode = kmemdup(adb_to_linux_keycodes,
+			sizeof(adb_to_linux_keycodes), GFP_KERNEL);
 		if (!hid->keycode) {
 			err = -ENOMEM;
 			goto fail;
@@ -797,8 +798,6 @@ adbhid_input_register(int id, int default_id, int original_handler_id,
 
 		sprintf(hid->name, "ADB keyboard");
 
-		memcpy(hid->keycode, adb_to_linux_keycodes, sizeof(adb_to_linux_keycodes));
-
 		switch (original_handler_id) {
 		default:
 			keyboard_type = "<unknown>";
-- 
2.11.0


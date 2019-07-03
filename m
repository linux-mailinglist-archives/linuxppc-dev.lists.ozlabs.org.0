Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F145E54A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 15:21:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f1w41mxSzDqGx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:21:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=huangfq.daxian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lfIH0IUL"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f1ml5cNpzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 23:15:03 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q10so1264591pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TOAiuu/wlD5D7o5/mqIHnTG4uZtldrOoIUofef28WiU=;
 b=lfIH0IUL8bnlFMDRimVxIwkNQ/20moehxMR8XeG6e1vo0CHjFIa7S4/IFzeJrzgJlU
 q2EJ1FOEjXJguDQSyMFXH7k3X9n1scvRb7MkJjtKkRBfWxe8gnqZdhJTTVtiiemk1hZ8
 JEsWEwZyeYK5LrcZYxqtxqYOB84MaPfNmB0WpIoCWpbsKR17eWSZ/DL4BpVsMdWBspi3
 XBGVX5QsFJ2A9jlFpjBiIrBKWiWS6s+R4q4WHhiK4NP1F7C+nhehr4iK/vSnZH9RFSc2
 eCufZv73Y0MyVNOl+ObekcnzpEHus2zpOUjXEVq9ou6kVad7pijQPkngK46W9dWsm/zJ
 axEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TOAiuu/wlD5D7o5/mqIHnTG4uZtldrOoIUofef28WiU=;
 b=IjeKZFAXV53mfVy2FH74dQzKwU0Ccy3LTK61qTTyyrK4efI59OyCeVgLbWkoZuY0RE
 bV8KazzhaG9oKJROv9MIIQPe9L1voUJQ/WSh85phXZ0tRLKUGkYQMmoT1xDJaW6ytsd0
 NDibKpNdKzGB9HYWfg6PyldX8cz2gZyFqdbQzAAUx1I6wh/V3mlNpHGV0+ZsRSOutgWr
 +yto4P+fEa9pfe5HVwLDNJ5oGUdDEUScAzxpNj+/Tucf9SeZgFczGsvNbxD1nH6k1fWs
 zmsuX1MWi8+pykbTtcx+yoYjQeg60fH0ZoK+HmKL2E84RDovwUWT5BnTxxT1b4Rw8gAU
 3+hw==
X-Gm-Message-State: APjAAAX74lKOqPTNW/AUj8bpiSLqDn5kzee6RyN781iom6YpmZG7R5w1
 yD5BjrZnY7OTn9Yw98OQONE=
X-Google-Smtp-Source: APXvYqyiVfU9tnl97ooPeC5zImq20DdkMsp/940AfLqBE2Jk+gaxyNTMhh6g4w5deJAwDI1B1gTb8A==
X-Received: by 2002:a63:f510:: with SMTP id w16mr37865515pgh.0.1562159700244; 
 Wed, 03 Jul 2019 06:15:00 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id j14sm2877028pfn.120.2019.07.03.06.14.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 06:14:59 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 09/30] macintosh: Use kmemdup rather than duplicating its
 implementation
Date: Wed,  3 Jul 2019 21:14:52 +0800
Message-Id: <20190703131452.25085-1-huangfq.daxian@gmail.com>
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
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
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


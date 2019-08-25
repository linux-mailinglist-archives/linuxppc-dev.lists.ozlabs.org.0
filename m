Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E897D9C410
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 15:47:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Gbzr5ghDzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 23:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BBTUSTiF"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbT95GZrzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:24:29 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id u17so8740173pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AnjEbtcd5cNHwbypnsrs4cfSdZGE8Y8KXODnC5r+/Sw=;
 b=BBTUSTiFPulSXGVxfV98A1F0dTvb1nWs3kkM5cP9rBvuoglTt4LTj8MiMfMFJBcrsS
 MTkeTo7kfOO+E0w+tKCTnNl3c/QHQ2SSNUY9y0LVFtXPL9z4rM2CVMgGoJ5gO8pDVZ3K
 vpOFcvPN2hFCmHJbZGQeZy5BK6pHjBE8Plt63H0GmNLx4Vm2E5hg9Nh/n+QOK3km2hVD
 H13h6219G0X/DDyWj/h1KQ89LK+SNeEolCXmqpXmn50tXDlsOST1VLkuz+6fbZZ/VRDy
 KA2SYRSEYEHy+/fzoZr+9A/pwqozm+eDevLCy6f29pL0zilHLKXlEXyE9eRy40DxvdGs
 yOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AnjEbtcd5cNHwbypnsrs4cfSdZGE8Y8KXODnC5r+/Sw=;
 b=qQ4BLBMgBBEng8APHY10vnENMw5pGG2T+jzV6cLPnNkLXNEfodcHUcfHj3MXUq+2xG
 aC3lVlRCcBMFNaf25Fc6ZBAHzrJWmUq/KAlbVtbLkH91idr9nle/VwvJPty7ww+ccEUz
 3DDZ/qw/+uo6EvHQlS9vepV3HOnCS7jZuEi377XHUepVYzVV44e9YBNdNlYiJQfMH+nz
 wYqW94cpsUkH286O6l4OIt0UoQACFVMiMnG6/Wsf5Yp+7ui3u5RrmEmHH5WNLNIKx/uz
 kpNBMV+oKlubNBEO+Q3pcAgBkavFilZI+3kzKCITxhyAdXHnm9sdUCx1RFA9s/8xIOG0
 a2/Q==
X-Gm-Message-State: APjAAAXw7C90iBwhbG3xN22ZewJpxAw3ur5OuLS9QwY6jlfPy7wAGRqb
 OCQPEoTQAj5g9ZBhi6/wKUHxNLM8r6KSjA==
X-Google-Smtp-Source: APXvYqw6YJNQG1mv4TcaAIQFGH9uTD6ol5DJ8JkmCimZzRNBFxq3HdokK6aYuJxRfnvwrECLT3Lxsw==
X-Received: by 2002:a63:5b52:: with SMTP id l18mr12098178pgm.21.1566739466886; 
 Sun, 25 Aug 2019 06:24:26 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:24:26 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 05/11] ftrace: create memcache for hash entries
Date: Sun, 25 Aug 2019 21:23:24 +0800
Message-Id: <20190825132330.5015-6-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_FTRACE_FUNC_PROTOTYPE is enabled, thousands of
ftrace_func_entry instances are created. So create a dedicated
memcache to enhance performance.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 kernel/trace/ftrace.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index a314f0768b2c..cfcb8dad93ea 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -94,6 +94,8 @@ struct ftrace_ops *function_trace_op __read_mostly = &ftrace_list_end;
 /* What to set function_trace_op to */
 static struct ftrace_ops *set_function_trace_op;
 
+struct kmem_cache *hash_entry_cache;
+
 static bool ftrace_pids_enabled(struct ftrace_ops *ops)
 {
 	struct trace_array *tr;
@@ -1169,7 +1171,7 @@ static int add_hash_entry(struct ftrace_hash *hash, unsigned long ip,
 {
 	struct ftrace_func_entry *entry;
 
-	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	entry = kmem_cache_alloc(hash_entry_cache, GFP_KERNEL);
 	if (!entry)
 		return -ENOMEM;
 
@@ -6153,6 +6155,15 @@ void __init ftrace_init(void)
 	if (ret)
 		goto failed;
 
+	hash_entry_cache = kmem_cache_create("ftrace-hash",
+					     sizeof(struct ftrace_func_entry),
+					     sizeof(struct ftrace_func_entry),
+					     0, NULL);
+	if (!hash_entry_cache) {
+		pr_err("failed to create ftrace hash entry cache\n");
+		goto failed;
+	}
+
 	count = __stop_mcount_loc - __start_mcount_loc;
 	if (!count) {
 		pr_info("ftrace: No functions to be traced?\n");
@@ -6172,6 +6183,10 @@ void __init ftrace_init(void)
 
 	return;
  failed:
+	if (hash_entry_cache) {
+		kmem_cache_destroy(hash_entry_cache);
+		hash_entry_cache = NULL;
+	}
 	ftrace_disabled = 1;
 }
 
-- 
2.20.1


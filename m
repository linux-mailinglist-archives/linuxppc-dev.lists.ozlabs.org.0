Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131B1D598C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 20:59:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NyPp0MCSzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 04:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=OF8azeut; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ny4x0RK2zDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 04:44:45 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id a4so1404551pgc.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZrZZlEq92Pse6AsQBZ3gt5RG0ZPIDCja3ntEc/+5UQ=;
 b=OF8azeut5MIuxlonteG99mx9a8Av6BpOuIl5byPuyYv0PuO0UXM/SByDvX2ewPXsPg
 /og5vzn72KRD56TgC3VrKeifwDs395skcMWCdtpGQCKKj5PJMqovDHzFGlQ73nEVgASR
 oFyOSxGmQZhWbIGuJ7bgbNsyLESS4/HoKrUm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZrZZlEq92Pse6AsQBZ3gt5RG0ZPIDCja3ntEc/+5UQ=;
 b=Y7VYjn9p/19VIK4S602+VEfv2QTVCrjEgQXkmEfsoyfZrewbMdUi9tfSIyOKaB+Vsv
 OgYkYAcrSMcVFy2CHwheAfsft+SyZsJci1maJqi6FlBY4WxIAA3rkd05Dr1XEpSTmtXN
 y/Vz2TIMBhykd5t4GIKyu/VHeeiUUZfGdG9Kw84k7hS/i7GNWyGWbvOkLnJzOGrnxAGY
 UOBOZHGnkP7OgJNvM2XRReWIapZxjUponzu9hiK/1nh54huH+esQUkRcnbI/J9EuiOJe
 sLU4oJroKZUga+cFdR7p9KMYgbEAXPTGVEX7ODlg6GX1dX7tXMwFaOCy0ayWrpnYv3J7
 znwg==
X-Gm-Message-State: AOAM532U3qXR3h1Z2OhCpqXYFxKS0osUtPE8PY8J5K4hrW9UOeNNPyMe
 +DQd/9zEAqRmjHLZgq5eHjCG+A==
X-Google-Smtp-Source: ABdhPJy0Km/ifgMEiePh3m/4wFYQO+7PiRxrK/I+HUaIW+MrdLPTJ2yAIsLPOcL7MweyQmOZrjJPtQ==
X-Received: by 2002:a62:2544:: with SMTP id l65mr5284782pfl.288.1589568284068; 
 Fri, 15 May 2020 11:44:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a2sm2509003pfl.28.2020.05.15.11.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 11:44:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v4 6/6] ramoops: Add max_reason optional field to ramoops DT
 node
Date: Fri, 15 May 2020 11:44:34 -0700
Message-Id: <20200515184434.8470-7-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
References: <20200515184434.8470-1-keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pavel Tatashin <pasha.tatashin@soleen.com>

Currently, it is possible to dump kmsges for panic, or oops.
With max_reason it is possible to dump messages for other
kmesg_dump events, for example reboot, halt, shutdown, kexec.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Link: https://lore.kernel.org/lkml/20200506211523.15077-6-keescook@chromium.org/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .../devicetree/bindings/reserved-memory/ramoops.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
index 0eba562fe5c6..b7886fea368c 100644
--- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
@@ -30,7 +30,7 @@ Optional properties:
 - ecc-size: enables ECC support and specifies ECC buffer size in bytes
   (defaults to 0: no ECC)
 
-- record-size: maximum size in bytes of each dump done on oops/panic
+- record-size: maximum size in bytes of each kmsg dump.
   (defaults to 0: disabled)
 
 - console-size: size in bytes of log buffer reserved for kernel messages
@@ -45,7 +45,16 @@ Optional properties:
 - unbuffered: if present, use unbuffered mappings to map the reserved region
   (defaults to buffered mappings)
 
-- no-dump-oops: if present, only dump panics (defaults to panics and oops)
+- max-reason: if present, sets maximum type of kmsg dump reasons to store
+  (defaults to 2: log Oopses and Panics). This can be set to INT_MAX to
+  store all kmsg dumps. See include/linux/kmsg_dump.h KMSG_DUMP_* for other
+  kmsg dump reason values. Setting this to 0 (KMSG_DUMP_UNDEF), means the
+  reason filtering will be controlled by the printk.always_kmsg_dump boot
+  param: if unset, it will be KMSG_DUMP_OOPS, otherwise KMSG_DUMP_MAX.
+
+- no-dump-oops: deprecated, use max_reason instead. If present, and
+  max_reason is not specified, it is equivalent to max_reason = 1
+  (KMSG_DUMP_PANIC).
 
 - flags: if present, pass ramoops behavioral flags (defaults to 0,
   see include/linux/pstore_ram.h RAMOOPS_FLAG_* for flag values).
-- 
2.20.1


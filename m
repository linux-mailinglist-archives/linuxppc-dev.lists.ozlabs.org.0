Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F81A7EFE4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 08:35:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nTG2hr3v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXQXr139Jz3dK5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 18:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nTG2hr3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3rshyzqckdcgqqeyvivksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXJP34ytCz3cBr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 13:58:15 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b1ff96d5b9so36318897b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276293; x=1700881093; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvk9Q6fDi4VYvpZBd2dg6YVoVQRX3tnrrY9vqXNqK/Y=;
        b=nTG2hr3vcXlHVwO2ZMhRVJrjZPhTZ6LmzvaaR2z7jgkbjfEQ20W6uY4n6c9LTzegLo
         Uec+g8XOyvSRJzOVLNY6rtKKQsYjav3UF0k//+BTpGBpSH/vrvb0eycLbM4bZMQKlKMV
         zAkcVwXDS/nr6mwb8SRxbTV8DN+UZlLZzXoBDe3IgnqD/bF/tn5AxIeRuuLyIojb3Vn+
         jsfnnHAHSgR5HJdaU3rMhbVef8Ca+Hen48Aom8MPyDN67RaHtdNCYQk2vv9zZzs9iKIz
         nbJFYnYf93GO1bFH+a7e3OpXp36IE4ELhHd19aeLL1sUqSjwh8S41t0TwIA1lXXlt7n3
         4bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276293; x=1700881093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvk9Q6fDi4VYvpZBd2dg6YVoVQRX3tnrrY9vqXNqK/Y=;
        b=UXYCPe0S8Jj96Cg2C/bVYdijZsH8ZAk3iPi9LL1Je3HFpxU1lR0JArEMnDp043bv8L
         2pjpyz8oOjEV8mMHuijKZ+1F2vaYmbxy3dD6ybRnZTWtMViws3ewJgNY7b+9YeOvYqzl
         JhG+iRlx0BEzAOlqNhLPfmQXU8WnfvwvvtxdfwuBjClv0d3Tpvmm2begfncp6Zwl2jCx
         8ccBmt/bvh4UieYv6eGKm98THxxI+yyhS6sYn41rZSD6rl0rRz6Gw8n5supwzhUn5My2
         szHbcdqU8G33AIHA1NSVaYOR2Dcenvyk7k3ujCkK1I0iQ99RF0fxgAppbRZzz+WmRrfR
         wHzw==
X-Gm-Message-State: AOJu0YwgJ+Bepvod6ghaSWzF7cmKtunkyaGiSDLVDohh6UFvqO3sy8Tf
	UHohfyDfKvAxV/AYJJ5KP5rCqVKIfzhq
X-Google-Smtp-Source: AGHT+IGP3XlXj/5Dcw3hp9Px56ng9u8ZBGdlOpNsgMCWjyW3JuNS4KY9Ymdo28sfT5+B96al0+/x10TRijqM
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:d512:0:b0:5a8:d81f:f5e7 with SMTP id
 i18-20020a81d512000000b005a8d81ff5e7mr38384ywj.8.1700276293608; Fri, 17 Nov
 2023 18:58:13 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:45 +0000
In-Reply-To: <20231118025748.2778044-1-mmaurer@google.com>
Mime-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-5-mmaurer@google.com>
Subject: [PATCH v2 4/5] rust: Allow MODVERSIONS
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 18 Nov 2023 18:31:25 +1100
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With variable length symbol names from extended modversions, we can
enable MODVERSIONS alongside RUST due to support for its longer symbol
names.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 9ffb103fc927..6cac5b4db8f6 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1885,7 +1885,6 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
-- 
2.43.0.rc0.421.g78406f8d94-goog


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E3B2CA80E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 17:21:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClnQg4Zd4zDqs6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=aaIMgn1k; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClnKm50TgzDqml
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:16:44 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id k5so1393277plt.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 08:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0YdCjkJ51EOhZtuBaCrGJ/RvqotXRv8loSeq+0K1Lw=;
 b=aaIMgn1kMgD56TG5g0Vi0ZkKk6tnzbIUF1pfDYVYgvX7pggmfVvYYTd1Op8oEFa5Qn
 jcyh85859ruNoHIygqJnBsOe9WlQuE2aD0H/iS7qoLbb2lx86xlSuSMhjpkFrtqevRS5
 9nqF6NnLxd0AtaCPpFxA7HmRVmDGrNM1bGLas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0YdCjkJ51EOhZtuBaCrGJ/RvqotXRv8loSeq+0K1Lw=;
 b=PU9q4slWaWWnCFZ/wVZGUY2UAKK53Jvg9xUXaOX0rU3Dvmg67aP7nzTOicWWyAVjAc
 a2WD3iPgO9PbS7LuXmLtTogco21MqCExocFL3vWWdIPjTvfcRz5xHsPfZxqzYrBCwaEJ
 l5PgfntCG5sb2wj1FKcUrvP+4T8ABpVSF8nJugD7SpUOSIEtKmHghp6jVgD7l95NwaRS
 smmpbX6bxkjZyjd05rj0zNfUeMcCZWqK1amnnA7qzZOafXqtZkyppsB4+orGkd4lTrRu
 2riKEf0fTImR+JmsbQbIV3Qyr1/E/bxhelnqgnryMXzlY8YwuLs5B1Gu8rW40pfpNpDG
 uW8A==
X-Gm-Message-State: AOAM530ZelN+lSUS1ea1biqnYDVx/2ckZIqMS0kuZZ08ogKO9/kiWj1W
 rJkoYtCy7Asw3GyKKhOk9Fo7AQ==
X-Google-Smtp-Source: ABdhPJyXoEkCjSN+IDdIpKLJVoutR17sCfVu7a/oC94ndZZBF9Z2S63HRCawbS5ZfYp8mS2kuNDaTg==
X-Received: by 2002:a17:90a:a2e:: with SMTP id
 o43mr3337563pjo.59.1606839401186; 
 Tue, 01 Dec 2020 08:16:41 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f932-2db6-916f-25e2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f932:2db6:916f:25e2])
 by smtp.gmail.com with ESMTPSA id q72sm222708pfq.62.2020.12.01.08.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 08:16:40 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v9 1/6] kasan: allow an architecture to disable inline
 instrumentation
Date: Wed,  2 Dec 2020 03:16:27 +1100
Message-Id: <20201201161632.1234753-2-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201161632.1234753-1-dja@axtens.net>
References: <20201201161632.1234753-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For annoying architectural reasons, it's very difficult to support inline
instrumentation on powerpc64.

Add a Kconfig flag to allow an arch to disable inline. (It's a bit
annoying to be 'backwards', but I'm not aware of any way to have
an arch force a symbol to be 'n', rather than 'y'.)

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 lib/Kconfig.kasan | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 542a9c18398e..31a0b28f6c2b 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -9,6 +9,9 @@ config HAVE_ARCH_KASAN_SW_TAGS
 config	HAVE_ARCH_KASAN_VMALLOC
 	bool
 
+config HAVE_ARCH_NO_KASAN_INLINE
+	def_bool n
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
@@ -108,6 +111,7 @@ config KASAN_OUTLINE
 
 config KASAN_INLINE
 	bool "Inline instrumentation"
+	depends on !HAVE_ARCH_NO_KASAN_INLINE
 	help
 	  Compiler directly inserts code checking shadow memory before
 	  memory accesses. This is faster than outline (in some workloads
-- 
2.25.1


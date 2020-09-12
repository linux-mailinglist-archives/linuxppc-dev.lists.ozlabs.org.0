Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E32679FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:34:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVsD2DrBzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:34:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Zk/gIvdN; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH967tCzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:37 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id y1so1896741pgk.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZnp4yDc6/H8oZY5gPE0ntNCiw9S8Y24vH6szdlcBNQ=;
 b=Zk/gIvdNfjQE/2unl26djetvFbMWk4A8shRgP7V779rbL1iDmAqb/WJsaeUEyvkWho
 8jG+lsS6GNlo3kWdNKOEks2fdvmH3bO73kMlDWOuyuO55TqqWNyvjERND1Wyg09jCOar
 c+he/PZbFxcnDUtW7NY4RKVcPovh+GacMTNqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZnp4yDc6/H8oZY5gPE0ntNCiw9S8Y24vH6szdlcBNQ=;
 b=Bp5Bd2p9xbwYCxGfMGeAkcjci451503hMONNaQo9Ni96RMDCXfdMroQV3VA2gW2jNn
 cY4qQmvjJcld8c6CHsOfZ0uH2wqM6475vQzg7Ff/eI2vg/h47DQDoPlAeJ9rw5VllfIf
 c0rXctQwdyXkEu5l4J3kDAZJf+G5Gn6yQO6KSj3q1wgubq6YQNCmeDpLYBpLtQjDguqL
 0eTKm/qxHEhLqJ3q2AyZwzlzqz46a22JBQo+xh8GbAvBPKm7hLZy9JgWWxHFoa6a4MSK
 vVV7BH5xNI9LWA1tnO8JeZAwfd86ovi/efHDmokGq4Kpkh0aFIApRPpWSahWgohCe6p5
 ckOQ==
X-Gm-Message-State: AOAM532okGwGeuNW++7aZEPxXYScdQBJCwsDx/x/MpKyMHOqmiF/dxX4
 ezH23xtDwis/UglenZotXJqPYA==
X-Google-Smtp-Source: ABdhPJxq4vqIb6iJR4MN1IGlGkXsD9IVC0sP3rRF3lcvwIHfpvEszE0WWk+A5K78Aa5hwg8SNrEAAg==
X-Received: by 2002:aa7:9ac9:0:b029:13e:d13d:a133 with SMTP id
 x9-20020aa79ac90000b029013ed13da133mr6030859pfp.27.1599908916069; 
 Sat, 12 Sep 2020 04:08:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 17sm4796064pfi.55.2020.09.12.04.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 15/15] selftests/seccomp: Use __NR_mknodat instead of
 __NR_mknod
Date: Sat, 12 Sep 2020 04:08:20 -0700
Message-Id: <20200912110820.597135-16-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The __NR_mknod syscall doesn't exist on arm64 (only __NR_mknodat).
Switch to the modern syscall.

Fixes: ad5682184a81 ("selftests/seccomp: Check for EPOLLHUP for user_notif")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 26c712c6a575..b34ede28f314 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3773,7 +3773,7 @@ TEST(user_notification_filter_empty)
 	if (pid == 0) {
 		int listener;
 
-		listener = user_notif_syscall(__NR_mknod, SECCOMP_FILTER_FLAG_NEW_LISTENER);
+		listener = user_notif_syscall(__NR_mknodat, SECCOMP_FILTER_FLAG_NEW_LISTENER);
 		if (listener < 0)
 			_exit(EXIT_FAILURE);
 
-- 
2.25.1


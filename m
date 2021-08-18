Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABB3EFBB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 08:14:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqHgK2BcCz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 16:14:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a6bTyF6x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=a6bTyF6x; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqHfg0bhQz3088
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 16:14:16 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso4602053pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcRMFUHVF6QqGnr97K+ATth5rLyNBKP5psUqyaewiPQ=;
 b=a6bTyF6xsvXmJVaSI8AKs77+P0oFTI1gTPlsYa6mh59pACM92P1VFzFqvqU9+X+jNr
 vTM9CS3vOAuRCBsVzn6N7KgVHI6W6ooLD8DmaYQuGxrolCI4Xru2kAG7C7jmtZ5uZ8PR
 VDy1iToF9Tpap2g7DTRp0rqJ6lJwmpqW0wJjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcRMFUHVF6QqGnr97K+ATth5rLyNBKP5psUqyaewiPQ=;
 b=i6r1MEHEpjb2tYJ7/LbewOyJL2FiBlhO3By9Vj4MpHJXZVdGTHwRyrQcFRN7pV7A7Q
 rqD5Q9EUyhqAbM4xJe+1MGApPxZJeKdjbGQU0voqFYayWtr1ygOZaSH6YF2yYT4iMGyp
 gW8zN7+hpecxUJe5HgtL32E61+v0ZM8+cfqv3b2fyGlK/4qZGb4bqTYx+KQiIGsp90sr
 a1Np5fe4VCs7E1BTa7PITStEfBiO9w0VUUzeY7ds1uPBhSFyw8TKkf2tRxkb2u5fqJSm
 XmV5Cr5Nkidy9QGPx1uQVQnB63AR4wlfELRS1Uuq7qvbnvmdpT4Wy3qlPw24+hKT2wJd
 fB3w==
X-Gm-Message-State: AOAM533wMIn9SYv7DP7P8sgVve77UyRrbn6WOFy5B7cGqUfJA5SrRGGn
 aLePbvgjjXwpNx+YHr0LKrBVCQ==
X-Google-Smtp-Source: ABdhPJxYy9uajyke8AmxVdXcCpVPxEVIqn6teRhyhxiibQmTAmVANSe3Um2YhA94u6j4OQrmXZTUYg==
X-Received: by 2002:a17:902:e9c6:b029:12d:4cb3:3985 with SMTP id
 6-20020a170902e9c6b029012d4cb33985mr5959378plk.56.1629267253269; 
 Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l12sm5631661pgc.41.2021.08.17.23.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 61/63] powerpc: Split memset() to avoid multi-field overflow
Date: Tue, 17 Aug 2021 23:05:31 -0700
Message-Id: <20210818060533.3569517-62-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; h=from:subject;
 bh=JCECg/Hewr4d9JO4WQR5kDd0IjByC1o9V4GNPJaYPKM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMrEHk87hiQVCzgI18EL/HOEsDc4MJhIkHkaVTZ
 DZKWkUOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKwAKCRCJcvTf3G3AJjKnD/
 9vO5rK1NcyiJFD1V1xX5Q3QwJPN1EMRWYcJsr5dTRrhYDef2VBoAd3vGVJhv5tPWCziVR95zI+LgIL
 d02IU4Ow0Hf/RnPFBOD9Lk1pR4bdZqy2udFH1tE06S0wBxz6HBgDxKiHg0hd49XAZs+xsJCSVXM+ks
 ZJe+gXBJkwU0QQlyx97a3srOeF6TBCIwRbfsc1ny8kqeq7rHXhuez2Nl/jEpDrSY7P6MGZ0RS9pwGp
 BG8XE5jwyatTqBbwztRYJO6EDxF1oljeN+vw6wXSMzHTs0P0jZF+xhBsDePue4SrU1uYVK4eI314VF
 ytJTqzumiq1LoMoetRo7XbnZL9HC+8KQkD7iex+cbwbl0vBuTQNERQCXbWiuHcR7WbrVndhdzqr/qr
 7kpYWqqHhGYN42VOTCoEV+CxxyGt6O1oEwupEs9JwlhAHT0ET/3m5v95ln9sj4q/idsJQyugW9w9wS
 B+pdNyiwZvnrIR6r8PjnSHwflJuJYyRkP28Ci+HZxNLOE9WlE6UmnuDmdrcVKpWz+nctnlPQ9JHhAq
 vpfGhXMnm0qF1zx5IYh+d69+ZRtUQbUKz2k4hFKSxvSse3CvWfi63pBT3m1O556umLnQD6zZbq4vQZ
 p0vLhJOR+anh57gwE1CG5ilwh9jU07xLpPrNzUQkHrIgJsiMsfqPJrC73E9g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wang Wensheng <wangwensheng4@huawei.com>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, linux-block@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, clang-built-linux@googlegroups.com,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Instead of writing across a field boundary with memset(), move the call
to just the array, and an explicit zeroing of the prior field.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Hulk Robot <hulkci@huawei.com>
Cc: Wang Wensheng <wangwensheng4@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/lkml/87czqsnmw9.fsf@mpe.ellerman.id.au
---
 drivers/macintosh/smu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 94fb63a7b357..59ce431da7ef 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -848,7 +848,8 @@ int smu_queue_i2c(struct smu_i2c_cmd *cmd)
 	cmd->read = cmd->info.devaddr & 0x01;
 	switch(cmd->info.type) {
 	case SMU_I2C_TRANSFER_SIMPLE:
-		memset(&cmd->info.sublen, 0, 4);
+		cmd->info.sublen = 0;
+		memset(&cmd->info.subaddr, 0, 3);
 		break;
 	case SMU_I2C_TRANSFER_COMBINED:
 		cmd->info.devaddr &= 0xfe;
-- 
2.30.2


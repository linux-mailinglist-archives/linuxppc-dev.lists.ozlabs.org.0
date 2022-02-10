Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9D4B1A67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvvZr1Qcsz30Qt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:27:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mvi1bzuG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mvi1bzuG; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvvZ92b4pz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 11:26:55 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id f13so5742386ilq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1MJU8h6aqi1lREanFgpSWWzF65VdO9IwfkWhBgqaH3Y=;
 b=mvi1bzuGc+ZCDBoKyIvPuu57FjwX/ZNRRmbHLZvq28NxvswbVJpCtL+TPmWTVqyuNq
 zHOVncwF2tsmDVT250gY7kLq+jhckLGi7PlKEqS4kMkEFP1KTu7Z7xjiQlYjB2792Sy0
 y79LwuSrYF42p6Ksm7buY7+zkijxS7uB/hHR9ElJmFJeaWgz2GF8WWh/oKXQxLhRyRAL
 sBCNNuvExT46DRyy/8TIoNJF5PD3spUAqOHHh9NO3ZMs/icV5NIDHPE+azUqsowaetzV
 7cpHrDo+EZ7zUtQ5l6ZDe3klqtAXMvArBpa4JNsPnSEGr2ueqLcJfFXWmveEcH8M/UrG
 z/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1MJU8h6aqi1lREanFgpSWWzF65VdO9IwfkWhBgqaH3Y=;
 b=Mqeh6mcTWGYgW7LsB7Gs8AHhJtLU/IGIe3p2KbppWrIXnydI6LzrnxrLJgRm806uPA
 IXFJpUcebm7j3BZaeslwsDg/C0Oj7Qro6yAqDxe0Alrp85fzYA40XdVlOluCcymFE/Uw
 7RE8ItwlHz5ZK6N9uTf2+FMMw8WHqCh5ctyQeX7Qn/YnqVyThfticErxHTUiKpfgM8iv
 /WObkj01fh2dwLrtl7y75hLpwHOyS8C48bqrHxkgmECDE9zhY4Bo0H+mRhMGC7RLvRMV
 dw4MSTgonVXUv4EjgLkrtUvXwuRyWcugu4+y8d+pnSQv+H5+61cNYsYCCbh/ro++HrnW
 Vlww==
X-Gm-Message-State: AOAM5328uTk/q1Q+w5dC32glOyN5Dd+3adSs0CYQ7oir1stDcJloylKy
 UY9ygOgo8hOvloZbUbVGr6U=
X-Google-Smtp-Source: ABdhPJw4HRWGUzFWRINnqDSvHJhe4t426yscU51lkh9YSM6/oOmml5+22RpllautY9urs7QLFyNzJQ==
X-Received: by 2002:a92:ab01:: with SMTP id v1mr5297485ilh.149.1644539212078; 
 Thu, 10 Feb 2022 16:26:52 -0800 (PST)
Received: from localhost ([12.28.44.171])
 by smtp.gmail.com with ESMTPSA id y22sm12896727iow.2.2022.02.10.16.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:26:51 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 David Laight <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 43/49] soc/qman: replace cpumask_weight with cpumask_weight_lt
Date: Thu, 10 Feb 2022 14:49:27 -0800
Message-Id: <20220210224933.379149-44-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210224933.379149-1-yury.norov@gmail.com>
References: <20220210224933.379149-1-yury.norov@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

qman_test_stash() calls cpumask_weight() to compare the weight of cpumask
with a given number. We can do it more efficiently with cpumask_weight_lt
because conditional cpumask_weight may stop traversing the cpumask earlier,
as soon as condition is (or can't be) met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..28b08568a349 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -561,7 +561,7 @@ int qman_test_stash(void)
 {
 	int err;
 
-	if (cpumask_weight(cpu_online_mask) < 2) {
+	if (cpumask_weight_lt(cpu_online_mask, 2)) {
 		pr_info("%s(): skip - only 1 CPU\n", __func__);
 		return 0;
 	}
-- 
2.32.0


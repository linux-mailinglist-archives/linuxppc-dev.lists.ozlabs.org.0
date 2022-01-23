Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94594974B5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 19:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhhny57dLz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 05:43:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C1SMT8g7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=C1SMT8g7; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhhmk6kB7z3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 05:42:14 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 g9-20020a17090a67c900b001b4f1d71e4fso14259330pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 10:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VqjN8AVE4l1jGj4WKwwteMJXfvhHCp8LxE1b5uVHyhI=;
 b=C1SMT8g72QpJmf2bGBlHtrMJyAm02anZRdJPiD2hXPa8KnxyJmdZw8KHlGAX0+WQGc
 BZHWyBl2a5DTg8aenBofL3Pa+LSa4prxrtnLXqzJa+qJVVLWS9YDxbbC4POYvOHztAqw
 IyapelEZ/75WdLGC84xm+UEAL5Cev9xJG06mFRsDSpCKQLMoLxgo8eFVJQqILZ1wkvcj
 /C5aH5KAaWIXgqOmeQebx/JlfxVpZJzkpasVbNS7lD3Xygu7Dq/lNJpvZKtbbQBFVMYy
 bxtmSmEeLKDAfMNUeFJyK+ebz4bFvez0SDfycUa2ySgs5dFSDYB8Y/ANERmbRLt77Z2M
 N4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VqjN8AVE4l1jGj4WKwwteMJXfvhHCp8LxE1b5uVHyhI=;
 b=Gnqac2dYgaOwLdrFzXsD7DqIFcMnoECLL2guZOF/P6IVgj4C+XqWR+n0l5CCnbfUvd
 hDYiX5XwaINg1LyM9PLfjoF8U6ZBvgcNbUyfhR3s0n/UR+0W8CXQgxu7V5kNGy2n4Zqv
 C49TgMH3h8sxL/RrtN+3YpUYOpdIWcnz8KDe6JEj4eiv29wRTsj0BePMxSSItpCVe7IG
 JWvcP62WwHfK4356xLp0PFIRmSe7TdfiUg1nVUaC8aXf7nPppucgbZyYbWQuASwrnODO
 tSNfkzl1LfmZCZdBDxrirkg57lcQ+z1udvXAw0bz2GQiQLqQQE/qa/VOszG5rMkMZJ60
 WjgA==
X-Gm-Message-State: AOAM532vOq4O8RlXruy3oRkB2NLMI3e1bG7zHBLqaOzuJODlgyGSmUY2
 Wxwc6bdRuuAIHTw5VBWTQ40=
X-Google-Smtp-Source: ABdhPJyR3LEGx3dQjXbO/uCCX9t/QjIgjrhqlzEDELiIFsGeBhAD2N532FLMhxMOd5s6FzXSuCmH2g==
X-Received: by 2002:a17:902:d883:b0:14a:4ba5:6e72 with SMTP id
 b3-20020a170902d88300b0014a4ba56e72mr12062149plz.27.1642963332593; 
 Sun, 23 Jan 2022 10:42:12 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id q140sm10315902pgq.7.2022.01.23.10.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 10:42:12 -0800 (PST)
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
Subject: [PATCH 46/54] soc: replace cpumask_weight with cpumask_weight_lt
Date: Sun, 23 Jan 2022 10:39:17 -0800
Message-Id: <20220123183925.1052919-47-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220123183925.1052919-1-yury.norov@gmail.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
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

qman_test_stash() calls cpumask_weight() to compare the weight of
cpumask with a given number. We can do it more efficiently with
cpumask_weight_lt because conditional cpumask_weight may stop
traversing the cpumask earlier, as soon as condition is met.

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
2.30.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26B22074E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:32:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B69bz3BJfzDqjY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 18:32:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=V2Eh8BkZ; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B69Tj3K7lzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:26:48 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id c80so4501662wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCk19GsQjhT9V6ZH5VfzAX6PQXTZggJu/iEJMuF5hMQ=;
 b=V2Eh8BkZ8dcCa53IaQSf1cFlilO/zt8ksPMcm3ZyMf7Kh+zTEEuh90evBOvEi61Q2K
 54BEgKiKD5KhfqA0S1X2/Xd7JybfTairskcEafqLYETq1pXo/nwW50FaHThpGQJCKMDn
 N3w4k2sMMWuls8XD56YVqhTbHLtGtFTQdrBDWb/tFACe+fXHnJj4BsEkhGl8V6oDKxYs
 xzRwW8j16fa41Zbo1mO6xdgn8cV+YCawvLHsJt/E0QV8Vg3yLLpnjDCgblt7FADeb/9C
 es0UE0y/wxLnmsVmvRJLRckXYkWxyYcO5DGgT7rfz45lcFYKT+dOAz1YXilbEV5zMmX7
 /WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCk19GsQjhT9V6ZH5VfzAX6PQXTZggJu/iEJMuF5hMQ=;
 b=PM6z917Nnf8ECPTwxszqeg9L6jrTSvwF9mGx702W76Qq4Ot5pqxxdvz5Xf3PEBuVjO
 yrNeviMHR2RLzgP2xiuIEI2RssjU8ff8oncjJf4fpLy1IVeYlSFF87lIAE300BB3WRj0
 Av/1nTPeBqni17+O5tNtSYVhbVloF508BdiNGPit+rzgdYqUiDVd2pBu0ln8sM7CZgjU
 MzeIpTk0IhTbLX6LzHPpVAhQ91y32QzBDLX3wqVGnwwBo4HydTYbpy1DVjy8KIkybKQE
 S8Ll/28wDcYK9ZOaDMXlgeeOdVee0AsNc4Ne5PIic/76OYH6J/ZQNDnhDaF4Up+S/egd
 p92A==
X-Gm-Message-State: AOAM5339hKQMqTLcfQoJg3gaSNjQMIWMwPQ414c5XOU6exBU6pTKyDgP
 B3EPAZ9vFe0DyTEOgXRLvLkFBQ==
X-Google-Smtp-Source: ABdhPJwMbYK/KKybcySvzNfcd30nLvna3tfOpKszLpsbnWbTflEcZDNIxJlMqKGZU3TgUfFpWQURiw==
X-Received: by 2002:a1c:6354:: with SMTP id x81mr7228802wmb.98.1594801604289; 
 Wed, 15 Jul 2020 01:26:44 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id h13sm2400361wml.42.2020.07.15.01.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 01:26:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: rjw@rjwysocki.net,
	viresh.kumar@linaro.org
Subject: [PATCH v2 05/13] cpufreq: pasemi: Include header file for {check,
 restore}_astate prototypes
Date: Wed, 15 Jul 2020 09:26:26 +0100
Message-Id: <20200715082634.3024816-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715082634.3024816-1-lee.jones@linaro.org>
References: <20200715082634.3024816-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If function callers and providers do not share the same prototypes the
compiler complains of missing prototypes.  Fix this by including the
correct platforms header file.

Fixes the following W=1 kernel build warning(s):

 drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype for ‘check_astate’ [-Wmissing-prototypes]
 109 | int check_astate(void)
 | ^~~~~~~~~~~~
 drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype for ‘restore_astate’ [-Wmissing-prototypes]
 114 | void restore_astate(int cpu)
 | ^~~~~~~~~~~~~~

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/cpufreq/pasemi-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index c66f566a854cb..815645170c4de 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -22,6 +22,8 @@
 #include <asm/time.h>
 #include <asm/smp.h>
 
+#include <platforms/pasemi/pasemi.h>
+
 #define SDCASR_REG		0x0100
 #define SDCASR_REG_STRIDE	0x1000
 #define SDCPWR_CFGA0_REG	0x0100
-- 
2.25.1


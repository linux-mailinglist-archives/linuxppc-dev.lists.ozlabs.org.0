Return-Path: <linuxppc-dev+bounces-1138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9A96FE25
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 00:56:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0s615zncz2yNj;
	Sat,  7 Sep 2024 08:56:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725645027;
	cv=none; b=BL/J/cNhDofpdri6bB6cbH8Upm+JMrRc1Smh0Nyt/uMRz4RQNQLO7+9eT/UeE2WXMZgTXscIaX+cmeClkxeIFDB+4ta2vsrhjRkQOTt0+Y5hakew9byVMXZUQdQbGjef6uVZXigSQ6lrJNztaJT6aXaFImq8TLQEq7/QJdGM9ozCt7blbCX1Ry+l4N4TIHjpnxKi11LKe8czRg6qcnjOz6AalHsciImJXINnH6CWCKjP1WvTxUj8iYYyASVgGpLtqQB9khY2voGhQUpjD867AxUWjQUWVA0+4tSgN6LNWNBsqY3O65l/bd/KGljIIHQxFOpaJlyiCQzlvonGAT+UXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725645027; c=relaxed/relaxed;
	bh=cBwPrXfQENKYJlILGnwqxaMS8yZZIqO6Bs9phkuiKJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hsHlPMJKoySRs3kiacFFjTh14DkYQ8pu9+3iYQO9qia/Xamjxvov14zs5O1iOF060PgLolNtZp55FaqKaCfc0KB/qQz7yt4m5jd94N9d/GtDfsSc6awVVVMojt5BDVkEgWjbQaFt1THNhNwTzxTDoczAxGYWYcJSWBiIYUWSv3+BntNlzUNKWvvWdNjOi56A5BRqrG/txJv0EFLl6HKOmYrxHuxNrIMVgtg6PSoplWxHlgj6h/YZiPPRxk20aozqbLdjpbWAIiWh9wK4SzOhE3DnNEAer/rkaX1pTKzD/g2Q/lY0GN91lKxttEh8QT7/yulNGuNa8F8IkRuTnFu2YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass (client-ip=209.85.128.50; helo=mail-wm1-f50.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.50; helo=mail-wm1-f50.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0kKG4tpzz2yGX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 03:50:25 +1000 (AEST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso5892855e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2024 10:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645022; x=1726249822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBwPrXfQENKYJlILGnwqxaMS8yZZIqO6Bs9phkuiKJY=;
        b=ld9pGEhFtY9hzIPvxPBGsMI34RdNZhK1qXstXgLvJr/IQLiobpR5hzyt9fXnZNCE7R
         aWcZk3URhRcE71rEAI1D5xzKSq/Qw9zskrCaanI7nxVZGSbV4BghXUPyyHtyERHP/ZKM
         o0qITM/lAEFvA4M2o4GLZGWZLjtv8sqY66CGu/NgJnA/mv1XTk/eKH3/MmWTxiwuVfbS
         8lCJDf1Dc0Rj48bIf6hyrFCg/Rij6uaICbjzXu/RC5VeJO53vDltEOy14GRH6fn2UU5P
         UkODmC/Cf9qBXzf6mhBOBspTLwzA+C334kJmuOc6os+xWaLh6kejVvOWNORZRFJgOJ/E
         bx+g==
X-Forwarded-Encrypted: i=1; AJvYcCX65eX+trFErox8SwtwDH6zPXpXs0xLlh47heUrlAZZ2qHHN1AkIx15MIhXasYZPpqOsw0lh/zj62QuImM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrPpSWs7/iFtHwvxrG9tNiLS+aziDHYI0ZOA13hak03fW/BxVK
	0omLOdyIwUsmguwwsa9w5KFiV9p3rNicvpANqte7ZPVnkcAlXrHF
X-Google-Smtp-Source: AGHT+IFCFQDCipGqICeFJ8E8CGwuoBP8ciZam2q+rs25bUZzeBwA8DyQ8K8CRJvgWbUp8Cr0GJh8vw==
X-Received: by 2002:a05:6000:10e:b0:376:df1f:1245 with SMTP id ffacd0b85a97d-37892703f37mr11604f8f.39.1725645021469;
        Fri, 06 Sep 2024 10:50:21 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a041:e281:f300:ddd7:8878:b93d:7c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37891607ccdsm443827f8f.4.2024.09.06.10.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:50:20 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: ming.lei@redhat.com
Subject: [PATCH] powerpc/xive: Use cpumask_intersects()
Date: Fri,  6 Sep 2024 20:49:36 +0300
Message-ID: <20240906174941.1147197-2-costa.shul@redhat.com>
X-Mailer: git-send-email 2.45.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace `cpumask_any_and(a, b) >= nr_cpu_ids`
with the more readable `!cpumask_intersects(a, b)`.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 arch/powerpc/sysdev/xive/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index fa01818c1972c..a6c388bdf5d08 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -726,7 +726,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
 	pr_debug("%s: irq %d/0x%x\n", __func__, d->irq, hw_irq);
 
 	/* Is this valid ? */
-	if (cpumask_any_and(cpumask, cpu_online_mask) >= nr_cpu_ids)
+	if (!cpumask_intersects(cpumask, cpu_online_mask))
 		return -EINVAL;
 
 	/*
-- 
2.45.0



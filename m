Return-Path: <linuxppc-dev+bounces-1623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A1987014
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 11:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDpCR541yz2ygB;
	Thu, 26 Sep 2024 19:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727342835;
	cv=none; b=WNjao7J8PDwRVH+txIBa80GNOXkpYzEoC/odv6SmJiUgQ9UTpI7r4uyAEGiY7Ju3wG1m+rWKSNj/t2Xj816Pn5dqhIWbv60w6d+eGsCXw6CINzhXZcCmNQBYa0+rdB2LxGxKfn0196utitwYNPblgmGURmdbJqFjnjCbyOUiYxNhHhdckQILwC9l8gs1d8fvxrMjxBwCvbg7GMm0ZuCD0VT9F6fs2HdPeD69c57eIEfRPX57mOwh3mZC2/zzNyyxsJQu+kUmZfoZgRiJbQSsBde7lYW2JtDC08tbOUnd3FgNxvuSZhSBMlj4N57Mm+ACKPnkpkCIgScSgpktTN0RZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727342835; c=relaxed/relaxed;
	bh=RCYimulyplJ/QBbQZDyNZ6PC7/nIgszRvvPJOLK6CQQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ElYSvbcxi14SalPlplV1ZGvkAdfPtZcNhZr+sHsg0WWRD4FRJgAEhtkdo1w8d9RdeN7h+i/k41f73covtanwzhpaPOYaRmzfWOoRcP6jUcnuyhcRbJhhSNfhPn3WUUtsOHzhVAy5pow5eUpNvE8HLDvI0yXkmSFMVsbbhAZPsmE/7vw6MWKq0A1YaYvYigNVF6p4xpQbDAY4CeAlbUxw6NuZ9XqFhu/iDLa6EC0Y6VPEq+al/ZPVmKFTUYy6aNf3iSl5aGhBlSu11HL/mgqF0yovwixIBFkSuc+7AJovtwI/8JUDuzexECUc/Efam4iqMAoRn/hsp0O1XDK4hIKiaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass (client-ip=209.85.221.52; helo=mail-wr1-f52.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.52; helo=mail-wr1-f52.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDpCR0xFtz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 19:27:14 +1000 (AEST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ccfada422so265369f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 02:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342831; x=1727947631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCYimulyplJ/QBbQZDyNZ6PC7/nIgszRvvPJOLK6CQQ=;
        b=A1gJWNSFmoG1RNAtrx5UKpozS8/+qW83ifAVFuBU83oZPG9idE+N1TtDv4BfozBOjt
         yU/SpXLQw+sfTazCiIkqTnQQsKS1lubA5Yg8YPncG2tX/w9Fr3AcZKeQSAir10Tg/Lcw
         113smhGXvTcvWP2HOKMl63us9QCuuzRYGm4p5TSzReK3U3f6LqBmyMpv2Pcc4lbFdF4S
         GgPjzm2hIl8IfjL7cN0ExJN3vM2KMOIge6lNOd9uPCmaI1Alf8xERvMZwdSZjtv05+6K
         6ySBgT1lY+TMCmzb4HNi2+fIkuiIRhtZb9fl1Y+xnk2Zn4U/OsGlSrjkB0PS+7lyBHGn
         IyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDcwYLsMm600KywELiqJpBQRm5KXa1uQIMUfS2Hzp7ABdSBCZLpVB3mJsg7MkQ/OJVObiEiL8GD2J5tsc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjAd6CUtMTzH9tswmoDoU/5OsIjWd1fmFZiNNSLi8it8PXebdq
	EBoSQ4wP+C/CYAIXmn9F4sqSg3C9YDZ8puZP00esra6r54kXuC67
X-Google-Smtp-Source: AGHT+IEQT+Ooa0Yhm5wcyTD5XpZt+dDp7YMYJ24i3C/+E8lwiSV5RucDIsttkrKOgzUYqqlOQF+FRQ==
X-Received: by 2002:adf:f1ca:0:b0:374:c8cc:1bb1 with SMTP id ffacd0b85a97d-37cc24b575bmr3660406f8f.39.1727342830761;
        Thu, 26 Sep 2024 02:27:10 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a041:e281:f300:ddd7:8878:b93d:7c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2cd263sm5938075f8f.48.2024.09.26.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:27:10 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Ming Lei <ming.lei@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/xive: Use cpumask_intersects()
Date: Thu, 26 Sep 2024 12:26:22 +0300
Message-ID: <20240926092623.399577-2-costa.shul@redhat.com>
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

Comparison between cpumask_any_and() and cpumask_intersects()

The cpumask_any_and() function expands using FIND_FIRST_BIT(),
resulting in a loop that iterates through each bit of the bitmask:

for (idx = 0; idx * BITS_PER_LONG < sz; idx++) {
	val = (FETCH);
	if (val) {
		sz = min(idx * BITS_PER_LONG + __ffs(MUNGE(val)), sz);
		break;
	}
}

The cpumask_intersects() function expands using __bitmap_intersects(),
resulting in that the first loop iterates through each long word of the bitmask,
and the second through each bit within a long word:

unsigned int k, lim = bits/BITS_PER_LONG;
for (k = 0; k < lim; ++k)
	if (bitmap1[k] & bitmap2[k])
		return true;

if (bits % BITS_PER_LONG)
	if ((bitmap1[k] & bitmap2[k]) & BITMAP_LAST_WORD_MASK(bits))
		return true;

Conclusion: cpumask_intersects() is at least as efficient as cpumask_any_and(),
if not more so, as it typically performs fewer loops and comparisons.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>

---

v2: add comparison between cpumask_any_and() and cpumask_intersects()

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



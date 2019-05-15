Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E11F5FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:53:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453wy32QBWzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C9Zc5r+f"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453ww65Zs9zDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:52:06 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id s17so2794765wru.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nytq/On43q8XPsmcb/kSTUQUu6ygGympqGdBDgeJzfY=;
 b=C9Zc5r+fI+/FO7h8AYtoREtVY8FaEZvGe/awFqM/h2Sjhl2yPheAI5gJllXqLo/9g8
 EYfqpBRqmVDz62X80O9XaD8idB4VEQAx4zIxi5CbJUJguCTDzSvAUYq+ESEsH0nOerRZ
 U0mcrPGx7YzHOQIXjyMWkPXtuTZe125hPDKlCLP7vR03oXTXpQl1K8ApJ+vIY2YSnluA
 njBDBytCi+CK1XjhQX0db0niLdYzN4A7f6gmN5h44c5LuMzbr+UOS8fHbNxW8+EbESEP
 B9DiP5TNWjH+vWzLQyGUopvXFZ11R94g09DYr6gkU3KEMiHMdhlHgXKOhop3LVLnXHNT
 KmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nytq/On43q8XPsmcb/kSTUQUu6ygGympqGdBDgeJzfY=;
 b=lf706SFQ+kW05c7KbBdZYwNi/LGtsIJoFUhahVogkenfljJmR3/8NpDqWSJYuV/0LW
 rEiLhlFp/jEArRn8VhdjVAZhJVqwQ8l/7Ji781mlH3UFbsMBKLm3LH0o/n/kxGOcCFSs
 E+oA+B8qbWwcfttxiMOp52IkduDKstyQC5Vruj/YvM0lLkPWlMxFx1zxBcJzJeX/dKQf
 30ZLuxM12EW0F7L6CzkNMFGrUy/ubSadxPWklF1z9ns2dl/C179EIAtis5/M9wIEhrJP
 mGbb32X5tfrc60nAPz+RD34WynmmYHSrO3kTZRZXH7b4YqiID4QnASjPFxvQnljIzyc9
 ADFg==
X-Gm-Message-State: APjAAAXNhCVNQ9TjwBlMG8AWexvRaGQpYBQHM2Gj6o9yFIKeLpDZQE94
 a8iX6ENu9edgVoxFRtPzlpY=
X-Google-Smtp-Source: APXvYqxn8yBAWfFqMrTjax6PBoUXe7fjtfc1XiH6muJ6fS3SzOZiH/DzI+lzz7JVSfykkQBkJ5jBHA==
X-Received: by 2002:adf:e850:: with SMTP id d16mr10513190wrn.269.1557928321334; 
 Wed, 15 May 2019 06:52:01 -0700 (PDT)
Received: from macbookpro.malat.net ([2a01:e34:ee1e:860:6f23:82e6:aa2d:bbd1])
 by smtp.gmail.com with ESMTPSA id
 x187sm2256456wmb.33.2019.05.15.06.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:52:00 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 1FBCB1146D7B; Wed, 15 May 2019 15:51:49 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: silence a -Wcast-function-type warning in
 dawr_write_file_bool
Date: Wed, 15 May 2019 15:51:46 +0200
Message-Id: <20190515135146.5866-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515120942.3812-1-malat@debian.org>
References: <20190515120942.3812-1-malat@debian.org>
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
Cc: Michael Neuling <mikey@neuling.org>, Mathieu Malaterre <malat@debian.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
option") the following piece of code was added:

   smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);

Since GCC 8 this triggers the following warning about incompatible
function types:

  arch/powerpc/kernel/hw_breakpoint.c:408:21: error: cast between incompatible function types from 'int (*)(struct arch_hw_breakpoint *)' to 'void (*)(void *)' [-Werror=cast-function-type]

Since the warning is there for a reason, and should not be hidden behind
a cast, provide an intermediate callback function to avoid the warning.

Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
Suggested-by: Christoph Hellwig <hch@infradead.org>
Cc: Michael Neuling <mikey@neuling.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
v2: do not hide warning using a hack

 arch/powerpc/kernel/hw_breakpoint.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f70fb89dbf60..969092d84a2f 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -386,6 +386,11 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
 bool dawr_force_enable;
 EXPORT_SYMBOL_GPL(dawr_force_enable);
 
+static void set_dawr_cb(void *info)
+{
+	set_dawr(info);
+}
+
 static ssize_t dawr_write_file_bool(struct file *file,
 				    const char __user *user_buf,
 				    size_t count, loff_t *ppos)
@@ -405,7 +410,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
 
 	/* If we are clearing, make sure all CPUs have the DAWR cleared */
 	if (!dawr_force_enable)
-		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
+		smp_call_function(set_dawr_cb, &null_brk, 0);
 
 	return rc;
 }
-- 
2.20.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47349424341
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgN61WWpz3dg2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.52; helo=mail-oo1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJQ3scHz2ygF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:50 +1100 (AEDT)
Received: by mail-oo1-f52.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so524930oou.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lY59MK3rRpvbu1Z+VUSRhTP9oCogI9gtd3qobuL4xSE=;
 b=6xHoe8jeUdQBIHYxqI8J15ahtimtIW6j/FxZH/jlVBxyLkuiruNqfMvFI/XYilirJS
 13WRE+MXe9Qwg672CGm3CS/+1RczcD6PVBvZLz8+faE80Tj7ot1/T6KTw5MFeoaw8oM8
 1peNKHLT5Yj1DMgRpVZwtv1swIt+2PpjV+SWL2QRRJfRAl0tqDaVkjfQUrR7rSdFcVSc
 0vaP8sjFECpx1Rw/LXuwKOHt+kXABUobS/zU8v6l3KqYkNqrEqKw7ZjTg0gvafU+Zewp
 b9Hv9skbk+gmAxy1SRnNvX+VFdFCLu9fqndfEwyIq74c0B0eL91zCtoiI+pnGdMEo6q6
 LW4g==
X-Gm-Message-State: AOAM531rss1JwajcImPHBb+beTfF+08b3cGeSTeOUibCRrRwH8GgCO2A
 /kJn9MBLzmXDbzKU3E5UyA==
X-Google-Smtp-Source: ABdhPJz0UBQruF1+4qwCrW51W9Ryn9cj8arPhEOykPX2X80Gkf6HFF4wZl1tVkLGt4TXGOWPUlKBPA==
X-Received: by 2002:a05:6820:1018:: with SMTP id
 v24mr19468852oor.27.1633538628646; 
 Wed, 06 Oct 2021 09:43:48 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:47 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/12] powerpc: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:27 -0500
Message-Id: <20211006164332.1981454-8-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Borislav Petkov <bp@alien8.de>,
 bcm-kernel-feedback-list@broadcom.com, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace open coded parsing of CPU nodes' 'reg' property with
of_get_cpu_hwid().

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/smp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9cc7d3dbf439..d96b0e361a73 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1313,18 +1313,13 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 int cpu_to_core_id(int cpu)
 {
 	struct device_node *np;
-	const __be32 *reg;
 	int id = -1;
 
 	np = of_get_cpu_node(cpu, NULL);
 	if (!np)
 		goto out;
 
-	reg = of_get_property(np, "reg", NULL);
-	if (!reg)
-		goto out;
-
-	id = be32_to_cpup(reg);
+	id = of_get_cpu_hwid(np, 0);
 out:
 	of_node_put(np);
 	return id;
-- 
2.30.2


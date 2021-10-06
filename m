Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B10424337
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgLB4R2nz2yy3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:45:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJM04Frz2ygB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:46 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id w206so4862679oiw.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CN2tRnfV0nmrSbuDbyHoypag3neEaofRCNv6xL7Eiog=;
 b=3wep7S3yM5JjPRxoZjXCAnqOjEqAkpZOKnRmMlIm+Yek1eCKDcz9h92x1qvEv2K7XC
 H2pu/mlTwDddKHTr/E50zhfjL1MzxzKmG2ZaoKmvJDzt6dCh/0xS45sKUdAjIwaoOC7/
 358bOLlGeCfk3FejMP405i+h/LxLs8iRD/xKX22rimvANOcWTbPcQOGt3Ifhy7rBFmKo
 IcF32LD6i3WEtFctI+GtO+83m+HXo7GkdocyGWKcMz+zgorZpiTVJvs/cgcIHpTBCRUO
 T8uNYj4tnXvi2lyFXzeUTquV1pvBgMsnkgz1GWe2OTd0z++BT0kSxLKPFJv4F3mess3x
 +ocw==
X-Gm-Message-State: AOAM530XRKSh9JUdXWsM/zjAziSLSaQ7riVMGAiAMyvAZFFLamOEDcAu
 hz3DLRlXr15aTsjv/HjGHw==
X-Google-Smtp-Source: ABdhPJz/z+8TSD/WdWHkwOUMUF3/lnf5Mt7uWOPSGKwTcm1xutcPl6qw5jPqaYPZiNT3CeLWfPqlWg==
X-Received: by 2002:aca:30c9:: with SMTP id w192mr7839682oiw.93.1633538624646; 
 Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
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
Subject: [PATCH 05/12] csky: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:25 -0500
Message-Id: <20211006164332.1981454-6-robh@kernel.org>
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

Replace open coded parsing of CPU nodes 'reg' property with
of_get_cpu_hwid().

Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/csky/kernel/smp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index e2993539af8e..6bb38bc2f39b 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -180,15 +180,13 @@ void __init setup_smp_ipi(void)
 void __init setup_smp(void)
 {
 	struct device_node *node = NULL;
-	int cpu;
+	unsigned int cpu;
 
 	for_each_of_cpu_node(node) {
 		if (!of_device_is_available(node))
 			continue;
 
-		if (of_property_read_u32(node, "reg", &cpu))
-			continue;
-
+		cpu = of_get_cpu_hwid(node, 0);
 		if (cpu >= NR_CPUS)
 			continue;
 
-- 
2.30.2


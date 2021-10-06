Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958142433D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:46:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgMd113Vz3db5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:46:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJN6xpkz2ygF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:48 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so3873643otx.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E46c5KotLBJJxu4fxLSa91xNqDqPq5a/10Op+mtdz/c=;
 b=DtR+XjL2Y5NRrSGhoMH/kGfrn1QGoZAdaJag/CU/lI/0nUtxfOMTd9cd8jUramSq2r
 ehrZMBZUPyfG6MrYyO+FUYZV1L42FzH15hf71mBSDEri9MZCSAiMmkd0Ov1tq60C07qe
 sVSOIYFVcDW8sCdn+FXRDrx45Zv1cFpP3YfFPKabp9jJu1GP9BYaKdfRWDzAIQLmRvI9
 PLw97VRtLzkdvKKbWj9w6A6v0t5s6gRceBxNsw/scviHR/Th5bYw5i6Ra6PW/+kro99q
 /RCED0Kdb2cS27JW8WH+Ep45WQELa0B/93BPogBn0/KeavHJ1LNKnJeEjKjTtAZUaUs7
 N4AQ==
X-Gm-Message-State: AOAM533J3v3xpq39yskzD4+fYSw2aJ8DmJTgVm7GPOakrG51YQQJD9wx
 n1KqeAq8pvUHbp4BSC6F+Q==
X-Google-Smtp-Source: ABdhPJxehVSGYvZXtuNP7Z+wFAXu0A1JJQzA5MrGIRkKPVwBp+gSYiQNHX06q+RB97zQgpf/RwBd+A==
X-Received: by 2002:a05:6830:1d8b:: with SMTP id
 y11mr20406228oti.291.1633538626550; 
 Wed, 06 Oct 2021 09:43:46 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
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
Subject: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:26 -0500
Message-Id: <20211006164332.1981454-7-robh@kernel.org>
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

Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: openrisc@lists.librecores.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/openrisc/kernel/smp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index 415e209732a3..7d5a4f303a5a 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
 	u32 cpu_id;
 
 	for_each_of_cpu_node(cpu) {
-		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
-			pr_warn("%s missing reg property", cpu->full_name);
-			continue;
-		}
-
+		cpu_id = of_get_cpu_hwid(cpu);
 		if (cpu_id < NR_CPUS)
 			set_cpu_possible(cpu_id, true);
 	}
-- 
2.30.2


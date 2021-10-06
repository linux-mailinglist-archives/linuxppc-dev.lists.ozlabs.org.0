Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90D424335
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgKl0btrz3cHw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:44:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJM00Wfz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:45 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id y207so1679242oia.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uA/cSYcpVyY62IJQPXwhEfvcH0a7DNNoh6QF/gbSv/o=;
 b=28IrWJMZVMNaNttQdpSl4oPAserp9G4p9kNzvzNjhOKMSYBs28dL4+Fi4OP0nRtdT5
 wN6Rzbr75FgR/sJQhAeTyXePRJlEpFaTlPkJ7ZPPJAwYd5brSl11Jmp40z/+z2CeE9wq
 x6I6vqdWvTA67fV5RNkRAr5RrUWkMq9G0b6IAv8NxUfnsIUXz320YMgiEz+9SQQS9kvU
 wOIH/NUF7ye+NcBk0OuAEjFSW7e4yCjX48f4f3WYmB+Qzj37Zu+QP344aChTBIpHVYvC
 6Evtd/pmdtNlQ3tVoztQqjBTQsRP8/gwJdWfS82UD2aw46RaLVs+L9FUBJ+5lFYmjdeV
 h1qA==
X-Gm-Message-State: AOAM531sIx0THbIlE0ozHFha1h9f+RFemtRodzgIzekKLP86AWPE8xdw
 lKks84qNLVA8iR1yWYOgYw==
X-Google-Smtp-Source: ABdhPJyz5HqR6tKtFIEsHk/GSarLhJvs4xTI3uQnRBWEIdAL05spj94Pn3luIAFrkmprFHNc17eP4A==
X-Received: by 2002:a05:6808:231f:: with SMTP id
 bn31mr855081oib.66.1633538617237; 
 Wed, 06 Oct 2021 09:43:37 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:36 -0700 (PDT)
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
Subject: [PATCH 01/12] of: Add of_get_cpu_hwid() to read hardware ID from CPU
 nodes
Date: Wed,  6 Oct 2021 11:43:21 -0500
Message-Id: <20211006164332.1981454-2-robh@kernel.org>
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

There are various open coded implementions parsing the CPU node 'reg'
property which contains the CPU's hardware ID. Introduce a new function,
of_get_cpu_hwid(), to read the hardware ID.

All the callers should be DT only code, so no need for an empty
function.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c  | 22 ++++++++++++++++++++++
 include/linux/of.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f720c0d246f2..e587ab44be22 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -286,6 +286,28 @@ const void *of_get_property(const struct device_node *np, const char *name,
 }
 EXPORT_SYMBOL(of_get_property);
 
+/**
+ * of_get_cpu_hwid - Get the hardware ID from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ * @thread: The local thread number to get the hardware ID for.
+ *
+ * Return: The hardware ID for the CPU node or ~0ULL if not found.
+ */
+u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread)
+{
+	const __be32 *cell;
+	int ac, len;
+
+	ac = of_n_addr_cells(cpun);
+	cell = of_get_property(cpun, "reg", &len);
+	if (!cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len))
+		return ~0ULL;
+
+	cell += ac * thread;
+	return of_read_number(cell, ac);
+}
+
 /*
  * arch_match_cpu_phys_id - Match the given logical CPU and physical id
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 6f1c41f109bb..807f8168dad9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -353,6 +353,7 @@ extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
 						 int index);
+extern u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread);
 
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)
-- 
2.30.2


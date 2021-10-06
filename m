Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ABE424358
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:49:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgQk6lNRz3c66
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:49:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJc6sggz305g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:44:00 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so3845139otq.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODdwkiH4tXq9GvyXH7/gt65PfkKCS+62hrrbhfBOAKY=;
 b=ieUI63ZStvvzjfMIDuzRmLJgZo9ItUVh4qSL8ZW3iUCs/cbf1U8dUc3/23r+3OhXnp
 6gXkVVkXfdQWANR+edTdMPs/oAOWnfvgPz/AVNIcyWZCg1ISNA3JvYr+ddDGolzvqQ4V
 8MZwA9wP78ps3Ircy9AZwwfL03UvQzVYJBp9aAG+FRKKCTp6BTbLV1ohDAHaStdeYsmA
 sX/2+WBkK0aOjXtXToLgtpq2KBXcQGdPQJw4phTlvyMBCinRP14hxNqDGg1dD3uC4TsI
 dd7UftTPgNQasD8kPu5VLuhPwed8oS7lVbsspYSWGAWXSU5LqemSDtdcfIevKOio+yVv
 J/aA==
X-Gm-Message-State: AOAM530BUQ1wKe/NjiTlhcALSO4aWhy55qEzTUvbi8oeWZdVoqjJaNpz
 SIEBkI0J51gaQnflvilEDg==
X-Google-Smtp-Source: ABdhPJyKbg8/vmyrEytsmwBD61hnJT/KfL8RD1L+0+jj33vwvFOqRG7dPOrAYWXK5lnk+W9TvgzSoQ==
X-Received: by 2002:a05:6830:1ad3:: with SMTP id
 r19mr19253078otc.98.1633538638626; 
 Wed, 06 Oct 2021 09:43:58 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:57 -0700 (PDT)
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
Subject: [PATCH 12/12] cacheinfo: Set cache 'id' based on DT data
Date: Wed,  6 Oct 2021 11:43:32 -0500
Message-Id: <20211006164332.1981454-13-robh@kernel.org>
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

Use the minimum CPU h/w id of the CPUs associated with the cache for the
cache 'id'. This will provide a stable id value for a given system. As
we need to check all possible CPUs, we can't use the shared_cpu_map
which is just online CPUs. As there's not a cache to CPUs mapping in DT,
we have to walk all CPU nodes and then walk cache levels.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/base/cacheinfo.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 66d10bdb863b..44547fd96f72 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -136,6 +136,31 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+{
+	struct device_node *cpu;
+	unsigned long min_id = ~0UL;
+
+	for_each_of_cpu_node(cpu) {
+		struct device_node *cache_node = cpu;
+		u64 id = of_get_cpu_hwid(cache_node, 0);
+
+		while ((cache_node = of_find_next_cache_node(cache_node))) {
+			if ((cache_node == np) && (id < min_id)) {
+				min_id = id;
+				of_node_put(cache_node);
+				break;
+			}
+			of_node_put(cache_node);
+		}
+	}
+
+	if (min_id != ~0UL) {
+		this_leaf->id = min_id;
+		this_leaf->attributes |= CACHE_ID;
+	}
+}
+
 static void cache_of_set_props(struct cacheinfo *this_leaf,
 			       struct device_node *np)
 {
@@ -151,6 +176,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
 	cache_get_line_size(this_leaf, np);
 	cache_nr_sets(this_leaf, np);
 	cache_associativity(this_leaf);
+	cache_of_set_id(this_leaf, np);
 }
 
 static int cache_setup_of_node(unsigned int cpu)
-- 
2.30.2


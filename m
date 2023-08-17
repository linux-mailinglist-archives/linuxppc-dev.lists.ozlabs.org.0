Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30E77EF45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:00:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UZY2YVXr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR8rw3Tqmz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UZY2YVXr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR8qy4V7Vz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 12:59:57 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6493389c56fso5411266d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241194; x=1692845994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE/BUm2FSSisZiwalVUsZxq3GksbeB9ZKcukTp9gXFM=;
        b=UZY2YVXrHGTVpEhbC5mxFz06MN1nNY1gyh7KoP2ggYewVRUUkbhSsyIhi5sB4yf5Sr
         YXp/Unxm0pcBXp5ekpS22Ov61WGv4mX1Jtqmm35gEkixtpLg7bT7FbO+QTo93+xlU0Ts
         vOLD8UWlG7J9toNDv7UQ9yaH6KUyt8ZqK0rOxCXmJnJ4xdCzSDOMUw/Fqn3c27pcaUbu
         U0uYDusXjtk9NVzYHoUSUwvW/jsLsYgVQ+UMznrHW6mpeCVxOtXEAtmEQaGB+haCnpbH
         dyRNz/QiAIt6HenV7y8ywhqVmxmUKFPlvMIJGmxAwaU/5dW4ENLiWMpEcoUBQaSxPh9h
         vjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241194; x=1692845994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE/BUm2FSSisZiwalVUsZxq3GksbeB9ZKcukTp9gXFM=;
        b=DdbyA9+JxoifKb0Cep3Ys4J8QnbvYjEQrkngbsEpaLaZgcpLI4GjWwisWJZshmHRhH
         OpvyjPhCqGeIoy6EHEPJ8mvtKlY+cep7yrowrxTGgSKb6u3ZFVgjJhHAjnCbe0UOSKht
         qtw8dV1lDAQ/pz59T3o6qb88FKAMJTYNY/FheQCtIcT47bh7kfOtRohMLTTSXmkvcpG9
         wW0q9Yj+d1xpz/s1vj5TP+Xy33VnI+VPip5/wHFdePZF9jeOMmjbHci0caoljqyf2xFT
         9w6m9GDCLZ9Wou7TBiQx5MUf7cspbTPqFv7C46AErIteDzVklSfTQvTojjkggh88ULJ3
         lSTw==
X-Gm-Message-State: AOJu0YxdCz0xOw0hSB9PT0kBWKKB2ZBYs6CFFSbQpIOz4Wfna9EEZ7Ea
	RiCU/WXjZz6IYO8ZlRaxTG4=
X-Google-Smtp-Source: AGHT+IECVIOcGyGWVM+fNHMcONvgzoQkkaN3K6EQ3o6DVnQup7O4owLUrKdS4yydSMgybnuA2LUQuA==
X-Received: by 2002:a0c:b38c:0:b0:643:3117:b22e with SMTP id t12-20020a0cb38c000000b006433117b22emr3157248qve.27.1692241194140;
        Wed, 16 Aug 2023 19:59:54 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:53 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH v2 1/4] arch/arm/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:36 -0400
Message-ID: <20230817025942.3209-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817025942.3209-1-twoerner@gmail.com>
References: <20230817025942.3209-1-twoerner@gmail.com>
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
Cc: linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop CONFIG_NF_LOG_NETDEV as it was removed in commit 1510618e45cb
("netfilter: nf_log_netdev: merge with nf_log_syslog").

Drop CONFIG_NFT_COUNTER as it was removed in commit 023223dfbfb3
("netfilter: nf_tables: make counter support built-in").

Drop CONFIG_NF_FLOW_TABLE_IPV6 and CONFIG_NF_FLOW_TABLE_IPV4 as they were
removed in commit c42ba4290b21 ("netfilter: flowtable: remove ipv4/ipv6
modules").

Drop CONFIG_NF_LOG_BRIDGE as it was removed in commit 77ccee96a674
("netfilter: nf_log_bridge: merge with nf_log_syslog").

Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining arm defconfigs as it
was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
glue layer").

Drop CONFIG_USB_MUSB_AM35X as it was removed in commit 57f8e00d8a82 ("usb:
musb: Drop old unused am35x glue layer").

Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
("netfilter: nft_objref: make it builtin").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/arm/configs/keystone_defconfig  | 1 -
 arch/arm/configs/multi_v7_defconfig  | 1 -
 arch/arm/configs/omap2plus_defconfig | 8 --------
 3 files changed, 10 deletions(-)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 1cb145633a91..61179b75cf1f 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -98,7 +98,6 @@ CONFIG_IP_NF_MATCH_TTL=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_TARGET_REJECT=y
 CONFIG_IP_NF_MANGLE=y
-CONFIG_IP_NF_TARGET_CLUSTERIP=y
 CONFIG_IP_NF_TARGET_ECN=y
 CONFIG_IP_NF_TARGET_TTL=y
 CONFIG_IP_NF_RAW=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c7b2550d706c..497274c81ea2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -851,7 +851,6 @@ CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_USB_MUSB_TUSB6010=m
 CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_AM35X=m
 CONFIG_USB_MUSB_DSPS=m
 CONFIG_USB_MUSB_UX500=m
 CONFIG_USB_UX500_DMA=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index b685018dcf54..b2f0862f4bd9 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -78,7 +78,6 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETFILTER=y
 CONFIG_NF_CONNTRACK=m
-CONFIG_NF_LOG_NETDEV=m
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NF_CONNTRACK_TIMEOUT=y
@@ -92,7 +91,6 @@ CONFIG_NF_TABLES_INET=y
 CONFIG_NF_TABLES_NETDEV=y
 CONFIG_NFT_NUMGEN=m
 CONFIG_NFT_CT=m
-CONFIG_NFT_COUNTER=m
 CONFIG_NFT_CONNLIMIT=m
 CONFIG_NFT_LOG=m
 CONFIG_NFT_LIMIT=m
@@ -100,7 +98,6 @@ CONFIG_NFT_MASQ=m
 CONFIG_NFT_REDIR=m
 CONFIG_NFT_NAT=m
 CONFIG_NFT_TUNNEL=m
-CONFIG_NFT_OBJREF=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REJECT=m
@@ -179,7 +176,6 @@ CONFIG_NETFILTER_XT_MATCH_TIME=m
 CONFIG_NETFILTER_XT_MATCH_U32=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
-CONFIG_NF_FLOW_TABLE_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
@@ -193,14 +189,12 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_NETMAP=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_SECURITY=m
 CONFIG_NFT_DUP_IPV6=m
 CONFIG_NFT_FIB_IPV6=m
-CONFIG_NF_FLOW_TABLE_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_AH=m
 CONFIG_IP6_NF_MATCH_EUI64=m
@@ -225,7 +219,6 @@ CONFIG_IP6_NF_TARGET_NPT=m
 CONFIG_NF_TABLES_BRIDGE=m
 CONFIG_NFT_BRIDGE_META=m
 CONFIG_NFT_BRIDGE_REJECT=m
-CONFIG_NF_LOG_BRIDGE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_VLAN_8021Q=m
@@ -560,7 +553,6 @@ CONFIG_USB_STORAGE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_TUSB6010=m
 CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_AM35X=m
 CONFIG_USB_MUSB_DSPS=m
 CONFIG_USB_INVENTRA_DMA=y
 CONFIG_USB_TI_CPPI41_DMA=y
-- 
2.41.0.327.gaa9166bcc0ba


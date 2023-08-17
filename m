Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74E77EF54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:02:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Zw4yS8EE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR8tr0qFbz3cG3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Zw4yS8EE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR8qz1tj1z2yVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 12:59:59 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-640c5df2e6eso37435826d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 19:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241196; x=1692845996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztwugRyCoG/jPczTnAvnIkr0nq9TF+fC2+bEu6D3jFw=;
        b=Zw4yS8EE/ONnyxUVX0vsKLQUPf5oNFxSVPTWmOyt4c9a9lq6ns/tC4610cgge8UXgh
         fBhR1AdhwR9+pdnw5tRB+nIS+XUKsWg9lY7C9zM6eYgGoCfOBUP21kM5OM/pDhOahNSx
         wXluh7v2jIkhQdJJifSB8i0RenT6XLhxG8V9iThazbxiTkEUJM+tJ2tWaMQtUqfPZ8f2
         Hv99NSes3vLfyMDH56pVsPQXJYlOS0T0ENdSrkqFa1nnmUiJzDPXVhd96mWYJ6Am9Tc8
         OwzCXEx2MpfRi0rwevYHxRB9wjuSrt2KNaXNTfPAyOnLTlIFwDrZ2INl9TTdeLMxyW+H
         TjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241196; x=1692845996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztwugRyCoG/jPczTnAvnIkr0nq9TF+fC2+bEu6D3jFw=;
        b=MRjBfoSfdNxlYJjUm4pHcv/vbIYOro0jtJX8F+8DZZeQAooDmCdR3TCsiQgOpQVhBR
         LH4vmiOo2RtTQE6CWNxVG4mRtL7gsUiZ5zDr16shbJaiZgOkXP7YI6UmtErL/wCp+jdu
         H3/9c18YYO8e1iE6ehZD5AzCfJ4kLrBeqIvz8BXEZXkCBxEH69ERGtXs4MrlCI8WU38H
         5QkeB6/8D6QBenpmAgGoxB+zZRT/ZO6NoIYE9YEBopmI+8uJWuqj/wEUON7ZwZ7VIFVg
         Na3SQ3IY0UyeuUKcsYAo+zbPngnMhnjqMvl9hjYmduOYFGBXOlr01Z8XiY5viV80A5TV
         LuYQ==
X-Gm-Message-State: AOJu0YyJjtjL+yrLAwa9B3/SkvOuqR2oJIVLbQBPvgH+MohvpIHa2ioD
	O2fkgvfiuxcDbljVu+/aKYs=
X-Google-Smtp-Source: AGHT+IG+FilTVdaRFGvd3ZuP9D/ev2/97REv1ERlKBJZKe5MJQokXeEBYBnEUFUrg7AAkPP/DryCmQ==
X-Received: by 2002:a0c:b356:0:b0:649:7b67:14d3 with SMTP id a22-20020a0cb356000000b006497b6714d3mr1869864qvf.32.1692241196259;
        Wed, 16 Aug 2023 19:59:56 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:55 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v2 2/4] arch/loongarch/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:37 -0400
Message-ID: <20230817025942.3209-3-twoerner@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 57f8e00d8a82
("usb: 71 musb: Drop old unused am35x glue layer").

Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
("netfilter: nft_objref: make it builtin").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/loongarch/configs/loongson3_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index d64849b4cba1..4700655b2bcb 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -137,7 +137,6 @@ CONFIG_NFT_MASQ=m
 CONFIG_NFT_REDIR=m
 CONFIG_NFT_NAT=m
 CONFIG_NFT_TUNNEL=m
-CONFIG_NFT_OBJREF=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REJECT=m
@@ -227,7 +226,6 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_NETMAP=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A501A77F5B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:52:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TI34epmG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRNfs3QjPz3cW8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:52:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TI34epmG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRNc44Ztpz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 21:50:28 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76ca7b4782cso499017185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273025; x=1692877825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbvZ0wXoAsUi3mH+OyBVc4tLRr53KILTrQvp8XOCI2I=;
        b=TI34epmG63xD/ogdDBQlcmORfJTVgqCB9lCa/odYhTA7mGcaaXBsVMVzIoLJkRSQSX
         cyj6CUlXhBBpxGczW9E//k7K5WcVE0awNVniGZOocUxt1fjELgDWbzmKjH/aB/Lw8haN
         ejRcRk+qaJr5GY/7t0AgvIN6MkEqFwU/TsheIqw6pwDr60lXmZZc4/+qGwtIMqPjCStI
         7LGDwqCEjWEvukhk68ufc+soaBCCdJqVyC3WfFdbEX15Vhznz7adSHAXxXIS41T3S+HW
         gUgF92Cz6ETPSlKpDhxGxaPa8wHIFUKq8zBcj/64dTv6/6P+aoRQODiwtCT7tJFNbbzP
         z9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273025; x=1692877825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbvZ0wXoAsUi3mH+OyBVc4tLRr53KILTrQvp8XOCI2I=;
        b=Y+A9eWw7PRtUepa4bODTJbuIs7cORviFixDrDiWsePOKtndrBe/fCGNIfZOi5cOZNa
         alfqis/bpUQ5Z4MNb68Q33BDf5QPd+JOr9yCX9tNBOExqaTCE4xofT8osn1+rkp7FMBn
         OvvYiWylVOKd/7rzRBxZtEcGYgC/dJvP5ILb+o4rqgfufSJ4Jd6JxrsvccfhH02SP8ey
         qZltlIU8vWhx5X7GYhTmY98M4M0oe9EMBzADP6RFDUD71ATlNSRKUT3RrdEEJAmd2OAn
         3jizYdz6pjJ2eplfvNBpb8soW633za4iCRTFa0nfoITRWpQ44q8Ag0CiKu+nha3qEjE5
         Ostw==
X-Gm-Message-State: AOJu0Yw9uiYgZ5jUfl92KTI3J17uAxFHppRwGuAax7qCKE8t7LNnFLyf
	KmQV3KuKqD9vjJ/yDkxt3Ko=
X-Google-Smtp-Source: AGHT+IFwFJxPNX+IDoSCTYuBwePuAYwMImkYtdwD+QMIGbAdq3LaStJT3pJEeHO3wtYuDF5hW0txgA==
X-Received: by 2002:ac8:57c8:0:b0:405:5337:4166 with SMTP id w8-20020ac857c8000000b0040553374166mr5942082qta.68.1692273024954;
        Thu, 17 Aug 2023 04:50:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v3 2/4] arch/loongarch/configs/*_defconfig cleanup
Date: Thu, 17 Aug 2023 07:50:12 -0400
Message-ID: <20230817115017.35663-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817115017.35663-1-twoerner@gmail.com>
References: <20230817115017.35663-1-twoerner@gmail.com>
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

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 9db5d918e2c0
("netfilter: ip_tables: remove clusterip target").

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


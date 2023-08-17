Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21C77EF53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:01:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WHSqp/Oj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR8st3KdLz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WHSqp/Oj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR8qy3Bw5z2yVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 12:59:57 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-40feecefa84so38424231cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241192; x=1692845992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqIUTEi6b5maOYfEISJN/XLCGUsT7sZm6MvKkdhtPPQ=;
        b=WHSqp/OjipS4malg5Jhuw8Q9iUeu1/JOmbXWqXYvnZgGD0kM17N6tQvxwUsCI5NLru
         Uc5eVbilZvj+vU/FDtUEKtVANL/igEVVU9fMzmN+KBhf+xt59WNKpal6tsNf+z9+Y7TV
         yD5Im18r3kHMjvZZUNXeLn1YO9dO18rMwOHA24MSxJx1EZE51SgTXLAarM8kC0zelVrK
         5SidfXYcfJz7Lp9YUVglFIezKC2ivHG+RE4hB+Sk1DDJsqYqmafTDGDirXACn06WXuBz
         DmK8i+/ZjA5wROpsni5u9JVtRraWCxRDSDmuyfbzUbITI31KPak3SF5rZt2bcrO0fYUd
         z78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241192; x=1692845992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqIUTEi6b5maOYfEISJN/XLCGUsT7sZm6MvKkdhtPPQ=;
        b=PYPbwL+Qz0CJ5N0b5aNCVbGn+6v2vscRk9o7sGkXkdvHVLEBelC9DeDhOnG2oRrQHd
         zpVg7vptjnH6sDB2F/XeqwBbxpNoFTbL1PM8WW5U5NmY7ell3iARYIbUC5MhVO01nytP
         tZf2iX1lk9Q6evya9/5Acj98xiumPRonSPdbKawlxBhRiOAhAYdsmgjOrGK73MywUMIp
         O/xH1Da1B7O7LjgztbSpGa8zru0uLFaa4OHBce2kbreApMbaU1eQEVWecu3SKIiBIbH1
         X6xbxCZbOD9a3eRS3EAGwMZbTVeqR8Ldy2P37a+cXL+B3lN+F9KHW77JewJ+u4HbscDA
         0Xng==
X-Gm-Message-State: AOJu0Yx6YE1Oxi2iAOtwYhVvrPrIoDLswhICckD0h5ysWAoSakwfdGGN
	1XlEaL2SnclrrcRMavPUs/o=
X-Google-Smtp-Source: AGHT+IFBzAZ0MiGiVZDZXUmHBUCgDd7pIXBv+9jFVMKW5hvqzp/dG7vKept76xYLnf/geME77zPN6A==
X-Received: by 2002:a0c:e047:0:b0:636:afa1:345d with SMTP id y7-20020a0ce047000000b00636afa1345dmr3324091qvk.17.1692241191804;
        Wed, 16 Aug 2023 19:59:51 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] general defconfig cleanups
Date: Wed, 16 Aug 2023 22:59:35 -0400
Message-ID: <20230817025942.3209-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
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

Drop config options from defconfigs whose code has been removed.

v2:
Generate arch-specific patches. In v1 I organized the patches by
CONFIG_ option which caused some of the patches to cross architectural
lines. This requires cross-arch consensus before they can be applied.
Therefore organize the changes by architecture so each one can apply them
independently (or not).

Trevor Woerner (4):
  arch/arm/configs/*_defconfig cleanup
  arch/loongarch/configs/*_defconfig cleanup
  arch/mips/configs/*_defconfig cleanup
  arch/powerpc/configs/*_defconfig cleanup

 arch/arm/configs/keystone_defconfig        | 1 -
 arch/arm/configs/multi_v7_defconfig        | 1 -
 arch/arm/configs/omap2plus_defconfig       | 8 --------
 arch/loongarch/configs/loongson3_defconfig | 2 --
 arch/mips/configs/ip22_defconfig           | 1 -
 arch/mips/configs/malta_defconfig          | 1 -
 arch/mips/configs/malta_kvm_defconfig      | 1 -
 arch/mips/configs/maltaup_xpa_defconfig    | 1 -
 arch/mips/configs/rm200_defconfig          | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 10 files changed, 18 deletions(-)

-- 
2.41.0.327.gaa9166bcc0ba


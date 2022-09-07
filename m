Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FB5B0394
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:05:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN1DR3zjPz3blS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:05:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fZrD9EyU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fZrD9EyU;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN1BV4HTbz2yZ8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 22:04:01 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id l10so1056035plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IszLW3sg1SPv5mSl2k6bEBExPJOlwV+yZ4skOQwS8j0=;
        b=fZrD9EyUeRNcWfFPKnYIbz5HEmaA0y95IjNoFqAZMsp5fwJQ0yre8Sq3BwiY8n6UNy
         313a8izLaOeV9KwboIv2ttPxPE2vx7vEOL9N7JZhMGmZtSkVqbPELwkbJawRTVaf88Qm
         jOVUuR+Bb4mC50muTiGrgv2fr2po+wF7X4Kjn6ZPRq9vYxXPMyw6WIF5Jluwd0BapNqx
         el1Wug6i6EhBcgrSt70OJ7IIx7akciEcSJiqwWPCHMB6qNWnQIl4zDyPDOwKMpwjSCgq
         o3axJn4vRVaL7qkCVJWmtb/G5zJNfXvCcAJlUDBSqHTAZFjPLHxdkkuG3wGCNzQGBj+G
         SzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IszLW3sg1SPv5mSl2k6bEBExPJOlwV+yZ4skOQwS8j0=;
        b=cFRgVv75JZRpFFlo/R6LGxel4IomSJutXG7xlJ16tuKhiH1WJuK2lKw202k9LWmukJ
         ZWoNBU6uHmFSISfKKv6fofKgSXAsdEQP6DlACypOTmZqsBao8YkDDdhW2UnYjDKuJkWI
         77yn1XnOjv7b4PdbtlseAJbgoTJL4ayil6f73vOYaxXal3Q0SvEJl0mVqbg6oCaLOuFo
         2vl+vaE0Xuz06iq1/qPMlem+yHKEXh0l190oIQ0hONJpG91E3WQ5lnxh/O8WI6NeyBvY
         GQzp783mbsFBEoCYD6I4jSWZBt7Xpy8oLKo+4G9wLO2LxHAqjuDRbGm5KocsBlsofDnw
         KvYw==
X-Gm-Message-State: ACgBeo0PizNi+uNkZlSD8teuYFGiT3CqF7i1BMCAKc3boX9QotQU6jmJ
	klw6DY9ATCl368UCDhxc+DPk2xN/TEk=
X-Google-Smtp-Source: AA6agR7JLGxEWW+E8WFZi4vpMaoJr1wrRCHXtB+eyf9Q7P3pzqtTU7VroEkxUaL4q3ricnIZNDAWFA==
X-Received: by 2002:a17:903:32d2:b0:172:f62a:2f33 with SMTP id i18-20020a17090332d200b00172f62a2f33mr3462439plr.16.1662552234061;
        Wed, 07 Sep 2022 05:03:54 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090acf0a00b0020061f4c907sm6320212pju.7.2022.09.07.05.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 05:03:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc/64: more soft-mask improvements
Date: Wed,  7 Sep 2022 22:03:45 +1000
Message-Id: <20220907120347.3684283-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are a couple more improvements while I'm here, I had to
rediscover again why disabling softirqs during irq replay is
hard, and ran into some bugs trying to find a way to do it.

This doesn't solve that, just documents it better and tidies
up code a bit.

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
  powerpc/64/irq: tidy soft-masked irq replay and improve documentation

 arch/powerpc/include/asm/interrupt.h | 33 ++++++----
 arch/powerpc/kernel/irq_64.c         | 93 ++++++++++++++++++----------
 2 files changed, 81 insertions(+), 45 deletions(-)

-- 
2.37.2


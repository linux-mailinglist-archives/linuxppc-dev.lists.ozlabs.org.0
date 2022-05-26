Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE658534A99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7zKn4cnQz3bx3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 16:58:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=AVzKQVVw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=AVzKQVVw;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7zK71nsfz3bwg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 16:57:45 +1000 (AEST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD92D3F20B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653548261;
	bh=YwbocuSneHvQq0fh/EdmbXmlfTeqDwMbby8XL3N7k/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=AVzKQVVw6TAGDLnKvunWmwYt/vuoJeWlSsWN0c6fC8Ls5GcSKlxqeKHXqxPZAigMq
	 uewf8jwgt5JMG1muu29/LGH6bz6E+VkF6YiYd2xiToOOdiCtwMWzSu83+emDMaLnw/
	 v9h8nC9Lw5jhtIMufDudYqzJHi9Jebb0BTAr3V7FPGmuWuHD1oCnnpRDGol+5ML8EN
	 KwVzfBBmnCxM7C/z+DUfBAofjmg5fmlHA5CbZEXq0+q6C+JDTrUXviy5AfbJnunszD
	 hdXu2P3o+BcVKxl4OJg3sAmJDXQ+V9mE56zTvAD3N6s3YQkvWHyObTALV0tNJc6lJO
	 lQ/hmLZbP07HQ==
Received: by mail-ej1-f71.google.com with SMTP id v13-20020a170906b00d00b006f51e289f7cso353645ejy.19
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YwbocuSneHvQq0fh/EdmbXmlfTeqDwMbby8XL3N7k/U=;
        b=DXV2QrqywSJGHiQh4YnnYWt/xhFVVwUeThnWVJ+B80xzPpogZV3JXAn0alupOjlpD1
         zkIZekCablhSW63DPX1mTxb/d2GE/VW59q0hLQihKqEk9iQaWn3eGApxcOvHVH4oU8bW
         b/EisNS5HioczSk8dH/d5yKwipP1sM/6fUbN2QKYUdGmijh+jJfRaRG7/MXfTdqh+sbW
         8YBUK4DeQRngiAwtrV7M+EdsKGIasU4uy7L4OlwKpN43o/OOOsIxUdUay7K+xMC6i+C9
         1B7lJJnRB3KtSFM8ycBn4Pn+FGVdOuqL6p1xk9lkaCR8R6yljQEnFJslDdd9or/Y8nUM
         YG5g==
X-Gm-Message-State: AOAM533tQgXZ6Dghukvw40ciasvQFl3FCZSd/CcRY5kaTow4lf1KyFAD
	WThsR0iyMjb9n9hop1MyNziFKxsUy4HlQtWULNanB9ro30Wsy9Cdq2IosRqtGvzsh/lmFwo95gz
	74yPVGEZyC0vc+nL3dUAYsaRfKDrhIvLq9Q1ifmhEteg=
X-Received: by 2002:a05:6402:380f:b0:42b:27aa:d4cb with SMTP id es15-20020a056402380f00b0042b27aad4cbmr31517638edb.211.1653548261445;
        Wed, 25 May 2022 23:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrCbaTkwubd8CefOtFsYwzxV3AEkWN3OGRmcmHpo3yFUy4WL5kUwmf18rbGX6Kv/KSsK8d0A==
X-Received: by 2002:a05:6402:380f:b0:42b:27aa:d4cb with SMTP id es15-20020a056402380f00b0042b27aad4cbmr31517629edb.211.1653548261294;
        Wed, 25 May 2022 23:57:41 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090652cf00b006fed8dfcf78sm220906ejn.225.2022.05.25.23.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 23:57:40 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc: Kconfig cleanups
Date: Thu, 26 May 2022 08:57:35 +0200
Message-Id: <20220526065737.86370-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace some stray tabs with whitespaces and remove an extra empty
line.

Juerg Haefliger (2):
  powerpc: Kconfig: Replace tabs with whitespaces
  powerpc: Kconfig.debug: Remove extra empty line

 arch/powerpc/Kconfig       | 6 +++---
 arch/powerpc/Kconfig.debug | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.32.0


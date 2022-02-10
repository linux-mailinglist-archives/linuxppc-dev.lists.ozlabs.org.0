Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5A4B16E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 21:28:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvpHV33Knz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:28:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lQxJpuZR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lQxJpuZR; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvpGs5LBzz3bZR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 07:28:19 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id o17so9734403ljp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 12:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vml5uigID9wwvx/PlQfGPRSbZZVlYDUpEbRuwhp0E2s=;
 b=lQxJpuZRKbrjYRk+AyXay/cRjKN560M2OahoDpjCzzb2OGujUrlPndTElEa8/M3seS
 zhgS77DEtiBCseBEetgdEXFMW5dz8FGSsjH3KqwBk4N2RB5L6gsVX4WzWUYoonZ0sf/G
 A1W2cKPLVlroJJ9/3S4cmVoKOg6QT1+werAp9+E4SopOP1iOyP7oq/X7De4OtQXj68RG
 taGCRLCihFoa9nsNfCdFCv9jZ643U8FwlaSCXMTQG410eSS+QfOi1zNzK/Arv7Nkp/LK
 FBDA3SFdvkgGrHSWbrYxayF4AIVehEyQfxFK2cZwBKN8pAWmIWZW6jYy9Du+YFtvlQf6
 3yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vml5uigID9wwvx/PlQfGPRSbZZVlYDUpEbRuwhp0E2s=;
 b=Hkofo0pPIk3Owp1j5XeQkIePDeNwAjJ69cHr4T880/Qv5hwSzXvyAxpopl5FgvBXKr
 pJk+E0XHlTc2fOtAYvD+yVRmdlAdHvO3fuMZVpDqy16Gntdt3SXSmgg+aEZ5mlAWV8hX
 Jsehf9ft2VQEpI7dNpwy8TkUnFIYYKRTgMBrxsdAtrxmrY6Ae4gfGcWr/YeDK7daEh3S
 qxREvnPQnB1BlMd6/rDs/7+ZucUrki+eQfP2FdD1YaL5ORAuFLQu2S+4fYTHgsxSepxK
 RbnjVfOszYssxMDYCV7I/DMMMPvooKw3A5sPeS68uBG30sNqxD4/9R1yaWDCvkOfPTCg
 WW8w==
X-Gm-Message-State: AOAM532VY8M8WkDbNshFf+r8QvzXlXK9U9LOKsBeCAPA3InKzwlofiQ9
 rKojUYEFWT9XsFFbg4BLV6A=
X-Google-Smtp-Source: ABdhPJxlaU4AbDMA3tdAJCj8pQ7P7mO2f3iSg8/6pS8JrpcHZh+5pVcOdX/Ay+jQV0U47LM1JTZ0tg==
X-Received: by 2002:a2e:b05a:: with SMTP id d26mr6005006ljl.425.1644524893738; 
 Thu, 10 Feb 2022 12:28:13 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d19sm1223881lfg.108.2022.02.10.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 12:28:13 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 0/3] drivers/crypto: Constify static attribute_group
Date: Thu, 10 Feb 2022 21:28:02 +0100
Message-Id: <20220210202805.7750-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series constifies a couple of static attribute_group structs that
are not modified. This allows the compiler to put them in read-only
memory. The patches are independent and can be applied in any order (and
go through different trees if needed).

Rikard Falkeborn (3):
  crypto: omap-aes - Constify static attribute_group
  crypto: omap-sham - Constify static attribute_group
  crypto/nx: Constify static attribute_group structs

 drivers/crypto/nx/nx-common-pseries.c | 4 ++--
 drivers/crypto/omap-aes.c             | 2 +-
 drivers/crypto/omap-sham.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.35.1


Return-Path: <linuxppc-dev+bounces-11244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AEB33B2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 11:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9QcP288pz3cfg;
	Mon, 25 Aug 2025 19:34:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756114485;
	cv=none; b=nNHd2t8OYgjKJAtYEAHT7IDPjW7OYftXUSUiQ6x6Xqby3mSCTb4FEI5N2pWraD+MStaAJezMqb/nr724Ae2L/oCG2ll8yUprn7+u7Xxz4JDYzRXsuBGOiLdeDGgl6og24jHxFA4Bm+wnY4RHDXceC2G1A1zJ+uF9TsqP3OZILmdgQHw2PdUEhOe0rThqGwbfjJufgWoJDzLAnx4KkxihZGeWDQCTzQ8aBkELkkhh4spN/b4S3y8WySwesGQNEDCIrQjNo7wAfLSBAtpmJ76ufqNB+LEirdOIUe3E5yVFee3i1lWI0/H8SpXd0n7n0dQ0ylWAqWIkfQgvZwYp+F/oQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756114485; c=relaxed/relaxed;
	bh=V0ekzX7hOfhzup1TYo38EYe+UPAgqh85cgI3qFYsCcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dme/4jnrMvadZmJszCvhZ7TdIftfH9BrTjoKxWy2rVq1cZJyAs4/T+y6RaA4QY170cslOeCDU5w/x8G3GjvneSCd+JL/4w+stui5oM2Q/qwoFOmATq6tOh/ATyC9m8WTNglvanbEpZMqxxzlUryEqhs4pPz7RQ1y5GGtsBp7pX9RyKJFCrhBbqgreXp6EwaBqBszayCUT8hVyfskyZu8fMe69fspsZZadFnxsXVx0DGVKxyDG9Z5IWn4Dks89aApzTx2fVm2BxgmyG1G+LYD/UHGCtI51Bn2hPima6i0vnVte3XDaL16gjD8oAkA98pJDA4pP+uKXYF35mbk1e1e/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RhEEJVAb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=salah.triki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RhEEJVAb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=salah.triki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9QcM5FF2z3cfH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 19:34:43 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b627ea685so2725615e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756114479; x=1756719279; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0ekzX7hOfhzup1TYo38EYe+UPAgqh85cgI3qFYsCcU=;
        b=RhEEJVAbBm/hPmh6rkL9E9wYOA3sEP9ZuPub4MIMv+8/sv+rZaVhY3vq82ZigIEOy5
         U7UQFH8F23gZr2gftRMUiEwJo+lQWU2DxdWbBBCWqbtqbQj4FmnqJ/Q6IIvpEar6GUa2
         dEgNeVdobr1VwiaDzQLcYgg8rMbttIdZXPmTNtfo3bvTDkmVblgTCs6xcynpvz7obEdD
         kKEHTSy4OaN0FVv7xYfyr3xlE8d3aQ4WdGMC6vWoxfoio9eYkAUPVGJnE4bl1J0UXHDR
         0jI5D3aW55wnvEKZCW9O0cvYPWZ0yRy+lgk+ipskJ0eVM2MArHG5brTZpgrJGv2BGqQS
         qYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756114479; x=1756719279;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0ekzX7hOfhzup1TYo38EYe+UPAgqh85cgI3qFYsCcU=;
        b=O8rV4GomLKtJB2VUJYyv2S/9aCt4i1vh0RS2EPRQioez+8Omh3UWgGUIhagBC0DvxS
         VxxFTrZ8OfH2GSwVKoc/2cK8TXC3Y/K8C/Kqlt3FvJ+jJfEhwTj7wQJpOtDd0Jzoa+1v
         jdTQFLx09fne/XYrxV+sb3ASd/agD4E/mzp6/JjbgbairxZlL58hByh7dbt64939Q1DA
         HicJJxFs/bb+j3boHPPvCwVT8AQZUk1vPGWYGAl14i8PPJY/06PrIqReY494Yay/5FiG
         wPZq/M8LDGnSdxXZk6lMUpTErSvDleC+F+4AT8+w5waZLgGD4xiEaru6NDNvJuE+V069
         K4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx2mH6x0VcB+y0XHpuDZ5CS5f89iYRjSJ0EWSs5FjEYppUcQqch9+c0h3LBqjoQPboulV4pJkbb2xbFXM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyoaSSTFeaZJbV9MUcaXbjUGi15ac1KMgHNq4U3rFCC71SafngJ
	K125dvjXFL3AsiC5twqrgpMIl1JGD7F9PFa0k3v998M2VcpUAtLDMbmg
X-Gm-Gg: ASbGncv6iXW9YD5d+eNwmrfJ363mz2Pet3PHcrvxL60Gu9bRdqVfT4kMUZKTCV0TzU2
	GGOxvmlhgaYDUQbApdL8aXV8b67l8jTj4lrFslEmEQgNxBIYVF7x9sZTe9VChOaTOOWmm1Pgx/6
	Pv+B2l3DkrwjlmM6RJBeEh7QW9hTFoKRvBr2tpO4i8ckn8Ou6LRVZ/PReBGsLY85dZa5MFFzl8M
	76gC1SnHS+Ggipd0Lq+gq9NtXJovcyeISXGf19YGuV/fRETf5Qm7JCUo7jVUkBsdDHDQ3YJd6gB
	sPsmEMZmAaoF93LDZGSGGumU/RBjC84qN1pa/y8g7pY0y9HZkg87Z8lp5jOHLkEYWwjbQUkhDDY
	F4BCJMXtzGXNT
X-Google-Smtp-Source: AGHT+IFcndbm4f3NcGG45AtxWvCWfIECRUoVl/7A3Y21V4o4YWwd+7uBs/nxY7ed57LZP0qUl1f1Yw==
X-Received: by 2002:a05:600c:46d3:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-45b517d2ab6mr92679845e9.28.1756114479052;
        Mon, 25 Aug 2025 02:34:39 -0700 (PDT)
Received: from pc ([196.235.191.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753ae41sm101865975e9.9.2025.08.25.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:34:38 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:34:35 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH v2] bus: fsl-mc: Check return value of platform_get_resource()
Message-ID: <aKwuK6TRr5XNYQ8u@pc>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

platform_get_resource() returns NULL in case of failure, so check its
return value and propagate the error in order to prevent NULL pointer
dereference.

Fixes: 6305166c8771 ("bus: fsl-mc: Add ACPI support for fsl-mc")
Cc: <stable@vger.kernel.org>
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v2:
   - Add Fixes and Cc tags, as suggested by Markus Elfring and Christophe
     Leroy.
   - Remove blank line before the if statement, as suggested by Markus
     Elfring.
   - Replace ENODEV with EINVAL, as suggestd by Christophe Leroy.

 drivers/bus/fsl-mc/fsl-mc-bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 7671bd158545..cd83cd564736 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -1105,6 +1105,9 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
 	 * Get physical address of MC portal for the root DPRC:
 	 */
 	plat_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!plat_res)
+		return -EINVAL;
+
 	mc_portal_phys_addr = plat_res->start;
 	mc_portal_size = resource_size(plat_res);
 	mc_portal_base_phys_addr = mc_portal_phys_addr & ~0x3ffffff;
-- 
2.43.0



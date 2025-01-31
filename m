Return-Path: <linuxppc-dev+bounces-5730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70BCA23988
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkmGl3Bsvz30VY;
	Fri, 31 Jan 2025 17:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738305022;
	cv=none; b=YRXzZjo+k1MSM9tjX3CMC2PotA57yYTMD2i1+JhC5ukX4NO7W8NibbByaHLDCi7HR9pBx59VW2FfIyW6Wz7Q4Ue5+VlQ/zIFAman1Dr1jWoY7ueaoAN3g7kSO/hxLJqhoIltOzybAEoZeFh0fpNwY/rW4HvEnquxbD8TDbWHbg47MC0cwUPHdg5udLQ/mx96OeuzBkrsUkqvP5yN5UDgdJujIBLnNENXlTQBR9kO6ulFAcxv2h3QqlAu6Je/cj0kIsakEwskyiZOtywyofTFUuK7vrlPjG4e9wb9UbmFn8MLAG5GXczEPLkrDskceK8o43ilsp3MSx0rxyHwEiqSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738305022; c=relaxed/relaxed;
	bh=uWFCApVXlUNL44yjpVc3vQnitUqQpaOyL9miI4oL37k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsrUKxgGf7povWZSJtWSWwsITIYcVX7+toUZFRnRVn6nVrnyVkjze6eBLyxRTqdbEcGIirEX9zo4UfL9bfT3ZF8adMZPWV9mb7wJ/z2OD1CkVawjBUSKphfin6lcxiQdADBrhMtNTLgdOzSIAA+mLQoJ8BfPXRR8jAWJsCfiJrcHHr1dUrUf20L3wDKkCF2DYkE+sDLWzwQvuEFH7pDEbFzfw7whjG1P5/XdvfCLuC4D7/U6ULJXltSgXI2ZLY3iSRvf1WTfl1S98cgyWTuxiYzxzkLRmKRNtNKlXUi4cXSYPa/nEsfRAskWgXDowaK0Rs0SVojzf4LGAbMJukbEFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=NUzm9GwJ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=NUzm9GwJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkmGk1j50z30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:30:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738305012;
	bh=uWFCApVXlUNL44yjpVc3vQnitUqQpaOyL9miI4oL37k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=NUzm9GwJsIijRxEGy0A1+b/EHArQKHXz4CF8SKXR1b/PWdzV0RK0vlsszpPq7YXJX
	 YnRgSVugwBjQGqX5O6lGATywts6mybA/Da9Qt8jJuaeSuBr3DgMwIALlKPigXWqR2Q
	 v1CUCylroRni6qL1Nj6HNSRpnGldU8A9eKCrlZGuJJCiBpkoOefP0OebFyB0jAXY1t
	 2RmnJCgTKH0JvWUOu3OV7aJaGF0k8yb6MpOPHxcvhUN57PWTgHbQUzf6uCN4C5Omag
	 yN+JgyC7dHU8l5laM1af7+OP3ffAdSLLTFuiOiOfO+kyXmzdTuzzXlv0Jd3lBn6scn
	 vOTwdE9NEngkw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YkmGX1SkQz4x4t; Fri, 31 Jan 2025 17:30:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 17:28:39 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/5] powerpc/microwatt: Define an idle power-save function
Message-ID: <Z5xtl1m_Gqc-HLjY@thinks.paulus.ozlabs.org>
References: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This uses the 'wait' instruction to pause instruction execution when
idle until an interrupt occurs.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
v2: Use prep_irq_for_idle_irqsoff()

 arch/powerpc/platforms/microwatt/setup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 5e1c0997170d..a942c446aeab 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -34,10 +34,19 @@ static void __init microwatt_setup_arch(void)
 	microwatt_rng_init();
 }
 
+static void microwatt_idle(void)
+{
+	if (!prep_irq_for_idle_irqsoff())
+		return;
+
+	__asm__ __volatile__ ("wait");
+}
+
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.compatible		= "microwatt-soc",
 	.init_IRQ		= microwatt_init_IRQ,
 	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
+	.power_save		= microwatt_idle,
 };
-- 
2.47.1




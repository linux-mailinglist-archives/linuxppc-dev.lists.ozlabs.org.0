Return-Path: <linuxppc-dev+bounces-12517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8DB924DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpyP1f0wz2yr6;
	Tue, 23 Sep 2025 02:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758559837;
	cv=none; b=NdO9EenDwzUphkahKNCuyWB3lI/aQPeaUkNrCm2iPXKF2pREpQfZ6DO3iIAjjG4p26rJ4FAhtHo+lOht0isFs7mYSRLyFVBesQzi08v9//xNgcc01MDTmFttRIAAMCrnoNF7CYMYKIEC8KI+dMv1MN3oDzQ0my0Iie6+OwxI2BTBgjntCNNCTMZAKek4MzfHqvSLE7gQX+6oiBAslwR8QnsvDv/MHK/L6rnYI83iKiI8w0ebzcAeRKBdzGG31hH+AGbq9PLwYLpoBcwYNPacbwUk+xhOughHCRNaR1BFPNfu0/p2uF87sKN9QRMLaaxS8JMawN1536Uwf+6C3Xbn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758559837; c=relaxed/relaxed;
	bh=zuVT/NXt6gs791D+SZCmhqxz/igNEd5Yz8i1Mnw+YiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+AjvvXslF+qbSHqZEioaryhtY+TxGzubmGjqoQL6hgm/nuS/3wWjJvmTPkHRz5VWPWWSu+UKD2wmOOPCAbtDrHst//TH4eWHWoflmg+1RTSxXc1An0V8AcER1gToumfIcEDVKIlLhynRJy1SzITCYrlMPYnIoU1nyKWzPv0G9xt/kQXmX0kJXYuXOBiibiyKObfpUHRSVGkAoFx+SR8IuFbIPZV7qTqMMRVLHe0UruyrrmyhLrzFLxH21iBLQWScRYccd5pJhS404lpKNxBj7U2m0b/7gUD2VeRTrfnDqkORDeBOfzkxTlrzRPdJf+mgsKAJJx37v1pVdjjghnZ0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpyN3pZpz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVmQ46hrnz9sSS;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAj35bzrK7Eo; Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVmQ45vFpz9sSN;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B53D88B768;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Wc8vrIHa2uK1; Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A1E68B763;
	Mon, 22 Sep 2025 16:55:55 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 22 Sep 2025 16:55:46 +0200
Message-ID: <175855270809.96300.15498969212421871816.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758552948; l=721; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aYbrvM60FKtWFyNikef1uJvt0soMLPkWIUod5zKQIfE=; b=o2vh0AbkgZRDTZfD+sDgtiYH+hiDvCfPGLBCRbBvfV9mgwoWZUllSFmykcseyTH9sUcVFu429 IYzJdwjwgF9CXkzFUSH2+wxK1i3QMoVm1UnTnl//mmS0VCVqqVvVmhE
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 18 Sep 2025 18:23:20 +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for those IRQs then add change
> notification capability to the QUICC ENGINE GPIOs.
> 
> [...]

Applied, thanks!

[2/7] soc: fsl: qe: Change GPIO driver to a proper platform driver
      commit: 156460811def1ae699eebe40d9678e4ce3d1d9bc
[3/7] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
      commit: e9713655b29a47d23cbf07aacf50b0ce8ee0a850

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>


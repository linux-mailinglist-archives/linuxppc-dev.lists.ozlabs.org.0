Return-Path: <linuxppc-dev+bounces-10460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14A2B161C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 15:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsYWf1Hy1z30Vq;
	Wed, 30 Jul 2025 23:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753883438;
	cv=none; b=T7QTNi+TprcBbdoRueCkPV37W0MbsMOpE042m4sOUjOq66N8NxNicHFQ/ltLkfgSgbC6leFnTdVk44fZRiTsbjtaDe6F0Xvpw2JVkP+zQA5DANVHQU16LI6FOHtQXBuoI+Vd8BZg7OzX2e/ycwtVftuPZQ33Ag96zuWbJFF6mfUryaMXoPd0GmnKL0smCkIS3dAkNO+v8EMA9fa8PspsjHLo0I78A8eXAINIgt1djxk+2H9oLeK74WYnyjuJVVZJh1IpoOPd/fJD2ywJW8dpXOGd8UhuLrxuufDYp33FVE/2XpFjLDI0HzPOzrR1Y6fwdmXSG7c7kH9cRPr5FGbbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753883438; c=relaxed/relaxed;
	bh=p08GgTAtNuoUw16P9wD9ly2Q678Qz+Rj1+xTjHzeSgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6G8P0Vr+stPhGOGg8E3QPtT1Tu48YMvVrpQFEKATibe952Bv4B+naMTGtOKU0XmIDy9QXkhqsxYJTlqU5EGe6Qj4hV0Ip/RdOyOAsHFRh65RHRsjVgat8Qmk6EJw3NJoMI8BgeukfbhKt5klLGAMGRpRP2euxf0dU16Ctm5hAgC9lx5+NK8iPTixadQtQ/A0+3V3jqthCcwyHD7IEFsC/gMHYkHLp15xIuXVh73WVX49hZKVFqAmPXBO4BqlRTsSzsCFlzttrxXYOsD2mcjBLKHYYI9NIMumDxhpz3TVQG/UWn4iyHi2EehOnXVy7Bq+7Fk4Uisn5IgVND99lHLuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsYWd3Nhhz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 23:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsY9j1CV8z9t5l;
	Wed, 30 Jul 2025 15:35:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ImwirM9pu7i; Wed, 30 Jul 2025 15:35:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsY9G3wCmz9t9W;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 80A968B76E;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QWsmRx-KqxQF; Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 663D88B763;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 56UDYYp8271754
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:34:34 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 56UDYXEC271753;
	Wed, 30 Jul 2025 15:34:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] soc: fsl: qe: convert set_multiple() to returning an integer
Date: Wed, 30 Jul 2025 15:34:23 +0200
Message-ID: <175388225169.270550.11152208847309594157.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721131511.75316-1-brgl@bgdev.pl>
References: <20250721131511.75316-1-brgl@bgdev.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753882464; l=399; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=HnFftf19nbxbzRIzCXYRHL3Xne0RgZpbO7Z5YU6Gs8k=; b=jgrphHn/SaT3HhwtKAqT2ZOMETfLzyu0+6ajFuPkjx8YrmtBNGsTYaWFXkKiMYa6rt0KPIVXT vpYgu7zuB3tDrpXXojgB7IzPMrUz+7j3w4Jpp/m7ofw9yl+biDU2ER6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 21 Jul 2025 15:15:11 +0200, Bartosz Golaszewski wrote:
> The conversion to using the new GPIO line setter callbacks missed the
> set_multiple() in this file. Convert it to using the new callback.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: convert set_multiple() to returning an integer
      (no commit info)

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>


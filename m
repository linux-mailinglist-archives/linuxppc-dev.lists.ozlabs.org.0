Return-Path: <linuxppc-dev+bounces-10461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A7B161CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 15:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsYWj6Fjjz3bm3;
	Wed, 30 Jul 2025 23:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753883441;
	cv=none; b=SxzzAKb9tZ1C3/CmTNk9gRjLzx98WCKjNaF1gruxFbdvqDHZ+DtcBQm9CpLlKIWqaewXC9thWh0BRNLEpVUfgcqyqTZuIxgd+NS0l5vpdlqGaW0l0qdLiG4BRkuCbNoKuhoiYJQk1AReTTDR5E0IINNLN6oQOi9MMzU9mgV42O2Mylh71rvXhN5TxghyojCeRUp363OTEzmnk8GXSsxsZQChoqRPUacwp8Bbv6D9OEu9ho2tZjYK/p8efvsZnVEz+lyZPA3WvcZHW6G1mq82MgnfDYEocIptaSIee91vwMA31VDLX/6zb4/vVTcfbGlTkeU5gpvQ/dxg11PAQ6QKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753883441; c=relaxed/relaxed;
	bh=ZI5DAmK+8UZTo8BKllrVIz00Tuglcysu0tyWwoMJ9Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5p56SW+XzPByXQS6VXsSIG9uZ7npgi8a66Ax9MOjnQGqo8jRbMa02/GEYvS3VxWClmCwgEBSxkz4kZmOjsUVjRhJrqbZZ6Rt7FPMip2CI3PUXu4+A+JKzV8Kvi6rCKCSFg3qrDxBg0Zy6q1nFWuJgv4u7e+a2tPykP66sV0hZWVwkMkr6DcU3Y99rDA8xTZMLc6jTAUiRMfjAo6YBgHlvISn/gIbCybOLgpVaLP1DsUZ4D7qK+BzffiKSQgKfnt6VTcalpxNyN6kL65LXfiX7xkOHfoA4K5vi0odjKVlYh3KyPBX5PfUAwEUIMoyzAjn7LeWy7OGjLbBIEj3jGnOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsYWj2qR3z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 23:50:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsY9h1rxmz9v53;
	Wed, 30 Jul 2025 15:35:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MxTpDkr189x; Wed, 30 Jul 2025 15:35:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsY9C2Symz9t5l;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F1908B76E;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id B3TTTuOPHS02; Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32F008B763;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 56UDYXEm271745
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:34:33 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 56UDYXMb271743;
	Wed, 30 Jul 2025 15:34:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
Date: Wed, 30 Jul 2025 15:34:22 +0200
Message-ID: <175388235172.270971.7957080828511695950.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753882464; l=407; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/o4cDiVkyPr0JbwYVaNEzFDJY8Bq/G7J5zt/xxb12Qo=; b=T8m3DHSjY8I3U43L/rEU2ojmXAySZGPQXNqoopT4g+PYQNfxMX5El9+y8GY8hGY8L71TgIJwE TRZuWcHBtxgDaNODgHwZ2PPCnKlCVyMagmq7d9dn3uva5+yc1VmKmGa
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 10 Jun 2025 14:38:50 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/2] soc: fsl: qe: use new GPIO line value setter callbacks
      (no commit info)

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>


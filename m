Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E5544D2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 15:10:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJkx13jwgz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 23:10:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kkMTlr6w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kkMTlr6w;
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJkwP2nkGz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 23:10:10 +1000 (AEST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEB99E0002;
	Thu,  9 Jun 2022 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqN5znb+dlqAWvFeLAcPi/B/Ngq+tNLs0kkLchBQOtg=;
	b=kkMTlr6w7LXD6p2O4dJ52u4sFl3IqqesI2Y953XefKaCvHAqObUm393ANCD58itnRaDuNK
	gKzn1AojwFRS8ozXlEdghrha6e9J7nZIPxEsAIKan6Ct3zQ27uBvC3o/0DZx0kd+HZcIvI
	lBzvawajiP8EsDErlLGqF3jbc2efro/VbHIwfd0R3POGcYXUcVprdC0XaxxEEJ0JDRuw55
	2SIZtO/gX0fIAqGOv7YSrXTUgZtD3f37Pc/kqtBTufvIzCGV1SzU7/uY71ZY367zetu7vx
	CKBJJuCWOPERuuxehMcn9FGgtimM3omXe7OLP8gvKGEpRbwFMMXmrn+J5VQy6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 03/14] mtd: powernv_flash: Warn about failure to unregister mtd device
Date: Thu,  9 Jun 2022 15:09:59 +0200
Message-Id: <20220609130959.293421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-4-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'90914b4e8e2fb630d21d430f8844f7de583a1ac3'
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-mtd@lists.infradead.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-06-03 at 21:07:47 UTC, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= wrote:
> mtd_device_unregister() shouldn't fail. Wail loudly if it does anyhow.
> 
> This matches how other drivers (e.g. nand/raw/nandsim.c) use
> mtd_device_unregister().
> 
> By returning 0 in the platform remove callback a generic error message
> by the device core is suppressed, nothing else changes.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

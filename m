Return-Path: <linuxppc-dev+bounces-1131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800F996F7E4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 17:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0fn91b3sz301n;
	Sat,  7 Sep 2024 01:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725635453;
	cv=none; b=D4gHQHyKYFPD3tplXYTSP468D5gjA9brvwuKHftpRHN5Im5CBcNb/2syfDGd+zhg7dlrr1/6vl+K/5oDp5+7UF8E6HScTV9kydVCyG8CTrjAePm5u+d+QpGOrgv4Ptm8xENijINH4mferSEaMRY69srqL3QgeAMAfgKZLSihHLHsxSCityz9PdvL3ZFXWj/WT+HPSXcFCZN9OG4ROSUUdbuxBQEhFHPe7+upwqW9oV+ddYVaSRSotlg3suriDDAcMxKd1S/NLyAwKyIQvAxhXF3Oii5pC08wk3dKzTgD75/mQwGPPS5/nIrA1PJGnM7Vf+X1oFQE0SzDfJU9ILZYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725635453; c=relaxed/relaxed;
	bh=TlWUjv85UmB/FzR7qBD8k/0BSGkObn4DwgKFQhETorg=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=eFkA633dnq4SZ6Irl2cz9BwNcF0RYJEXRJPM2knoMdo/qh4mpR7V10GP+CzVxEvS61DM+F7rz7rYjQ8VS15yS/RPacB95XIB2LbJtVcURP0jyVlhqOKvoUWskLlb9U5pb/XwZb0AaimrZkO/rry7jmWRMjwWLCbTw5FKtDwl44veXdPgLfeEILZFsjY6lPdon/Wn+lPaVmbrzXMVnPVNShvrQVOU7qevOLYYryM1Fcdx/o+DSYX6/qgIOHaENVmk+BvvzH3SCY7J5ELJVKNw8pkZfjtTucrUmX0MkxvGkKswocyZLNTTzTL80tnbFCZMiuicoqauosfqucP7li+aKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pUXCenkN; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pUXCenkN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0fn75p6Cz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 01:10:51 +1000 (AEST)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B6527C4C36
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 15:10:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2273C60008;
	Fri,  6 Sep 2024 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TlWUjv85UmB/FzR7qBD8k/0BSGkObn4DwgKFQhETorg=;
	b=pUXCenkNv+uLK7//UHJoWJ7iq8w2tLMEh5eb3Za6lkA7wiVPjOAhoAfRUJjZfnO1cMVS09
	9vLnHkNX7Eg2jUK3XZDJs8Db2BMOLhB4fxywPKpiLXrpv8shdeorcloOZ1OmUEsMbKml0F
	3gH8nrzNcED57LDamv+WGTKNSe4h6Rqx8GXUIUKNkej9/gN774fkGE6UH3I2ssrUZ357ax
	JITZdg/JengIA3Q6T0u3SkXVLjl0M7xR6WkjV70Jvwfc507aYSwqfPhqvLm6COwKOSrGtL
	Da6LiWrkfLKA5/oHMdwJCmX58wrV8fnH5ZE9TLgY+UImQTnhzwgkZMqEXmzVig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Charles Han <hanchunchao@inspur.com>,
	robh@kernel.org,
	miquel.raynal@bootlin.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	tudor.ambarus@linaro.org,
	liuyanming@ieisystem.com,
	linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] mtd: powernv: Add check devm_kasprintf() returned value
Date: Fri,  6 Sep 2024 17:10:24 +0200
Message-ID: <20240906151024.736454-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828092427.128177-1-hanchunchao@inspur.com>
References: 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'395999829880a106bb95f0ce34e6e4c2b43c6a5d'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 2024-08-28 at 09:24:27 UTC, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure but this
> returned value is not checked.
> 
> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel


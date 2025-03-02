Return-Path: <linuxppc-dev+bounces-6602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999CA4B29B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 16:31:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5QsV4Y6Cz2yvv;
	Mon,  3 Mar 2025 02:31:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.25
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740929502;
	cv=none; b=CiKWA2JsPqVS7nY5pKokCxVilLIjD8wuxTZFoXWzfp4OuViaTblSQ6o6zR6Gn3EFsLKCfIHALYAEbvXW5v9XrMRq8/PX7IU4mK9/nvnXN7TNeJRPqrhLpHf/XVf/DlvEY41w1U8b03vzM9h452lLk3tK0OGmGi1DnZkcnt0mJzA0xu8TxC1oYTS+vx1XKJ47nki3CvTWjzlUSceR87jFEziX0GroTSPKjVqcVaXNMUyUV1a5W+QPRBF/alLd2/YTyo4bjWbJrVcuKt/0VokIIumgfffwSgzkcmCpI/qQtukHezcnr6k0QhIqeIuK7BkMes2iRh8HaA57YYLaYct8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740929502; c=relaxed/relaxed;
	bh=CHITz2+YWVCqZNH8zM0mCk4OaRmTsJ9xq+F0/7AL1r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMUGYZnJ8MyzO7/SvknXiSe3TGSaSxdXtlIIOHmuPbwNS5bRYJ1HzJg1b+MxM/V1NhuyNcQhAcfmZ67pvW0iys0w9P6Hc8dkfA6wfvDy5YtCftQQynMj+fPK26SWsmtanFO5J+L7ymx4aZAmHbVX99+7jYmIuz51tfWlAiw75pMrsSy7y28hpZSe33mxGwc7b/wl5Vkjps12i0VZkriLnbuTvzsAj+qnsbWbX/h+HibgDxKxvMQtEveeQkS61HnhWmWKg+0KHtFVR/O3ow6RDUbNXBjoP+J0xu8IwU+qIYdqtmzp/WXXGD7cNCAGvXxXrCGmI4bKC08ON0l7ppYmNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=N5rXtFnP; dkim-atps=neutral; spf=pass (client-ip=80.12.242.25; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=N5rXtFnP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.25; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1865 seconds by postgrey-1.37 at boromir; Mon, 03 Mar 2025 02:31:40 AEDT
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5QsS4fqVz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 02:31:39 +1100 (AEDT)
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id okmqtJVk70yWRokmut9O82; Sun, 02 Mar 2025 15:59:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740927569;
	bh=CHITz2+YWVCqZNH8zM0mCk4OaRmTsJ9xq+F0/7AL1r0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N5rXtFnPdciX4yYY/+OAbDtQWCPVFXb0Q7ZwJp8RQBxYKLhiMBfbZELmQBspi2cz1
	 UQfhmOdjvcCKk8TTVQw3QfKhcIjwpXFb15L44d4zDcZYuBJTEK7MFXW2pCFKjXAzEe
	 cKfqVLg6T7j+bKTKCacfO0894mvXRItoyqSZ1g1o9VfvgmqHCef9O9EUCkv+Orl6Tu
	 kPikree9OBxPQRsJkIMX31J6B4IZUIQWWkmEb0fDkWhYRi8rUCNLBZ2LG4lbPcRT1S
	 7XITGjy/ij66aTeP0D4yYEFD8PvqSHCBm+EEM8FpQBDp/8wCUKI6iMIACeYJh0ei05
	 BGeJgUR0rJwkQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 15:59:29 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] powerpc: gpio_mdio: Simplify gpio_mdio_probe()
Date: Sun,  2 Mar 2025 15:59:14 +0100
Message-ID: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

While wondering if it was correct to call mdiobus_free() in the remove
function and only kfree() in the error handling of the probe, I
arrived at the conclusion that the code could be simpler here.

Patch 1 uses mdiobus_alloc_size() instead of a hand written
mdiobus_alloc() + kzalloc(). it also uses the devm_ version in order to
save some LoC (and answer my initial question)

Patch 2 uses devm_of_mdiobus_register() to completly remove the .remove()
function and save some more LoC.

Both patches are compile tested only.

Christophe JAILLET (2):
  powerpc: gpio_mdio: Use devm_mdiobus_alloc_size()
  powerpc: gpio_mdio: Use devm_of_mdiobus_register()

 arch/powerpc/platforms/pasemi/gpio_mdio.c | 41 ++++-------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

-- 
2.48.1



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B67F7132
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 11:17:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=byyO7Smd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc9rn68PSz3dLG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 21:17:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=byyO7Smd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc9qx3sx1z3dKp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 21:16:28 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-548d60a4d60so2328206a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820984; x=1701425784; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcMLBYSAsdprviXMYBJT1guiAaPHdo15Q++eqKUBcSs=;
        b=byyO7SmdoMERD9Z4qG+G5pmDZ86upZ+mJ6JOaXjS42HrT5vtlNMYpFYVV+clyWcPQh
         LQuyEgOftrVRicb/sQc9GNO+ueFzwZcjSoBiLIAP0s9z8nwZqB87tg6jD9eZ8zJHcg/5
         TGebHpDUXlKWM9hYDsi0d7Y25jXjNTwx7kXvRRW4QqmUTf4oZskwc5PzvgJ7wyLiec2p
         iFpbx9D8EfpOnqJKzFbcOAQPGfTbfOqpnSGVrY9t6dUZIF58kJBGvnWjSycQnXV3RKxm
         A4PrL9w5IkAXt7CM/2npkj+8fKVcXz2U7P/HWxKTPNLuC1lxmfE7AmOxJSNzHJgbyOPb
         OlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820984; x=1701425784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcMLBYSAsdprviXMYBJT1guiAaPHdo15Q++eqKUBcSs=;
        b=DYs/l2wp6dTdLeaItoXJYazhNu1+n5bIIyQRDE8lQPZ+EnDTtAhBJpNoIxTvNRBAlj
         7Kh7CffVaDh72NfbwTXXhJdr2z3nd2wQGgVUfyhl9VbStKuinCapDSau09BV3NrJJgXm
         hatV/7XEF23QPgRtAYek4SyVbhYMsZ6jbG+0E9ql1n/lWqtZvGDR57YmuW6v05z7FSHS
         1UDKE4RCWm3dljGg+Za1tGFvMrIrd9EMz8as/v5LhzNn7rfFSvvNto0gjjLH2o49FnWq
         uwYXdF36CQe0Je9/uQlrK1Ta1BFaZYsE6MZWNdt/36j0mLxfhoGdezDHhfXibGIX/9wp
         lDcQ==
X-Gm-Message-State: AOJu0YwRfpjTAZQiiYa9vA/v15cCcmToSDaq43JXAfPOr6YLHh+sJ/vr
	uDZaNz9klNORlyKSnRfa2/g=
X-Google-Smtp-Source: AGHT+IHMyVQ9DHJdncIOviYJm5Op4owrfc9bHRGqIAVNz9Kh2xDLtmkrUG13pmyHarsniEeVN07dLw==
X-Received: by 2002:a17:906:2bd1:b0:a04:3571:e165 with SMTP id n17-20020a1709062bd100b00a043571e165mr1192100ejg.52.1700820983400;
        Fri, 24 Nov 2023 02:16:23 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:22 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:09 +0100
Message-ID: <20231124101619.6470-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

v2:
- fix style issue in patch 4
- add ack in patch 2
- set proper subject prefix for all patches

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
 drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
 drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
 drivers/i2c/busses/i2c-amd756.c                   |    2 +-
 drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
 drivers/i2c/busses/i2c-elektor.c                  |    2 +-
 drivers/i2c/busses/i2c-gpio.c                     |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
 drivers/i2c/busses/i2c-isch.c                     |    2 +-
 drivers/i2c/busses/i2c-kempld.c                   |    3 +--
 drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
 drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
 drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
 drivers/i2c/busses/i2c-piix4.c                    |    2 +-
 drivers/i2c/busses/i2c-scmi.c                     |    2 +-
 drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
 drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
 drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
 drivers/i2c/busses/i2c-sis630.c                   |    2 +-
 drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
 drivers/i2c/busses/i2c-via.c                      |    2 +-
 drivers/i2c/busses/i2c-viapro.c                   |    2 +-
 drivers/i2c/busses/scx200_acb.c                   |    2 +-
 drivers/i2c/i2c-stub.c                            |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 drivers/staging/greybus/i2c.c                     |    2 +-
 27 files changed, 28 insertions(+), 29 deletions(-)

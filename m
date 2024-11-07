Return-Path: <linuxppc-dev+bounces-2955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8DB9BFE5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 07:18:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkX1v24CBz3bdK;
	Thu,  7 Nov 2024 17:18:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730959896;
	cv=none; b=fsjNoidcdtsoLnj0NX2VBYEQk6CkJ+JbCagVkGkKucgjuiI8R+ILN2auJycU3KReZ5huSB2LUBJAbLOVfYE+cIlqOWgB71v8FX91HlCDREsgGoSeMVkG5+wear9cDWOnqcdi5u1Yz8QPDjUuvdKAMA3YI0n7Qy5nOR0V0aaB0zOehI1ZJZcMLklh2o0Un7BQ808PThtJOUVIfny0MGiKnzNRfo9SW5oxIQ8UmUTpb4UZY2S5heUyn57nbXYqO1KAv9OcmEQkj1/XYoeoShbQiHY46+jIRbVXh39rvyLsMKrH87Wt05fAwUrug92KoLEInfXN066v+S5nE0RxiTS5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730959896; c=relaxed/relaxed;
	bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AAKkYLVCye7EObaGBlVZXb7+w2g13o7yPYqrkISTomw8z9qs16AR+17/nGO3R5I5cUvU2mpGkbLbstaOLXSc90CBD0v0b2zb+DLs16vgnHhm0UuzqVztwM2eZ7fIlZJdycx4FYaQCOSjlbIu+L1AZgIvcLldX6dIKGaBXoSF7DS4J4Jaah7JWTaUuAOfRHCOcEOgsIZ+lIYxIH9Zu5MxvWu51faIvB+kp3HSF/L172hMHwV7hnTCkdNYvJEUAS9PlrT913x1Hht974lchvF22QMaBe0jV/nmZLKCxCheZ0b3I8afLGGj+FuEPC88B+yOvLaA8MlzLqN/SXwBoyMaKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J8VmLQ44; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=xandfury@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J8VmLQ44;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=xandfury@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkWtG4vgYz3bjG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:11:33 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20cdbe608b3so6116225ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 22:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959890; x=1731564690; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=J8VmLQ44UMZvBDjjtWmHFrmOy3hEfVZ7n76VRsNghMVwfthuX2otlZ7ayrtuhGvxtG
         9EcSCDx6DsH5HtUEk6GwoECFgnCPUX0DKQ54+zfdxSk/m1KsH59QVP9DPqJS5JwUHUbr
         POORjzIMz+mGcKzETpOPbZ45MOZmOd/tsAOCa75WpFFyUJKY32BsMQzKzY5GbRJNJuE0
         D452M6EszOJ9v+gRSb6b4rCSip1cXxPKhT2w9J3WjlkBpTjoDAQOJXdm+ekuAjj1isNu
         pP6qbiNvUe81QXQUjGw2VJZ1sQUbypRdm6HMRKk7synmyQg6KodYFX+PxWIHAPBk6x+D
         i2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959890; x=1731564690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=H2fH6wPso2GGOjRqMm0CJy5SvXpv89BFxYD0vHpjEsmqaYqLh2R+bFn1SjWvd2oSrM
         eS1r/dVe70CRgQx08oRuQcJen+vwCxxsfVHcAyukkBbkq0tDnQpxfxQeRt/3U0kSd7+7
         w8tJRWWCWuUV/zKkvCqGRjhOISzuzBqveiuFvvXA7ne0LbV3edXKw1LXHgI18J6Itw8u
         +1rmlI430rdc4cEMv8M9Px2wG7bbD6n/GSQHacoe2ONF2svcX68D58zmCgmJmsnbFpgs
         3pg3lCunw2Kt4gPmuQHvYbefHQ2oC6m9Hq4EhNHRHFfZJEbIP4kxPvsNafjQ4MIa5Fr4
         otBg==
X-Forwarded-Encrypted: i=1; AJvYcCVGd+sOBxw6NPEJzN9I/Jape2jzxt8RhrHO6QB58z773O1xvoz8QtCVzFz3uI42WQvKuqKa9+4FJI2eg9I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKcShgJd9WNcAB572306E0A8ugpHW5s56N/U/53Ee5SHI+jHIo
	G1ahyq7Q1tmElQ0jGjNYp+xErCa1C/WNR0nTe9EGpLFWzPorNN81sdhoH8JC
X-Google-Smtp-Source: AGHT+IFb44ve8UxBIvy91ELgGSUmf+xH+y8rohtBiFFGcFZF2HaHBFlJbfOx82kv14jZNYjFRB9GRQ==
X-Received: by 2002:a17:902:c407:b0:20c:da98:d752 with SMTP id d9443c01a7336-21178618acbmr7885715ad.16.1730959890021;
        Wed, 06 Nov 2024 22:11:30 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:29 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 0/2] Documentation: dt-bindings: Fix documentation issues
Date: Wed,  6 Nov 2024 23:11:22 -0700
Message-Id: <20241107061124.105930-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This small patch series fixes documentation issues in devicetree bindings,
specifically addressing repeated words and trailing whitespace found using
checkpatch.pl script. No functional changes are included.

Patch 1 fixes repeated words in various binding documents, while patch 2
removes trailing whitespace from several files.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>

Abhinav Saxena (2):
  Documentation: dt-bindings: Fix repeated words
  Documentation: dt-bindings: Remove trailing whitespace

 Documentation/devicetree/bindings/gpio/gpio.txt        |  2 +-
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/memory-controllers/mvebu-devbus.txt       |  2 +-
 .../devicetree/bindings/mips/cavium/bootbus.txt        |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 .../devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt      |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.34.1



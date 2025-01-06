Return-Path: <linuxppc-dev+bounces-4727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA14A03152
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 21:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRlxp5wprz30WC;
	Tue,  7 Jan 2025 07:23:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736195022;
	cv=none; b=Kf1dc+XZD/rXqO6oYHaMbK4v2bpoHjctlppkSLyrL1uxPdoH8kISJw2QWCDP1fwfWI7hwW+OW6mLxeQdMdpl1EnHr/XzTDk27XiTXIS/R283sEUbg+8dOXtpEa1zdE/oHg5WKzJ97u/MYeGFc80TdN9KSMW9IJMDKV2P//AjcvEHg+6xJvL+eR3zR375pLKaCGm0y0Wk025MWRQXVkFSyLlMJ8WTB8YIzwSCIKH6heiapTYVj244Yc8whyJVxj8Lc++FjKCz7wIUy9E/2CmK0c1lcpelChhxT+AMk3AdsBWfeModjSPJS/mek+WOCZ9aIOe0R3Dv86zE0xoghfq2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736195022; c=relaxed/relaxed;
	bh=nh6giEYIA/meByuU7DxkCeD78i3wvwoOcPOobfQbLGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPVL+7qPMk1bswjGdFr5eM4d/bUnsPKULy24jG/uwbz9TxJuoYDGeZ6bWj/y2mwLHQ4RaiF7/TbCJxPFSzL/lxY/zRTXI45LjWx5x7T006MdZ2FSD0LbvEXbMinRgb+x8rDxkiQ/9x8I/VcQl+wzFfsVdKRHci83/ONJlPq/3sUH71VxDzYhsuL9en48+AoyL3kQBx8wEQhLgLNXwWoFE0WX3nIcOg5FhSa3xr0VRKs8zC8X43McZxWcdjBx4PfazWMGQmExwQJYMHWJR0JtmKJ/2NeA40ZPMghti7F+JrDajnxfsRrLWXcgXCu5d5ne04D6keu4fbE/ENfvq5+Yrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1kFQ0m72; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1kFQ0m72;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRlxm5pDdz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 07:23:39 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436202dd730so106113035e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736195014; x=1736799814; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh6giEYIA/meByuU7DxkCeD78i3wvwoOcPOobfQbLGE=;
        b=1kFQ0m72BjBfgsATm4q3rfzlzvw7RUz3X8VYokpRRRuDtuHlm7mg+KiwwTMezarjMM
         LIGtGHBGIpgs3qwUMqapjhokV27MwKvK3u1ntO2n5p5M6SCuSgimyREcFgb2b52VjM/4
         d1pG7xeZDGuBmLqyQ0u4xAJlE/ZpQNlUTBpJPJko0oI9DF1tCYYiexwUGuP230yTDV7M
         OcwqsicQofs5HXQDDuV63crBYr7CGx+1tUkAIxNtKBwUZWsykbEKs++d7WrRuLBvSEWg
         ZZcP01vwxUicYYFdWFubolQz0VbQEfE1LtvePE9oWe0WaGIEyyAntHKFTZ36mPXz0xk/
         8Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195014; x=1736799814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh6giEYIA/meByuU7DxkCeD78i3wvwoOcPOobfQbLGE=;
        b=M0r3W/ZCYXrNVYnQ0RDgsjztm3kk3Z9QX6FlFadgsDx4CzS5+Eh93S+6CZ0jXXt3sk
         20YH2tfM0FQF9JKhXSvcimZIbYLJNTlSTlZZUPT9dG6hdIvNbeYx8jsrU4xCHAriH/p7
         dDznp9aMxT6pUxnf9M4vHBB6wc4NjTyIRZILtqemytrbEuDEeQ8oS7LDJX/pSjY3cQgS
         W7kPpw5pZUJVtjbJg0/qkPqxco8DGQvj/nqcJY8OBDcrDrOSI2DTQL14iHSFspTyQT1H
         9IjbzhJ+wcxqQdbhVnR2qwkclW4wWLqcPPPfdYcYuDemyCARlgY0yUEqcYutzZeYlRKk
         CuTg==
X-Forwarded-Encrypted: i=1; AJvYcCVw8QtK6FbgPpwzZqOVHA/crO356NB+FJxiyFKpGOG6M4ApqE0kXte+grnq/TuYBHrNiMXLHP/+lkMLLWo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzn3GK7tRQZtbjrh+3w4MdfhwZYQeZadXPZcVMVkmdb6WBMtxOB
	BOr7d45gjBkxkiZkjfrzgwpOFKni3UCTe0wmAICZ4XUObTFBf+Yv+3x4pWXlDv0=
X-Gm-Gg: ASbGncs7dndKu+f74ZuJ1cjb6KdlV54UH/cTWelZUEHBeOgos8CaE5VFRypGPFScAKt
	SeUoWH20NtvhJ/OddVm2ctIeHfBZkR8PEUU5ZkRzEQuXxfTnz4qdZJ8Ch/20GNw/Z/OQ7n52d9F
	uLTjKh6CHioD0b3p0j0KLJxwuoz6MWRL+9F1B6Jr/ZCdzVVmo0RqpsNrXcaktxLD6GhNP9yGusn
	TtXj4QE89rawuZ2Qo51rbI8Xq2BWDYQDAtSJNhDpkHputiHrR8EnA==
X-Google-Smtp-Source: AGHT+IG5MF7x6loZ2YU8l7YFeeisPs11ZQvCeOUqElgSEpjCa2qSR+5vvj/MXT5V88O23KvWA1y/Iw==
X-Received: by 2002:a7b:cd98:0:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-4366b2f9323mr450859345e9.2.1736195014045;
        Mon, 06 Jan 2025 12:23:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6d7c:e1c5:e9:58a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm609463555e9.19.2025.01.06.12.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:23:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH 00/19] powerpc: MPC83xx cleanup and LANCOM NWAPP2 board
Date: Mon,  6 Jan 2025 21:23:32 +0100
Message-ID: <173619500923.255677.11065404025961122002.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 02 Jan 2025 19:31:41 +0100, J. Neuschäfer wrote:
> This patchset adds a devicetree for the LANCOM NWAPP2 board based on the
> MPC8314E platform, and slightly modernizes the MPC83xx platform support
> in the process.
> 
> This board is nominally end-of-life, but available to hobbyists.
> A U-Boot port is also in the making.
> 
> [...]

Applied, thanks!

[11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,mpc8314-gpio
        commit: e083b304bb0c2c8c9fc1c2adb63eed6233babfe8
[13/19] gpio: mpc8xxx: Add MPC8314 support
        commit: 401239e1ec9757bf508240e49f5d5da9ea75e5f7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Return-Path: <linuxppc-dev+bounces-8246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0DCAA6D44
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplHL2hwTz2yrC;
	Fri,  2 May 2025 18:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176398;
	cv=none; b=fsr+FQ2NZWNeafMJfvV1LGjFSo3agC98vAOhy461DVDzjx363Mksc52mDKoAIhaXAp3CoOo3gSV529f6Y+wWD4vtUSHEK1thGSIHgoQAM0pslxXfMABDnufEgPAW6ua1l/vNFVg37GJBRIjvm15bNSuC4YOxusCdHVS3KKQeMNBFQAI0pn6qJpV7Z61DUe0RCIq7kEpENVdSeVMzPlRGiX4Vi8NFap60xlokwJgtlfbbzNtcwQzJMwf05ZXS/DoHDAFrVFuUWmCysF+6kKAL2IojWrK+6KYdjIUdVTXw8n6MWEp8MK8zcJBY8l9a9RQR8weMh1ny1DKpBiquMXUZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176398; c=relaxed/relaxed;
	bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EB3uMS5sZgqClo6M9vcb1jvaozsYmTOacicgUGG9FuZT0yFTDyPtH9ZV6fE89570jUP6QVMq9G9L3Zn0d8mer+rQCJFxVMCRYblnfGGTdRyHwRLcQf7oA53j3w3hlHlXlRi9pNoHibwgE/KVxTN5CTBnNDKE8Vj/f3UGiDv8B8+jIP7yYHVw3Hio25d2hkxYA7NXb86oMowfvJAwlTQowtrb5ta208Ny8yfhmcv6CJdAGlJpWwD31i1pTuSJOkjLN3HNr0Kmqx3lyyKWXOBVqwWKL+HsvTt7mRBSXT60VgQhABfX5Qx+3btua9/hGg7qmA1LudVhqk6lnLfiSY/UCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=lVu4vBA3; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=lVu4vBA3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplHJ1F57z2xqJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:59:54 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso976124f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176391; x=1746781191; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
        b=lVu4vBA3OeSqrCv4jnnBO5LZ4lV+oeI6HCrb9m43ig62m84V40YPT7mTPT7KKBdO4p
         gC6a+pGB0SGT5zVdHdN0+/VR/CCO3zmKnm31KXlBYoGtfpZvQkikSdb7VJe5l3ufTjDK
         HUQVfNFBO+M042nGk0RzzsamSWvb0kTzfb5l0Cs/Kw4FDK9qEjYc79NtwiSIn2E3CeHg
         yYmu5/Qz5TgbbdHudpxb3NN2xa7eP/CCLGfKPMhubSu17JpX7BBLYBJM1HM4Icdmy9x+
         Z7u1GUxtLEBIPeFdrPe56994bDKGla+W8jduSzGNcPfte8nfFZXqEuIC/JDY2ThGgQIj
         d6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176391; x=1746781191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
        b=b8t98oGm4NQWKtgCzIH7ZMKZZMFk2bx3sHSOxQskfmncqx+XsFoqnT4vFH+q+CXrxs
         wb9bJbFD2TbRBQBN01lIl5Z4AyigJF3yQBmtTI40SrqFj1NavliPn287x8A3+QzrHPg7
         ptrupNzB4alvP68M+pmIkmvHmbDZZ75x4Dfij0SHCJ4g9uJpNH5sV62azUJnY8+KOYMn
         c3jeiqb7v88IRPi+MLG8Bv3kuvFTt9pFnSVPGlZnMhbuSMzU0cNdOBamZPjjP01OSAl1
         Wxx7k3thJ/tIlCZKiWjlk0h+IfcMqJH9jxa2bRWPusl2T6IZwxUXVWsUyuogTqUdVBV2
         MpcA==
X-Gm-Message-State: AOJu0YwrF6ZmF9LegwK3ad/Or3N7HiA3LRQts9TSsYDAsex/U8kFB8BB
	fhKIMEYjNH45VJL3Mxh4ApaqRsq9mmIYj6FMY5kWs1jqnZC9aiHDm6zeWZbQvOw=
X-Gm-Gg: ASbGncvbQestt4WuT59RyAvgZWOOuTtVOZFx2WCU35pEin4ZPCP8ooi/3S6tuit8UVm
	3GcfwSJQAQ7aTzP4L3Cqyx4kAclmn7gMjaOm4KXL52KcU2pnT+1u4dYUlGII/JPa0iGyloMILJ7
	JXV0afLCdYBwKhsJMopCZkwljn3mEXQRj5/cXkm0O6TdDtLOc0ja/+84uc681s2SPEbdqATE5bb
	WTixg32VRMtYlmmMYFtEKVBaCVT2evF4gmvx+id8Jh1JsV3ImFZLa3+brUyiNGu8hpIj/LClgnq
	IAbaMX0GmjtVZxDP313TvAYbob70/KUnRCc=
X-Google-Smtp-Source: AGHT+IGkAmj0QTn7U0/RzbLyZFE3GXCS35eKh83HE+zzPG33Ol9TAe6eJSEee/o7TqoMVcjZZmYXFw==
X-Received: by 2002:a05:6000:2501:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a099af0f94mr1403321f8f.54.1746176390895;
        Fri, 02 May 2025 01:59:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
Date: Fri, 02 May 2025 10:59:46 +0200
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKJFGgC/3WNQQ6CMBBFr0K6dkw7KKIr72FY1DLAJIY2U1I1p
 He34trle8l/f1WRhCmqS7UqocSR/VwAd5Vyk51HAu4LK9R41DU2MAb2buIAkRaQBME/SYIDQ+e
 2xxYRrVVlHYQGfm3lW1d44rh4eW9HyXztr3nQ7d9mMqDhVPfO0N01NJjrg2crfu9lVF3O+QNbQ
 tBBvwAAAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5mkPquEYhHhuaHDlP2FWJwcbCha2j8346u44CjTk/b8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImEk8IL2kl18zA8xLaZV5UpuGvSQ0944hzDl
 +MCaHC/g5qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhAAKCRARpy6gFHHX
 ctyvD/0QuzQl8wwUQP5TkXhU0j7o76hnUPg9igcQd/mlb+GN+T5YJ7enSR4IgmeJkZVbUmRH+BV
 Hve2ufGgwDdIv07zwz2sc4sI2TWM3P3McMJIqlcBt2hfBtRvoJkic85ly65NV0rqScnJkrTQCOa
 Kt9pci1vAm3TX2K9j6b9Y6YUsMXkPpnBxJ7Bgfub+lBlDr128sdvgGUhkdFsd4+AP0EshgJ/R/J
 k/8Ga/IVA6Ze2en6raVViv1FiW+hN/4Ddg5hGdq4yzD3rqBJ93+1Wtg0VKthkwew43D1ucROH6a
 7wKorwf4SPc7ByLaJ3lrYuH1036ZpeJqPm97EEMD0DRHYa6sJxey4YyVx6o5rrgoTtGO8dn/nU8
 VE8hCMvzhdVGXaOpoFQ1312JoE+Z/Cn8/xxa9Vd0bSLIPDh/rlzmRO7PBKAKvoGH2rnC6eJl8rT
 653e8AqEn3aqaDBJJWhR+GHXSw942if2lOPnPyBzfU8MbB3VxBWlrmuzZAvsdtqQ6sKk4I82LS2
 WzBX3jKtN0qxJmwErJz/ZRA692Sf5gSIJh7sqCt0+A0m0XyuwpTEeDRhThbk6462Ct7+ht4syCU
 JN1r4TU0Yqi/FyFaI5d/eg01SodTxDrEsSOZVWKdEIOWomBY5DSmt5wqXgGIki8mmiyRnbGahnt
 Lyx4jfzgnRhTnIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of 
converting all GPIO drivers to using the new API. This series converts 
all powerpc board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- propagate the return value of i2c_smbus_write_byte_data() in
  mcu_gpio_set() (Christophe Leroy)
- Link to v1: https://lore.kernel.org/r/20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org

---
Bartosz Golaszewski (5):
      powerpc: sysdev/gpio: use new line value setter callbacks
      powerpc: 83xx/gpio: use new line value setter callbacks
      powerpc: 44x/gpio: use new line value setter callbacks
      powerpc: 52xx/gpio: use new line value setter callbacks
      powerpc: 8xx/gpio: use new line value setter callbacks

 arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 13 ++++++++-----
 arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
 arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
 5 files changed, 28 insertions(+), 16 deletions(-)
---
base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



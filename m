Return-Path: <linuxppc-dev+bounces-7512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63537A7F5EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDZ1jl1z2yrm;
	Tue,  8 Apr 2025 17:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096878;
	cv=none; b=ch+471x/EUgy8q2XrcjtFa840gvAyJ6rLodm85CwXWXLKtH0hS00o3Xxb8gCRVYP8VQNZ9CcWlXaDG/MQpGH+cB5rxLM068PRSdnWfGxHHtrXyrtkXJFq0KM095sYXF8d22M1EW2IBW5cYwNEHgjjK/fOxXSXXjR4YfOAm1wypUE+6v/VWs4XVU/M1Q1BPgdEN2dKI9bjwStlLvAlo3J+qG1DD41HTxn2EM401wmkjWQ92WIOCOFZlfJEPRrpCSY6/xmL+s78FrzzEIyBASYedzys7niYZe3TB43p6lCBWYpG7shgMkyhmHB0euP88beqRaSmu7SW/fuIa6jxKJOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096878; c=relaxed/relaxed;
	bh=TE8KU3GgwOIWy128lWSLTsSWedqlmnBG56cma81HI8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IyC/20snp86rXsufr6/Vlvp0WXySNjvSUpVF3UseBFikDyCvyf+OEOhf106ztN2xGbO0OZn2DrulL1BUguQWnoPbkkhRyhELSoOc2D1cvLZpD0MJCgFXp29AFGcbVzdJ2gIiJHG69mkqK9eeyG1uNMI3ZINNHTuJ5zhOQrjM9b1T064QiBgH7bhYRCL4tgSgfDSyt+PuWWSp92IIDs7M9f2Ffj9ZHCvflyeYkHmS5TJudx9Ke8WvdlrmexUPsGfhR42az4D0jEZ7jjukW5gJQQE4/MqfljjXQw2Mo2PbpwpMS5r/ih8kpO4Jv0pXHA3qlmry4q7WNebRLZEnT0XQJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bKgurOnN; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bKgurOnN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWyDW6SWVz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:15 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3848269f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096872; x=1744701672; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TE8KU3GgwOIWy128lWSLTsSWedqlmnBG56cma81HI8U=;
        b=bKgurOnNn20KAXNQMKpk3w30dOM2LhH6QLuxlR4u6+eIlfSoMEgQskf9sgCTO4VAmH
         YnwftbS7lyXZ0MLPsh3zA6kpVJkfvQ8uk+k2MwidR19iPrg3nCMK4D0d6GPVQl0lVZ0u
         /uqbRjkoX1grExiUhez1a6R7klzurX8nkcEbFXqIbwpOe1fH9YMF3WjMKFV3TrEtPZG7
         vEyj1xEWAuNvfyqXsY/UP+/U//3PNS67YqpZ6DtNIyBsn6237gy2iYg4reed/+ZbZGQy
         pIdT2MbHRaE5eAqcrdWSwdR2WYunQXFstrgfsS5D/dQtXMhFfj6T0iVUUECOBxCdKTLS
         o7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096872; x=1744701672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE8KU3GgwOIWy128lWSLTsSWedqlmnBG56cma81HI8U=;
        b=MNoZhpV5ktCO2/AYBb0Gc5W+pf312wbf88kI6zKwOHQAqojMEliFAtfesY7zvEIO/3
         MDZrL53rUmisp0UtWR0TeR2fV9txuEUK8NV9a4+R8S2MJvGT8A3YuxN/RsZrsRQdD3Dt
         tmzObFs7SLWv/xBI/8tXiMeVK1Nw+lcwzFJiW08pyOYbW875TMaFyw0zRbetdD6ZkiBz
         1fbeFnjmV12OnjIheRya0sjTkt5soLbtLSFiOWs2/hrnipKtpm5sXmEWkpxS6n0fYenz
         dcdqmTu8apIBBJjxF2gVPfIhrolTExe93MT6fQ08LlppyV2616H5ppb1gi+2dC1NlACD
         Hfgg==
X-Gm-Message-State: AOJu0Yxy/kdwr/Zd/lpTgu0ZOpxpbRxc8eEhUjfOKlalhBQB/UMZ3aJN
	3byJfLUEp3D1aPea1WrqJCJCG1HBZ5XmBibh63JN4mpTdCtCqJC5vdahVLpuM1Qa5uHg4nIsTHo
	sWNs=
X-Gm-Gg: ASbGncsnNwckyH1sXCJQm3fVHY8aWS20yZX2RKtYlWmFVkJHu9GmkAW/lxmsosmVWH1
	tT9xp+KV6Ze08vG49MJpvo4Q8N+UWipKyFnXi7Qi5IdVjhV/D9EYLntqIRILz0BM1VHNQY7Ep1B
	NhUmPkHHI5BKNLEpILIb0GYQlogMkd9t1h7bDGY3h1Z29OhFNLnGDLa9KI8Onwb1qiKO+tTu4kQ
	2BvAHjng/Fqo7yQDHY5Zzv3EVRqFJRbvN+39Ojvyy99QVMTYk9IjnWAnQhnY26pBaphWqf4Ylx9
	M7SbpLijoEgI96sB4ZXsieRGMgf5boX6E3miXA==
X-Google-Smtp-Source: AGHT+IEzkrRzBMtSl4ctUvpMUsrqjcehR8fZ97eCkYCoVM5CevnJWRctAuT077lImW/GKdTsztThZA==
X-Received: by 2002:a05:6000:2403:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39d6fc293edmr7415263f8f.23.1744096872357;
        Tue, 08 Apr 2025 00:21:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
Date: Tue, 08 Apr 2025 09:21:08 +0200
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTO9GcC/x3MMQqAMAxA0atIZgMaUdSriEOpUbPYkIoKxbtbH
 N/wf4LIJhxhLBIYXxIlHBl1WYDf3bExypINVFFbNdThphL8LoqRT7QLNdxs6rHmoV+oJyLnINd
 qvMrzn6f5fT+J7rl7aQAAAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tXCJ6XOIP5UMxUMzwAAhIQV73CiyhZPXy/4pnKrXAZE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5m0mAka9slZ1K1D+jsHMTs4VAcc/p4oxLtN
 XB1vI9OBBeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 chuuD/0SxuTx4+pN8BePlC//dOOUmReVczVf6jRowNhc02sYQt1a/bPYtM3rNcNcqdMCJDF45ud
 MfOXuA0DsTxCBEI6ccmItFp7dkfhtlyr/A/bTC6ITmXlGEDYgQSJ4c6R9DamchQx4oM7L9jqNiA
 LcctfJw7ge/xHBhkcwJ1Q6eKug/cu2FcP55KjiXS7IResKIi3ox/5loej5E/FaDUQsOLvrZkZ3n
 vfWO/NNW9ujF1DuPMbBjHOakESTkGQzWuXTyfVbRbKmab15nsBL91W8NcRXMqFXODIETP1TFKXp
 9qlaH8RAC+RNkm1HVzALgp1IxX85h+TqJIot5FPsAb+HBqP1yeLmdolkGMJjd9clUO6STS8Jvci
 +/+T5YAlLV0lRjKXo3YUhb9j9wmRa3Yqm8S2uLgaXVx+ULhzyPMztrr0ikxzEj6frq0ZDDDB28p
 OMVGh/Wz9QcHVhTuI6TcD0fs+owDNWwrD+v5F8JoCWU0Uvnit2XhoYETY1yWDuX2jKBYG0BVVFz
 r+ekbp8lykB6WpWoACh/bCvrDbhKL5JXghXg6hZl4WW+n8liV0/Y64jVDqPGhUmCZx4OQsD7Qyb
 kJWluEDSE6xG/lMhcoE++E2gaGZJOQZAMAr9ru4dMrpYEPlBKsybqw6y+CofqzWwT2GzsoDXvWQ
 LawoqFDJt++YjAQ==
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
Bartosz Golaszewski (5):
      powerpc: sysdev/gpio: use new line value setter callbacks
      powerpc: 83xx/gpio: use new line value setter callbacks
      powerpc: 44x/gpio: use new line value setter callbacks
      powerpc: 52xx/gpio: use new line value setter callbacks
      powerpc: 8xx/gpio: use new line value setter callbacks

 arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |  6 ++++--
 arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
 arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
 5 files changed, 24 insertions(+), 13 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2E2A7EC7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 13:39:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRjkm2B0MzDqW6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 23:39:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dqPVVhNr; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRjcz0BPfzDqxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 23:34:10 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id 33so1562311wrl.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YPXD5S4xLV51P6wwfMTdN27yHB1Bn9d7ZcN0H9u1frs=;
 b=dqPVVhNrpMXm7tI5lhasI13P4Iv5sCLD6W6FUk53xSj4uV95IJEsgd6zqVUVogrWsU
 I2O05TEnnYENcaVpVvaqQ6hWH+PFlWFol37gLRu6NNp4epkAUOZs2w7N58rn7alzGuuu
 foEN5ZoXroa2ENnKNP39xL0ZlJ3Cw7KeKnlr0BYEd1vsFHAm+K2UZwn/TVNTRigyiFh/
 u6Bf09F3Kh3rDlu7YNTEDQSQW8fbBPd4BcQKZ79vMjzxWC3jv9Zo+UDqpLlz2B6M/ibR
 ADi/w1eLKRFSVcweDcq5S7r5sGunMQ2fSuWiwNPvfqMtRYEsPk+GEOqxTXUWSem7Bm0u
 6zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YPXD5S4xLV51P6wwfMTdN27yHB1Bn9d7ZcN0H9u1frs=;
 b=de//1Igu9zC/lkWMOvWQDQLmkEmJ/Tl3msVjfPtFCXIYbcErO3csOC0xnHEVUhLHsG
 U3yjjFlPWl+0/u6OIox8LpxQgGpy35dWFkNAYHvL7m/5ipFM3J4CEQVa6a63/E4rupO1
 tRdv9XaQCALq4Xv7db7CSlMiICwIlYcOmaq/AphyP6RIpjXZLqvQAPaRKrgLxmzvghk0
 CWdjhDjdRHYyHuc3qa3DHUQpoK+voVJkoFCO4139jnWzJGCLg2RMhPTfe73v5x5rYoWE
 INaXjr2GiGsvv3njZUMrDijZp90m5Od5nmtV73kp0RKMhnV02Dxde4i01UoLxyxirHEf
 cQag==
X-Gm-Message-State: AOAM531lOZgaSwk4XfL6WmAi6C34fYWwQqnth8vbF8m0oeP48OdjCFRE
 xLLIdd5I9i51fCV5gCvsIffQxg==
X-Google-Smtp-Source: ABdhPJy+iGM2R6xUkANRTzhmdBseiBipUpDHy5WA/L3w1f4u2lkmfi3LA6Cr52fv80ZVHxOv3kW50w==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr2681828wrr.361.1604579645757; 
 Thu, 05 Nov 2020 04:34:05 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id o7sm2346689wrp.23.2020.11.05.04.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:34:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 0/2] tty: Remove obsolete drivers
Date: Thu,  5 Nov 2020 12:33:55 +0000
Message-Id: <20201105123357.708813-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As per the vendor's request.

Lee Jones (2):
  tty: Remove redundant synclink driver
  tty: Remove redundant synclinkmp driver

 arch/powerpc/configs/ppc6xx_defconfig |    2 -
 drivers/tty/Kconfig                   |   27 -
 drivers/tty/Makefile                  |    2 -
 drivers/tty/synclink.c                | 7899 -------------------------
 drivers/tty/synclinkmp.c              | 5580 -----------------
 5 files changed, 13510 deletions(-)
 delete mode 100644 drivers/tty/synclink.c
 delete mode 100644 drivers/tty/synclinkmp.c

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
-- 
2.25.1


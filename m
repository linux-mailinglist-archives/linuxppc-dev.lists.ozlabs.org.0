Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205D72D8C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:53:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hHR187Ba;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgGQZ16D8z30XP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 14:53:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hHR187Ba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgGPd5qYkz2yyg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 14:52:20 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-655d1fc8ad8so4285959b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 21:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686631937; x=1689223937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FreqPUXQKOmQkRhBReENIWy3FIZpK1ihibtqZ06c/v0=;
        b=hHR187Ba4r0IoK0j36h10HObjRQ1NvNAfUP+krUm4SmB/nKtMuJCkUdUzL0G6oCsyb
         EW0qCAXdKDMDbOt34uCq9hg9M59esUIbgEbTzx14MDsjZ6nSdGgd9aS6ep3M98n8IlED
         HQemhow9J0Anm5PgsqCpxL+UrNZmOo9CVsEyVVOrfUMvwTCZsO+Z6I1f44Uq6SZkE6aQ
         IJUJZ/+rGTOJ5xeyqhSEAA9gNGmu9JGcIIBwXj2/5YIALZuEc7KQnDPtE3B1+b0U8kMn
         euoy48HQCdHjZPPiFz+pt8QvczP8EDgnMiNedy3/MPaRmJHgJdG9vi9NF9rYDwCpzd1h
         psHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686631937; x=1689223937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FreqPUXQKOmQkRhBReENIWy3FIZpK1ihibtqZ06c/v0=;
        b=FHpwj8BSKreOBhusKE61DtS8gRijmk4HTIZ6WueVB/GIb9QlK/o1p0SkfbrdRw5kf5
         6KYBBk0RiDh4phmRIRPUqsgzEbKzJS9AQ2lYkXS+CVfDUhe4ns/erZDknbVcvLuOsvSn
         ne+ZSRYcGLi6goKTojnNZIc8th8PBU78pq/lFa95qaAMtbgVpS964BuEIuEBylIiDtgZ
         RCOBZcVWRXJCIFjR+B07M832h12ihy024NnI1QAl+QrFG9KxlksP41eoYjFqidD1GOax
         gKkVpQ3Qtoj9yBi1/e4YUVNfQHSjqkfiHo6EKe5QBV1uYQGu9GwMt5bYHsLGBNHX7P3O
         MoYQ==
X-Gm-Message-State: AC+VfDy6ce8ruU547LIZaTbvNGip2pOgmoC+J8Wxso7fdrXpLfvlsdP/
	RqeCxpWBQYRBrjDkrK3kiqZb5K38buU=
X-Google-Smtp-Source: ACHHUZ7PcmuaJlIg/jmaD/k+Fe9p3cT07muiFl4am9481lXUGxFbUeQQ0Yjrw1lau2I7+/wo9vHXNA==
X-Received: by 2002:a05:6a00:1744:b0:65e:691a:460f with SMTP id j4-20020a056a00174400b0065e691a460fmr14321463pfc.8.1686631937020;
        Mon, 12 Jun 2023 21:52:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id p10-20020a62ab0a000000b00625d84a0194sm7700916pff.107.2023.06.12.21.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:52:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/3] powernv/pci: Remove unused IODA1 support
Date: Tue, 13 Jun 2023 14:21:59 +0930
Message-Id: <20230613045202.294451-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oliver mentioned this code was only kept around to support the VPL
Power7 boxes. Now that they are all gone, remove the code.

Build and boot tested in qemu only.

Joel Stanley (3):
  powernv/pci: Remove ioda1 support
  powerpc/pci: Remove MVE code
  powernv/pci: Remove last IODA1 defines

 arch/powerpc/include/asm/opal.h            |   3 -
 arch/powerpc/platforms/powernv/opal-call.c |   2 -
 arch/powerpc/platforms/powernv/pci-ioda.c  | 476 +--------------------
 arch/powerpc/platforms/powernv/pci.c       |   5 -
 arch/powerpc/platforms/powernv/pci.h       |   5 -
 5 files changed, 6 insertions(+), 485 deletions(-)

-- 
2.39.2


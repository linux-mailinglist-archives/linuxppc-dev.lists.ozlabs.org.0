Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A408E38ADC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm7vq4KgRz3089
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:14:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cR3MbNlH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cR3MbNlH; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm7vK6jPWz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:14:03 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id b7so8452376wmh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N+rsDWAMv4x1ZiNx5AapS5e6MR/cbmzAQ/wF+EUOxGU=;
 b=cR3MbNlHRY+hSafJx7VAjfSope7BFgR94/44HuaDrveC1bGEnVAaWRp72T7xvM0XoU
 OTDDqMvOLczZa0Yvp5vjEaVW5Exg5f5iypjfSszL7Pv/7/5oSjatQAHxdeMrD/CSxPmP
 8XbqrDRkkfYJAlnaICjiZD7MIHTWYiFNH0cEy/lXgNFMkwo28P57IbtdVRsrhxAn+q9p
 S5SSJBsrkkm8/LbtosRlsbtzn7QgwanZfaqwoxfOHC69k6CHIljV5dyJ9RWYnRzTlG6R
 v1m1BolGX8TjunA9APuGjMSeBGGGxaMaO6jVTKKwGm+M2rQw3SEwbNWRVcLOeUzuHSC3
 YHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N+rsDWAMv4x1ZiNx5AapS5e6MR/cbmzAQ/wF+EUOxGU=;
 b=W4FO2q6aQtZrvWw2+pibkOmmmMNbUK6r0bGuDgPjvBw7OWZWIe1hFp/83ey27CxaZa
 wCl9EhpRcTNHqanXd3gHgpHwRbLE9H0uvvp8CSLekizodoFWeqzyhzgaOhQdxmd9Lr+N
 WcHQPbEp5xnJHAf4OmukU1IUCK7PcZe8LGi1Vt375PWx7K2zyQs5rpE172gNUVAjVOrL
 JV7cwgBlgbSxdQTXC2aYkv3fA4/O3D8dbXqsqOohD9qkAtwH+JQXIJeYSIAqX6XrdD36
 o7YMtq9gSm+0Wwos4u15qAJEaK0jDnNjmT7Wsb/8Kc9Jr4y/9avs4rrH7/vtEyrVourL
 0I4Q==
X-Gm-Message-State: AOAM531i1jveKc5ISzOl+JkHdnHMGNghm8iQRHNJonZnZqp1V68d2rGg
 9cbmgalp1wV9gYHx0ByMTw6Evg==
X-Google-Smtp-Source: ABdhPJyASSt/x1V8q95MVvVq2U/YMyWW3NXlYBCB6FmxOMXdwlT2RPBDCPtfjX12ceL8X8BK7YpF8Q==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr3390379wmj.46.1621512835550; 
 Thu, 20 May 2021 05:13:55 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id 61sm3393704wrm.52.2021.05.20.05.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:13:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/16] Rid W=1 warnings from Char
Date: Thu, 20 May 2021 13:13:31 +0100
Message-Id: <20210520121347.3467794-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Airlie <airlied@linux.ie>,
 Clemens Ladisch <clemens@ladisch.de>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Mackerras <paulus@samba.org>, Kylene Hall <kjhall@us.ibm.com>,
 Jerome Glisse <j.glisse@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dave Safford <safford@watson.ibm.com>, Harald Welte <laforge@gnumonks.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kanoj Sarcar <kanoj@sgi.com>,
 Bob Picco <robert.picco@hp.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org,
 Thirupathaiah Annapureddy <thiruan@microsoft.com>,
 "cs.c" <support.linux@omnikey.com>, Lijun Pan <ljp@linux.ibm.com>,
 Reiner Sailer <sailer@watson.ibm.com>, Matt Mackall <mpm@selenic.com>,
 van Doorn <leendert@watson.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 paulkf@microgate.com, Jarkko Sakkinen <jarkko@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
 dwmw2@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (16):
  char: pcmcia: cm4000_cs: Remove unused variable 'tmp'
  char: pcmcia: cm4040_cs: Remove unused variable 'uc'
  char: random: Include header containing our prototypes
  char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
  char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
  char: applicom: Remove 3 unused variables 'ret' and 2 instances of
    'byte_reset_it'
  char: tpm: tpm1-cmd: Fix a couple of misnamed functions
  char: tpm: tpm_ftpm_tee: Fix a couple of kernel-doc misdemeanours
  char: agp: backend: Demote some non-conformant kernel-doc headers
  char: agp: frontend: Include header file containing our prototypes
  char: agp: via-agp: Remove unused variable 'current_size'
  char: hpet: Remove unused variable 'm'
  char: agp: generic: Place braces around optimised out function in if()
  char: agp: uninorth-agp: Remove unused variable 'size'
  char: hw_random: pseries-rng: Demote non-conformant kernel-doc header
  char: mem: Provide local prototype for non-static function

 drivers/char/agp/backend.c           |  4 +-
 drivers/char/agp/frontend.c          |  1 +
 drivers/char/agp/generic.c           |  3 +-
 drivers/char/agp/uninorth-agp.c      |  3 --
 drivers/char/agp/via-agp.c           |  3 --
 drivers/char/applicom.c              | 10 ++--
 drivers/char/hpet.c                  |  4 +-
 drivers/char/hw_random/pseries-rng.c |  2 +-
 drivers/char/mem.c                   |  2 +
 drivers/char/pcmcia/cm4000_cs.c      |  3 +-
 drivers/char/pcmcia/cm4040_cs.c      |  3 +-
 drivers/char/pcmcia/synclink_cs.c    | 74 +++++++++++++++-------------
 drivers/char/random.c                |  1 +
 drivers/char/tpm/tpm1-cmd.c          |  4 +-
 drivers/char/tpm/tpm_ftpm_tee.c      |  6 +--
 15 files changed, 60 insertions(+), 63 deletions(-)

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Bob Picco <robert.picco@hp.com>
Cc: Clemens Ladisch <clemens@ladisch.de>
Cc: "C. Scott Ananian" <cananian@alumni.princeton.edu>
Cc: "cs.c" <support.linux@omnikey.com>
Cc: Dave Safford <safford@watson.ibm.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dwmw2@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Harald Welte <laforge@gnumonks.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jerome Glisse <j.glisse@gmail.com>
Cc: Kanoj Sarcar <kanoj@sgi.com>
Cc: Kylene Hall <kjhall@us.ibm.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-integrity@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Matt Mackall <mpm@selenic.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Neuling <mikey@neuling.org>
Cc: paulkf@microgate.com
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: Reiner Sailer <sailer@watson.ibm.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: Thirupathaiah Annapureddy <thiruan@microsoft.com>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: "Uwe Kleine-König" <uwe@kleine-koenig.org>
Cc: van Doorn <leendert@watson.ibm.com>
-- 
2.31.1


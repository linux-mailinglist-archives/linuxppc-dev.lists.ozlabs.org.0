Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3756659375
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:34:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zlnz4PXxzDqmR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iN50Egcc"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZlmR51ydzDqmM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:26 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id c13so2068439pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Obi+mqeZcYauN+iH39ewBxrukJgtKjTlMsPYuyiH4w=;
 b=iN50EgcceEQT0YlPboERpU5FLkejAJ2G/FQov+I72kb6ZMTm1wJi3CwG8GWcKRXnTK
 cM38Ju6Pz9pHF0F1d8PeOKrxWZ0QOhWqLrmse3eIhDc4dpv2IDbFY+2h80BJO/LVfNam
 R5xbvq/h2oDi/HargaAvRwZtUFKY/MxmorqJNnin4ZFqFw/cjUT82hQv1H9VGFhHzq7+
 fiIFsNizRf5RJaJ0i2y3qUxHlf0+wv6xEAyAW04exKCCI/e7zzwaI2uxx/5I1V9LrAuM
 Vcc1TV17IaVE2oGkPl4s8ICCDI+retg6HzPqldEFpPMsCHuxVBdODAsEfBGiCq2mpicA
 QwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Obi+mqeZcYauN+iH39ewBxrukJgtKjTlMsPYuyiH4w=;
 b=CW2NsXcv58xP4iOZGg7VuZpWjsI7+zR+Ng3vLrTmiIRWqyAqdjbs6lK0K9wjzJFDGo
 31IN73YOXbco+Vqvppu4VQhHp9iBInrdDGpBaU/fo18xpyRBd/2CrcX095rRyRZkD7qI
 zM/FHAS7kjza5RlJ6uGWtNEGmVpTrWyqlZIvxGkguYbFP1Qj743cecnpaOWT78GiV58S
 LBW8PxgwKCJFxZW/1UsqnHYmcsBaOYKSIxZ3iwer/1w5miGm6UTJFrR8h/2O6O0okd7S
 OUoIfIZSmNcY/AVPQabn60uZ66GE1Ouz3ZBqjuj+bh66j8mMGOlXI9xZEJPpsPIlwQZA
 TvyA==
X-Gm-Message-State: APjAAAWY/AGAHRn8w1ZCE0wM6pp89TL+JwWREIXmveEEzdxINmzMSgmc
 WVFrNVyc3yGzxoYsEk3OlhnyLEuG
X-Google-Smtp-Source: APXvYqyyh+79nUMgrBQ8L92Tq2wZSQo4vTNuYh3VLxUnuVUwEzDcTO7g/c+9dj3+AmVLww+Vc9HaKQ==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr7242980pjs.119.1561700004794; 
 Thu, 27 Jun 2019 22:33:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/13] next batch of interrupt handler improvements
Date: Fri, 28 Jun 2019 15:33:19 +1000
Message-Id: <20190628053332.22366-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the next set of patches after the previous 26, these change
the generated code around a bit more than the first batch, but mostly
fairly trivial.

End result is making exception written and generated code more common.
Next steps are improvements to the "special" real mode handlers
(sreset, mce, hmi) to bring them into the fold (as of now they're all
doing slightly different things or the same things in different ways).

Nicholas Piggin (13):
  powerpc/64s/exception: clean up system call entry
  powerpc/64s/exception: avoid SPR RAW scoreboard stall in real mode
    entry
  powerpc/64s/exception: mtmsrd L=1 cleanup
  powerpc/64s/exception: windup use r9 consistently to restore SPRs
  powerpc/64s/exception: move machine check windup in_mce handling
  powerpc/64s/exception: simplify hmi windup code
  powerpc/64s/exception: shuffle windup code around
  powerpc/64s/exception: use common macro for windup
  powerpc/64s/exception: add dar and dsisr options to exception macro
  powerpc/64s/exception: machine check use standard macros to save
    dar/dsisr
  powerpc/64s/exception: denorm handler use standard scratch save macro
  powerpc/64s/exception: move SET_SCRATCH0 into EXCEPTION_PROLOG_0
  powerpc/tm: update comment about interrupt re-entrancy

 arch/powerpc/kernel/exceptions-64s.S | 289 ++++++++++-----------------
 arch/powerpc/kernel/tm.S             |   4 +-
 2 files changed, 103 insertions(+), 190 deletions(-)

-- 
2.20.1


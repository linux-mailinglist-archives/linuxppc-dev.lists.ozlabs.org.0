Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A675A5B9A86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSwzs3KWgz3c8M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:11:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DWqHl74i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DWqHl74i;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzF5RGHz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:20 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id k21so7602294pls.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VY6RyppyfvxVAEUwCgqhW70oJTBxdzWEW6YWSJ89xg8=;
        b=DWqHl74i8VvE/g+6cmhTQT3Hsef7NBR/CiD4nFoNhcFS/w92FhP0S9QYx/xTjTTinI
         khYkgG4BI31BF2kKaBlBUCyGL4DhVUtp6DytzssNzxvcF8RjDEEa+A1mgTJb8yYzz0Kq
         mZVVY5wBXQVkyDV/BjlrnrSBp1rjKv91uP2O51zumtk9ocOCCcEtJzekJWvmp+o3tpep
         GMNWLR/SEYx3nywjlyrnBtZo67IYO2DKnK1SyIfPTfQ2UgsdNGhgmGw6FFBzCJOq7+OB
         CmYpjwKb+CjBYeGKSzn7Yl0QzxD2s6sAXR3zOPYWVFDmPbWIHfD/uLDfkBkLhhNCUlyP
         RaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VY6RyppyfvxVAEUwCgqhW70oJTBxdzWEW6YWSJ89xg8=;
        b=avAYsJOfQL2XIL3EDeTvjwVZDC1e4LgGu9YbOdQnQrMIgRv2c2rFhc2WiZvZLv/llT
         1F9y69gNGgI2QS6yU0YSMBMRVSwge3fOf6mvpccpXZs/QXmfkavjmxa/Si8sZ5nxZy5E
         6S9fXY1FwiDRcexyYDi47loWk19oStt+i/LqBuObXmscen149MtUMFdqU1BBSx54ZoBd
         4apJGHTz6kwG1yCHZBdyQ48rQMfQgsPwf4uf1JoUUq3lH2JTvKz1kd+gz0GI6GWszXQ3
         d7BnHe/UU35ofr8QTaGq8wIbtxiH0k7aH+gYPIYacHfm3OsUyt+CT0vmceBj6Jp7AxMT
         PBPg==
X-Gm-Message-State: ACrzQf08meHWpueWy/FXEPrRGeaZcoeVojjP44c52oyJupcpH4UWftla
	icgR1MAKeRmC8kZbjvtuW9vUG09tRww=
X-Google-Smtp-Source: AMsMyM5bWHer+kafQS0NL5FjJS+fj4/YgwwugY83p4sbH+mQ7cd1j+kN2y9A4zsFd8Nf3zaob1v9Cw==
X-Received: by 2002:a17:902:f709:b0:178:1ecb:1842 with SMTP id h9-20020a170902f70900b001781ecb1842mr2924786plo.1.1663243876150;
        Thu, 15 Sep 2022 05:11:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] powerpc/64: improve boot debugging
Date: Thu, 15 Sep 2022 22:10:52 +1000
Message-Id: <20220915121058.2288916-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is mostly 64s but has a few fixes that cover 64e too.
The main thing is the early boot machine check handler.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/64: mark irqs hard disabled in boot paca
  powerpc/64s/interrupt: move early boot ILE fixup into a macro
  powerpc/64s: early boot machine check handler
  powerpc/64: avoid using r13 in relocate
  powerpc/64: don't set boot CPU's r13 to paca until the structure is
    set up
  powerpc/64s/interrupt: halt early boot interrupts if paca is not set
    up

 arch/powerpc/include/asm/asm-prototypes.h |   1 +
 arch/powerpc/kernel/exceptions-64s.S      | 114 +++++++++++++---------
 arch/powerpc/kernel/head_64.S             |   3 +
 arch/powerpc/kernel/reloc_64.S            |  14 +--
 arch/powerpc/kernel/setup_64.c            |  33 +++++--
 arch/powerpc/kernel/traps.c               |  14 +++
 6 files changed, 117 insertions(+), 62 deletions(-)

-- 
2.37.2


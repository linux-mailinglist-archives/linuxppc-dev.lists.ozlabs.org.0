Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C483ED04F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6pf05SVz3cK0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:32:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mjaUg3c7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mjaUg3c7; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6p23XtLz3029
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:31:37 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso12172194pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95o42/7oY9rAO+5Y6rag3K0b9MXQiFhvlpE+/et/584=;
 b=mjaUg3c7zorG0gY73B776G7qK2syp3R2px87pssJ5VjM5bo10q+T2wFvhhw6CSzOve
 3bTZV6X9/6eH4CIfU8feTjt2tIu57i2Ow7WKtEjdjVaHp18UfDxyah4SbV9q8pyPQmC0
 WehhM1/G5cpAeMxM07TbhRsfPiFkc18YNQCiqOwN4X8L2/Dn6UAeoV8SFTpss35BHxUs
 UNkRC0A+ZIE3cQ5keDQXY5JgHLDCXmYjf/+h34wOjZJpymxanydjMGC8odDQ6PyLoqkU
 +Qo9fUpz9R2TYWpyNZpftwvX2U2blFRW//SZozmDbD+/MxjTePz8VfcvVTcViiN7P8UM
 fqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=95o42/7oY9rAO+5Y6rag3K0b9MXQiFhvlpE+/et/584=;
 b=FaciPiHOGs3+eCyihLK4tMPrk4hNXORzlQ+4MRgrl9Bq81A9Oq1U6fftPdOXTWO+Ry
 UfBGi7IfTew+aN8paXlYIYEMmD+2oea1ysvDyM32UUEgjqK4Rs5WFeoBw39gDl+htFl1
 9OCoSR7zOkeGY36MjpypUtDn7BVvKEnPBeWCXsd45G+ELcjG5Un0dx8/HtpoyBmuQlzC
 DbU4B6P+zmrPq5KYGJ8LidZKoj05GQlX2a3R8L4fL07sanTti26VfTW7xHxHhtupLXpO
 RjgbDnc6gc3uFBc6TS2k++31gL6KIagvocfZ+E9vKrdIM01eStHuQZch2QEVhXhf0NMn
 HujQ==
X-Gm-Message-State: AOAM532vhbxDPKDd4iie7DWeqQno9UevQ/kpTWVt9vcZx4NVFYoXmRq1
 IoFSK9ZtsZfA+PlQol8emB4=
X-Google-Smtp-Source: ABdhPJxBw/HUet9SnsLE2Hwou3cHKvyqXT0tTBmxN6XiV2mrWY4KZNPTaUuTW9rUk3K+M1H1B73QiA==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id
 d23-20020a170902b717b029011afae3ba7cmr12197556pls.28.1629102695138; 
 Mon, 16 Aug 2021 01:31:35 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id mr18sm8715684pjb.39.2021.08.16.01.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 01:31:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc: mpc855_ads defconfig fixes
Date: Mon, 16 Aug 2021 18:01:24 +0930
Message-Id: <20210816083126.2294522-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first was a build warning I noticed when testing something
unrelated.

I took a moment to look into it, and came up with the second patch which
updates the defconfig to make it easier to maintain in the future

It also fixes a regression where the MTD partition support dropped out
of the config. Given noone noticed the regression since v4.20 was
released, perhaps it could be left disabled?

Joel Stanley (2):
  powerpc/config: Fix IPV6 warning in mpc855_ads
  powerpc/configs: Regenerate mpc885_ads_defconfig

 arch/powerpc/configs/mpc885_ads_defconfig | 49 +++++++++++------------
 1 file changed, 23 insertions(+), 26 deletions(-)

-- 
2.32.0


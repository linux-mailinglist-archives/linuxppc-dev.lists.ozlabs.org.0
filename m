Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784881F6CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 11:16:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LDJ/v6Cd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T14DK0TZRz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 21:16:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LDJ/v6Cd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ghanshyam1898@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T14CR3TQWz30g7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 21:15:45 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6d9af1f12e8so1136833b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 02:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703758543; x=1704363343; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXTkOgJPfVQI5vG1o+5LiyjL5egXWPndcvQFG/dAUGo=;
        b=LDJ/v6CdvJqzo4AwEMX2DpM6LYlqqTC076L7NsCho7sM/byd5Sb7yhQcE86wuWPLtZ
         aiBY6UPF1siIU9GbacKl5BRBbvbxW+zp0ui86wkQwFpGJUdGvAFwIqFp0Kajavqt07d6
         kadoWaembQSil1oxJMcJM7UMRDdUwmWHsk2e8eGKCSywfBwQqKmMRvFQGCUJRYTPD3Va
         A7mqyNpScZ7ChjXERunZOKoTn8GHLjoH3om58QP12TXAgOL7EeCUQZr5CHbIibyveIRE
         zKyBnVzk3c4j8KdNo03cBHBtcG2kSN2X2MwGlCGHxacg+SKXXkP6jdakdk2D5PTfG9R3
         tLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703758543; x=1704363343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXTkOgJPfVQI5vG1o+5LiyjL5egXWPndcvQFG/dAUGo=;
        b=FzDQ0d0g44YmCOrN+EG43pU5FllSuu58yxwPMyo9h1GX8RJHZH7YH44s1jUUpI0493
         JHxn4ETWVvnE4B1iorBl2njl/jzoGLPm1N9KnJ1HL51pE7FRY5bdd+MTfYedAoQW3kkq
         MnolTgn2KBRUWc0Pm7DgpNq+cLMWV4SXdy1CO6n2ObMVwhD0yind/woP21jvuuSK2L1N
         L/e2c3/gA1l7gghfT2LeSIhX6XXa4U8nWdRiEaxZX5R6xgbIyfCatcdCopp5LDHL2Cg9
         VyoBHHjB/tS0jKi6AD78JYHFyIs/EFllq0PYKxxxmo9UCSmqhx3G+hu3PQQykon7WD01
         hhWg==
X-Gm-Message-State: AOJu0YxeQ679G+esNnI99Pe0Y/g+/wzNPv6MawrlN2+NfAYZzbBhd7Nz
	VIzSyTu/Mr2Xw6BuAg7wdb0=
X-Google-Smtp-Source: AGHT+IEONUPNn4h8LWIhAs9KtyKLEahLLk7SOBfPE+iZhkSuQrCxxUDZ7IeQKl4A0zjWGWy6KhjPiA==
X-Received: by 2002:a05:6a21:3294:b0:190:5e28:ad52 with SMTP id yt20-20020a056a21329400b001905e28ad52mr5152269pzb.67.1703758543460;
        Thu, 28 Dec 2023 02:15:43 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.78])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b001d3b7c5776asm13597207plb.160.2023.12.28.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 02:15:43 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH v2 0/3] Fix typos, grammatical errors and add units of function param
Date: Thu, 28 Dec 2023 15:45:17 +0530
Message-Id: <cover.1703756365.git.ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes spelling mistake in the word "auxillary",
fixes a grammatical error related to full stop and adds the units
of the size param in the description of eeh_set_pe_aux_size function.

Ghanshyam Agrawal (3):
  powerpc/eeh: Fix spelling of the word "auxillary"
  powerpc/eeh: Add full stop to fix a grammatical error
  powerpc/eeh: Add the units of size param in the description

 arch/powerpc/include/asm/eeh.h | 2 +-
 arch/powerpc/kernel/eeh_pe.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1


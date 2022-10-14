Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5E45FE750
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 05:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpWZk0BmZz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 14:09:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G7LR5OSf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G7LR5OSf;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpWXh4Pzvz2yZ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 14:07:46 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id n18-20020a17090ade9200b0020b0012097cso7076888pjv.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 20:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbL9Ej4j7dMuQpIuLli9KRFWYJBWtY9inozBipkNNwU=;
        b=G7LR5OSfYD18HwgzZHAOD4MpwUr6SlC08L9JKDxBMnkVs/5hRdI6IgUJ1VbBNtFbg3
         jAYJ1Hnx6dJgN4jBWhaHQiMiZPwjhK6AUYr6EF0QHcWBvEhwDA/Jy0ChsY2BrJyHYwkN
         Y3KborC0u85+PyrKkutY6JNf74LPQDiBOdjfpjpL8PSJYUkTqNRooqItSAVhTurgIwYI
         tY3lUseGpizZ82pOlfuF4jQh+28bPGSKamcPfT03zbGsGtwPsZxYq1a7kPqHXYFmv+8p
         7Ur4UYhe/wUx5unTTsuWf/ijh0zRDv9XVREQe+n7XPOPytmp8tNJAiiUn6RAv0+/qtG8
         xKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbL9Ej4j7dMuQpIuLli9KRFWYJBWtY9inozBipkNNwU=;
        b=kZHy7iMxPT6mziy+RJ+kaw37rYRLdakFO2OgvmE9fB3AziuHidK0MyTBg5bGlVrCjr
         gO7kiSqUGBrPlYlyaVBpx2ocqiIuJOW4XHCuk4oOFB5gdF8vbBZh0RLUecBRZuIxVz2s
         iDe3h+JgPlre7J7pHrXNeWJYJoUxlvyY3FKrC3Auh4S7J++o5/JF5n8jKZxUSOM4wwoB
         BeXUpSGTQLue/zkG85f/Oqna3BdU6Q0Lr68H5grShfPy6vpT5TCwD2JVSkmvExmBmmAO
         CYa0YDbn7NIieEz6AGfGVn57QmwpQLnUk+/6RG0gFkNCiDYMZn0wfdeo4CpoC3KKOZ7T
         H/Lg==
X-Gm-Message-State: ACrzQf3EOtw1sTZcFMFASofGHyWBHOzQjwB6DRIgiomXQJO8DieTuEY5
	NXOsa0p2+4w59bL+iZM/9CrwKEQh9TY=
X-Google-Smtp-Source: AMsMyM62bmJacgTVukzvzSDnHQaeJJNsn6bLEaeIJgu1RHkuKWvqzkmvLvIlUeKqhQQJKMiYTjDyLQ==
X-Received: by 2002:a17:903:32d1:b0:183:71f:aff with SMTP id i17-20020a17090332d100b00183071f0affmr3017616plr.136.1665716859002;
        Thu, 13 Oct 2022 20:07:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.146.77.96])
        by smtp.gmail.com with ESMTPSA id ij4-20020a170902ab4400b0017f8edd3d8asm523443plb.177.2022.10.13.20.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 20:07:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc: misc interrupt and context tracking
Date: Fri, 14 Oct 2022 13:07:27 +1000
Message-Id: <20221014030729.2077151-1-npiggin@gmail.com>
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

These are several fixes for regressions and crash bugs. Since v1
I cut down the fixes to a minimum.

Thanks,
Nick

Nicholas Piggin (2):
  KVM: PPC: BookS PR-KVM and BookE do not support context tracking
  powerpc/64/interrupt: Prevent NMI PMI causing a dangerous warning

 arch/powerpc/kernel/exceptions-64e.S |  7 +++++++
 arch/powerpc/kernel/exceptions-64s.S |  7 +++++++
 arch/powerpc/kernel/interrupt.c      | 12 +++++++++---
 arch/powerpc/kvm/Kconfig             |  4 ++++
 4 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.37.2


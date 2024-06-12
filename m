Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA0904AF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:34:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JJPjlLqG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzZ3R6fwSz3gDf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JJPjlLqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYrB2WNHz3fsH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:26 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-6eab07ae82bso1552311a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169864; x=1718774664; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Bc9UTJvjHe4RlGMnD7m65uYeeccHrpEGPbkyj3pP6o=;
        b=JJPjlLqGurIG0ypaGfiV4irgcnk7ASlhAU+NZy3hvjTHWygz1HCjRT+lCOH+BeVIXS
         G3TP/1e5kLYROIiEyTWtv2wGCnLrJ+XNzUVpyh/M3adsMbbFBSr4pmn4Tqb9UFzxpsUk
         CxgITk5Fj+h2VnzXh9uQ50J+dATDfd+r0J09tAsxhNVVQM/kk5YVUNwvRjvfMmoJKJ7c
         rRahv1O6WFKHFJSSiwWJYmKRejYuYUOo6GrDU8KPAvrC9hUVZjcpFDFhFaJRIJwPRiJq
         1ldCOWHl4dah8km4GQkEP704d3lD7BZEClzN45d/963EN3vfgPGqlCAA4aMOVfhr3X5B
         CNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169864; x=1718774664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Bc9UTJvjHe4RlGMnD7m65uYeeccHrpEGPbkyj3pP6o=;
        b=UVg8I/+9JtS2k65A5ZJQndcARKLDT+j8pk6BxXvBOLR6OK86TeGeZnGAeCB/bHDq1I
         DirY/El+U9xQqgLUn5vYouEPn38ACAUf6BhRKISukc7O/Gp4mOPin8nUcF+rkfDeUAJs
         WJfBwbNSYcDkmo4ayZSjjjbD+fiTCW6SxbCtI7QAdxgPk+Hp8NXQ3NQexOFPsctic/n4
         sNRGCeLkzn9XaG86vi2CKYWcc85PbnzyClFJQmNMuukMt5NIT2zC/XtsAHi5VOxTm1G0
         sEtAi10xKpVY2/F5t9pVP3ujPCYbCb7+0GmsY3CcS38HYgkAvUDYsNtAE2lOu2GbXNrW
         8lpw==
X-Forwarded-Encrypted: i=1; AJvYcCWUCylOEmLdtHlwi5d0o26+S6jgBTUBbSGZ+AndEjOc7KJFW6+iarhrRWyQn4AmI8XwU/mfXEYTvMxiELUmqIWME/sPd0+NI4Gtq4XY1g==
X-Gm-Message-State: AOJu0Yzk5s+jp4IcOhn6i7x0HidU56+WbDADPmQq1HATJeQp9WQrSTcf
	OaytDOsXO8iVzjrfzF+HKZZ0ZlWTlFAdKqs3jYtPrmoepvFpq13O
X-Google-Smtp-Source: AGHT+IH9+Xd6lUiJ24ooIzSZ6C97JAO5455r4+dra0H8lUoyTuJiwIb7nGdiQKLtXGs25ppqqhR9FA==
X-Received: by 2002:a05:6a20:7489:b0:1b5:ba37:9dac with SMTP id adf61e73a8af0-1b8a9c50fa1mr1037167637.57.1718169864462;
        Tue, 11 Jun 2024 22:24:24 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:24:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 14/15] powerpc/gitlab-ci: Upgrade powerpc to Fedora 40
Date: Wed, 12 Jun 2024 15:23:19 +1000
Message-ID: <20240612052322.218726-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

QEMU has fixed a number of powerpc test fails in Fedora 40, so upgrade
to that image.

Other architectures seem to be okay with Fedora 40 except for x86-64,
which fails some xsave and realmode tests, so only change powerpc to
start with.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b5fc0cb7d..ffb3767ec 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -95,6 +95,7 @@ build-arm:
 
 build-ppc64be:
  extends: .outoftree_template
+ image: fedora:40
  script:
  - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
  - mkdir build
@@ -107,6 +108,7 @@ build-ppc64be:
 
 build-ppc64le:
  extends: .intree_template
+ image: fedora:40
  script:
  - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
-- 
2.45.1


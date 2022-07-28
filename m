Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD358379C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 05:35:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltbrm5lQDz3cdv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:35:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WopjFI8t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WopjFI8t;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtbqR5Jk0z2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 13:34:26 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id x1so697364plb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=v5iO3DJsdBPM2eAKiUQEswEd2u5joVshDOWMCkBSEWI=;
        b=WopjFI8tRQsKj7xA9eC0fUlEFtVpR2QGFKPdVL1gXuQFz/suaXcXYnPrqJhZyD/MgM
         xPzRiKv2v6pruqFlUGtoK/cL3gvLBxtKYOupZ8Hrp0fjirRR1Kxb6diOiS4CwhdCl36x
         hXl7jt3dOgauNq9ttRk/Pn2iJJ/gJ/7M/6uj4HKWYUwv/29yFPgeXIDCGeBQCerpJegW
         TlbRGpXiokQGKtPRQQX2ZH6VUz9uW3j5VQ3b35UNwQIBvCUIGTKbkzmmXFC+HJoQt3IY
         WKFQnNsLkQlJBU9i6/kRoPfhvR5PAJ0DyJOj33iB+6DYmkQ+m7//Ik9S+FeEXisYJe9J
         OkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=v5iO3DJsdBPM2eAKiUQEswEd2u5joVshDOWMCkBSEWI=;
        b=4q4sxedaTMhf8TwPaU+uHFwzIv5X9KnIHFUYIQjh8qpaK3k9Az+T8jx7MDsC59nBpJ
         K0p4cBU6buz6HNKDOzN4x1FIYIbJFa0FAX26ua5rt8P8HZJqw7HYNxaCcMBke7eI3q5t
         7ZXWQuC1E5kXDFuwAegMyv9Z/JpCJ8/r0jc/SCeFGVnBFW59BiJGXqBg/kFkdYkjQ/83
         M+u1EfjyGtT7PcS/pFefbKr0OFzcAWGoLGENjG7bZVp72nPUEDLoIByN/WpgAhgmGtw0
         LFetkZaYAbzeGIuOsbcT7fKZz/KVE8CyXBXY3WEBsYighl4w5eVBo1bbAQV6lsNOD8b9
         t3lA==
X-Gm-Message-State: AJIora8WW5f+rgTofrEAdwF888IkqdWUgq3WgFRSSfNNUuXPWJx1haoa
	76A9KDQXeVioKeVMUhS4aVc=
X-Google-Smtp-Source: AGRyM1vrkYDWEh+Q5CKXwHq6PQq+SAM34S/j5zh3ymhk2nd7NrnqZNL26drZbsS7S6b+1oQNZRzfMQ==
X-Received: by 2002:a17:902:ef46:b0:168:bac3:2fd4 with SMTP id e6-20020a170902ef4600b00168bac32fd4mr24230479plx.132.1658979261953;
        Wed, 27 Jul 2022 20:34:21 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090a7bc800b001f2ef3c7956sm2598035pjl.25.2022.07.27.20.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:34:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id E106D104A91; Thu, 28 Jul 2022 10:34:16 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH 0/3] Documentation: powerpc: documentation fixes for Documentation/powerpc/elf_hwcaps.rst
Date: Thu, 28 Jul 2022 10:33:30 +0700
Message-Id: <20220728033332.27836-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727220050.549db613@canb.auug.org.au>
References: <20220727220050.549db613@canb.auug.org.au>
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
Cc: Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After merging powerpc tree for linux-next integration testing, Stephen
Rothwell reported htmldocs warnings at [1]. Fix these with self-explanatory
fixes in the shortlog below.

[1]: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/

Bagas Sanjaya (3):
  Documentation: powerpc: fix indentation warnings
  Documentation: use different label names for each arch's
    elf_hwcaps.rst
  Documentation: powerpc: add elf_hwcaps to table of contents

 Documentation/arm64/elf_hwcaps.rst              |  2 +-
 Documentation/powerpc/elf_hwcaps.rst            | 17 +++++++----------
 Documentation/powerpc/index.rst                 |  1 +
 .../translations/zh_CN/arm64/elf_hwcaps.rst     |  2 +-
 .../translations/zh_TW/arm64/elf_hwcaps.rst     |  2 +-
 5 files changed, 11 insertions(+), 13 deletions(-)


base-commit: d6b551b8f90cc92c7d3c09cf38c748efe305ecb4
-- 
An old man doll... just what I always wanted! - Clara


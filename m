Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8257F1D0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 23:47:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lr0K03f4Qz3ds7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 07:47:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OPmBQpai;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OPmBQpai;
	dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lr0Gy50bkz3blV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 07:45:44 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id b11so1288220qvo.11
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcVZzfJ+oVu0k1iEEQRl2mGHqBWa1nplvzjefXrRdLM=;
        b=OPmBQpai3vdx4jYuouzIhgDeqIEDHLQVcEvh+SKKQwx0sGPPIlTTfANxYu9MHF8uH4
         1QKh4pARNf3ZANSP7V6NO8RPkWJj424PmSYMPEUV750OUipqQkO+gtJQe3qf6B6co6Ky
         3FgBlOtDfRtEFfeb48sXKby4xCShDTuIg5gEWNvuPMTNVV1dh1XgygKx6tqqGLjeivTt
         6yoFyaISjTnWk9QRnbZrYb0xetqYE4/JHo+V6H1IurDBNUp9NjJzrijjoz74bbd5uGF8
         /d8UCL4gXkfVvck+ZV+0xpxnxhg2AW86fzGxIcjZryPk/TVeukljQVYMi/DNycDfulnu
         J41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcVZzfJ+oVu0k1iEEQRl2mGHqBWa1nplvzjefXrRdLM=;
        b=xM9D+/OgsJNTYHI+ROGwlzAeGI4sIb+lb0R/igk+hPLosq2o0z2MRvpUUDdvGHBpX7
         Vbm1kjo+6v1FGJAwBxvzmWyUNG2/PvSCjb2hXjJKqvryuNzf7TH2bG0TqHNZW9u6Wi3c
         5FuiXtwwuKM41K9hnFJOFLIIT9lKaESjwQRvCtHfw4MpYXIS17oCG/ge5XybOjvFAqPS
         G4LujK8vzuXOysLXwOYoKBFDjVuFX1gxIHbzPE1SItbB2Vbb7o0U7JqP0dP9qYQxMYgw
         ioWcdPdhH7tWbWFNwL06RJj5unG7Uo1bC/S98EIxFk6WIAJMPGs9pUi562pnnM9iQR9P
         kIgQ==
X-Gm-Message-State: AJIora83ohlWQ241X8L7h18tN7szo9MfMxgNwdWhIJQ80nqH49jXZqyb
	19bQO/NSGpDBGEuA6BNtCJo=
X-Google-Smtp-Source: AGRyM1txzng5Pp4Y8H5Znxrrl1B8N010dErCoy1b89zNXR7dHZFuYAWpbWXl4mufK333Qf+M0FCPqQ==
X-Received: by 2002:ad4:594d:0:b0:474:4159:5551 with SMTP id eo13-20020ad4594d000000b0047441595551mr422603qvb.117.1658612740179;
        Sat, 23 Jul 2022 14:45:40 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:6235:40e3:a1d2:6281])
        by smtp.gmail.com with ESMTPSA id m6-20020a05620a290600b006b5c492aafesm6263257qkp.86.2022.07.23.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 14:45:39 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 0/2] lib/nodemask: inline wrappers around bitmap
Date: Sat, 23 Jul 2022 14:45:35 -0700
Message-Id: <20220723214537.2054208-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On top of git@github.com:/norov/linux.git bitmap-for-next.

There are just 2 functions in nodemask.c, both are thin wrappers around
bitmap API. 1st patch of this series drops dependency on <asm/machdep.h
for powerpc, which prevents from inlining those nodemask functions, and
2nd patch inlines them and drops nodemask.c.

Yury Norov (2):
  powerpc: drop dependency on <asm/machdep.h> in archrandom.h
  lib/nodemask: inline next_node_in() and node_random()

 MAINTAINERS                           |  1 -
 arch/powerpc/include/asm/archrandom.h |  9 +-------
 arch/powerpc/kernel/setup-common.c    | 11 ++++++++++
 include/linux/nodemask.h              | 27 +++++++++++++++++++-----
 lib/Makefile                          |  2 +-
 lib/nodemask.c                        | 30 ---------------------------
 6 files changed, 35 insertions(+), 45 deletions(-)
 delete mode 100644 lib/nodemask.c

-- 
2.34.1


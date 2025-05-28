Return-Path: <linuxppc-dev+bounces-8961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E27AC6153
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 07:43:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6dhg2dg9z2xHT;
	Wed, 28 May 2025 15:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748411011;
	cv=none; b=PLW5KghO3EXkFqOa+GyVdobhHL3o/otvlLNxvCClmXzQzGpD7TCpfaSNKVwZJkyzfgczMd4WxNkNdgxg3T9NXzlURb4P5f8x8d4rAgwnAHU+ymz0ls3RwO2VMZUGGLuBgRxTrhgzpbArg4lANgxht8ohiNHIzxMVQtY+h8+Z/f+Wc7GCJQYIylfeCfT7OpwjwqJevYNxXL7bSdyZ6+E1IuiDQF26BZWKfsOO/xCtgFV0HnosYActZkkb9KDvqJhDDTpn6LZUmV1CCqb5qCItLQnmuLys+Qt1SVb/JUW3GS5sdg6wbDtqpuR7kHaL0mAzNPLZ0g/MNClnXwUrKCh4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748411011; c=relaxed/relaxed;
	bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTR1fDdob9ofFLd9oS7lmOGs6ov9TcyhI+5oRelw7x/gMZPZRSRhIUF9LJFhPqz5o8QdSzMPhlukW3ZypdC81tkx0SGlov5K7Z2fDFY+NureHQlFSP5XreSpD34K3PZT0IYSrEVbX2woHCF/nIAa2YfzAoPwf2yulrbKcrbd9Zvgo5oEki/S9CnY6TV75ftqJwekMRd396MZJwdJFP6ByMParbB+FuLF4/fWExqTNY82Usgyja+3XYR+87wZuuvW/gDPgtx0hMBjysIHQjKQdv85sZqBVaGm7LDQH1GPqGgxkAKnDkWpiiL+wTYG4FwcUplMdasOo1j6b03mFNHspg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=CUtLACZG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org) smtp.mailfrom=brighamcampbell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=CUtLACZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=brighamcampbell.com (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6dhf11fFz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 15:43:29 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-86a55400913so88093439f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 22:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1748411007; x=1749015807; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=CUtLACZGIUOXUeSVcnU48Vd2PjPsl+f4gjq+vJp+fDRiGtH/aGDf/8RUhhOZ7ntKbd
         AUYwyoPzu4VGZjPXO56kraIfa4TodGQDd2wFz58Rv5fMrAplj2nCOh0btoRX+zO1KuQT
         5hyneqR9XpKNXqiUpbwa2xnHSi4qpCqP+w5wJgwKXHmleKDBocfIecqeK876yNA86+94
         WiVbFWj8nvpoRkxFxoB6w/Dsyu193dfD1kdJzr2rVYDVwP1ER7VX8A0kqV+XOlUVMSXa
         XU9CiS2xiHosAZaET+ppA0vL4ckXvXQ1m9As4UxmEVi4qMD95Ryk8xXoVsyeFzY1ZVKy
         yHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748411007; x=1749015807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=Pw50x2CY4+DIk+uyALZMfopYw0mVJ0WCf5ZWp8M014tCq5mJlB6pj0gWJsSLil6fwy
         R7MSoEdum7MAjq+Ac+/TisAoq4lzY2XejKXP5pdtzqhF3qVcHRMLUaZ7NRKrwadtz2XX
         J0TsqsJ0GTiyO756XLYXJGHOaemR3ogoZZeqAiqFQ+u6iTrc6kNtI46/dMlhmWg7wlAA
         sQRVg+BINYAkj9D+5cX/MCVUFE3xlkuLr3qgu+5Zu32Ox44hx2IHHadD7WP6XkzmrauL
         y1RmBZjAFlYPjsTyJPZrXb3Ay+b8CUvxo1Gj9QjCgKn/v5yRbVO9kkxo7C/GA9gvpngq
         GQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD7XxHZ3SiVi8nVoXbgX8UGMg9UDLL7Th7gkQwPBwelE94Mjj3y1/H3Hg8ZRy775rqAyLTTggGYZcjxpE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0JbUrdYzaHZzbjvY4QQuahGhL7IBhDtHHF0GvK1hxLXcSVjPY
	JJIcFqURRLoNlEZzgvkklPlJih73J3WrWTr+1caL5fRr0SCSbELERqxev5U5aHVGyck=
X-Gm-Gg: ASbGncvqxu+wa5va8l+Owfml6abilrI12jtyTUyzSmetGhYc1eXdq8Vq7+8vXtjAMBg
	dsg5epnt9w17BdMi3TQYpwlOpZD8FDwpSy2AuPUYfu11GXmJmmz+WsH8PFrJvdMs2YUbjStLnNt
	FyDAc6FLllUBV5cSTZZRPe0dDKnpfN4lPMzTogndXaXywc81+7xwMygPbeE/gf6yDRa5ZnQaG4m
	HyBY3TIoy8aQ9sAQPbRw3lflYTT873P1aDZpZMLgFmTladFnurfy5gXowQdOW/DEs5esmuLEX3a
	61fMLyiaS6Jad4k73UtjhFCtkosZJN6LKEZqQhGcsg7E+gBeA25Y4A+ZE+NL36QSoBGTpGuomCA
	A5di9jRY=
X-Google-Smtp-Source: AGHT+IF+v7eeJiqgx2CgLK57L91nnP+NaoqNBY3MrpJ58a87hZdHLPE/Eq+lD7S1GC6+xWdZO4pGrQ==
X-Received: by 2002:a05:6e02:1686:b0:3dd:869e:d1f0 with SMTP id e9e14a558f8ab-3dd869ed599mr37235695ab.9.1748411006513;
        Tue, 27 May 2025 22:43:26 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd8bfb2ec5sm1220685ab.1.2025.05.27.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:43:25 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
Date: Tue, 27 May 2025 23:41:47 -0600
Message-ID: <20250528054146.2658537-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix the following documentation build error, which was introduced when
Documentation/arch/powerpc/htm.rst was added to the repository without
any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
Changes in v3:
 - Edit commit message to conform better to de facto kernel development style.
 - No changes to the diff.

 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0



Return-Path: <linuxppc-dev+bounces-8907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F51AC18EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 02:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3QcN6Qf0z3cCM;
	Fri, 23 May 2025 10:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747959220;
	cv=none; b=RQRMWmqhKn6v06tIYZG2rAbozD4KgdA2kLFfiB2ytV4IFSPRsQ/ewqNE2Lpn7usOXJO4mBI5lgPbd/BpnfXJxRMM29499iz8iVtArv9tawYQPifehQVkeGh5+kjdgIKmNYfDxbNEcJl+rx7wT7a8QGgH+b2WhyKV6DzwN6i4xKQLdNiBklXw8+NP1QX64s80/qj/udUpa3Kp11b09+KVQZc6RHyNPRdIGd98+5xq90BuoKDZlTRvLYiodnSrGGaS4D93BCorbpyJUan24vi+awFX8JSkj+38jJwg7kAujFbk5pNJRYpOPQlx62+VTcDgEw2XSJKCEcxQpfAe12pXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747959220; c=relaxed/relaxed;
	bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYmN8VTO3nHEujWmsAsZw3veeKgQzjXEpf71GEqkGbSXkDwobI4wk+JMTDUCn6lX959Rgwnx1ZIjkbcEg31I8eSjCmfA5Az6nC79JoyKNpNoddf4YiqsqxxoVmdNZaL5J6JPGpc3HmT0QaFEApbUiXi7f5qJmceTnOdbe4kTE97h7bkfn6+o0RJXglsNEH0YekgwYW46Dxd8sLy7Q8bEfyfygsNNahfarP+vsDe+LLQ0zZrUjEB8se+4nUFNTeZ80yVNg0ra4weEucZ/Obn0kjB/ut0DHdSiNrzI8qzwW8/dBazcl6qaupbfQnSi3kcW89QnLWil75KZqVkcn6Ya2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; dkim=fail header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=F7VfHf9j reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org) smtp.mailfrom=brighamcampbell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=F7VfHf9j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=brighamcampbell.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3QcL2Mqkz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 10:13:37 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso22705545ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747959215; x=1748564015; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=F7VfHf9jvl2apn6zmUNvGpaXUTycSU0t5vbx1Z/Vhp0IoBS96ywd2YGXn5VGrj9Yjn
         bOizWRY19T+Yy1jJKgoEAD5HpCHKSNxHGoM4vbfo+TOCoN1Chka2uh+iFF0nttqaf+33
         pOGdHmyp0QuWVmd3toeil/nbofe29PpTGV8s5a1wEr+IA6UI4BQ+wgLXM7PoUnfgDJVA
         n3dSh68Mmg9m5YkPkOMohznCMEMjFlqtymO7GM19y3uQ9AA2Mp4hbFP5LCx/MyOsDwUX
         8eZA6H68E+5nkq59hS9k/dDkrSl3i4/uaxGlntLCGfjEgcU60RcJ0pA0G3jTWqj1EM1i
         LVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959215; x=1748564015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=e4VbkC/kTCJxjrTW6atpN0y/i3ROApOxPRdSjSMcijJFAQP2ng4W0AGYlhCUGhMyU+
         W7gd4HOke92navUFxKD4w/u7+wZTo/IcGSOgx6vHzGMMX7LjVMwzFEgo90m9BhHxjRYY
         RRCjs0csj5lXH5YaCyQhFpbr0cy5CEtkORojTl1xhRovrI/Pm4tslSqGVTH8yuz9bjtr
         933YI/4cJKKG9mLxbqpb11Ao1XS1WsYLMmSqci0jAkTAIrYqQ4tz9TPGRzZE0ATpbU7+
         bOKgwB2UZBzjRPskC3xx0xiPe60tad6c4TJOYcHR/cdoJ+1fTAN5JePtKDmD+Kyv+AJM
         +ysg==
X-Forwarded-Encrypted: i=1; AJvYcCWe0HApSsLZYpB+Br3uiJeaSrhtZoZZm6n21/3Sxeoikj2MiY3MzLvD7csRciNgwGtOcJJf+YDPlSazzw0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwN1o0KUK0Z1qC20DfLQ0rRumQQixdIdyoAFF7OHEOWxoXzE91
	dwkMsdnP4uaTM/U4s74otBtb8KtNDTcJ9MVtwPDzN1pj2UMd69VN+NT8PzLEVpq8FF0=
X-Gm-Gg: ASbGncsQ8Ce+qRUKmu5+IlLsbP4nyeMrweW9R31wH1DaE+hA9JtHfMj/70mABQN2hyy
	6b98CuRvdRpZRd99f8D+lsQzA8jsh/TwXsvspMDRZCNbVT37fAHkMYdSYGL545zXL82d/zWKFyP
	+rrxQv9hZoJoa69kHIqhQJW4UlnX3m4mzEWIJDZJ7E4XvqoBQHk/iYI+Q9g4HV+gGPtKdSevNnx
	02S4bohsGrRJJm5HMjs49pE6V1QiS+hTwo9Pi0jckmfIV9qduqodrAWoJlZxMIuUCPt94mf4RPf
	+iDAgtTOcT4gRFwk5QybfP9xJXkbGvxUfDq5UFjnE/FknqflcsF1yzc/ox3BSOtaZSvUV1Wqwfp
	g9NttN/s=
X-Google-Smtp-Source: AGHT+IFKmxDugOdIs6vFYcotQEFU7a9JdAs53jaauyO4yjTbDeTgs1+LUU9JZAtgqiOFD9DNicpN9Q==
X-Received: by 2002:a05:6e02:3c04:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3dc93276652mr13178285ab.12.1747959214980;
        Thu, 22 May 2025 17:13:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbd17aa848sm3183450173.67.2025.05.22.17.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:13:32 -0700 (PDT)
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
Subject: [PATCH v2] docs: powerpc: Add htm.rst to table of contents
Date: Thu, 22 May 2025 18:11:14 -0600
Message-ID: <20250523001112.102087-3-me@brighamcampbell.com>
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
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

There are no changes in v2. I'm resending this patch because I addressed
it to the wrong email for Shuah.

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
Link: https://lore.kernel.org/all/20250517210757.1076554-3-me@brighamcampbell.com
---
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



Return-Path: <linuxppc-dev+bounces-8634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD2DABACD4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 00:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0K3C3Ry5z2xqD;
	Sun, 18 May 2025 08:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747516254;
	cv=none; b=B8GSfYKMTbXJil+Cz/zwJLs0nLdA9XVAAu+WiV0lt5a2KfoW+Dkykna7xEsHKFY+uvyLaly2+8/1yBFVflrmGFnyUT4Qy6WY44nPoYR9mtRabUlua/ckTglL0SMh7RiGcehkLrHgaTolKBCv6pW2NnPMTsgR/DIiPRUSGHjBlpWDZ3pywUW2u37o1csrZtLFJBrSLdfsFxTP2S3uyPs4elTiObndULv+xqCEQ/oNRearqkHoT6dPzOo9/T/wFji0BIYeLjpnXyjuX1i/uhZKKPETqaBP9Ymg1uOE/F0R/AzFmtVJPVHqvh2wRlJpMBmzdOFkL5QGgdGz3qrya7mc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747516254; c=relaxed/relaxed;
	bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+pZftq9Q4JfReonqH3Tdz2eQ8EQrZvr5EE550ZnDo5NZEkEkcUv4lSQ2JbJHZ5VbhQ7wNdsH8eSbqpw8lRV5Wm+bzvEibPyBIYvFL//sozQiHw4Jbpu6B+7A3I2g40+sA+uYfhyWiIic/d7uo7PZBpuM6CTa0RhrQySTvd4dKi9z6UWJ7p4LK/+cQEg4K1H71h9ZKTTkiKNMq+OVA8ATOzuLQEHun9yoDTgufh5/TI9umSpGbe/XILSkRlmo12bulMhmPDX71iP1PICDHSc52AsP6kYo7O6B9JZ4Aby3ZbkIBX/7a3oUTvP+nJ/MFk4WiqxDRa/QCinVDsv3dwjJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; dkim=fail header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=FYfDCBqr reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org) smtp.mailfrom=brighamcampbell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=FYfDCBqr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=brighamcampbell.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0Gnm5NBGz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 07:10:51 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3da7d0d7d58so24202685ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747516249; x=1748121049; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=FYfDCBqrBqgDsYM7QNM7qYzfxLml/bNUvFQ4Vxk/ozdiKTWdRLu+OiepostYumSaFk
         7u6lWrQVbJuL5FSOpUc0KUvatnIb6OPGspd6qPuwW4psN5BWm9ItHEPzSDvModNfPO7X
         76EuAoZX7C4G30aw90BEjKZsKqJ170VPHBTRqv4MZQPwlZ/HnRVCj8v52c0rHeSwQl3l
         h39zRpUDRJ/rlgZGCSuJNiHYFWksSEsUy9r/cwnDm4A+JMysOMb9ivq7FfCXM1xEmsfY
         dOc9R6+vgREZRcLmSMoPkfO3X/wDS4/bm+KddaqBr0E4WNMzAwWv6Qqob5YpdU4nyQV1
         iPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747516249; x=1748121049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=udDCGbwJk1gNXUQOmBIAyXsRMTtJ3p9vkNg3lUQ3bC68vXlI9VBXqBLxAz9HYi+E/R
         s8oD/aGnTuYgQsrtP8bk1FybGQSf2oQTDxD2lf3Uc2gW6rW539cY0iJtzpIq/bscY9Fm
         xhDv6Pny1IoXGgeIRN/njIEuW5BmXKhALBzHAs5Fa+FREiRdU+xc/LYrJ6A+2MVUC+Ab
         UZEgbNg8Y4boMe0Kvu5CIkIzC7CZC9aNF3nEM9P4IutUcuioBtmrQf87o9naHpibfMkM
         E+USsMqyPFfXL3SD8dFcuuYkHl027OJ4DOLIrtkU765MQBEdYVRuH2wjraXH8jl96hlo
         qSYA==
X-Forwarded-Encrypted: i=1; AJvYcCWK4M6nB8vschGQYtYFb2sOo91eijNdNCjBEtFONX7+ySSH+fdYg+WJ87Mqo55FAUcJwAFB/OHAPImgszc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlKaWkYn0CA470ZtEp/m142gI4lUXHHmASAttQX3ehPSl/ANJ2
	bTn+DkfGu2q5fwUn/YxoZEkbowK1YsDPIH1XmwhvkieErxHNEQejmMvPFLUqG/UFquM=
X-Gm-Gg: ASbGncu8+9HkTUTR8hxinGcn2lsFvFmFgzBtgUf/TCV3XnYENgVP+KbEonBR1tRmA+J
	xxxQ4T5KUSewvtrOOP3wFEFVnOX8zt3YvdvGv3jMBw/Z96mMhda34eYOrp7E3pkv2JNMXrAg9sn
	96iaAt4eoN11ZTNwgOP+JSjdB0zc/U72/gt5NqtmWaL7JTwLXOn0TVuSbxVGitDrVOHMucAdf1m
	8Yq9qRFh+QJG4DhwlljBj7zHdGNrVz6ywuv36saTVArGtzGKL7Zv5YmRt1dYcioV6KKhxZ5gC/L
	ZQ1243hMHehNHUj89EP1tLV1wxEmc4CCj5H8KjENgoQNqsAj1Ai7kwMi90QFEocd/kJr8Tzsvbl
	4HMIQJTQ=
X-Google-Smtp-Source: AGHT+IHO8vmPZ9wtEiIB3JiDHbb2n/QkwioIBKsC0rUUGe/Wln0nL1EQukSNTPuRfRNcvEViMy2SvA==
X-Received: by 2002:a05:6e02:1c02:b0:3d9:66ba:1ad2 with SMTP id e9e14a558f8ab-3db8569e88bmr68385155ab.0.1747516248818;
        Sat, 17 May 2025 14:10:48 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843e07b8sm11777445ab.20.2025.05.17.14.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 14:10:47 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] docs: powerpc: Add htm.rst to table of contents
Date: Sat, 17 May 2025 15:07:59 -0600
Message-ID: <20250517210757.1076554-3-me@brighamcampbell.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
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



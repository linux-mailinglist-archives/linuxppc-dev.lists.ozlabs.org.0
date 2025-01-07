Return-Path: <linuxppc-dev+bounces-4773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC058A03FA4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9nV2JbBz3bN8;
	Tue,  7 Jan 2025 23:47:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736254078;
	cv=none; b=RDWNAonDUxcruTxLvIVJlMh8XEX0XTFIwh/22485+A9NbAdUdQ+IA/cshjMsVCp36h7LVkFRTb8dNflDo12Z/BjuEgP/Okk/mxomiFjl9xeNktm3d3yOG0bJrfmVCzKzi+RFbsbDkanILo1xKNstaVbnvLr5NIrwE3U8Ovx/nnmEYm8vBJwMUYhhnowJPFCl9nJ69WxFKiTDY7J9si9WiC+qybcAe957IKs206aL3xu5jVIbYk4P+SxxbUQZyoCzLHJBKjlPjK0jIvV489nNu/+GlQ0ns/KNk8BSM+xIE6eiH71IEsi48BE01ZPpv+7OWG1SNyMv2WQquyrqNshi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736254078; c=relaxed/relaxed;
	bh=opIuyGFUTzWuwcM2pYQXlXkOFxHji1aKoxh7XPTxYrQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ffwpMG/8ge8LboxdLGzchZFZvRRHA7nGnXmIaWkTA4OaApgBlSZAnnXEzazZUcXRqbBfplCrhyYNz/1TiK37eYxsP+ZEcTfg7hRk4lCu/P0d6pcia30VTKx3L0LzlUqd5DInfBqtxbH096EJonU2bqSFQSUb+L7Rjq2eKRsRAO7YIdXr24ZWPRBXkmvu6j5UcZmjxExCr/kMhAczGYQYSlxiIknhv5oe8hvlOTZ2/Z7SpEZHsgxStWvoBUWTle5RgYTxZL6Oi2RvNLFzvB9JJXHwLnX/gjqC98Kfd+YbKVGsESH9oRxv3vf4u2lBNuqQKu0ZRCcEY46a9tfuvTh25g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iUNMy+Tf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iUNMy+Tf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9nS4Vpmz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:47:55 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21a7ed0155cso5704785ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736254073; x=1736858873; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opIuyGFUTzWuwcM2pYQXlXkOFxHji1aKoxh7XPTxYrQ=;
        b=iUNMy+Tfyplpe5OHr9YoWBDyLRFKc2AwjjduAGwNQO+fvRLz3KHn/i6UhQmOTolsdA
         10IQ64LLzUUb/PYTMlpDabQfTGhDOKxS2Xzq/lVodx1xkT4K0pfFWdW1I8GS7pzB5psW
         uwYM5H/PbQaWy+ad/AWC2SiLkMd9ujr/cqyZ5O8mvDnCyFh4m1raXqhzEeY04OTWuK8z
         Gt972O029qIMs5Z0RtKDAm3inI5hbNq2APBR6GoWa3uRX7ybl4sAcImTFhgm+LyTwkx5
         YEaWK1b4m4/YPp4Ulp/six+bAr0S+pG/3QZQ4hYCboltWwgegyqUEGgzZ0insQGfY7ZD
         /xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254073; x=1736858873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opIuyGFUTzWuwcM2pYQXlXkOFxHji1aKoxh7XPTxYrQ=;
        b=PtA+ti3tihRYG8jPcCsLWHc0NeB/TitUk0IObgG2CeUpXUsEWf82kjI4lGlbZE3ztR
         8uVpSLXi13yRiOwBIuj7ZCJjBX5L9fnBuGgPGAOxOVr/PmMmxt8UJLV26nB4QlpgRMax
         pyed/3JAmgGLkeMNC9Dt84aFM9QuvBVW9MyVE1Xms/8FHMF6S35OMJwICy3lMKT32k2y
         DCFJOFO66wccxlCtmq2aNiAry7D8HbiCmLcLW9BatEKuP7Y/28WMrFGYpCen7ezBZPxp
         XFx9aVjVX8czV4OYFocCKAClyw9DtN0is+QvOts1buKRqfeRVm7uNRXSMbsXc0HFY8Pa
         0XfA==
X-Forwarded-Encrypted: i=1; AJvYcCWRKzYZ+Kf7mMzYgkJ+vW972niemvVKiC0CnaFllwzeoHyz09T5kpeuE/eN67niOk6aiPG+teoF6nhGydY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFvZ5cXsuXesAvJBQUptLnJqXCabKNCTMGGpPVrTC8CgADCpt+
	I3YC7nkuh8LlJ45cG39xRm85HuYgF+rVxyBPeBsq+QJzN576li99jUbCzwcWvOA=
X-Gm-Gg: ASbGncuLyqGFKp1S0x20pQ0WFTj1Y76US7yC/9YgJNAseLU7EOzO2sqPvsnkX3/mpUY
	njzbnHAyDlDDnWXaOeeWRH336Lj34bRY465xDSv3mNAzeGLob65b7AJlSusD9VHTPVi81/SpXSd
	C8EC/3ahW6NDV0TNPvbvMX3PXHToqdf3lBFCXQO37vuPnp08HRcCA1mUNl5EOn70hpEAxd7n9Mu
	TY09zIU8/MwmKwJZMe8jfmV3rSJAxBfknp+UgyiUrziz1yfk9bEE6U3P8A=
X-Google-Smtp-Source: AGHT+IH/TI3sUb6l2+b2WaTSh1evq6vZuS5S4szn4UoWwy5hsMxR0UzHoKY9BZVjFfB8co0JCgCCAg==
X-Received: by 2002:a17:903:11d2:b0:216:2f91:92c7 with SMTP id d9443c01a7336-219e6e89278mr972540505ad.12.1736254072686;
        Tue, 07 Jan 2025 04:47:52 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc972b0dsm309970895ad.112.2025.01.07.04.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:47:52 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 0/6] elf: Define note name macros
Date: Tue, 07 Jan 2025 21:45:51 +0900
Message-Id: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8hfWcC/1WMwQ7CIBAFf6XhLGZZwIon/8N4aGFrSbQYMKRN0
 3+XVj14nJc3M7NE0VNip2pmkbJPPgwF5K5itm+GG3HvCjMEVAIFcLp3vD0CNdIoY6Vh5fmM1Pl
 xq1yuhXufXiFOWzSLdf36qDc/Cy54bcgokBqchrNrpsGPexsebA1k/EkaBKiPhBx4XTuLBAfXK
 vqTlmV5A7A3TXfMAAAA
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

elf.h had a comment saying:
> Notes used in ET_CORE. Architectures export some of the arch register
> sets using the corresponding note types via the PTRACE_GETREGSET and
> PTRACE_SETREGSET requests.
> The note name for these types is "LINUX", except NT_PRFPREG that is
> named "CORE".

However, NT_PRSTATUS is also named "CORE". It is also unclear what
"these types" refers to.

To fix these problems, define a name for each note type. The added
definitions are macros so the kernel and userspace can directly refer to
them.

For userspace program developers
---------------------------------------------------
While the main purpose of new macros is documentation, they are also
hoped to be useful for userspace programs. Please check patch
"elf: Define note name macros" and if you have a suggestion to make it
more convenient for you, please share.

I added the Binutils mailing list to the CC as it contains code to parse
dumps. I'm also planning to share this series on LLVM Discourse.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v3:
- Added patch "s390/crash: Use note name macros".
- Changed to interleave note name and type macros.
- Described NN_ and NT_ macros.
- Link to v2: https://lore.kernel.org/r/20250104-elf-v2-0-77dc2e06db4e@daynix.com

Changes in v2:
- Added a macro definition for each note type instead of trying to
  describe in a comment.
- Link to v1: https://lore.kernel.org/r/20241225-elf-v1-1-79e940350d50@daynix.com

---
Akihiko Odaki (6):
      elf: Define note name macros
      binfmt_elf: Use note name macros
      powwerpc: Use note name macros
      crash: Use note name macros
      s390/crash: Use note name macros
      crash: Remove KEXEC_CORE_NOTE_NAME

 arch/powerpc/kernel/fadump.c               |  2 +-
 arch/powerpc/platforms/powernv/opal-core.c |  8 +--
 arch/s390/kernel/crash_dump.c              | 62 ++++++++-------------
 fs/binfmt_elf.c                            | 21 ++++----
 fs/binfmt_elf_fdpic.c                      |  8 +--
 fs/proc/kcore.c                            | 12 ++---
 include/linux/kexec.h                      |  2 -
 include/linux/vmcore_info.h                |  3 +-
 include/uapi/linux/elf.h                   | 86 ++++++++++++++++++++++++++++--
 kernel/crash_core.c                        |  2 +-
 10 files changed, 133 insertions(+), 73 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241210-elf-b80ea3949c39

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>



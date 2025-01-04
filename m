Return-Path: <linuxppc-dev+bounces-4665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C201A0177D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 01:26:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQdR63hg6z2xxx;
	Sun,  5 Jan 2025 11:26:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736001532;
	cv=none; b=UwMjUkcexhLWI8vPQTMjuLfu23Ee1uhZhFMRbfIq0HBKgvKReLAazMoujuokb5L/tdI0nuOXc8USUFkdN6MJO46xgMebNWf8v1Vowfb7dgDulq2L0kfYIvkWb4kxiKFDaUi8pmCH7p+9QQH45lP9WPViLgHve6iwqZEW4MnCUXNqyyKgjd1HFeFgeodivheUr0LKFLULooaRXGUthLILlxZ7HmQXS/3eT8Limmphzj6N2MNWIV9xx/wZxJrRdGPLdOghovyjcSvIG87GSTsWcEOgT/6kCmGJp2UcsT3WoY37tWXL76MqCLvrZfDFrhwVZFtgIApPbaUp1kuAv21FWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736001532; c=relaxed/relaxed;
	bh=BKNiV3QEEiOj1Le3vlBLmpRmhzkmvu5zT7BlJh3wiAc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XiDnV3V9eLfNKV/ZRuPaSRoootQtySbJFJCNGxkROxEhkT2ZLW/geOdzMmhQaM8jxYUzqZSqOX4gQ8Wc7AB/kzNbzQMGqfHgECUzCdp64gzWsti/7i33jG9ECO40hFm3bbCgmNLJJxlN3HXr2Y6pSyhB2+Gi1wFGXJuq7lVGX4Vxnf6XIZnzBWVssbKC5v67szCxRVOpUjxo3mU+7l/TDNoz+FS6Q0mLqz0YoGJMyku00kFDRX4jCQKsM5OzW/S4gdPI+GIV84x1RmFJYWmmLqRWBCnVK2lDlhq5YH86/ey4hJHdOOMT0JyQduMOCLmndYDsHWORqpisnnYt6xu72g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=H8HuNsz5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=H8HuNsz5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNNp0Rs7z2y33
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:38:48 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216401de828so172351085ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jan 2025 06:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736001523; x=1736606323; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKNiV3QEEiOj1Le3vlBLmpRmhzkmvu5zT7BlJh3wiAc=;
        b=H8HuNsz5WXdhb6W/UozYONA43/ZRcZHKoP2n0ZGnZwa1au/VSixGpGWF0zsJVxkyya
         cgS0m509IEurKNK/HG9nl+siWoF68Qx7hZMVgYblvGaSU66iffiXSTPmfOzIX1YafVso
         gKM1NgvLJCjGmXMQmSIdvipxNzr0KKMBBeK3X+NWXMN9z9SMrhTm5glZsS2vdEiEUWYI
         O1gzuWhbT37jpGGpBibDMHEJKB2LLECogr+SpDpeeGTUnpe/sWAjMeEpBQeLA8+qQQw+
         jKZjZVXNtRAMBqAFllXaLA8LAhZG22chBsAK2A5RvpGl2oyRnQSKbFyYBzrSU3msDwN9
         mB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736001523; x=1736606323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKNiV3QEEiOj1Le3vlBLmpRmhzkmvu5zT7BlJh3wiAc=;
        b=Qh7RH+D59yXwI+PHyDCv0BTPAyUvysvDhq8JKEZ81QhTWzppQZHhwVaTXRI9Vo58JY
         vdwzSH3xiIlkhRCnBB2HQoKeCv7+vaqLp1sZlhr/OBUuX9TXB6lSQphUjGtg1ZZ6N3gI
         tx+TP20CTpPuqfP12LQ1v7fGDaUAVJwTcjOLr8LXfOzvS+yVK8qavVZdFMcCm23wM0ep
         t3raPdSq8FvfWJ6Cy50Kv30lsCnQmda4o4e3wqbT0Dc7sKzh/UG5AnhX6v5UE+XzmOjz
         Ors9vV8nf+GfSpxopc8e3mYfC6Lw1iC/eMf3q/8pqZFbIntUyQYH6530NeobCwQ9lbc4
         k0zQ==
X-Forwarded-Encrypted: i=1; AJvYcCULqNQGQIF9Try5ysvavG48vEDxkgVTRMKU2HOlfyNJBbT50UL1teZPtDxOXO0dMP0Pvpbipqnhy7bbFGY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdNpqrRGhv5rlsSCF3RGji8wgYsFFhaJaOImt87Cjn2t9ioQ7F
	A8Jqa5GWpQe3U0d6FOPtvYwtdOPfm1x7KxGkKYU2uc82kGXSUeuHtDwGAJW4Dd4=
X-Gm-Gg: ASbGncuUOjQHS3HS3SSZPxqgEvlEEBb3PTmIDaQjAn4pv5oKtaig7Q3drkMO00uCSMG
	dmetDgYPDhb3O5Jz/Wm/8LjFklx7m+uq0CSEsZkYpuCbPIa/VypURgcMFIDOG6rYuFlx2s2ybor
	IYEfD8pe0OXcBdNWBi0QXGO9Pois1ocIyAfC7Gn/IZk2BbdiwC0WNuEqEKd1lPeGzhwTAFDlYcA
	hqb6gb5GBY8j63qkVbkC3ZigVuui9qMtWu7kDOew4td7UsCgA9m02Y0J8D/vD4=
X-Google-Smtp-Source: AGHT+IHMKqIuk9Mp4P+qfjslbof1yC0x6Ct9CbXfed2Znwm+wkFLa5rTAL+cuIXWXtg5bkhTzZKJyg==
X-Received: by 2002:a17:903:2286:b0:215:b087:5d62 with SMTP id d9443c01a7336-219e6f1483fmr809248225ad.36.1736001522852;
        Sat, 04 Jan 2025 06:38:42 -0800 (PST)
Received: from localhost ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc97182dsm261833855ad.82.2025.01.04.06.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 06:38:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/5] elf: Define note name macros
Date: Sat, 04 Jan 2025 23:38:33 +0900
Message-Id: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
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
X-B4-Tracking: v=1; b=H4sIAOlHeWcC/y2MywrCMBBFf6XM2kieaFz5H9JFTKZ2QFNJJLSU/
 LsxuDyXe84OGRNhhsuwQ8JCmZbYQB4G8LOLD2QUGoPkUgspOMPnxO5njk5Zbb2y0J7vhBOtvXI
 bG8+UP0vaerSI3/r3pel+EUywk0WruTI8GH4Nbou0Hv3ygrHW+gVYO/OllwAAAA==
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, devel@daynix.com, 
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Added a macro definition for each note type instead of trying to
  describe in a comment.
- Link to v1: https://lore.kernel.org/r/20241225-elf-v1-1-79e940350d50@daynix.com

---
Akihiko Odaki (5):
      elf: Define note name macros
      binfmt_elf: Use note name macros
      powwerpc: Use note name macros
      crash: Use note name macros
      crash: Remove KEXEC_CORE_NOTE_NAME

 arch/powerpc/kernel/fadump.c               |  2 +-
 arch/powerpc/platforms/powernv/opal-core.c |  8 +--
 arch/s390/kernel/crash_dump.c              |  2 +-
 fs/binfmt_elf.c                            | 21 ++++----
 fs/binfmt_elf_fdpic.c                      |  8 +--
 fs/proc/kcore.c                            | 12 ++---
 include/linux/kexec.h                      |  2 -
 include/linux/vmcore_info.h                |  3 +-
 include/uapi/linux/elf.h                   | 86 ++++++++++++++++++++++++++++--
 kernel/crash_core.c                        |  2 +-
 10 files changed, 111 insertions(+), 35 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241210-elf-b80ea3949c39

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>



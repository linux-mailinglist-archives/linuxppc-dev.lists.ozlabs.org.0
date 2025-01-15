Return-Path: <linuxppc-dev+bounces-5275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF86A11938
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:48:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXw606Slcz3bW3;
	Wed, 15 Jan 2025 16:48:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736920120;
	cv=none; b=Ak9bKm2utnPmgvb0Lk9ckG2wHMiIIZI/0Ys32v9JYFzGfqFFARixxt2DROkqG2aIDAN7vHZmoc9SlNmGVW5JWMtKbBEmdPjFm2CSEYNqPFkqklT3VWeUWFywqci4l9MQ1Lg5Cp2qAeU1QIbvAfsPNbgoW2INA2ulg2/u57M+GNEOcUiUIZzJ4t1mGLpD9LWMYXeE9FmfePhoiikQPIz3q+C/eZr6JZhV/9Aeb3ecshwYmx//BWsxVUA3g84Uyx8kC8hD/FkRFE+2lh3RzNVFV8QOMbKYChqI6+oI8W+hk2WSkCqfOysG3tMal1xlmJQmE6J6xi/Bteg8pGOjOLYF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736920120; c=relaxed/relaxed;
	bh=Akn62yShjkzTVW+wH6ehtLyqM9iw3YLFKJEmmviG+rI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aGagxo6xkvt9xAaDWcYxr+QxlNhuiFilKTHr+3hOUxzFQ73ADJo0TOj3QWY9/qo2PH2YKOyhvosPS5wLYBWeqcY7MxQ/Lbm7JORbmymVSqyzbg4kQNB8hf4nane+UBRqscbCm3RiGxdhDmwDLwYNuxLKty4d9qMA4uwprt7pUKAVcRqYYRyv1xTJmMxuM2dK031HCBtDxDJ7J6/VYDY+EhHQCRM7VwR57hDDUPzpfKCvk8PddTrkRzwd7aCr6kMjlgr4f953z0KoSrWYTukzNPoNW8VaCuoouMWrkiTBM036fcxrIVkvu964wt+K9oVl8OXIWfgzl3VqGYUa3IN+tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ip77rQ5G; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ip77rQ5G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXw5z4Jf5z3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:48:38 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso8337726a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736920116; x=1737524916; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Akn62yShjkzTVW+wH6ehtLyqM9iw3YLFKJEmmviG+rI=;
        b=Ip77rQ5GKJ2LgibNXYTiH4xaJzzZIlvL5Moz9H0exqoTn3fQEBJ4vBCznzfy9jDQK2
         ftqdef4Gyp1d2fKVzB/altV/EN5yADOcnPmIXw9n/40egA/5kSW+yi4y3Sb4hjO/syz3
         dqFMq2upPWjbll4lZzDt1IjXqaRwRKihoFolDpDJPlsD6yA5bH2Bx9Ijdx5fqcdhEvbX
         LeGcOSEBq5siz2ey6rMcpfmzo45eOxyc2JGFQpt9E6ma2PfQfyrcmxahjM8xrBWFPhM4
         SV9hmzG5eH/9ZhwHjmtdTY0ND4LpXfAlRGUk+xA9qLZKkw6EgKRLcA1ThsOVfQwiTGn1
         VqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920116; x=1737524916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Akn62yShjkzTVW+wH6ehtLyqM9iw3YLFKJEmmviG+rI=;
        b=cmbnigl6m+nOBUQQ7ZfLD4RQHLdJOmkQvLIFpPVnwAoV2r89le27V1YkXGCG2UtTg9
         8y4ggNRVdQ0PG3rpzlfhW4zM4s8/ytsdnz17w5GpLIdM8ir5f59vppPwyrM7zyMrKWNN
         qPh+nHIHlk4tiy0+aY4FfyjVZMlksaEWGt1f0/fqQCbt4wf9t62sTMfclZnsy8awgJGz
         Zq/tNQnv+QUNsgFK4OpDgVHfEz94oT37KTxdg10pQly9Fs9eeH1zTz9UFnK0T3Hy05Ii
         oEGWYmUpisuvASJ1NkKq/TfaoXL6fjACboTSq4aDBGhDJOaWuuP3/bebIpK3un/qHJ5w
         B9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXLVIXns3DEeJJei8L+O/B8oBC0E5gt8w5oAY5Enb4eH4qLzXvCJT8PHVxYRXeoOMWlG50v59hAUI8PEVY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRcjKYbiFtZXwNS2J+9mplkylB4Kss3jAVQf0wX8+P//eGok4L
	8pbwenqacCIsEl4n7WIUq0eaQFRdqkLygbfjRDwjRSK2oxBfKHmAuZk9jSyjgQw=
X-Gm-Gg: ASbGncsN8FAgu4UNdy70iFRTn40ZTyhXDk1Ko9GmuOE4/EbE4thnWzO56hImUil2SiX
	Kx8hPRcGZYq/hRxXg8DFBmyHUxHY5s4Ehgnon/Y+jdnGIlmRuVfy87nmscbhMl676slWA0/K20B
	bcn8Qc0cujDT3SAGFmrC7H6N5vKa//d84KOk3tTrvEdw8YyU25JnK01DykrgnoDdeY8ANKzJyI2
	EUUimvZZiJLvq2dXurDOvGDqm3oIdVRWcvCMFvINH/dGAAoJoJdlzvwm5o=
X-Google-Smtp-Source: AGHT+IGTAFr6fQ9a6YArcK/8amGmkIoCg+M7qyB/EhAZVK1D/0q1h57yniAmS1nzzXQhV2aOnFsX2A==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:bbd8:2b9d with SMTP id 98e67ed59e1d1-2f548f75de6mr34075229a91.34.1736920116365;
        Tue, 14 Jan 2025 21:48:36 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f72c1cb28csm504577a91.21.2025.01.14.21.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 21:48:35 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 0/6] elf: Define note name macros
Date: Wed, 15 Jan 2025 14:47:57 +0900
Message-Id: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
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
X-B4-Tracking: v=1; b=H4sIAA1Mh2cC/2XMyw6CMBCF4VchXVsz04tYV76HcdHLoE0UDBgCI
 by7BTTBsDyT+f6BNVRHatgpG1hNbWxiVaahdxnzd1veiMeQNhMgFAoETo+CuyOQlUYZLw1Ln6+
 aitjNlcs17Xts3lXdz9EWp+vXCz37Fjny3JBRIDUEDedg+zJ2e1892RRoxQ9pQFALEhx4ngcvC
 A7BKdoguUb5gmRCxninQTu0TmyQWiHEBamEnDwqLCwEH8wfGsfxA3RS27E2AQAA
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Heiko Carstens <hca@linux.ibm.com>
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
Changes in v5:
- Noted that patch "elf: Define note name macros" allows removing
  duplicate definitions of note names.
- Reordered NT_GNU_PROPERTY_TYPE_0 to precede notes used in ET_CORE to
  show its not specific to ET_CORE.
- Link to v4: https://lore.kernel.org/r/20250111-elf-v4-0-b3841fa0dcd9@daynix.com

Changes in v4:
- s/powwerpc/powerpc/
- s/NT_INIT/nt_init/g s/NT_SIZE/nt_size/g
- Removed parentheses that have little value.
- Fixed the code alignment in get_cpu_elf_notes_size().
- Link to v3: https://lore.kernel.org/r/20250107-elf-v3-0-99cb505b1ab2@daynix.com

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
      powerpc: Use note name macros
      crash: Use note name macros
      s390/crash: Use note name macros
      crash: Remove KEXEC_CORE_NOTE_NAME

 arch/powerpc/kernel/fadump.c               |  2 +-
 arch/powerpc/platforms/powernv/opal-core.c |  8 +--
 arch/s390/kernel/crash_dump.c              | 62 ++++++++-------------
 fs/binfmt_elf.c                            | 21 ++++---
 fs/binfmt_elf_fdpic.c                      |  8 +--
 fs/proc/kcore.c                            | 12 ++--
 include/linux/kexec.h                      |  2 -
 include/linux/vmcore_info.h                |  3 +-
 include/uapi/linux/elf.h                   | 89 ++++++++++++++++++++++++++++--
 kernel/crash_core.c                        |  2 +-
 10 files changed, 134 insertions(+), 75 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241210-elf-b80ea3949c39

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>



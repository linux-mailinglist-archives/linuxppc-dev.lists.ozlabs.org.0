Return-Path: <linuxppc-dev+bounces-5068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46675A0A115
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJK2hYMz3cjS;
	Sat, 11 Jan 2025 16:49:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574545;
	cv=none; b=GRpKup4R/J9P6pLhdqvca7g7TRt6XRxoj7onxR7Aw4APPyrrsUTj+jB3Utjd59DfoJzgZLdDGDCrDn5dYvZ7c1krBS8T5tatHNd4l6vAD7KgFFRWLc/pfkCLM2Jc6pgg9KBdSZwm9MAMX2gzUExIIOilvqHIYp8e36srMJ6LclZsXhTo0me/opeNRcWBwKeLln1JcCrKc16pATgNxBumkgIizldM8ImJNrUuY7ClAOg+QqxxFOR9r/xUU5lBLDZZnC9liuOj01L0p79iVrGBGrfPb4LBRIE0JoSvhTiZDfEZ2R1ujiliTJ6Dt4KzzLtgCL1B8Ti9qpybe5mkY8luRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574545; c=relaxed/relaxed;
	bh=3P73rJyuNl3Q0nwSoWVJRyshylUCVEtly88Ev7msAUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lPQWmMWpAY0XTrMzKO5RBu2WB+vgKFLZVwlIjf8Ipz8n43Ac7IAEb/BaT2wwlWJBkYaJeywcAwLj3y9TlM8LPprSU+BGrYbgsoJIrkdoAjC3BcS7uffcyjYT+O5xtnksELnMzB8zAX3vvxXVZlaRTIR26h6FAdZ4ed4EGnfvqLQerpwpUfncq5w0U10Z7NdKbwmKZrwLBNILSeQDxq8GfXtVSbbhjWyu8kMDEg9uQABSHt9IKuxLM1UrNzkebqdAqc+Hcjd2MCZfCIXgZpUNYtXZF9Qj3p5q7VF0Y5W2oq6BqWZClPdL+yZf75txwa0UBh8tWp7fSDSgjtgqQRhcrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=G7NNc3j9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=G7NNc3j9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJH3yQtz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:01 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so3532894a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574534; x=1737179334; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3P73rJyuNl3Q0nwSoWVJRyshylUCVEtly88Ev7msAUs=;
        b=G7NNc3j9H6ioyBkIfY9yDcPrmcePbw8ZJjrJ6ZLbqFubEIwhvG4c5uRCH5xLnBJCSS
         9QHEuCARxR4uDoQBJu43FOd3T8xl7OgwzwpGeTFYWFNUb423OkPR32Nih2wfiKel2Ap5
         OHsdBMZXeiIGdtdVpZarHj1pbwXizKMPbYzZdiazUps1XAQzTFqGPwPQMbOt8bNmVBn/
         WlMyVe2w5cfw8lTXveaTfKwwwOVkE8SoC3ZiQbW0yEPPM1thg4wuyDj/LSfIBlYSbhBs
         gXwlXmHZaQFFWZlgcHeoPoKzMmfFo+RvmaSYsGOIzY1wMYUXg711vGS7tR0whY0puKix
         A6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574534; x=1737179334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P73rJyuNl3Q0nwSoWVJRyshylUCVEtly88Ev7msAUs=;
        b=OqF3zfKBVxIwSCPJqvS23SahQ7jm1LTWtoYOCY/e8g4XyiNpA3ZofCix+jyzBrb9QB
         W1ljnC6ZMFXoyCyhbB21qUJLA/foK1KxZ7oF7EFSsBeD22Vb/PEakQBLICntiTtSMBi1
         8oWJwhMH0x++2kRgC3afRaihxbhfjtsUD80Z/Fc1oUmfvwuY5bldMix98Luq+DR619Qk
         c+lZgHAi4K0lAXobvp9cw6L4IVDLj07lzBdYTZq8RYjNECJvdvnaASCFjAEeV7qr31JI
         9GfJlYYpODJjXjonUJ5TaDTpp1qATJ5dPw6LspyUvNLdnmgPyShA5UFB45043yM6m2iq
         vMlg==
X-Forwarded-Encrypted: i=1; AJvYcCXDlLGwtJB1dsNyeLbukDuB6A21wyXQkhBSk3GG8UpbzooCmYBt03h7Aa7LBBQYNpLzjGwcPZGUvSXC/rk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzN4vKPQixDa8h7WlQtAfiri1OT57bPaAge9P45Kry/c6GY4AN
	uyaAkdVlwx8oabnsh3gjHgGO0VTIH7RaK36mtmsDqYbB5y/hfIvqpMPXrJRoef4=
X-Gm-Gg: ASbGncu0YayXvz1cyvIBT5iYMXZjuZYXtO70A84kYHRaMe07YyOFKv0q7A1g7Y1Ukw1
	fEI21utKmMhhP058mSL6EiuqyyN87sgjfx/8jX/qjpYsAoO35GFKDKnFoKLtzXTFZUNLKGK5AR4
	LlEV0Zi7syTCUC5H3i76NQkyxknNk5psbFVNd7aE12FaE8ePgD8aK7rK35mgkuuzP6UUNl3DctN
	5zV9ItDlbk6vsrfHdD+IIlMnZYCHgi8lB25zdKMKlmrzFBP595nLxIPE4M=
X-Google-Smtp-Source: AGHT+IHnxhywBj4CVIR5TvzIlJFphpilQTNTWugzFhTp+kcciB5abGLTfjWrtU8KJEUcfzvGCQC8ng==
X-Received: by 2002:a17:90b:538e:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f548f580femr19629798a91.29.1736574534006;
        Fri, 10 Jan 2025 21:48:54 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f1372e7sm21407345ad.83.2025.01.10.21.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:48:53 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 0/6] elf: Define note name macros
Date: Sat, 11 Jan 2025 14:48:43 +0900
Message-Id: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
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
X-B4-Tracking: v=1; b=H4sIADwGgmcC/2XMywrCMBCF4VcpWRuZ3Kxx5XuIi1xGG9BWEgktp
 e9u2iooLs8w3z+ShDFgIodqJBFzSKFry5CbirjGtFekwZdNOHDJOAOKtwu1e0AjtNROaFI+HxE
 voV8qp3PZTUjPLg5LNLP5+vZcLT4zymitUUsQCryCozdDG/qt6+5kDmT+QQoYyBVxCrSuveMIO
 28l/iHxjeoViYK0dlaBssxY/oOmaXoB8zVRagEBAAA=
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



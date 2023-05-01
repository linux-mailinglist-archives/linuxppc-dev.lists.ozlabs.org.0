Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66156F3103
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 14:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q92qm3rL4z3cdM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 22:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oKFN/r8u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oKFN/r8u;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q92nz0PjHz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 May 2023 22:39:01 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc4d96e14so8629461a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 05:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944735; x=1685536735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc/FIv16Z5bKlEeMjq3JH7jrMiztUQ6tRChXDQSURU=;
        b=oKFN/r8uKGx9Dr4DETHEAj7XJds+1Bkl9Cqn4Z6CQQSxDowYbUKPXMMW3MeG+X8FYo
         fBbtsDIE6lZ/2kRnHPaVvNFwGmN5R+12wlVOtMs22XZvF4DeqmQ7ZLHPROSNR6NOEBIy
         hQHlXVgw1kAmIgV931djagKU+oBuvB30KXM04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944735; x=1685536735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJc/FIv16Z5bKlEeMjq3JH7jrMiztUQ6tRChXDQSURU=;
        b=Kg7LPfh6Hu9QrAuxRK6UUq7PGURW85excnDG6GIAuBBYXqYnmHLjTTY6YZqF6AUxze
         FIf7pwMhWcp7n7HlN7p0pGg3skITNkNQQL4Niq361lwHQ07OmbT3dHXXFKKGKTQQWCEb
         gtVWnnlSepU6uL/OmEEnHwkXIKRZXq95WlGh/eIL7b49h+XZynm3MiuPNGNPwoArr9iq
         6I9uWT+CV5eBpwmEVK0QAZtq8VTxNh6hk/WuSpB2eLEHRKez3x4RNkm6xjepn95oWssm
         Gi/GLadfWqWuhLD1F5N+WAaYVOoPGqvNEys8FWsmNtpaIQKcOikjSY7YlJw/K5/LyH7C
         kCiA==
X-Gm-Message-State: AC+VfDwubCtI+5WOYsAUBASs3ilri7MoDC8GNM6tNj2nI5LVdKm/THiz
	q+ZNuhmwV2jW2mNA/xJQ+PjCwg==
X-Google-Smtp-Source: ACHHUZ5dy1t28pTgAv9ZewhiQXtL5zGnuRNOu5Z+CKjak1xPicSHjkyOJ9snAkywki500Fps2M3Y7g==
X-Received: by 2002:a05:6402:4413:b0:4af:7bdc:188e with SMTP id y19-20020a056402441300b004af7bdc188emr6406640eda.16.1682944735175;
        Mon, 01 May 2023 05:38:55 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:38:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
Date: Mon, 01 May 2023 14:38:18 +0200
Message-Id: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqyT2QC/33QzWrDMAwA4FcpPs/F8n922nuMMhJZaczSBOw1d
 JS8e9UeR5aTkIQ+Cd1FpZKpivfDXRRacs3zxIl/Owgc2ulMMifOhVbaKKNBftON8AtH7oGX1oF
 CbRLoBgXPdG0l2ZV2woGnpus4cnHI9Wcuv68dC3D4/I9bQCrZBh971BjQpg8cynzJ18txLmdxY
 mzRu4BmIIEilxyE6JsNwOwChgHXK/AYk6IYNgC7C1gGwFjlIPZNpK0L3C7gnhc4b7qePwDB/AH
 WdX0Ax4+WyLYBAAA=
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=GVJi+03Xz3YcKIs9vohmPUDUq2YTUUxMRlFdBxq2C24=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7LAFLlAuOy2Pigaz4i/nocmi0AaG2bDBwCis
 1EE/BR48JCJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+ywAAKCRDRN9E+zzrE
 iBVJD/0bvdaJk33Kto6cW3Qh7bkAyMST0SlVrSVNNRzCcHkU8OMpa7+OaBEM6aylG0KK+gBpSC+
 9M/aU99yVviz/wK8tmypnptMZYvvfeVNiQeO93KdPzYmUZTepOB54/pajMpWdXzgXYnQD+5fVJj
 XS1Mg4dxUrfaWd9jTaMg6bMPcw4hnduHVIUToP1960WZux+4iyt66qBkHDTUhEe+4aLJdIPu8y0
 TXEFshDvlVqy/6h7WqW2Wn9X038Lecaf2Cb+vKG/dtcFncw1BsXiCUe+Ny7zQhFXCb+9f3XeamD
 VVWQ8RhWqq+IsHt/LUVH0SWBcwegONn8/OA3jHsAfFQY9s2iYABKgoBbDzq7QuVR4DeXsS/B8kd
 Je8L101yFCiVa6aM7T/iN025l2Pr0M6mSxPsEZbwbXYUnADYf4FjlVcsvSiBCQghUXRcE7yb0zE
 9s1uOFvgW1Tmn9KJTK5e91CRxAKAz5AUF/fiqJYtGJuXhPypDbO7xrVcHx2XV/9/KFsCVAWCFli
 izkP0mT4SSvRRjga1EF091s9YDLMxKe287MF0LcOdNASLL8QmYbIG4Nk2KJcqLUx7RR/UAzd6LI
 mzp4oKuDvSVn1XPWMnSidoCM4GInDmiQ20x5trgZ1hUVyat2PHBgU0I5SdzrjK2gYZDAo/Q8/4q
 9iNvZ9J8J2WbZpw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, llvm@lists.linux.dev, Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, stable@vger.kernel.org, Simon Horman <horms@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When upreving llvm I realised that kexec stopped working on my test
platform.

The reason seems to be that due to PGO there are multiple .text sections
on the purgatory, and kexec does not supports that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v6:
- Replace linker script with Makefile rule. Thanks Nick
- Link to v5: https://lore.kernel.org/r/20230321-kexec_clang16-v5-0-5563bf7c4173@chromium.org

Changes in v5:
- Add warning when multiple text sections are found. Thanks Simon!
- Add Fixes tag.
- Link to v4: https://lore.kernel.org/r/20230321-kexec_clang16-v4-0-1340518f98e9@chromium.org

Changes in v4:
- Add Cc: stable
- Add linker script for x86
- Add a warning when the kernel image has overlapping sections.
- Link to v3: https://lore.kernel.org/r/20230321-kexec_clang16-v3-0-5f016c8d0e87@chromium.org

Changes in v3:
- Fix initial value. Thanks Ross!
- Link to v2: https://lore.kernel.org/r/20230321-kexec_clang16-v2-0-d10e5d517869@chromium.org

Changes in v2:
- Fix if condition. Thanks Steven!.
- Update Philipp email. Thanks Baoquan.
- Link to v1: https://lore.kernel.org/r/20230321-kexec_clang16-v1-0-a768fc2c7c4d@chromium.org

---
Ricardo Ribalda (4):
      kexec: Support purgatories with .text.hot sections
      x86/purgatory: Remove profile optimization flags
      powerpc/purgatory: Remove profile optimization flags
      risc/purgatory: Add linker script

 arch/powerpc/purgatory/Makefile |  5 +++++
 arch/riscv/purgatory/Makefile   |  5 +++++
 arch/x86/purgatory/Makefile     |  5 +++++
 kernel/kexec_file.c             | 14 +++++++++++++-
 4 files changed, 28 insertions(+), 1 deletion(-)
---
base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
change-id: 20230321-kexec_clang16-4510c23d129c

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9D78B9A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 22:40:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=urfxC/+o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZMr537JWz3bw3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 06:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=urfxC/+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=38axtzawkdn0mcdr9tkmhdqrfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--ndesaulniers.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZMqB5K4lz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:39:17 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d74b711ec0dso4519386276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693255152; x=1693859952;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XhrkWiQBnHmzMnkAE+NYbdoZdy6UiyASIH0GRgNQ/sU=;
        b=urfxC/+oTHLuj+i6cn0/azuq+FFaWj+TnME6nhesd8cw0L5Hhx/TUyll1F+Er3mk1V
         EPtJEawuJ7LmK9shNHvS9h/gGI6VsaHwg4Nca8og7fCRD7CQB4X3Kfa9FsaRnST6k8xO
         0dr5yHSkjVGAHS3J7o6VojOEbV63NzFkgqMmpXOQ582xX256DdnHrjUmmPC4cmLFHEin
         Z1O8sfXNGBnPb7WSs4WCuskoLd5HzDd2PmDt8VBcd9vco3CTPXvj+3hemrc7Ly+8daso
         R24co0ytNidRJebijXU8YN6wM8GK/12rUxTgs3qJ/AEYZkHtELGzmn5jHkz2rJQRiQlW
         odaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255152; x=1693859952;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhrkWiQBnHmzMnkAE+NYbdoZdy6UiyASIH0GRgNQ/sU=;
        b=dOJbIkkOkw5e7foHXIa+XwoJej5CUew9OJklbpDeFqUKQ59fy0eCQhQa6Av530QLjA
         SXe+G6FYm16NmvDpgCNJzBCVuGpb5AzoUvhx0PwULUj8pQiEkHGYQW5C+mYdIbCEc4Ef
         bXC3KaGJ2tdQoIDvstD5lrl+KA3lKc254GYSbMHQf12liKqkespeaLgtmhsEFLuZnBLh
         HGqSyHBWGL3HDJX6G74/xzZqJfqA5MjCBgDxWFKN8xi28pewzf+soLOkwy2I3nMCCfWw
         5BtH0nkBa3HbCspkOk9GHM9d8CuQgthSS75XrC2zMlXZ3c2Mtoe5tm+GNWRVKKwktuIL
         SIYA==
X-Gm-Message-State: AOJu0YwPsO65Ra1cCTuztDzGytKps4JE83E1qbFRULV3cR1cCedHx4E5
	XPxPpXFtjc/yU3nhj4AJyTaXSEjrGUy/qdZXi1Y=
X-Google-Smtp-Source: AGHT+IGlwLCXXsjKROwMA/eBuqL6pO5hd66mEIQL7qVwZn+m6vX+Qy5OakE1dsfnaIt9WkB4KXLqeb7R2EWnAWB0U3E=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:b64:7817:9989:9eba])
 (user=ndesaulniers job=sendgmr) by 2002:a25:74c6:0:b0:d0c:c83b:94ed with SMTP
 id p189-20020a2574c6000000b00d0cc83b94edmr811734ybc.10.1693255152253; Mon, 28
 Aug 2023 13:39:12 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:39:06 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOkF7WQC/3WMwQ7CIBAFf6XZsxhAKtiT/2Eao7hQEi1kaYim4
 d/F3j3Oy5tZISMFzDB0KxCWkEOcG8hdB3a6zR5ZeDQGyeWBG2lYSvZK2K5ICzsqraR2XFkU0JR E6MJ7y13GxlPIS6TPVi/it/4JFcEE08r1/d0Ic+L67GP0T9zb+IKx1voFZACn56kAAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693255150; l=2020;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=xcYx2Rp6x+lRWSqPslFnv6rJuAz/HxMw+0OdY1ALQZs=; b=v17oTu32hcx8X2o5oavi8I5UUOWMaIGdmbzoTP9nH19+mbccNNnrpEkGWrOiXO5zDJPWL5d/n
 rm1iEXciqeaAqQHb6RBdzIzkcNFhLuv32jqEmsXHABpaRsTnDZThqrj
X-Mailer: b4 0.12.3
Message-ID: <20230828-ppc_rerevert-v2-1-46b71a3656c6@google.com>
Subject: [PATCH v2] reapply: powerpc/xmon: Relax frame size for clang
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a manual revert of commit
7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb, but using
ccflags-$(CONFIG_CC_IS_CLANG) which is shorter.

Turns out that this is reproducible still under specific compiler
versions (mea culpa: I did not test every supported version of clang),
and even a few randconfigs bots found.

We'll have to revisit this again in the future, for now back this out.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-1690371256
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308260344.Vc4Giuk7-lkp@intel.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes in v2:
- Use ccflags-$(CONFIG_CC_IS_CLANG) as per Nathan.
- Move that to be below the initial setting of ccflags-y as per Nathan.
- Add Nathan's Suggested-by and Reviewed-by tags.
- Update commit message slightly, including oneline.
- Link to v1: https://lore.kernel.org/r/20230828-ppc_rerevert-v1-1-74f55b818907@google.com
---
 arch/powerpc/xmon/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index 7705aa74a24d..682c7c0a6f77 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -12,6 +12,10 @@ ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
 ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
 
+# Clang stores addresses on the stack causing the frame size to blow
+# out. See https://github.com/ClangBuiltLinux/linux/issues/252
+ccflags-$(CONFIG_CC_IS_CLANG) += -Wframe-larger-than=4096
+
 obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
 
 ifdef CONFIG_XMON_DISASSEMBLY

---
base-commit: 2ee82481c392eec06a7ef28df61b7f0d8e45be2e
change-id: 20230828-ppc_rerevert-647427f04ce1

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


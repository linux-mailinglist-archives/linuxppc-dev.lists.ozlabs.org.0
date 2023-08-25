Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21893788F55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 21:48:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hPq4/dVO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXVrJ5Chfz2xb2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 05:48:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hPq4/dVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXVqP4Spfz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 05:47:59 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf6ea270b2so10716985ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692992877; x=1693597677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2eAlo9fjSE47gDq8UwikbKqRdW2epxnqoMlapicBOVo=;
        b=hPq4/dVOWPN3/xYHGSNqtyJ78/BikbId7FjgkfxbkA0VyhXPOzl7lO4mlSM8vpzpxU
         1oGQR8NSGWUYNC7ooixw3ZAc++ZMNLfG5xvP9RLdzvf3NVGbXmVMW/TPzW22AGJMcj3j
         AQHeCFp14CPdOHj9yNQc5tLosZGGBOzxfv0s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692992877; x=1693597677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eAlo9fjSE47gDq8UwikbKqRdW2epxnqoMlapicBOVo=;
        b=QMRBIFguKAK4UZ4ur1Ise70mOwtYWWHmOHE8ruz5POqtCctriEsfowpexiGH+X69ze
         a/FNriTLNezdOZ9nXXtyJJMun4WEmERmaQpLNgD4oMpGKUHN4mkPvt8VNr2vG73Dl/pg
         /y1oYaO0Yfbdt923KjoCFrQnjHqKe8HRu/7nWbrSE8ml6xWHdvxCJ1uPD2yUSa5CuAD1
         S3K1RG5Z0B5QyUAm+uUFi+bSudUkIZtL+mVrvmq+E77K1oTUySBUOtKNLNZnAyubc0N6
         XfCf+ugHfVm2z4YXjL5qy1ffu4v81huYVf9UaC/IOWQsWcxz+1U9ht/loNA9pOeX8WOC
         aHgw==
X-Gm-Message-State: AOJu0YxS7sgwqCfHQ+mu3E8MDIsixdM5CgsJEkB6ijtcd6rmbtNlSOI8
	i0+oieKFLOPQC2FOTo6sjU4qpg==
X-Google-Smtp-Source: AGHT+IGxcpanMsKBVZgKv/Yq93mXGufH+Af8FwFxALkGKO/g/5fDq3MRLYBXtsa8BQ/uRSV5+dgzUQ==
X-Received: by 2002:a17:902:f68a:b0:1b8:2ba0:c9c0 with SMTP id l10-20020a170902f68a00b001b82ba0c9c0mr19091463plg.59.1692992876671;
        Fri, 25 Aug 2023 12:47:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001bdc209b9a0sm2127104plk.201.2023.08.25.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 12:47:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
Date: Fri, 25 Aug 2023 12:47:51 -0700
Message-Id: <20230825194329.gonna.911-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5155; i=keescook@chromium.org;
 h=from:subject:message-id; bh=v1dFNPv8CIhPkvxYivSEa1AvUQm838lqlgbgtyuDhao=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk6QVpcTKUn7qqPn10MgMfRhkYIt+AsVuNBKMPQ
 xjEfa7v0KOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZOkFaQAKCRCJcvTf3G3A
 JiiXEACuT7VwLDIoXTeIecrMyMglPUbKPt7yUzWO3/54TGsSft96acY1dzB1vA7qrGa9t1Cdo9v
 R13OX57o0IJT2V2rlOgzIcV672EkcYj8onx7ErDcMmui0FpMoy7PxyJQlbMuF/va0qIrTAABk/c
 7FVHlMtL8QNfzwffmzL3/prEJ1FOVTerYWIdlzsoUtxqY2tRQT9XNW+91QKmKXwu5wuV0LtbZHe
 LJXY8jOpoAqoRh8LfxuVxYyzHhX2rnsxIZV4PpW/MurNesETGNW27Axnw6zDS3SURGqdSM8rK8o
 5ba5fSaoDMTza0TNdMdDLe0MaeC5v/YkHK5+W3ymGNF/xCIq0k5npCjRtifmrUabKOtznAM5UyD
 b+vijr2Ppt5ibT7kha8c1gx+OcPvz8Q8wbguQxUhMDJrwyO+dZ6E5YjMyrYqZwYyM5IsPFZ1bdG
 oHZDtbyRinFIIK7R4E3eaID7Ln+ugtxStkmhOXE/wla3uiFkjs8MB6Ng7HZbW+SOxY5lW4u8rE0
 yIYiPlxv9dcZV78jyYILn15t8EIDWR+BXJKIntgzqwTrHXIrGnVpMny3qjFs2m8AotyH3mAqXKX
 3Xnv6M5GUGn4L2vIRCvJeyzyrhxv6H9oJFtsb8GgriE+578mNn9MnTFC+RnySu6r9pgT9oyIpjJ
 hRc0FPP 4F/47bRw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is my series to show *.config targets in the "help" target so these
various topics can be more easily discoverd.

v2:
 - split .fragment from .config to hide "internal" fragments
 - fix various typos
 - avoid duplicate entries
v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org

Thanks!

-Kees

Kees Cook (2):
  kbuild: Show Kconfig fragments in "help"
  kbuild: Split internal config targets from .config into .fragment

 Makefile                                      |  1 -
 arch/arm/configs/dram_0x00000000.config       |  1 +
 arch/arm/configs/dram_0xc0000000.config       |  1 +
 arch/arm/configs/dram_0xd0000000.config       |  1 +
 arch/arm/configs/lpae.config                  |  1 +
 arch/arm64/configs/virt.config                |  1 +
 arch/powerpc/Makefile                         | 26 +++++++++----------
 .../{32-bit.config => 32-bit.fragment}        |  1 +
 arch/powerpc/configs/64-bit.config            |  1 -
 arch/powerpc/configs/64-bit.fragment          |  2 ++
 ...{85xx-32bit.config => 85xx-32bit.fragment} |  1 +
 ...{85xx-64bit.config => 85xx-64bit.fragment} |  1 +
 .../{85xx-hw.config => 85xx-hw.fragment}      |  1 +
 .../{85xx-smp.config => 85xx-smp.fragment}    |  1 +
 .../{86xx-hw.config => 86xx-hw.fragment}      |  1 +
 .../{86xx-smp.config => 86xx-smp.fragment}    |  1 +
 arch/powerpc/configs/altivec.config           |  1 -
 arch/powerpc/configs/altivec.fragment         |  2 ++
 arch/powerpc/configs/be.config                |  1 -
 arch/powerpc/configs/be.fragment              |  2 ++
 .../{book3s_32.config => book3s_32.fragment}  |  1 +
 ...enet_base.config => corenet_base.fragment} |  1 +
 arch/powerpc/configs/debug.config             |  1 +
 arch/powerpc/configs/disable-werror.config    |  1 +
 .../configs/{dpaa.config => dpaa.fragment}    |  1 +
 ...mb-nonhw.config => fsl-emb-nonhw.fragment} |  1 +
 .../configs/{guest.config => guest.fragment}  |  1 +
 arch/powerpc/configs/le.config                |  1 -
 arch/powerpc/configs/le.fragment              |  2 ++
 ...85xx_base.config => mpc85xx_base.fragment} |  1 +
 ...86xx_base.config => mpc86xx_base.fragment} |  1 +
 .../{ppc64le.config => ppc64le.fragment}      |  1 +
 arch/powerpc/configs/security.config          |  4 ++-
 arch/riscv/configs/32-bit.config              |  1 +
 arch/riscv/configs/64-bit.config              |  1 +
 arch/s390/configs/btf.config                  |  1 +
 arch/s390/configs/kasan.config                |  1 +
 arch/x86/Makefile                             |  4 ---
 arch/x86/configs/tiny.config                  |  2 ++
 {kernel => arch/x86}/configs/x86_debug.config |  1 +
 arch/x86/configs/xen.config                   |  2 ++
 kernel/configs/debug.config                   |  2 ++
 kernel/configs/kvm_guest.config               |  1 +
 kernel/configs/nopm.config                    |  2 ++
 kernel/configs/rust.config                    |  1 +
 kernel/configs/tiny-base.config               |  1 -
 kernel/configs/tiny-base.fragment             |  2 ++
 kernel/configs/tiny.config                    |  2 ++
 kernel/configs/xen.config                     |  2 ++
 scripts/Makefile.defconf                      | 12 ++++++---
 scripts/kconfig/Makefile                      | 16 +++++++++---
 51 files changed, 87 insertions(+), 32 deletions(-)
 rename arch/powerpc/configs/{32-bit.config => 32-bit.fragment} (53%)
 delete mode 100644 arch/powerpc/configs/64-bit.config
 create mode 100644 arch/powerpc/configs/64-bit.fragment
 rename arch/powerpc/configs/{85xx-32bit.config => 85xx-32bit.fragment} (76%)
 rename arch/powerpc/configs/{85xx-64bit.config => 85xx-64bit.fragment} (78%)
 rename arch/powerpc/configs/{85xx-hw.config => 85xx-hw.fragment} (98%)
 rename arch/powerpc/configs/{85xx-smp.config => 85xx-smp.fragment} (59%)
 rename arch/powerpc/configs/{86xx-hw.config => 86xx-hw.fragment} (98%)
 rename arch/powerpc/configs/{86xx-smp.config => 86xx-smp.fragment} (58%)
 delete mode 100644 arch/powerpc/configs/altivec.config
 create mode 100644 arch/powerpc/configs/altivec.fragment
 delete mode 100644 arch/powerpc/configs/be.config
 create mode 100644 arch/powerpc/configs/be.fragment
 rename arch/powerpc/configs/{book3s_32.config => book3s_32.fragment} (52%)
 rename arch/powerpc/configs/{corenet_base.config => corenet_base.fragment} (64%)
 rename arch/powerpc/configs/{dpaa.config => dpaa.fragment} (80%)
 rename arch/powerpc/configs/{fsl-emb-nonhw.config => fsl-emb-nonhw.fragment} (98%)
 rename arch/powerpc/configs/{guest.config => guest.fragment} (85%)
 delete mode 100644 arch/powerpc/configs/le.config
 create mode 100644 arch/powerpc/configs/le.fragment
 rename arch/powerpc/configs/{mpc85xx_base.config => mpc85xx_base.fragment} (94%)
 rename arch/powerpc/configs/{mpc86xx_base.config => mpc86xx_base.fragment} (86%)
 rename arch/powerpc/configs/{ppc64le.config => ppc64le.fragment} (65%)
 rename {kernel => arch/x86}/configs/x86_debug.config (90%)
 delete mode 100644 kernel/configs/tiny-base.config
 create mode 100644 kernel/configs/tiny-base.fragment

-- 
2.34.1


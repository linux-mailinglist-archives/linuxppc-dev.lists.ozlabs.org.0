Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3D3F1648
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 11:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr01d3bhwz3cVY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 19:33:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=enn9Mp7+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=enn9Mp7+; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr00x4rcVz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 19:32:32 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id x12so8000684wrr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmf3umRfv4KMZ4uQ33/nDRLk5ExaW9fT/xorODYlDPc=;
 b=enn9Mp7+BHj8C9UfShybnnOLllZFUZKmPD3lFyG54k9reTcqpk5AkxO9UJohwcucyj
 iwQTIO2npa3wA1k0iA2wE7V6z7SL4ojVklZY5i3FEqRvn4HUvKcbQ+iVNkQcHlP7P8nr
 dXs64snQ0/F7klMWbgLLpuhDGlDvVjRT9uF99TOej9/zM8aB3aYGTX9Hk99Aq3NgP67C
 pvBBzhwuDuAw+apun2yEkKhFWNpwf6PX6pShYpQQ3XwfqIQk6/Ctee1Vw+Ufu54fgaqN
 D2xY7doZWziyJqOA9Jdc0P2uVWDFEqq5lt2ctpWfR9hckwMDAbkGL8XMJ/LOJGqy4Wui
 AlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmf3umRfv4KMZ4uQ33/nDRLk5ExaW9fT/xorODYlDPc=;
 b=bYCKwDH0w9kU4Ieqa6p7tcMiqPCurvqECf8E+xJd4KhOH9pUJ7AipviZ0h8fZgosu5
 YT5dY+QaEpye03SVyehufYBYL8pgqpZ2LOHH52aYtdHLJx4DKDdjo+3S7sJ0OZ91ZunF
 GCDsTstb8leMDirvNc4PYxLalvQIdRrynMWj+RghWwlGadkoVt6BhskOmP5n8q1SaJHp
 WyDnVZlkgofsvsA+ievbIBF9zz5p6HLYfrtm6nBnszUTzVjOQrjvFyFKJ80s6bHSQ8TX
 rcSkIyL56r6fEwWPh33vdPDdvpk5c8+/xIMA0Q4StFSFLxkdACRIDqrvyvlf2uERcXat
 Y9Og==
X-Gm-Message-State: AOAM5306PKfq4BNl5k7yr+DPS9IrQHI3eGO4su+79ENGfvlKM6LFDu1F
 MggIimUC+/4aORm0nRSu4SU=
X-Google-Smtp-Source: ABdhPJyWWlLboikpd2then9nHSZfdRg9YfDbpOedyAGwGxARsjMptNU5YHc3mcTz52AsxgCxk/sorw==
X-Received: by 2002:adf:fa11:: with SMTP id m17mr2592459wrr.323.1629365548547; 
 Thu, 19 Aug 2021 02:32:28 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id h11sm8485061wmc.23.2021.08.19.02.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:32:28 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] Kconfig symbol fixes on powerpc
Date: Thu, 19 Aug 2021 11:32:24 +0200
Message-Id: <20210819093226.13955-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear powerpc maintainers,

The script ./scripts/checkkconfigsymbols.py warns on invalid references to
Kconfig symbols (often, minor typos, name confusions or outdated references).

This patch series addresses all issues reported by
./scripts/checkkconfigsymbols.py in ./drivers/usb/ for Kconfig and Makefile
files. Issues in the Kconfig and Makefile files indicate some shortcomings in
the overall build definitions, and often are true actionable issues to address.

These issues can be identified and filtered by:

  ./scripts/checkkconfigsymbols.py | grep -E "arch/powerpc/.*(Kconfig|Makefile)" -B 1 -A 1

After applying this patch series on linux-next (next-20210817), the command
above yields just two false positives (SHELL, r13) due to tool shortcomings.

As these two patches are fixes, please consider if they are suitable for
backporting to stable.


Lukas

Lukas Bulwahn (2):
  powerpc: kvm: rectify selection to PPC_DAWR
  powerpc: rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK

 arch/powerpc/kvm/Kconfig               | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.26.2


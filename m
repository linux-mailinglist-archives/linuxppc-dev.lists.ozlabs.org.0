Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA077F5B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:51:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TPnESRUp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRNcw34Lgz3cP2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TPnESRUp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRNc21kjYz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 21:50:24 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-40fe3850312so55100761cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273021; x=1692877821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qcri40AASRR4BFsuSO+X3cA76lV9mjhear1ggGLTZLg=;
        b=TPnESRUpP/KtEYZty2/I71s0M7NdefMLoExvx9rNuW8Reu40ADoBeZFuDMVF9NfGxp
         6jm1VSkNUATDJUAO2waHJf6ZuRjtYXCMibErNn1PcQPInVBNTPt1LynPSb351l+dpPgU
         8uR+Cg6eEt9lu2ZTtxyeF3nm5m96aBb27q3bZOscAOlDDbinhtVDTsvVnyY2e/O41AaR
         3ILuvFu1GOacRyKkb50Aijdm2HXNe87tUgm4ZbMnzvOVpDdRb1OFXssgZF1lCg6+QbR/
         1Votk8z5iyG1pZ5l87yCSStgvjzBnV0m0kH7WLqgSSrGPUh+WiEv7lMxnq7doraeSruP
         83DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273021; x=1692877821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcri40AASRR4BFsuSO+X3cA76lV9mjhear1ggGLTZLg=;
        b=Q1L/AXPrONMcLqrgacxnddYRMgSqzAs6pfmIGq33jmwZoQo+72pPCOpDaAkAZ0h3I3
         JQO7oiFEUjrJ5grJhggAHs7vbRh/LCTJZ4QWMfkHzhW0nWzRiUFZzpMn81sGxOluMQz2
         ECazllC/eh+0q34ImpZAu7UdNXA5WNxOMOD8i650PJIEv9mEEsX79yTwWO1ngCjIUq3F
         4SLEye4HCL1jK+61tSm9uD+jH0gBAKwVr11qe+OCk74HnrA5StS6s82y3ddLnmGRJy39
         GobE0WdhYGeXtWNi+QQZkRq1IatCkwezo3x1GS68XqFva+ZW5MuXny3W5mqoNpBiP0H2
         bBUw==
X-Gm-Message-State: AOJu0Yy2YqhOFQXC5FzT5oBDfQ3trn/TiI9TzUHVBSB8xlhC+nWV9pqp
	BWZjgeUTLk7sbV1D4ekJhwNyYtMUjbI=
X-Google-Smtp-Source: AGHT+IGxsq2uwogQdBPmvMNMrm5x/VpIF14pHjZPiMJMm6t7UtQ0zLWCLBZFUfKOaK/uYR3GUwHjIA==
X-Received: by 2002:ac8:7e8b:0:b0:403:b252:96ea with SMTP id w11-20020ac87e8b000000b00403b25296eamr6018736qtj.21.1692273021085;
        Thu, 17 Aug 2023 04:50:21 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:20 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] general defconfig cleanups
Date: Thu, 17 Aug 2023 07:50:10 -0400
Message-ID: <20230817115017.35663-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
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
Cc: linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop config options from defconfigs whose code has been removed.

v3:
While reorganizing the patches, I put the wrong commit message with the
CONFIG_IP_NF_TARGET_CLUSTERIP option.

v2:
Generate arch-specific patches. In v1 I organized the patches by
CONFIG_ option which caused some of the patches to cross architectural
lines. This requires cross-arch consensus before they can be applied.
Therefore organize the changes by architecture so each one can apply them
independently (or not).

Trevor Woerner (4):
  arch/arm/configs/*_defconfig cleanup
  arch/loongarch/configs/*_defconfig cleanup
  arch/mips/configs/*_defconfig cleanup
  arch/powerpc/configs/*_defconfig cleanup

 arch/arm/configs/keystone_defconfig        | 1 -
 arch/arm/configs/multi_v7_defconfig        | 1 -
 arch/arm/configs/omap2plus_defconfig       | 8 --------
 arch/loongarch/configs/loongson3_defconfig | 2 --
 arch/mips/configs/ip22_defconfig           | 1 -
 arch/mips/configs/malta_defconfig          | 1 -
 arch/mips/configs/malta_kvm_defconfig      | 1 -
 arch/mips/configs/maltaup_xpa_defconfig    | 1 -
 arch/mips/configs/rm200_defconfig          | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 10 files changed, 18 deletions(-)

-- 
2.41.0.327.gaa9166bcc0ba


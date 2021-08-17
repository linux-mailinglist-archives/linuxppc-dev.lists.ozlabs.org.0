Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A513EE5F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 06:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpdxY4ZqHz30gd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:54:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DVzdoGmu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DVzdoGmu; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpdws5nd0z307C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 14:54:19 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id u1so6297026plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GKg5n3efjm/6/IM0x7Cbp8tTyEJvaLsqMs7Foza9Xi0=;
 b=DVzdoGmuN3LLqUoCdElkecU5og/cuJZS9N+VhjBc9Cyu08IAyNPjdzVQ2dD+JLluW6
 sgQGNssNM0eI+qIQDNmVNRKgCkmsNPpKggPfVtBvAIyOdVesa4W2IsCPPjt7l6QBhiu6
 WgX4cc/Tn8k6zOXsUwmfEvDYcxerA0HQrDppUx18YkaO/4eXKxCVNnrGPtnoWQ5Du9My
 O26ErmyojLX6Ssqf41CYf9rEesauu5NqB6mzqG/7i/EjTHbEe8OGfxYDZ/mqM7GepedA
 8iH7l8JRqQW5VWgrbVcNhXqE2OPIKtq9rpZMpGBSObunUpdlhgSPz5x6fyvund9LSKzd
 4oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GKg5n3efjm/6/IM0x7Cbp8tTyEJvaLsqMs7Foza9Xi0=;
 b=ZXFz7bKzfawfBKqOfxyNujr+87G+eHLls0K3423j1WBY5BwWi58lOv2v1Q3Op55D2c
 BMlasJ0xq78VeN+1ISADJIqUkMNBiCFZ+IflCLtXeQk80c67VB8yauPVzPepCgJszJEE
 fxNxHn0WGHYmHM3ZrYIH3fYSXrnVdS5VA6rFDKUR7jrBSBtQgLn8wfSPow62lZZeUFKE
 Yctu4YNg9LAdN+Ou08KMffl/fpBGbY9Y8CSWuGVZAHhLsSJccURW8qxriaX8s6uZ26Ag
 LlK3RXespAU9DkVdWnVmKhiT+8q5E8xoSHzUYQXa745ZdLEbESanPK1o3DGczxdAwQ7j
 fL8w==
X-Gm-Message-State: AOAM530jhXuVAL8J/dUydnAisNAYNItMes3DyrIqkopTQ6Phe79VnVb+
 DeeZ6pHDN8SoWh6VmROsLve3zjFMvmk=
X-Google-Smtp-Source: ABdhPJw+2jJQk+FWj/V8RgvqkRNYxoKHu37Sw/K7MUFF/J4JMDr4UTlos5tHp1ELdbKtKF7VUpcCJw==
X-Received: by 2002:a05:6a00:1693:b029:333:da3a:8c86 with SMTP id
 k19-20020a056a001693b0290333da3a8c86mr1799486pfc.41.1629176057617; 
 Mon, 16 Aug 2021 21:54:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id k6sm1029073pgk.1.2021.08.16.21.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:54:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] powerpc: mpc855_ads defconfig fixes
Date: Tue, 17 Aug 2021 14:24:04 +0930
Message-Id: <20210817045407.2445664-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v2: fix typos, split out mtd fix from savedefconfig patch

The first patch fixes a build warning I noticed when testing something
unrelated.

The second fixes a regression where the MTD partition support dropped out
of the config. I have enabled the dependency so this is still part of
the config.

The third patch is the result of doing a make savedefconfig with the
first two patches applied.

Joel Stanley (3):
  powerpc/config: Fix IPV6 warning in mpc855_ads
  powerpc/config: Renable MTD_PHYSMAP_OF
  powerpc/configs: Regenerate mpc885_ads_defconfig

 arch/powerpc/configs/mpc885_ads_defconfig | 49 +++++++++++------------
 1 file changed, 23 insertions(+), 26 deletions(-)

-- 
2.32.0


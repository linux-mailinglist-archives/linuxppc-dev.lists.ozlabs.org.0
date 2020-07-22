Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08622A20A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 00:13:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBqVp0tlpzDqwH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eXn7IUD/; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBj5F04CgzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:24:44 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id b15so2246474edy.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gPP0o2IshuB1LsGL+RlWYagGQFRTxZqJkVHgsKuPywk=;
 b=eXn7IUD/qqGZ665TjtY/1XQa6zE3hdJTIfxcjm9PHJSTXYZx8C6sRqi8KjavPYnP4j
 glhyUS6oA94YrOTN/C75FuWP7eHJF06P90j6gT4U8tHksMu8dYeOaUv4kEQJ2ZjGNrx4
 zmtxNETChqqAejiSizVPikMweJuWEBb8tqO2cjekgH6LP6r/CPW2gDyC8hTXDmPWPcf0
 3mUGe7ytgBVKEaljkhd3OWBCCQu5vlt0/oKnLKxRrJWaxWJTePwFYAKVzC86eHxajaEt
 5mwxIjbKDswO3P2a3H4oGhKR+L6iqHEoYdKEd4WHo2iE7wyXLbNoy9Sjv/NfQN+aa/Jb
 XSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gPP0o2IshuB1LsGL+RlWYagGQFRTxZqJkVHgsKuPywk=;
 b=OJNH9WwdwGvSTL2YmzpIgBa7GEbpDE3nVeTDmA3lKhwUuftBij1deMFQahNkw2QtIu
 dWCMjh1vhNpDtLUKVA2KypqfmgSuPPhZ40+yLF1j+n8ibQ27Y2Bw5eHE06o7usxnRjd6
 cD2wS5It3z9P6YkIDeQIaDDrfWDE/e4Ck1giq/sp07Jjjo4JZlaSumTmYdddmo43HzjO
 NypiOl3kZjmdctuohfnKTpLwJ8WZi3xEzBOWehrUqNo8Ngo4AzzRWijDL3abzq4q3DLR
 tmEM3ZxN5wao0Fl8huYNVM+E24xOpnNMsdza37dc+lK0m6nAgHflyUscBbkxLfgT+/bf
 8a7g==
X-Gm-Message-State: AOAM531ZKQzqCMC3RFU9lQCEngPaLiQkebuPgoBVB/OIsI6oNWhuiMRA
 VDNDUMMW9DiRq564ANV3kYw=
X-Google-Smtp-Source: ABdhPJw6qCvxHjC43/yrpWhDOe/AsWnZXiBnfMRI2ghCPn3hOLpRGBpWv3Dxsjl6tQ8CgvCHhpH0Mw==
X-Received: by 2002:a05:6402:3064:: with SMTP id
 bs4mr517588edb.350.1595438679957; 
 Wed, 22 Jul 2020 10:24:39 -0700 (PDT)
Received: from localhost.localdomain ([188.25.219.134])
 by smtp.gmail.com with ESMTPSA id bt26sm311517edb.17.2020.07.22.10.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 10:24:39 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: robh+dt@kernel.org, shawnguo@kernel.org, mpe@ellerman.id.au,
 devicetree@vger.kernel.org
Subject: [PATCH devicetree 0/4] Add Seville Ethernet switch to T1040RDB
Date: Wed, 22 Jul 2020 20:24:18 +0300
Message-Id: <20200722172422.2590489-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jul 2020 08:08:49 +1000
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
Cc: madalin.bucur@oss.nxp.com, linux-kernel@vger.kernel.org,
 radu-andrei.bulie@nxp.com, fido_max@inbox.ru, paulus@samba.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Seville is a DSA switch that is embedded inside the T1040 SoC, and
supported by the mscc_seville DSA driver. The driver has been accepted
this release cycle and is currently available in net-next (and
therefore, in linux-next).

This series adds this switch to the SoC's dtsi files and to the T1040RDB
board file.

Vladimir Oltean (4):
  powerpc: dts: t1040: add bindings for Seville Ethernet switch
  powerpc: dts: t1040: label the 2 MDIO controllers
  powerpc: dts: t1040rdb: put SGMII PHY under &mdio0 label
  powerpc: dts: t1040rdb: add ports for Seville Ethernet switch

 arch/powerpc/boot/dts/fsl/t1040rdb.dts      | 123 +++++++++++++++++++-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi |  79 ++++++++++++-
 2 files changed, 194 insertions(+), 8 deletions(-)

-- 
2.25.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4372124E96A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 21:37:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYpYy0MzPzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 05:37:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SILZm/yT; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYpWt3W4kzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 05:35:36 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id si26so6809423ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dWMxgBvmfFyawmFvMmHtQbFSjxdsaTc05buinE1Bj3k=;
 b=SILZm/yTNxrh78QIeeI8/0ZwVzwwOG5rVjnml/IdrXRNeTNBuvJha0FWKTzujPwGKK
 LyVlhYxe0my7eKLYXKW0WYq+XJmL0lZSe1auBZcOnRh+fNUmtJU1+B2VE07DbZrsvLLb
 kMTXIZT45EXQUANdZkpz3PmoPHvT7RYS929aaCk9DvUs1RdJd/9Y8rgaSjBnkbRKnogv
 W6y1GvNrVQllDiDtdgACatlGLPcJ5LnGOK2phbqRFmsvbIvW1PiAT1UtUKTKnAAyHM5T
 tofd708J11s7yy4V8FgjX+C+BlRzpiyjmkUPFxLF5Hr3XW4kNZioo30bjAX1LoNY3VKL
 nNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dWMxgBvmfFyawmFvMmHtQbFSjxdsaTc05buinE1Bj3k=;
 b=AfBk4Y0f9H3Pa8IUU2pOJH17MHXwmx/LjPlz6EYkzOSpPOgmq20r9r6u3ZOYUUqfZO
 WkqY3ndi6ffQDbznIMkabzR6O33J9j122lPvukFhw0BAfAWZ/Z848y51SZSNsfFugOHu
 kjNfhWYmb7UOU9wQ2J8FfmmfG8gBvHYXf5HnC/th9URWfT9o71Yhn2qKtp0y34zQmIIf
 8xDWxCFQTKje2f84aXXDrrolatzic7cQnFdFIY1FSjUHfduCx8JVSfj7ORbQMtNY01Rp
 yJyfX/8w2G+cJFVqhh2ZE/SYxjM9VAzwJ0wQKNivjp9O35D5JCRmsUMlK6/ZAk9rbS6+
 NOBw==
X-Gm-Message-State: AOAM532K9FG+elMXrQrgdQ2OVKZVfqbXahi426KUPHYFWDMGE4/sawFY
 xKn/FBAZdttSHU3jexPcRZ73INDkgQhJGA==
X-Google-Smtp-Source: ABdhPJziHAmG8Bj99dgFaFHC+kcJQ5u8k3ckuArREtMVoTUqO0Prg16KpC6nG6eBFZdDYzJCZAB+oA==
X-Received: by 2002:a17:906:d9db:: with SMTP id
 qk27mr8122791ejb.230.1598124932571; 
 Sat, 22 Aug 2020 12:35:32 -0700 (PDT)
Received: from debian64.daheim (p4fd09171.dip0.t-ipconnect.de.
 [79.208.145.113])
 by smtp.gmail.com with ESMTPSA id eb11sm3612855edb.76.2020.08.22.12.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 12:35:31 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1k9ZIP-000Enb-LD; Sat, 22 Aug 2020 21:35:21 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] powerpc: apm82181: adding customer devices
Date: Sat, 22 Aug 2020 21:35:17 +0200
Message-Id: <cover.1598124791.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Chris Blake <chrisrblake93@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I've been holding on to these devices dts' for a while now.
But ever since the recent purge of the PPC405, I'm feeling
the urge to move forward.

The devices in question have been running with OpenWrt since
around 2016/2017. Back then it was linux v4.4 and required
many out-of-tree patches (for WIFI, SATA, CRYPTO...), that
since have been integrated. So, there's nothing else in the
way I think.

A patch that adds the Meraki vendor-prefix has been sent
separately, as there's also the Meraki MR32 that I'm working
on as well. Here's the link to the patch:
<https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216949.html>

Now, I've looked around in the arch/powerpc for recent .dts
and device submissions to get an understanding of what is
required.
From the looks of it, it seems like every device gets a
skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).

Will this be the case? Or would it make sense to further
unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
and integrate the BLUESTONE device's defconfig into it as well?
(I've stumbled across the special machine compatible
handling of ppc in the Documentation/devicetree/usage-model.rst
already.)

Cheers,
Christian

Note:
If someone has a WD MyBook Live (DUO) and is interested in
giving it a spin with 5.8. I've made a:
"build your own Debian System" sort of script that can be
found on github: <https://github.com/chunkeey/mbl-debian>
(the only remaining patch hack is for debian's make-kpkg crossbuild)

Furthermore, the OpenWrt project currently has images for the
following apm82181 devices:
 Cisco Meraki MX60(W) - Needs DSA for the AR8327
 Netgear WNDAP620/WNDAP660 - (Could be next)
 Netgear WNDR4700 - Needs DSA for the AR8327

Note2: I do have a stash of extensive APM82181 related documentation.

Christian Lamparter (4):
  powerpc: apm82181: create shared dtsi for APM bluestone
  powerpc: apm82181: add WD MyBook Live NAS
  powerpc: apm82181: add Meraki MR24 AP
  powerpc: apm82181: integrate bluestone.dts

 arch/powerpc/boot/dts/apm82181.dtsi        | 485 +++++++++++++++++++++
 arch/powerpc/boot/dts/bluestone.dts        | 456 +++++--------------
 arch/powerpc/boot/dts/meraki-mr24.dts      | 237 ++++++++++
 arch/powerpc/boot/dts/wd-mybooklive.dts    | 199 +++++++++
 arch/powerpc/platforms/44x/ppc44x_simple.c |   4 +-
 5 files changed, 1033 insertions(+), 348 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi
 create mode 100644 arch/powerpc/boot/dts/meraki-mr24.dts
 create mode 100644 arch/powerpc/boot/dts/wd-mybooklive.dts

-- 
2.28.0


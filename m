Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5D1851E52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 21:05:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=C11Iw4bH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYb6D2FKfz3dVS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=C11Iw4bH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYb5V4fPQz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 07:04:29 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso2844110a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 12:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707768266; x=1708373066;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oHyBDS7WaykcBxou7weKIofyX0CqedvQH5iZaXyJUSI=;
        b=XqnC0asvUzrYLV1BoCks9uC121Df1/KoHpkm0PTcDGRgtpV+D3ve4m3c/XrZDer17i
         Qi/G0Sp52mO9zyzC+RomrQLtCsSMQJ5ulzAFYuvFjoWu+KbQl5GiekY4p1wAt6mwOz8P
         Rs74A9MGPQIMYXdyfBecoMUezH3BQePoxjG1bRcfaRC2kovSvMO6dyPtwR/CN1zIiOdF
         EakOMnKKMIqncvr+6gkVg6rbjwY5SJeg4AmLWSdwTZKgPsfULT3z9PPJQXwLG2Cud4Dx
         V3iVMz8CH4e9LYDHIOHZ3yq1D1i/IZCsZbCH6HPrBWUDU/aWHs7b7eQHQf53UzwYFX9x
         C5fQ==
X-Gm-Message-State: AOJu0YygPKL6kqvktUs7pV+WCUwWtZ6h/Cgfgs1AQx9yLvHdxUJeg9Nf
	gX35pt8SiMeKBwumT7Dzm1HZSnYPt4AfKM4kOLTbC+cdhiGH13+J
X-Google-Smtp-Source: AGHT+IEMGnpxGT56LrXgCFndTnvCesBsLlgnBQKvMecarsRHN8zHvIvLfxyta8lDj4PhdImTon3wBw==
X-Received: by 2002:a17:90a:348d:b0:296:1bf4:e797 with SMTP id p13-20020a17090a348d00b002961bf4e797mr5843091pjb.39.1707768266250;
        Mon, 12 Feb 2024 12:04:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXedhrpGpeN/mZtKPE3iUbsChTf1bVigu3+DpaD6WA1ZRSMHipyEPQETX+Lv3vb7jJTFxad2niSeQ0nFqmkqb1V6Wdu7sSePH/lfNh70NjSKNo1UmzG6x4+UuBYaktj9f/fsDdGeAWlUoniKT2TpmdQMMIucI6BHWDFDtkrFx3ygS9fIWUyDgzKIkGMxTp2Ec/7BeAXhUyjdzBQocBe8QhMsIKm3orsx12oMvDGqy9A6KlVAwQGycr8f7S3LY08eGrt9G9YONShmzflbA/T
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id mr1-20020a17090b238100b00296bb0b2f57sm938628pjb.21.2024.02.12.12.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:04:25 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707768264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oHyBDS7WaykcBxou7weKIofyX0CqedvQH5iZaXyJUSI=;
	b=C11Iw4bHxhH3M1/VOZDftgEoILCd3GlmfqDD6dN8rYyZx2g2Sp+nSDeKFmFz+xeRSoZTMC
	o/esB8Z/s3cn9XVMaNMOzligTd4fszB7Tk0VPT5NkYWopLDiBlS5yp96lfg3w/kPDmV8rj
	rgDZBJmItUwmszZhwSIHvK5LNoiH4/QxP5lDv9nFqYRRAe1fRJlLLpbapf+ag4J6ZFEZD6
	a5M1V7Jom6t/8mgk2K1gMkp7h/+a6mtKccz/SbvRndbTpm1r4HFIi8XAcNHozQgCH/b/KN
	wjOTK3j4l7hDKU9zGK99eV9tAI1BvoT3ilGaB3EKB6HKlWWEIKAQMuH8yBSj2A==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH v2 0/5] powerpc: struct bus_type cleanup
Date: Mon, 12 Feb 2024 17:04:58 -0300
Message-Id: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOp5ymUC/4WNQQ6CMBBFr0JmbU1pEKkr72GIacsgk2DbTAE1h
 LtbuYDL95L//goJmTDBpViBcaFEwWdQhwLcYPwDBXWZQUlVSSW1sHO6uxGNn6OI4YUcnRKVbip
 V985Z3UCeRsae3nv21mYeKE2BP/vLUv7sn+BSCinO2pzqzhm0trw+DY+EjEePE7Tbtn0BD9AKR
 7sAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=46m5kgpYafsjbmkgwgaR3UEdg9F5o1nC2dyStdDKowI=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlynnuMoCq0skqVLkNyeXmP6y8brBEXCdxD+d4j
 tgdu4ncXBKJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcp57gAKCRDJC4p8Y4ZY
 poMsD/0RvTTqHv+De6ldjUB5U9FVw9LSQpxhixM4+Vea1K/AUn/X06Slrqk2KGuB4t0hNee8q3+
 CMCyqcE2Ggdf618CxQ0Dl04JBWol8rgcOuFCv5xnnwOFlBT173GjFuph2qS900Q2SBPK7fmDSec
 PaJOmu7VZ8n8rGzUrdc0sHTwjeOyqHxrCTGdn7yU7aCtHn2IrxTr/9Zj/TMxWeRRU5p8a8Kjw0n
 D6NmhGLwHfiO02H+hZW/uoUmD4jixo6aSQp8RPi12nbO3oWIhCK+CASr+SuhfRIg7cou3QWwT1s
 rCVKOeHT2alFnwWWxlgv/XkpMR4eixScTnzR2a4joKjAOPEzOdmWNujmfXX4hUswjGbapkjSAIl
 wIqGSwcTYUUeLFP7kW4YeieDJ3Q9YUCBHlNZhYQ8M8Y1NSINCbrI5liJdt0bf9gaNCgCbFtlo5h
 9L6C1h6idOImKJ1I+HXKM1H3mIiprbc9tkBSvBSoyIZjzZhFQCyqfLb/mR0Ns0Uar8UrPysS5SW
 RIffqFjxOCAD5xiU8ldo3hl3ycstEVZjm7BRUi4c4s9kSSaidl4c+KObiMQABynvvcyeEzJ5p4B
 xOv3MBK0yzo8iUV59ZtVpoXd5IVbGP9/e+GC8YlUMK1FAVbsgprDLUtuS1CjQdkXSlH0lRx3rkq
 QRUy+o6OPIZ9WSw==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]). Patch 1/5 is a prerequisite to 2/5, but the others have
no dependency. They were built using bootlin's without warnings using
powerpc64le-power8--glibc--stable-2023.11-1 toolchain.

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Changes in v2:
- Added a new patch to make macio_bus_type const.
- Improved changelogs to remove the word "Now".
- Fixed a build error: https://lore.kernel.org/oe-kbuild-all/202402102142.uphiKeqw-lkp@intel.com/
- Link to v1: https://lore.kernel.org/r/20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net

---
Ricardo B. Marliere (5):
      powerpc: vio: move device attributes into a new ifdef
      powerpc: vio: make vio_bus_type const
      powerpc: mpic: make mpic_subsys const
      powerpc: pmac: make macio_bus_type const
      powerpc: ibmebus: make ibmebus_bus_type const

 arch/powerpc/include/asm/ibmebus.h       |  2 +-
 arch/powerpc/include/asm/macio.h         |  2 +-
 arch/powerpc/include/asm/mpic.h          |  2 +-
 arch/powerpc/include/asm/vio.h           |  2 +-
 arch/powerpc/platforms/pseries/ibmebus.c |  4 +--
 arch/powerpc/platforms/pseries/vio.c     | 61 ++++++++++++++++++--------------
 arch/powerpc/sysdev/mpic.c               |  2 +-
 drivers/macintosh/macio_asic.c           |  2 +-
 8 files changed, 43 insertions(+), 34 deletions(-)
---
base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
change-id: 20240209-bus_cleanup-powerpc2-498426fccb98

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


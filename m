Return-Path: <linuxppc-dev+bounces-13026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F8BEB2E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 20:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpCjj0F4lz3cYN;
	Sat, 18 Oct 2025 05:18:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760725080;
	cv=none; b=SIugWVKDVRCejRL2yX27e0wHh5oy1bTjwCAefNf7Mi1u0KBGTsty1c/TY8b87S0EgjgdUdGxeIDY5fJfO8PNpTaN1Jc683/K6lHIrwn46vypbUPYM1cgeQSmHFhmloG7aZv6SiV7NxWdzla9n52OUk3u4Mkl/G9y3F5MMoRCExTTBw8mjAE6wXm3eAkOmc6O9dySQ2WeaG2z+bz4BO3ETOcb2d7dageSmRoSZOWOGsqSMfzzCSg1Nxbwn6e91fZbGPNMnG44sV/QY55QPmLy6eApcXo3uaJ1s1EG2p9lKlqc2WRkvCqvGql/qWmwmorvBF8Ebm5Tsvt/5iiF+pvdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760725080; c=relaxed/relaxed;
	bh=TJx67ud9DOLcGJpcNiwREKvNyLxjpa6gf/QVt67SlS0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Vpq1N0YDOGn1YoJheAOWA9mkyjqLcLx/4t2sBcaeM847BGY6xqiskTBP7Hx6Qimq+ug2BM0F9x2NuV0cuHFp7bjQUsZQUP6YLdhCVAuKSd8BRd04nyzC668C0LbHLN1F/rqoeZVaNtASIiAwS6ai/+9Y7v+qTVDGTxGrhV3nvjRp9koyG6t7iwV1MoJ+f9Y1K5krRl9p2rvFEoC4bZPuGLk3l08VZ+JbyopvgoN2n2XCsTjtY9NQ92rdUxlsI0z7kpzUU/o8e5Y5ZLLiCDM/LPnGco2xJMVJEY91W2sp40VF/v3TG75PDKpCbnIWATtwgKjJH8qZxD9U9KZ5N4wHTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=YEpVRdoQ; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=YEpVRdoQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpCjh2tDZz3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 05:18:00 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 228748288041;
	Fri, 17 Oct 2025 13:17:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mSaYZQkuW1Za; Fri, 17 Oct 2025 13:17:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0B2FD828916C;
	Fri, 17 Oct 2025 13:17:57 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0B2FD828916C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1760725077; bh=TJx67ud9DOLcGJpcNiwREKvNyLxjpa6gf/QVt67SlS0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=YEpVRdoQa6rJZCMp4b3Pmuz7solJ6w8yI8NO+jwFR2gOFWOPsgMYzcOJCOm2gucU3
	 AaukxG24QsylETNVPuk9cvmW5THEe8jrm2mFCGQXYW6FsUdF9kBVkg1FtwMwGi0uJx
	 TJuVqO+oG6ubKxTVpzySg3uZZqsWo+1nPEjIO40E=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wxDQM_w1ivE2; Fri, 17 Oct 2025 13:17:56 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id CC8A98288041;
	Fri, 17 Oct 2025 13:17:56 -0500 (CDT)
Date: Fri, 17 Oct 2025 13:17:56 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Dave Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
References: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 1/2] PCI: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
Thread-Index: LUG2F4YDIH+Na1U3fGLanAwWnSRh1m0u5uA+
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Certain hardware devices, such as the IBM POWER9 CPU, transparently swap PCI
bus MMIO data endianness when running in big endian mode.  This transparent
data swapping presents issues for certain types of BARs, for example little
endian framebuffers, where the device driver needs to be aware the PCI BAR
is now appearing as big endian from the host's perspective.

Introduce CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP and enable on ppc64 systems.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/Kconfig | 1 +
 drivers/pci/Kconfig  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e24f4d88885a..0e75fe570389 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -314,6 +314,7 @@ config PPC
 	select OF_EARLY_FLATTREE
 	select OLD_SIGACTION			if PPC32
 	select OLD_SIGSUSPEND
+	select PCI_ARCH_ENDIAN_AUTOSWAP		if PCI && PPC64
 	select PCI_DOMAINS			if PCI
 	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
 	select PCI_SYSCALL			if PCI
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 7065a8e5f9b1..fccc01110763 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -40,6 +40,10 @@ config PCI_DOMAINS_GENERIC
 config PCI_SYSCALL
 	bool
 
+config PCI_ARCH_ENDIAN_AUTOSWAP
+	bool
+	depends on PCI
+
 source "drivers/pci/pcie/Kconfig"
 
 config PCI_MSI
-- 
2.51.0


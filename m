Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1D7A55EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 00:50:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=XDyAGqfx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqKkZ5hmZz3dC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 08:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=XDyAGqfx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=n8pjl.ca (client-ip=185.70.43.21; helo=mail-4321.protonmail.ch; envelope-from=peter@n8pjl.ca; receiver=lists.ozlabs.org)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqCCp4zvxz3byH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 03:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
	s=protonmail2; t=1695059779; x=1695318979;
	bh=KDmGL0149HMvYz0D68P8rK9iJncYI66ZFd51OEaftAc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XDyAGqfxs1IhZyrSbs3kXmWVIDtAAGsbXg/jRzsX7fuS5Oxw4QNBzYWsvFGPZ+ksw
	 S5Zcze4DfsU+j4F71vMZOBVGe3BZKYabMh1wfnbZ2ABquD3iq/MryJ0VB04GGHqRW3
	 gnQBHdLwQI3E7N3+pV5UgFQGhEjTazGFHroCb4KlhwP9A18gG508T7Pqs5jbffIgxO
	 cUkXsv81IXGY6O6u6TWRNYFNwN9rAhwcn1b7zAnxuUbHTSaeD2idJu0SKxFygNCYtF
	 S9e7CJc5qlz+kEo5lV3WyEyT1tOTgZkgAyKcyZB3b18aHv/xFJwzM9+FJT8sFeXCTe
	 SfZ1idLrRGTVw==
Date: Mon, 18 Sep 2023 17:56:09 +0000
To: reiserfs-devel@vger.kernel.org
From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Message-ID: <20230918175529.19011-1-peter@n8pjl.ca>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 19 Sep 2023 08:48:37 +1000
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
Cc: tsbogend@alpha.franken.de, jack@suse.cz, linux-sh@vger.kernel.org, ink@jurassic.park.msu.ru, richard@nod.at, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, Peter Lafreniere <peter@n8pjl.ca>, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, richard.henderson@linaro.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ReiserFS has been considered deprecated for 19 months since commit
eb103a51640e ("reiserfs: Deprecate reiserfs"). However, there are
several architectures that still build it into their defconfig kernels.

As ReiserFS will be removed in 2025, delete all ReiserFS-related options
from defconfig files before the filesystem's removal.

The series is intended to be approved/rejected on an arch-by-arch basis.
No patch is dependant upon another in the series.

See discussion originating in,
Link: https://lore.kernel.org/linux-um/20230918125744.4342-1-peter@n8pjl.ca=
/

Peter Lafreniere (7):
  arch: um: remove ReiserFS from defconfig
  arch: powerpc: remove ReiserFS from defconfig
  arch: sh: remove ReiserFS from defconfig
  arch: mips: remove ReiserFS from defconfig
  arch: m68k: remove ReiserFS from defconfig
  arch: arm: remove ReiserFS from defconfig
  arch: alpha: remove ReiserFS from defconfig

 arch/alpha/configs/defconfig                | 1 -
 arch/arm/configs/pxa_defconfig              | 4 ----
 arch/m68k/configs/amiga_defconfig           | 1 -
 arch/m68k/configs/apollo_defconfig          | 1 -
 arch/m68k/configs/atari_defconfig           | 1 -
 arch/m68k/configs/bvme6000_defconfig        | 1 -
 arch/m68k/configs/hp300_defconfig           | 1 -
 arch/m68k/configs/mac_defconfig             | 1 -
 arch/m68k/configs/multi_defconfig           | 1 -
 arch/m68k/configs/mvme147_defconfig         | 1 -
 arch/m68k/configs/mvme16x_defconfig         | 1 -
 arch/m68k/configs/q40_defconfig             | 1 -
 arch/m68k/configs/sun3_defconfig            | 1 -
 arch/m68k/configs/sun3x_defconfig           | 1 -
 arch/mips/configs/fuloong2e_defconfig       | 1 -
 arch/mips/configs/jazz_defconfig            | 4 ----
 arch/mips/configs/lemote2f_defconfig        | 3 ---
 arch/mips/configs/malta_defconfig           | 5 -----
 arch/mips/configs/malta_kvm_defconfig       | 5 -----
 arch/mips/configs/maltaup_xpa_defconfig     | 5 -----
 arch/mips/configs/rm200_defconfig           | 4 ----
 arch/powerpc/configs/44x/sam440ep_defconfig | 1 -
 arch/powerpc/configs/g5_defconfig           | 4 ----
 arch/powerpc/configs/ppc64e_defconfig       | 4 ----
 arch/powerpc/configs/ppc6xx_defconfig       | 5 -----
 arch/sh/configs/landisk_defconfig           | 1 -
 arch/sh/configs/titan_defconfig             | 1 -
 arch/um/configs/i386_defconfig              | 1 -
 arch/um/configs/x86_64_defconfig            | 1 -
 29 files changed, 62 deletions(-)

--=20
2.42.0



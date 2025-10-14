Return-Path: <linuxppc-dev+bounces-12852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87802BD9895
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx16mRgz3cYH;
	Wed, 15 Oct 2025 00:05:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447157;
	cv=none; b=mcnddZs8/DhuI4gCgQoAPijSNtIBdDvk4dOMFDQ3evzGzX2TIXdmpwVIxHY+MLuAnGMs1oePelvrCZy+6Pc1FoP5lxv1hZCeUwT6gpzMZWV2ivv4lW15SIXVRETgcTTQCLnMYKe5jqjJI+78Zo12Jf7Wng4c8qZWb6IA2REWgWOIz8a0hZ9CpVPdzO9JbUDtEu3rrzu937a8FiOUJBmMTuhPhZbHWC7U1O3WOQzFutU5F0/okmoD3dJNbvIlLN345dX95UFxk1Vgi9UA1Mv8BayZxl58Zfa6XvZT54YM+PfLmQk07y/Zf7ah2tDVsmvXVUy2olOg1rieCQ1TVYf88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447157; c=relaxed/relaxed;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cry6w0AfADMMZvDq2Q2rto7eCTEyZICBSDoHveNI4sgEzPqp+rlnfPtTuiLU7L7+ybwVtETBHUsN7ypU/qWW9LUcVlVmCo28Sn1/+jlYCmAwYuMToEBvl2P1wYi9LwTqS9M1il2tuWy+nHVLFlbWg7HU1+NF+Q1xIozIQ5eetsNZwzQ5ocA+5xM/uD/GFC3CHkkVFzZ7BnuND9ttFW1SbikVAqPCHeZW3ecyCH5ozdPD2aaOfGxB30x26uy64vHPUuDv5MqD+vOS9sJmvBN1D6dnnoGzfLhNHSoiI/dBLOT35dP3ZeYPgyS3imsCSdqrSmHWx2GZGnomC20tzd/4QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=18Vfa1VR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s9uz1WXb; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=18Vfa1VR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s9uz1WXb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx06Lnvz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:05:56 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	b=18Vfa1VRutbhgbwNI48uwRFrpTeK2iXMNNTzbDO0N7x5xONQbK5szxonq4ynVgVeOR87f9
	/+dAtUgG+zz8okIOlqkYHW9vY7SNupVCUbTCAqxN7EwLA1hzMKiXwWbVBQ9DVEN/ssMks+
	RqDArBFm87CsFc2oSx+Dv4YpO/+fKtgNsszjib2frMB4kascP6vDibG2NAlRKZT943QWaa
	4mfweieMQ011LjiIYvfP1TGplFbYSC7aCT7dAqz00Wny5AkFg4vyB285fS0T5qFYa6MVxE
	sGWYCA/M2PuyV8MB8h7ezU3qRTZ9gJtE3qJTK2ZBsEgJP5Cg22uDTnqXzKBEIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	b=s9uz1WXbQUnSkz0696jxjnrvflf58GlYGmSwbNzRqndYmmv20g7+eUgK1BDUYWwmkhWTAe
	JKbsLnaYtHUjhaAg==
Subject: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Date: Tue, 14 Oct 2025 15:05:15 +0200
Message-Id: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAItK7mgC/4WNQQqDMBBFryKz7pRMVLRdeY/iQk3UoZJIYoJFv
 HtTL9Dl+/DeP8Brx9rDMzvA6cierUkgbxkMc2cmjawSgxSyFDXl+O4DLwpD8lZnJ489bx5FPhB
 VqitUKSC5q9Mj71f31Sae2W/Wfa6bSL/1XzESCpTqMVZjQSTqvFnYhM1Zw/tdaWjP8/wCCbSiJ
 L4AAAA=
X-Change-ID: 20250813-kbuild-userprogs-bits-03c117da4d50
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1841;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nwdxilI0gCDF3hCKssRA5tQbRafKabX/iqdQVkTDYQU=;
 b=MxoQo1TizE+S8bqU4JcnOVpUGYj4wmq5FSvunih7gRn6DU94kLSoa3uxPTVhQdnPvJtR0bw14
 Kuj7ZjOyybgA7859XltD841WYT6mM+WPK2cYwKR5+PQFZK7588LnrSg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current logic to inherit -m32/-m64 from the kernel build only works
for a few architectures. It does not handle byte order differences,
architectures using different compiler flags or different kinds of ABIs.

Introduce a per-architecture override mechanism to set CC_CAN_LINK and
the flags used for userprogs.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase and drop already applied patch
- Disable CC_CAN_LINK if the test program generates warnings
- Move to architecture-specific logic
- Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de

---
Thomas Weißschuh (10):
      kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
      init: deduplicate cc-can-link.sh invocations
      kbuild: allow architectures to override CC_CAN_LINK
      riscv: Implement custom CC_CAN_LINK
      s390: Implement custom CC_CAN_LINK
      powerpc: Implement custom CC_CAN_LINK
      MIPS: Implement custom CC_CAN_LINK
      x86/Kconfig: Implement custom CC_CAN_LINK
      sparc: Implement custom CC_CAN_LINK
      kbuild: simplify CC_CAN_LINK

 Makefile                |  8 ++++++--
 arch/mips/Kconfig       | 15 +++++++++++++++
 arch/powerpc/Kconfig    | 15 +++++++++++++++
 arch/riscv/Kconfig      | 11 +++++++++++
 arch/s390/Kconfig       | 11 +++++++++++
 arch/sparc/Kconfig      | 11 +++++++++++
 arch/x86/Kconfig        | 11 +++++++++++
 init/Kconfig            |  7 +++++--
 scripts/Kconfig.include |  3 +++
 scripts/cc-can-link.sh  |  2 +-
 10 files changed, 89 insertions(+), 5 deletions(-)
---
base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
change-id: 20250813-kbuild-userprogs-bits-03c117da4d50

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>



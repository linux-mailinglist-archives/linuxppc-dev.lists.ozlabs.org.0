Return-Path: <linuxppc-dev+bounces-570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650779601D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 08:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtHrv15Wvz2yRD;
	Tue, 27 Aug 2024 16:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724740623;
	cv=none; b=jRspxEqTS0jRkjFX5q0R9D5IWND9zwWB4ys53l+s881oYCRHi4psU13xn5+Fu4vepK7fZHXhyncdYxSLn724GT/13Vb5vV/srxFdQWW+kboDVe6P1d08IQBuXmkopyOruwl1A5u8YXf6xHMUEMd8NeRkIHZIp2dF0rs1vIFN+rHBiZEv1T/yJDr8zbwoMl6efz3xNyeXYSCEao/rksoS+cwrb3PFGqDeqYmQy00PdFPrenJSTtFSD0INFHfebRtXnNCUA3MjbcOdhdCmI8U8dc3H8C1kexlmsgqKR9DAuvI+Pxkj9L54lNVAieQi/3nvAXzy2r4lqCETSiI3+oKMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724740623; c=relaxed/relaxed;
	bh=YtXQ1b+AHiYzvhi9lLvKVXsirFFKMPBoc0aah+APMNA=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=VqBbS+/M31PDxTUAC9Sfh19YNcEKh9DUWgc40wWpNl+gAdoNThISsSx9BihxrGqUNcPCvNsYHWzpJ41EvxtulKJgcJaW9McijiU4KE9ZSinl08mg4uQlAH2uZH671Abz5paWyXn+Dp/cpU0S/ug2XhiLLxfZeQ27RcZjBfi/BA5oQWa8qygc2QVZGDaRYoxBx6CXEbx0rLVgWccT1M/Ap+PxlmFh6M2G4C0jD79lus8N78b2AZWazTnxgePJroRBZKzMAUYVz6SnsRX6tjqJDu2lMS6GyrNmSpCFI3qq3XvrTyxg1RN9eWL885SH/0mFneyM24zWV0jvXovAF0y7Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qflEZINF; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qflEZINF;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtHrt5bhkz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 16:37:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724740622;
	bh=YtXQ1b+AHiYzvhi9lLvKVXsirFFKMPBoc0aah+APMNA=;
	h=From:To:Cc:Subject:Date:From;
	b=qflEZINFFfc4eT24aWEhVpuHbI/WjUWgY8ltXDApgzjEKIQy+hyXdvq1CArIIMwm5
	 HV1g45slwrWEZp5juzWB5k33zoQTfDxkalHD12d7shDFEaqvnlWOzUWXmHGldfqk0h
	 O5JP0P3s77f+AY1XcKlQGajmQVwauD8AGvhiPVBmzQX/TMxE6Ly0sy5UWYJAP29FoS
	 aMjUOh2T0oOlVCYF0/tO4A0TlVKMZy2+XlRhZg+81DFoUZzLqUnJNB7gR/+WW94llE
	 6qtjqLGvehe9Zn+CG+8hW3/S0A+W2Dg/x65qi2twHMvyu+eCQ8xVUmkoP+rbY2c7Xf
	 6dTvq0giv5fzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtHrt4Chxz4wnx;
	Tue, 27 Aug 2024 16:37:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: powerpc: Add Maddy
Date: Tue, 27 Aug 2024 16:36:51 +1000
Message-ID: <20240827063651.28985-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maddy will be helping out with upstream maintenance, add him as a
reviewer.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 878dcd23b331..0ee724dcc05a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12912,6 +12912,7 @@ M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
 R:	Naveen N Rao <naveen@kernel.org>
+R:	Madhavan Srinivasan <maddy@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
-- 
2.46.0



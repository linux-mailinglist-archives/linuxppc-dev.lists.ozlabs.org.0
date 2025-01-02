Return-Path: <linuxppc-dev+bounces-4582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0D9FFE67
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgQ0p3Lz30T1;
	Fri,  3 Jan 2025 05:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842753;
	cv=none; b=QiQFElMMJMq88uLw76PmzBDgVuDpFOsHyT22Yz40gW8UH7ybUpAS7AjJCrImZwizv5pCT2Ndy6dhu/vmx+qsmqEAt64Ryw9G4HW2yqnmQvVAbXESVH8ZA7p1T7bXOaHCMDEyGSU89GUY3eSd/JjMXMBki8CxRGlkeO2iJ99EYACMk9SproB0M4PPL2ZHBb1osM3w9uBHwWONa3lrK97uR4dj2uJKHlfWONShLXQQici9PLqnFQiO3qJv8Z3+xzYl8M7FJVvcNmmFNReIWLYDTWu1c/QdR94K8KJA7H4blkhUWJguKiEfiPTkThYRRbIg8i5UVm4GLKUxvgKWsdduvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842753; c=relaxed/relaxed;
	bh=pr//AWH5axI1Lc1MuMhQ+zSacl5po5TkOFobw6rnbQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQIPPj6MD0NEL7T5MQ5jcM4/Njq7WtUcDOcqr3d48uenKBa6KG61S8CQrAkj2CMhI/ZJ6pEiYAhOeXZzC+tmFyf1wQArja3IUtxif3tkroSog57ePyc+TRAzktBMFFR9we7iqodtGXsbQwO4jHMs56vXzpdW3KakOT1ecHjZ6VahYJOW7ZysM7QrsaAy5B5Nk+COJKQTsOMdsLWido8kpQCkmTtSgDYoMNy25WqtNxpT38LLSY200NhCll3/S3jzwe3aqFqkYBtwpcXRWLNeE/yoltHB16NdzhidnZiShxmavsCdeTxIfpuQCpDzE0u0+NrzMjBdA50LmEhOiwoiEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ueHE2x0P; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ueHE2x0P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgK6Chxz305n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3166A4145C;
	Thu,  2 Jan 2025 18:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D39DAC4CEE2;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=/r7+wKhmpuwizXZEWKLGTtNGPZdCjwDwKJndEwbewKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ueHE2x0PBfzsWJl7NXiYBXU4wLdFdwtHAxEoLfIC+HkW8HhYTRKfCzDs6IdqsnlLX
	 HsQ0ivUBPy5TQQU4vWGpfXQ2UNbw0Yig3CxtlRqRCVo5dxQfeo0ZbtGXc+SLv0g5ID
	 zSpTsTSB7FChrsq+4ffLy7stZ93YydKe5JUq8WT+z2HM0E+pnDoGOK6eGWX779H+ix
	 3M1BW7VXBxTmheYOWfg0oKwlhSoxBZdMkTxub/ci+rm21zfCn5ZYZrAVfa9sqx0rMt
	 7woYoN/nVxwN07omW5Sl8esphIfCPBRgZwa7ssM6tkTRIS0sx9G+cTdmQtZz1p+Tcz
	 qYAdN0uAU7+Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97DBE77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:32:00 +0100
Subject: [PATCH 19/19] MAINTAINERS: Add entry for LANCOM board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-19-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=747;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=dAH39hTNAFd2Gn5pb9BXoNF53Untzct7/Ny6B9T7rmc=;
 b=JbUR+WMaOFgpoRGjfGRqrBOPDgnsyxY7Nup2gMAnp2r3UNMzcEwns5pKruLl7F84UyqvM5QId
 sJbADWCBw83DtJgSJAT7pJj+IAa5Cq7WldU6YJFkVO7S4qLA7JrKVnw
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Provide a contact for NWAPP2 and other boards.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a882da5b49ce5bd55011b93f28c32..6d4717cf7c19c25aa50c5cf1a7956797225a1d21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12951,6 +12951,14 @@ S:	Maintained
 F:	include/net/l3mdev.h
 F:	net/l3mdev
 
+LANCOM BOARD SUPPORT
+M:	J. Neuschäfer <j.ne@posteo.net>
+L:	linuxppc-dev@lists.ozlabs.org
+F:	arch/powerpc/boot/dts/lancom-*.dts
+F:	arch/powerpc/boot/dts/mpc831*
+K:	lancom
+K:	LANCOM
+
 LANDLOCK SECURITY MODULE
 M:	Mickaël Salaün <mic@digikod.net>
 R:	Günther Noack <gnoack@google.com>

-- 
2.45.2




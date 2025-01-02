Return-Path: <linuxppc-dev+bounces-4572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 568989FFE47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:32:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgJ5cfzz304C;
	Fri,  3 Jan 2025 05:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842748;
	cv=none; b=gdwbI48Bj4tD6E6runpwBOEbL+TCCxLa80I9c5wDxXZdI5Iv1ngr443MXkPMN2ve2AdOO7JUrfL5VKdofnvWKbJmRoAJz/V9xN8pJ/QJv112tzKhKzmgd/OtvTEL5mC/32ZjXQJ+ogzuFfDZRbCOr9E3GqeVatxDC92kHaJX/OZdARMn0twAgjWuijHikoPHlbYCqa+ojXC0U8Dc36suSxkVVdl1Nh+mvpnYufDVOX9R9+cM9Oa5sv6+HJpqYY3AgxKi/o8PW1G8jIO2FS1fq4eI3S3IgZ95W3ISwTrNaAvTO4BDQ28ITKG6g1MNT9Btule1QgwPMm7VjhWPSzMrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842748; c=relaxed/relaxed;
	bh=fnnOMyjrtEZAj0dKme1eOtu/6XVFE4eNzmBhVFBaMEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnqazkPsuCvb3tJ9uacScF40HPHtzx0jZn29/hEgT2RVQvaTB1At0NCXpcg0mb0JC43AkrmeiHPqHpVCJHiG8ZFJCs7flC3cG0WN5dE0mbzhHMwxYlWQJxSX6tBZmYWTRSI0FcKauz3CHzqraThaebKE1GzF8OlIBudiGAyKbqoTEfwqgBZbQ3vVZz+0vlxsHr/FPB8rwmmLJNNqFWqIkSnR/UPZ2lFFhha/fXJGU8yA2phSm7H12HJ0QQNtEKefio/t3zIk9ArsvL3NOpbZXXvSEeFSFcsPqF5uifoDHEQTt3NLRHjc9BEy3yOaVbg+LIIuMqS2A1m21ZohDv9SwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I+5A8Ctr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I+5A8Ctr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgG2nF3z2yvn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E72A5C5DC2;
	Thu,  2 Jan 2025 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF02DC4CEEA;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=2srrLyTRgX4m7OtpfeP/Huz2CwE+YlrW2T3rwErpCgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I+5A8CtrF27j5RARWMbgi2VYd1BTVqmE5vvAJcdIugqpkKpd37tyYui7KvQUybgMe
	 0g2fvsB5LduhL9VwYfUmWIr21hkn5YHu0MHbYJTR7c+stApTVuWDk9J1uqRKs0S75h
	 aTZLxx5W9NNJnNWRBu7YB15oW8bGvnN+mJ+Pm9GyaqZmCUveBTkwHjbr9CUUsKCU6U
	 nt2m9hapAmARyrq7Vn8AXhePe/fxl2uWLmvZ544p4gcw74G4sxSVbnUO7VTl82IVGM
	 MdMpQYGZ+97dpahwpV4yx38PYXiBYMN7aF61LIFzMr+0bsBoegCl+MGDrfaqqPdMeH
	 LukduV139/I+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6216E7718B;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:47 +0100
Subject: [PATCH 06/19] powerpc: dts: mpc8315e: Add missing #cells
 properties to SPI bus
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
Message-Id: <20250102-mpc83xx-v1-6-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=702;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=NGog7jJ8LoqfdQSewm8qpRr6JKendRjgTEchw06j2Sw=;
 b=VOECrtBjonUvDKztCwI/1P6FQh2InQlLhaxoEBEYIKZcGT00WtzybtKWtCEnhdX7KgjqGFrAP
 JbaC+XNS25pC+3bOX5AhFZt5TTtAa07uaLS/EQIa010kRMx7bqkY4vo
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

These properties are required by the spi-controller binding.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index 7e61a78850433fa43795a2a5fb06ce6a148bb11d..f9d1b48b08799822d33f5e7606030019a19b4743 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -88,6 +88,8 @@ spi: spi@7000 {
 			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 

-- 
2.45.2




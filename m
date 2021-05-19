Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B6388D80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 14:06:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlWmp5ztfz3ddq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 22:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlSfx32sWz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 19:46:01 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 39540F40629; Wed, 19 May 2021 11:45:57 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH 2/4] =?UTF-8?q?dt-bindings:=20nintendo-otp:=20Document=20t?=
 =?UTF-8?q?he=20Wii=20and=20Wii=C2=A0U=20OTP=20support?=
Date: Wed, 19 May 2021 11:45:44 +0200
Message-Id: <20210519094546.3954-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519094546.3954-1-linkmauve@linkmauve.fr>
References: <20210519094546.3954-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 May 2021 22:03:54 +1000
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both of these consoles use the exact same two registers, even at the
same address, but the Wii U has eight banks of 128 bytes memory while
the Wii only has one, hence the two compatible strings.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 .../devicetree/bindings/nvmem/nintendo-otp.txt     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/nintendo-otp.txt b/Documentation/devicetree/bindings/nvmem/nintendo-otp.txt
new file mode 100644
index 000000000000..b26d705ec52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nintendo-otp.txt
@@ -0,0 +1,14 @@
+Nintendo Wii and Wii U OTP
+
+Required Properties:
+- compatible: depending on the console this should be one of:
+	- "nintendo,hollywood-otp" for the Wii
+	- "nintendo,latte-otp" for the Wii U
+- reg: base address and size of the OTP registers
+
+
+Example:
+	otp@d8001ec {
+		compatible = "nintendo,latte-otp";
+		reg = <0x0d8001ec 0x8>;
+	};
-- 
2.31.1


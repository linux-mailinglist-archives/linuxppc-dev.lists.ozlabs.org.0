Return-Path: <linuxppc-dev+bounces-14654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9BFCA88F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 18:22:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNJ8W5Mpqz2y7b;
	Sat, 06 Dec 2025 04:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764955323;
	cv=none; b=TIN9hy/tnmqBnXoAuYCjy5PkWqJOEHkrWBwrArqtgMr8QODnGHpBiabJZCyL7kjfy4kaDIhjDHygcxsBUtXCXfme+w4zkDxVYFPG0KV5pNqDk5vZ0cw5HkzMzjYSCXrF9nf2kCaD+y/Syno9Ko+UWpZCTXeUD4VULlr78MI4BYC4Av610SirpZCj3z/0hI3bYJuKyvLhBREJyeH9S/6JnUkLf4O1lDVfj1Voq9IUbjrCsYxcLrYeJXXh9upiEqflbVhRANP0CIIK7yT9RwzHMy/TTAsq0kGbxU6p+3AneyDgvX03xOfQl9O6a39Nlr4LuGfgwrKd87TgaK1Qb1m1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764955323; c=relaxed/relaxed;
	bh=UZCQZm4mibD//j04osocVMx/xPMdekYmVSEU/NvjAMg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Z+l4qHcxuo9vT++qXViUpdVfrpp0imQwm3rbgvXdwuT/o8NfiSbrRGdxquW0+O+i5U3CDDBArSqDHlzLf8y4h5nQHc2qHZTlm2H8cMXPQJlgXCSvsNdQwYQ2QU8yKi9BVWv9uWFxbpmsx668BugZhZg53h5wHZpo8NyZIndpSq91WmuNNmRZ+b5w94SAij9ooRf4hN9FxyQFQQBYdgCsnv57tpoulCi9h5sWTBpBstty73wB2P2yHx4/CvZUg486GQ/otewlLFakr0PFqVViHh1qbll4d0/porH07ymU1DdmUZbw14eUbUSzkES7ltgdXOpAs40ckChS5r4XJqItfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TY+ACCVx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TY+ACCVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNJ8T6htsz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 04:22:00 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso20083975e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 09:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764955313; x=1765560113; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZCQZm4mibD//j04osocVMx/xPMdekYmVSEU/NvjAMg=;
        b=TY+ACCVxbSXgQ+B7vbB9MJVsWF4tHwesTY0XjzEufZ6B7w29lPle/sePPDpaNtLeOO
         PvEnY5L7h/0S/a5zSnDIRFyvsZpWpVC7nPlPg598s/D6PdHsDRvmKRaUj/llYQT14OM+
         /NAmf+tKmxuINNKFRThJXzMyeu6DpiHBsZ32h9YMoZVxU1XQMgsLDjv6lDU9ZtPgFgJ7
         ghU2L1OMugmn4JFvpdS2JkYPbBNbPg9+VVv7A24j+KZH6x1yBPq/DOaYTZmVoOA5D1Ws
         CsFUsUOfFZ3bIMimyjpKZFjQj+65SriCATTODQIAwf3PhKfFbeRGZWuv0PLjLgywZpJ3
         qifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764955313; x=1765560113;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZCQZm4mibD//j04osocVMx/xPMdekYmVSEU/NvjAMg=;
        b=mQjDDBOVPlRIKevSHD5pYDtP1aHmQMpIUUlENaKPVKrsdCmNeQtFleYhKNPK1gkB78
         Cup9rPV5nAc3ER+ArmArEe7afJHCOKQMW+45yCRQp7hACIBW77jFDCcwtjoxnYc8l/eP
         jC5Lu/YgHp9tfkXo+33l7E9AruxtyUI6yLzaHbu92x4VDulmcsnqHxs+0bVS2ox4yyWO
         HKRqlEpc7ENSe8v/4L++PaOXL3rQZuHg/BwPjY0qWsqZf6OxXHTiEMr5icwjjTk4nydx
         h/LWrzxCrzthkav5nNRlrqJmHK5MEMnR8M/T3TrUIS6j3erMsPrliHP+KInGvLMWwmoP
         Db9w==
X-Forwarded-Encrypted: i=1; AJvYcCVabZDeQxyaDWSInIckf6xyTtznPM0n+PmA4+e3LNmIHpVPVk5bwEjb52NeZKSHIF5GqQ63dDUev+8u89Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWnnfqrVDXEJxn7Uh6jWwhUnpGa5Deh8mxBZrWcSzuiV3OdyeC
	xXabMVpVLpeuGGKGNIlykHRO7DBUGEB9RnesIIkdYI7l2OtBReQd5wai
X-Gm-Gg: ASbGncv9CUj7EJ/DmpxP0MaCJ4koxewFUqDw9+OArut/qYr15tmp4oYAHevnjj0J02l
	g1RLvxFiYNZAkHrD/Lgnf2N/ZW4RPCNPjIQowKaDNeRX244wH+B0rLWBLugDJjBU7YMVaksRE7R
	FL8ChWZ20O7+s1Dgv3lOZEW89RU8h0Juhpf/xSyaOIUkOcNsRf69tcveKAEKfXY95jXsy27u/P6
	/u31NVK/IURktViiITWaAUxJD7Qf35Rd8e3V9kwyYa5od7FI8d0ogRq70KhpUFH053iPQ7l/Y2l
	YLFOLPxKmxlFQ5JbSlstsq3rLzM+Min5K7OoIQO2ctw8W4KQ8fjoBr0cRRsNVycRPA47kTcOIZo
	noDAA8yLPfvwPnMZh5xNw+TV0Fr9p/XvoTQe0/r6lSe3JQ+y64oYnu8lKURaZcomFLP30cRpIgd
	ZJv59yCcOJHJipLhKngIvZrHCxgh76JGFi8Vre5NaITXtn1OgtGeDoouA7EBsF8CwiCN1UQwqrU
	DDRI6d1Dj9Nn+sJEWWyMBcVblTrVOn2ToJqNyxs+8lSsvKtMUC+qg==
X-Google-Smtp-Source: AGHT+IEm4o0h8b1j4bpARx7YuKAwXXTAp9EAESCVyno/gJt9JehnaUTIUnUp8aaB5eTEW+OITqbHfQ==
X-Received: by 2002:a05:600c:1e8f:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-47939dfa53cmr462435e9.11.1764955312576;
        Fri, 05 Dec 2025 09:21:52 -0800 (PST)
Received: from ?IPV6:2003:ea:8f47:b600:41b3:37ed:a502:9002? (p200300ea8f47b60041b337eda5029002.dip0.t-ipconnect.de. [2003:ea:8f47:b600:41b3:37ed:a502:9002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b156604sm61127675e9.16.2025.12.05.09.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 09:21:52 -0800 (PST)
Message-ID: <64533952-1299-4ae2-860d-b34b97a24d98@gmail.com>
Date: Fri, 5 Dec 2025 18:21:50 +0100
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC] powerpc: switch two fixed phy links to full duplex
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These two fixed links are the only ones in-kernel specifying half duplex.
If these could be switched to full duplex, then half duplex handling
could be removed from phylib fixed phy, phylink, swphy.

The SoC MAC's are capable of full duplex, fs_enet MAC driver is as well.
Anything that would keep us from switching to full duplex?

Whilst at it, replace the deprecated old fixed-link binding.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/powerpc/boot/dts/mgcoge.dts | 6 +++++-
 arch/powerpc/boot/dts/tqm8xx.dts | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/mgcoge.dts b/arch/powerpc/boot/dts/mgcoge.dts
index 9cefed20723..cea9bdc65dc 100644
--- a/arch/powerpc/boot/dts/mgcoge.dts
+++ b/arch/powerpc/boot/dts/mgcoge.dts
@@ -153,7 +153,11 @@ eth0: ethernet@11a60 {
 				interrupt-parent = <&PIC>;
 				linux,network-index = <0>;
 				fsl,cpm-command = <0xce00000>;
-				fixed-link = <0 0 10 0 0>;
+
+				fixed-link {
+					speed = <10>;
+					full-duplex;
+				};
 			};
 
 			i2c@11860 {
diff --git a/arch/powerpc/boot/dts/tqm8xx.dts b/arch/powerpc/boot/dts/tqm8xx.dts
index d16cdfd8120..e582487d5a3 100644
--- a/arch/powerpc/boot/dts/tqm8xx.dts
+++ b/arch/powerpc/boot/dts/tqm8xx.dts
@@ -185,7 +185,11 @@ eth0: ethernet@a00 {
 				interrupt-parent = <&CPM_PIC>;
 				fsl,cpm-command = <0000>;
 				linux,network-index = <0>;
-				fixed-link = <0 0 10 0 0>;
+
+				fixed-link {
+					speed = <10>;
+					full-duplex;
+				};
 			};
 		};
 	};
-- 
2.52.0



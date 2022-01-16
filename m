Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E0148FF2B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 22:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcSzV4947z30Nx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:36:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=I8cLSRXI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=I8cLSRXI; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcSWV1X3nz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 08:16:03 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id k5so7363236wmj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 13:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=ZRW3oDhOxGZh12nnFCIRwcL+KGVdvZHn8X1zV+9ZLv4=;
 b=I8cLSRXIcXyA4Kq2yDP6ZcRkV6/IuSdvBN8mh0S+5IHpaYy1QM3dQp/lYGXEQLRxq3
 7Es8XLj10aoY1aGuWL1gmcgXCZKeP1KDkQMmTYhu8xd4AzPMgVTc/ttgwFL4lLHoFadW
 DoS6iUEEvi80m8vN7fwFLKYjpLgGkcLOBW5shTkZ7vy4avnweOaiz4JvgHnrWAID4FHf
 i+kdgO9SHB0zQrZwgqJQxSYDqjyQpaR/ia8xuNUF2lj6+mTfH2SF5W9SBjl6weGSw9Uw
 m9mK+enQRtAOg+3GXvGkoYG3g7oVJaK84GHtxRt4e5jEW0glpPL4cJmdhrISdLDLFTv2
 EZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=ZRW3oDhOxGZh12nnFCIRwcL+KGVdvZHn8X1zV+9ZLv4=;
 b=GFggrfK5Gjomf2PJEzexctdkar9vT7jD/D2rlx+RnNiP73wh8yJMdZr2LUxgU/vaOA
 YSbJgLJRnydh865/s09Px7kRhkuXG991DcJdZs7TIFr7k37VdOBp1t7/5cWuD5TVDWCR
 6bxWCTJu0wMv6O6Cr4lnf8sRx12OfmzFPU8wBKt/RJZisNo2h5yiGcoS1UnuifXTeaSr
 Slm8qV10bEf+KS7w8shiE8Sh88ul0WXfPXE89sHXikw5WuXejNz6cHL9WyKL2ngPKkqT
 Rr3px5DbqRIX///Fiv17Co4U7dcIAtgTizRYHUexfVCGUPsgd2KprUAWeZ9umWjXI9n2
 i+yw==
X-Gm-Message-State: AOAM530uE/GC+9VypJ5rZP3qZtV+F1pDUHgd9GooK7RE7XfdnhWP31I8
 OO7Yp/ePa2uzY25c3Mt9dP2kBQ==
X-Google-Smtp-Source: ABdhPJz3kSbmMli5hJqvOZ83d2ZGQygN/ukAJMlrPaXrgbXJnOmWK3Isz2XTLJ84yNoTdwFX6MrALw==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr24369924wme.98.1642367760615; 
 Sun, 16 Jan 2022 13:16:00 -0800 (PST)
Received: from veiron.westermo.com (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id l12sm8820445wrz.15.2022.01.16.13.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:16:00 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH net 3/4] powerpc/fsl/dts: Enable WA for erratum A-009885 on
 fman3l MDIO buses
Date: Sun, 16 Jan 2022 22:15:28 +0100
Message-Id: <20220116211529.25604-4-tobias@waldekranz.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220116211529.25604-1-tobias@waldekranz.com>
References: <20220116211529.25604-1-tobias@waldekranz.com>
MIME-Version: 1.0
Organization: Westermo
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:35:45 +1100
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This block is used in (at least) T1024 and T1040, including their
variants like T1023 etc.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
index c90702b04a53..48e5cd61599c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
@@ -79,6 +79,7 @@ mdio0: mdio@fc000 {
 		#size-cells = <0>;
 		compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
 		reg = <0xfc000 0x1000>;
+		fsl,erratum-a009885;
 	};
 
 	xmdio0: mdio@fd000 {
@@ -86,6 +87,7 @@ xmdio0: mdio@fd000 {
 		#size-cells = <0>;
 		compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
 		reg = <0xfd000 0x1000>;
+		fsl,erratum-a009885;
 	};
 };
 
-- 
2.25.1


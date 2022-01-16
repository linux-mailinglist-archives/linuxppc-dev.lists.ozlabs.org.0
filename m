Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5348FF2A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 22:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcSyn4fyFz30Lt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:36:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=tEQ3Z8Ar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=tEQ3Z8Ar; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcSWV1ZzSz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 08:16:05 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso19828358wma.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=OYx9JCI6DcrgKeqxQcsds9tuZxZXQZpFHva5BE3zQL4=;
 b=tEQ3Z8ArVhbEOydXcPfD6z02encandhWSTEPXG0PyWYE8yDtw+UL8FwKA44xl4SWMU
 X6Qm+gpBc1Khn7VtlAdiva7ORd8VE7v3PuSx2CseK0ifZb81ijLf3VW2pIo3sELVqspw
 GTkn8RI1Ghd+0zQb2HIEky2x3wcbVCNPlD1Nr2eiWC2I3OfF4xGUqFjLPkofjAiQTi83
 xJwxegF5xZqmhXcgLtyDqteBTAOacAsuRO0xxWXLYFNvZRev6esjHTO+o9rjJGDXU+We
 FxdF/6w8DrWc9R+QuHPSItS6JmFi8isnosrIMTT3iXb3cyG4FI1RicV5/cB2mOWFKZ8g
 1+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=OYx9JCI6DcrgKeqxQcsds9tuZxZXQZpFHva5BE3zQL4=;
 b=cU7Kg6mDu7a4KdKwuxJetA8PLNw1v1z4ExjYgHEUl0ZiXPIbVnDu0AQH9rxRYeybBA
 I7dn8sQtkln9RtRLSqa/tDD6FkHsK3HNk1BAzOLrxqSPyvtiSIHcXAXhouRQiMlmQxap
 Yu7J6OcwlHQ1OTS6FqWVU4FU4HNoaD/CVoP62YqsFjsQfBSo54vzKisM0tspvt6EKsGH
 /82CvlcKcZX4uuNzNd08l1vydnF16JH3+/VzvhTFeSmPXWg1pt2CaSn05/N2OTM0nmYo
 NY8QwVVxzyJhRjjXsHgW8lt5ZU4Iv3NOfiQkc7W4IxNbddrXEWbVdeE1Ys3u3rkI3yq1
 ysuQ==
X-Gm-Message-State: AOAM531rgEpH2HwVOspAn13Hd/Hh/8PFPB5r04xqvpYtjBg21zJYwc2j
 B8DKdyV5tg9pfwCzPgpgK/WbRA==
X-Google-Smtp-Source: ABdhPJwNI6YNksXjvEy8DE/JH4Lfpaq7XmCMwtYuyn8XmgW/tNTS2qAAmHFICjzlNLuvLqxGCA+Ecw==
X-Received: by 2002:a05:600c:48a1:: with SMTP id
 j33mr17126323wmp.143.1642367759452; 
 Sun, 16 Jan 2022 13:15:59 -0800 (PST)
Received: from veiron.westermo.com (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id l12sm8820445wrz.15.2022.01.16.13.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:15:59 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH net 2/4] dt-bindings: net: Document fsl,erratum-a009885
Date: Sun, 16 Jan 2022 22:15:27 +0100
Message-Id: <20220116211529.25604-3-tobias@waldekranz.com>
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

Update FMan binding documentation with the newly added workaround for
erratum A-009885.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 Documentation/devicetree/bindings/net/fsl-fman.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl-fman.txt b/Documentation/devicetree/bindings/net/fsl-fman.txt
index c00fb0d22c7b..020337f3c05f 100644
--- a/Documentation/devicetree/bindings/net/fsl-fman.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fman.txt
@@ -410,6 +410,15 @@ PROPERTIES
 		The settings and programming routines for internal/external
 		MDIO are different. Must be included for internal MDIO.
 
+- fsl,erratum-a009885
+		Usage: optional
+		Value type: <boolean>
+		Definition: Indicates the presence of the A009885
+		erratum describing that the contents of MDIO_DATA may
+		become corrupt unless it is read within 16 MDC cycles
+		of MDIO_CFG[BSY] being cleared, when performing an
+		MDIO read operation.
+
 - fsl,erratum-a011043
 		Usage: optional
 		Value type: <boolean>
-- 
2.25.1


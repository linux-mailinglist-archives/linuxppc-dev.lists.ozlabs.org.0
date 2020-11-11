Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A02AEDE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 10:35:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWKMf2JhkzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 20:35:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalelectronics.com
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CWJnm0bnFzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:09:15 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id CCEBE80305E2;
 Wed, 11 Nov 2020 09:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8keCE_iaknt; Wed, 11 Nov 2020 12:09:10 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 09/18] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Date: Wed, 11 Nov 2020 12:08:44 +0300
Message-ID: <20201111090853.14112-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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
Cc: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With minor peculiarities (like uploading some vendor-specific firmware)
these are just Generic xHCI controllers fully compatible with its
properties. Make sure the Renesas USB xHCI DT nodes are also validated
against the Generic xHCI DT schema.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
index add9f7b66da0..4491567152a1 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 
 allOf:
-  - $ref: "usb-hcd.yaml"
+  - $ref: "usb-xhci.yaml"
 
 properties:
   compatible:
@@ -68,7 +68,7 @@ required:
   - power-domains
   - resets
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.28.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B61C9D51
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 23:34:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J6Dq2lCbzDqrj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 07:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=stevens-zone.net (client-ip=212.227.126.133;
 helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stevens-zone.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J6Bs1ZCJzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 07:33:08 +1000 (AEST)
Received: from Cyrus.lan ([80.189.87.220]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.163]) with ESMTPA (Nemesis) id
 1M8QNs-1jSOIE01Kq-004VKP; Thu, 07 May 2020 23:32:58 +0200
Date: Thu, 7 May 2020 22:13:00 +0100
From: Darren Stevens <darren@stevens-zone.net>
To: linuxppc-dev@lists.ozlabs.org, oss@buserror.net
Subject: [PATCH 2/5] powerpc/mpc85xx: Activate Cyrus P5020 ethernet
Message-ID: <20200507221300.68c658f8@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rfbTy2QxJ5LLmIp4Jh5pWxqB9HRXcMnSXQpphaZYtcWsoioKTzV
 HxwMViz+nvOzAbnMR2mqBGeRLBju6cuWsDG8Xrb9rsrtOCMZJO2dJQ1kHpWXKNNTChDis5v
 wn9dgqOb52esJnPnRzMsf1NtM0fIdGXBRntaqvsj5qprWXhlBoARHHhrtHpew03BuXxECA9
 w9O/9UfuPGTig3sok9NIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zlpSYCDKkgc=:t+NFxuCkfTaEVNGnbbnxnP
 LcW7pYLQbkK9TAUOTbS9SKqg7UiuIfI6AOKkuxeuuEyPlChwypS4PM0O7cOnTWKP1hJ5pUw+O
 yczPpDsJ/cUPYQpIe9fanSe6F40CIBN5LQJ1aZ3DLq//WxuDUTD7k3iMWfcuNfirjA1z0xIpZ
 YIDFRD1RYuy5cDkkHluMHvgafRr05hw6MMK1AzXBlmofFSlQ8EHOuV8UJVn3GkUE8JiG2cp/Z
 y5RDmFdbYcOqeGh/MhRU9T7Rc8Hc6u6DQQ61xwDlOjrCNNTcb9KZ5I/8cmd5QL5NG72gy7eiZ
 BI0La1gEkBZ366hpb+f/2HlZ7r+oWVZzUBUR6Ltm0i/F6qjY0A4MbFFegca3L28bugplPID4h
 R7ZIFJ8WAHfZrordOAJt5s43EFNft5OUck8VYQntyRgLuun8dVrASueY8WpO3IVKR3a7NI2pl
 iizJ3OM8BtUOKCgB/PCM0geZzmNzQ13WP1FIUwFvmSvU+NOAZA3JdwqUeowKh4IPdebCLTE16
 4NOS5LccEOz0OgIWHc08Xh/0qCyKnJVwa0gJXbAjL5uLUf+yMT24GoOw6vPMZwq+6zASvt7gx
 8eXO+6R1zU3jbuqseW2RB7i8ab7Z7zqBD3q2E8YRkSxHGS+vdSfr/5VKuety+Vdjy0VNuCuFP
 TTmj0XeCWtQz9qYw8qq1xqNGOd+8BgCLaorYwP0EPt07AsdrIo+S7nofw6BQO5fPp+WUJGS2p
 0i5Tar9MaeuNzBdV8hlRdBElyHGdANS2BuyCdouB+TxjwA65pWlrcXj1YNnNsOe/9uSsDgaGI
 0w1CQNlNZWTYBCb5aDj6gL7vc6UfU8z7WrSD+l9va1+oifHim5yNh97TblYKLkcEu14/P3t
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
Cc: chzigotzky@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Cyrus P5020 board has 2 ethernet ports, add the required device tree
entries.

Signed-off-by: Darren Stevens <darren@stevens-zone.net>

---

 arch/powerpc/boot/dts/fsl/cyrus_p5020.dts | 39
 +++++++++++++++++++++++++++++++ 1 file changed, 39 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/cyrus_p5020.dts
b/arch/powerpc/boot/dts/fsl/cyrus_p5020.dts index 40ba060..bdf0405
100644 --- a/arch/powerpc/boot/dts/fsl/cyrus_p5020.dts
+++ b/arch/powerpc/boot/dts/fsl/cyrus_p5020.dts
@@ -17,6 +17,11 @@
 	#size-cells = <2>;
 	interrupt-parent = <&mpic>;
 
+	aliases {
+		ethernet0 = &enet3;
+		ethernet1 = &enet4;
+	};
+
 	memory {
 		device_type = "memory";
 	};
@@ -67,6 +72,40 @@
 				reg = <0x6f>;
 			};
 		};
+
+		fman@400000 {
+			mdio@e1120 {
+				phy3: ethernet-phy@3 {
+					reg = <0x3>;
+				};
+
+				phy7: ethernet-phy@7 {
+					reg = <0x7>;
+				};
+			};
+
+			ethernet@e0000 {
+				status = "disabled";
+			};
+
+			ethernet@e2000 {
+				status = "disabled";
+			};
+
+			ethernet@e4000 {
+				status = "disabled";
+			};
+
+			ethernet@e6000 {
+				phy-handle = <&phy3>;
+				phy-connection-type = "rgmii";
+			};
+
+			ethernet@e8000 {
+				phy-handle = <&phy7>;
+				phy-connection-type = "rgmii";
+			};
+		};
 	};
 
 	rio: rapidio@ffe0c0000 {

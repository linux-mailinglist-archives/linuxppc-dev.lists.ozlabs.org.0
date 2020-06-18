Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBD1FEC11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 09:16:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nYBb42X5zDrDn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 17:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=prsriva@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=ixHKZ/xQ; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 49nY4w008jzDrCJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 17:11:11 +1000 (AEST)
Received: from prsriva-linux.hsd1.wa.comcast.net
 (c-24-19-135-168.hsd1.wa.comcast.net [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2CB7A20B4783;
 Thu, 18 Jun 2020 00:11:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2CB7A20B4783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1592464270;
 bh=A0GiQILHZ8uuNOX7+rBVoRsb1esS85HaWBTuDqTUAM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixHKZ/xQIYNcJIA9BE4KrIbjwT0LdW+G2r+zYBqwNbWNH109H6oJwoZ55KK/1rHMF
 zDbf30HMELw5TZ3FWiLSdBVIQVNopsycaccVcaHl3PXGOOTza1ZjU7noxo4fAsdRFh
 sPyrgvlID5Gdj2Adjaje8Sum1mYYaHoWYTjZWerE=
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [V2 PATCH 2/3] dt-bindings: chosen: Document ima-kexec-buffer 
Date: Thu, 18 Jun 2020 00:10:44 -0700
Message-Id: <20200618071045.471131-3-prsriva@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618071045.471131-1-prsriva@linux.microsoft.com>
References: <20200618071045.471131-1-prsriva@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com, catalin.marinas@arm.com,
 bhsharma@redhat.com, tao.li@vivo.com, zohar@linux.ibm.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, nramas@linux.microsoft.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 serge@hallyn.com, pasha.tatashin@soleen.com, will@kernel.org,
 prsriva@linux.microsoft.com, robh+dt@kernel.org, hsinyi@chromium.org,
 tusharsu@linux.microsoft.com, tglx@linutronix.de, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, james.morse@arm.com, gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Integrity measurement architecture(IMA) validates if files
have been accidentally or maliciously altered, both remotely and
locally, appraise a file's measurement against a "good" value stored
as an extended attribute, and enforce local file integrity.

IMA also measures singatures of kernel and initrd during kexec along with
the command line used for kexec.
These measurements are critical to verify the seccurity posture of the OS.

Resering memory and adding the memory information to a device tree node
acts as the mechanism to carry over IMA measurement logs.

Update devicetree documentation to reflect the addition of new property
under the chosen node. 

---
 Documentation/devicetree/bindings/chosen.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646..a15f70c007ef 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -135,3 +135,20 @@ e.g.
 		linux,initrd-end = <0x82800000>;
 	};
 };
+
+linux,ima-kexec-buffer
+----------------------
+
+This property(currently used by powerpc, arm64) holds the memory range,
+the address and the size, of the IMA measurement logs that are being carried
+over to the kexec session.
+
+/ {
+	chosen {
+		linux,ima-kexec-buffer = <0x9 0x82000000 0x0 0x00008000>;
+	};
+};
+
+This porperty does not represent real hardware, but the memory allocated for
+carrying the IMA measurement logs. The address and the suze are expressed in
+#address-cells and #size-cells, respectively of the root node.
-- 
2.25.1


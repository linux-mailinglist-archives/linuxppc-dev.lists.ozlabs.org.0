Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FF320C60
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkCcq5Kbvz3cmf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=VO+GRuSK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=VO+GRuSK; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DkCWD5YSdz3bVX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:49:44 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5B44D20B57A9;
 Sun, 21 Feb 2021 09:49:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5B44D20B57A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613929783;
 bh=5tVdVRRrroArIcB3wic0bOUaFnm0puk45+VCxameqFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VO+GRuSKumk1qZZjgksCFLKGIHvqRBcej/ZJ0gy4ic2simAXDkL+7Xf0FbnQmHx+4
 sXgqeBqQayqv+SAv9N1ppkqNdUhtS343Oxgo9+/iHJ52mgotuvGXi4t8lErFteIyos
 lo6jrbDOjhiiLC//fzIxzpmfXjZt93UzC8ZtVKbU=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au,
 sfr@canb.auug.org.au
Subject: [PATCH v19 11/13] kexec: Use fdt_appendprop_addrrange() to add ima
 buffer to FDT
Date: Sun, 21 Feb 2021 09:49:28 -0800
Message-Id: <20210221174930.27324-12-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210221174930.27324-1-nramas@linux.microsoft.com>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, sashal@kernel.org,
 masahiroy@kernel.org, jmorris@namei.org, allison@lohutok.net, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fdt_appendprop_addrrange() function adds a property, with the given name,
to the device tree at the given node offset, and also sets the address
and size of the property.  This function should be used to add
"linux,ima-kexec-buffer" property to the device tree and set the address
and size of the IMA measurement buffer, instead of using custom function.

Use fdt_appendprop_addrrange() to add  "linux,ima-kexec-buffer" property
to the device tree.  This property holds the address and size of
the IMA measurement buffer that needs to be passed from the current
kernel to the next kernel across kexec system call.

Remove custom code that is used in setup_ima_buffer() to add
"linux,ima-kexec-buffer" property to the device tree.

Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 drivers/of/kexec.c | 57 ++++------------------------------------------
 1 file changed, 5 insertions(+), 52 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 6512e25671df..f335d941a716 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -216,36 +216,6 @@ static void remove_ima_buffer(void *fdt, int chosen_node)
 }
 
 #ifdef CONFIG_IMA_KEXEC
-/**
- * write_number - Convert number to big-endian format
- *
- * @p:		Buffer to write the number to
- * @value:	Number to convert
- * @cells:	Number of cells
- *
- * Return: 0 on success, or negative errno on error.
- */
-static int write_number(void *p, u64 value, int cells)
-{
-	if (cells == 1) {
-		u32 tmp;
-
-		if (value > U32_MAX)
-			return -EINVAL;
-
-		tmp = cpu_to_be32(value);
-		memcpy(p, &tmp, sizeof(tmp));
-	} else if (cells == 2) {
-		u64 tmp;
-
-		tmp = cpu_to_be64(value);
-		memcpy(p, &tmp, sizeof(tmp));
-	} else
-		return -EINVAL;
-
-	return 0;
-}
-
 /**
  * setup_ima_buffer - add IMA buffer information to the fdt
  * @image:		kexec image being loaded.
@@ -257,32 +227,15 @@ static int write_number(void *p, u64 value, int cells)
 static int setup_ima_buffer(const struct kimage *image, void *fdt,
 			    int chosen_node)
 {
-	int ret, addr_cells, size_cells, entry_size;
-	u8 value[16];
+	int ret;
 
 	if (!image->ima_buffer_size)
 		return 0;
 
-	ret = get_addr_size_cells(&addr_cells, &size_cells);
-	if (ret)
-		return ret;
-
-	entry_size = 4 * (addr_cells + size_cells);
-
-	if (entry_size > sizeof(value))
-		return -EINVAL;
-
-	ret = write_number(value, image->ima_buffer_addr, addr_cells);
-	if (ret)
-		return ret;
-
-	ret = write_number(value + 4 * addr_cells, image->ima_buffer_size,
-			   size_cells);
-	if (ret)
-		return ret;
-
-	ret = fdt_setprop(fdt, chosen_node, "linux,ima-kexec-buffer", value,
-			  entry_size);
+	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
+				       "linux,ima-kexec-buffer",
+				       image->ima_buffer_addr,
+				       image->ima_buffer_size);
 	if (ret < 0)
 		return -EINVAL;
 
-- 
2.30.0


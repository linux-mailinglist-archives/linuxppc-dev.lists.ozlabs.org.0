Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F044E8387
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQp0L20cpz3chY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:49:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=x4YDxxnu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=wq21Hltn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=x4YDxxnu; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=wq21Hltn; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm56Vxdz3085
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:37 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id BBC54FBB97; Sat, 26 Mar 2022 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313996; bh=ORSaJ6zLK3T5QJ6ekZf62I3PpS/KQZ/OU2UVDjr9uRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x4YDxxnuX79fnNpzybqZuHD3PVt/O93KSqgtebGDs1X2HLjNicOzGLOU+vB6ZUS5s
 zbc3E8IYHnOB6rjUWKroVCthhe1gTrdvWUFH8SrG4B82rlDNZ+LAg8fGoavW5NCax/
 pKCiNZwdUn5arouXA21gD/Odhq2EeUeLxfS+oTt4bfMM0WIA9xIbsQ32MckX6efHgk
 UeKE40Dp2DU0cEq8NhbwXkyyIkTVY3CjHtsEjIod+9Ue+kBqd/zfIONLWX+24Wtjrq
 ZKpttzcF9DSVd8KV1wOlXVvhW2AnVzXjY0UZBUQyXWkenxY2oIwmjA0178JoJW5ABb
 /+os7Ee1IxWkw==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 41A1DFB7DE;
 Sat, 26 Mar 2022 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313993; bh=ORSaJ6zLK3T5QJ6ekZf62I3PpS/KQZ/OU2UVDjr9uRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wq21HltneWdL6v4ZLSJXC/plweTDbrb3ui94N5yiQei93RLb63mS41Cg7dVqI4fte
 9BqCFfq9VrIThMsyqq0VB1mZUqCXu0nH3/0YtYuj3fDiM2ZTv6HqDxtkQWuuGPZGDl
 N87b29RPMjyQMTbtoN714T9xt2bJioTmNWsoDEcxyjF6T5Adg+8hZX7ykzJJVzq4mv
 QyjX/stjxxs0Aq6YgOFQRPY3aB5QHr8caGS+ENicUHCHYZDLLKeArivV7C+1sgEsA6
 0Tgoe831JrmoLDcuBMxeugIow66ZHsyeskR0RGhE8X3sTVac/00kVNKHIBShyMJiDp
 xaU9YW7xKRuYA==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 05/22] acpica: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:52 +0100
Message-Id: <20220326165909.506926-5-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 drivers/acpi/acpica/utdecode.c | 183 ++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 93 deletions(-)

diff --git a/drivers/acpi/acpica/utdecode.c b/drivers/acpi/acpica/utdecode.c
index bcd3871079d7..d19868d2ea46 100644
--- a/drivers/acpi/acpica/utdecode.c
+++ b/drivers/acpi/acpica/utdecode.c
@@ -156,37 +156,37 @@ static const char acpi_gbl_bad_type[] = "UNDEFINED";
 /* Printable names of the ACPI object types */
 
 static const char *acpi_gbl_ns_type_names[] = {
-	/* 00 */ "Untyped",
-	/* 01 */ "Integer",
-	/* 02 */ "String",
-	/* 03 */ "Buffer",
-	/* 04 */ "Package",
-	/* 05 */ "FieldUnit",
-	/* 06 */ "Device",
-	/* 07 */ "Event",
-	/* 08 */ "Method",
-	/* 09 */ "Mutex",
-	/* 10 */ "Region",
-	/* 11 */ "Power",
-	/* 12 */ "Processor",
-	/* 13 */ "Thermal",
-	/* 14 */ "BufferField",
-	/* 15 */ "DdbHandle",
-	/* 16 */ "DebugObject",
-	/* 17 */ "RegionField",
-	/* 18 */ "BankField",
-	/* 19 */ "IndexField",
-	/* 20 */ "Reference",
-	/* 21 */ "Alias",
-	/* 22 */ "MethodAlias",
-	/* 23 */ "Notify",
-	/* 24 */ "AddrHandler",
-	/* 25 */ "ResourceDesc",
-	/* 26 */ "ResourceFld",
-	/* 27 */ "Scope",
-	/* 28 */ "Extra",
-	/* 29 */ "Data",
-	/* 30 */ "Invalid"
+	[0]  = "Untyped",
+	[1]  = "Integer",
+	[2]  = "String",
+	[3]  = "Buffer",
+	[4]  = "Package",
+	[5]  = "FieldUnit",
+	[6]  = "Device",
+	[7]  = "Event",
+	[8]  = "Method",
+	[9]  = "Mutex",
+	[10] = "Region",
+	[11] = "Power",
+	[12] = "Processor",
+	[13] = "Thermal",
+	[14] = "BufferField",
+	[15] = "DdbHandle",
+	[16] = "DebugObject",
+	[17] = "RegionField",
+	[18] = "BankField",
+	[19] = "IndexField",
+	[20] = "Reference",
+	[21] = "Alias",
+	[22] = "MethodAlias",
+	[23] = "Notify",
+	[24] = "AddrHandler",
+	[25] = "ResourceDesc",
+	[26] = "ResourceFld",
+	[27] = "Scope",
+	[28] = "Extra",
+	[29] = "Data",
+	[30] = "Invalid"
 };
 
 const char *acpi_ut_get_type_name(acpi_object_type type)
@@ -284,22 +284,22 @@ const char *acpi_ut_get_node_name(void *object)
 /* Printable names of object descriptor types */
 
 static const char *acpi_gbl_desc_type_names[] = {
-	/* 00 */ "Not a Descriptor",
-	/* 01 */ "Cached Object",
-	/* 02 */ "State-Generic",
-	/* 03 */ "State-Update",
-	/* 04 */ "State-Package",
-	/* 05 */ "State-Control",
-	/* 06 */ "State-RootParseScope",
-	/* 07 */ "State-ParseScope",
-	/* 08 */ "State-WalkScope",
-	/* 09 */ "State-Result",
-	/* 10 */ "State-Notify",
-	/* 11 */ "State-Thread",
-	/* 12 */ "Tree Walk State",
-	/* 13 */ "Parse Tree Op",
-	/* 14 */ "Operand Object",
-	/* 15 */ "Namespace Node"
+	[0]  = "Not a Descriptor",
+	[1]  = "Cached Object",
+	[2]  = "State-Generic",
+	[3]  = "State-Update",
+	[4]  = "State-Package",
+	[5]  = "State-Control",
+	[6]  = "State-RootParseScope",
+	[7]  = "State-ParseScope",
+	[8]  = "State-WalkScope",
+	[9]  = "State-Result",
+	[10] = "State-Notify",
+	[11] = "State-Thread",
+	[12] = "Tree Walk State",
+	[13] = "Parse Tree Op",
+	[14] = "Operand Object",
+	[15] = "Namespace Node"
 };
 
 const char *acpi_ut_get_descriptor_name(void *object)
@@ -331,13 +331,13 @@ const char *acpi_ut_get_descriptor_name(void *object)
 /* Printable names of reference object sub-types */
 
 static const char *acpi_gbl_ref_class_names[] = {
-	/* 00 */ "Local",
-	/* 01 */ "Argument",
-	/* 02 */ "RefOf",
-	/* 03 */ "Index",
-	/* 04 */ "DdbHandle",
-	/* 05 */ "Named Object",
-	/* 06 */ "Debug"
+	[0] = "Local",
+	[1] = "Argument",
+	[2] = "RefOf",
+	[3] = "Index",
+	[4] = "DdbHandle",
+	[5] = "Named Object",
+	[6] = "Debug"
 };
 
 const char *acpi_ut_get_reference_name(union acpi_operand_object *object)
@@ -416,25 +416,22 @@ const char *acpi_ut_get_mutex_name(u32 mutex_id)
 /* Names for Notify() values, used for debug output */
 
 static const char *acpi_gbl_generic_notify[ACPI_GENERIC_NOTIFY_MAX + 1] = {
-	/* 00 */ "Bus Check",
-	/* 01 */ "Device Check",
-	/* 02 */ "Device Wake",
-	/* 03 */ "Eject Request",
-	/* 04 */ "Device Check Light",
-	/* 05 */ "Frequency Mismatch",
-	/* 06 */ "Bus Mode Mismatch",
-	/* 07 */ "Power Fault",
-	/* 08 */ "Capabilities Check",
-	/* 09 */ "Device PLD Check",
-	/* 0A */ "Reserved",
-	/* 0B */ "System Locality Update",
-								/* 0C */ "Reserved (was previously Shutdown Request)",
-								/* Reserved in ACPI 6.0 */
-	/* 0D */ "System Resource Affinity Update",
-								/* 0E */ "Heterogeneous Memory Attributes Update",
-								/* ACPI 6.2 */
-						/* 0F */ "Error Disconnect Recover"
-						/* ACPI 6.3 */
+	[0]  = "Bus Check",
+	[1]  = "Device Check",
+	[2]  = "Device Wake",
+	[3]  = "Eject Request",
+	[4]  = "Device Check Light",
+	[5]  = "Frequency Mismatch",
+	[6]  = "Bus Mode Mismatch",
+	[7]  = "Power Fault",
+	[8]  = "Capabilities Check",
+	[9]  = "Device PLD Check",
+	[10] = "Reserved",
+	[11] = "System Locality Update",
+	[12] = "Reserved (was previously Shutdown Request)",  /* Reserved in ACPI 6.0 */
+	[13] = "System Resource Affinity Update",
+	[14] = "Heterogeneous Memory Attributes Update",      /* ACPI 6.2 */
+	[15] = "Error Disconnect Recover"                     /* ACPI 6.3 */
 };
 
 static const char *acpi_gbl_device_notify[5] = {
@@ -521,26 +518,26 @@ const char *acpi_ut_get_notify_name(u32 notify_value, acpi_object_type type)
  ******************************************************************************/
 
 static const char *acpi_gbl_argument_type[20] = {
-	/* 00 */ "Unknown ARGP",
-	/* 01 */ "ByteData",
-	/* 02 */ "ByteList",
-	/* 03 */ "CharList",
-	/* 04 */ "DataObject",
-	/* 05 */ "DataObjectList",
-	/* 06 */ "DWordData",
-	/* 07 */ "FieldList",
-	/* 08 */ "Name",
-	/* 09 */ "NameString",
-	/* 0A */ "ObjectList",
-	/* 0B */ "PackageLength",
-	/* 0C */ "SuperName",
-	/* 0D */ "Target",
-	/* 0E */ "TermArg",
-	/* 0F */ "TermList",
-	/* 10 */ "WordData",
-	/* 11 */ "QWordData",
-	/* 12 */ "SimpleName",
-	/* 13 */ "NameOrRef"
+	[0x00] = "Unknown ARGP",
+	[0x01] = "ByteData",
+	[0x02] = "ByteList",
+	[0x03] = "CharList",
+	[0x04] = "DataObject",
+	[0x05] = "DataObjectList",
+	[0x06] = "DWordData",
+	[0x07] = "FieldList",
+	[0x08] = "Name",
+	[0x09] = "NameString",
+	[0x0A] = "ObjectList",
+	[0x0B] = "PackageLength",
+	[0x0C] = "SuperName",
+	[0x0D] = "Target",
+	[0x0E] = "TermArg",
+	[0x0F] = "TermList",
+	[0x10] = "WordData",
+	[0x11] = "QWordData",
+	[0x12] = "SimpleName",
+	[0x13] = "NameOrRef"
 };
 
 const char *acpi_ut_get_argument_type_name(u32 arg_type)
-- 
2.35.1


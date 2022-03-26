Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03334E836C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnqg3dZYz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:41:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=dHgnS/DF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=i4ESBfHh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=dHgnS/DF; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=i4ESBfHh; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlb84pLzz3046
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:00:52 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 68227FBBDE; Sat, 26 Mar 2022 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314050; bh=n+yVi6iAEC+yUDGtAiTeBRB6isAkXDN31MWea5bro/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHgnS/DFKqe/aLEuORFbAT1jqI3IELdNbkgLSitQxh5vtG17J9IyfPUMcK78fAvQ5
 4vi5rs9z50d4x9NxL9yo+dxbW0E4F8gWCS1RXnKbBnSnVzmWcF09p+t3KfQsSbYqj8
 vf77nt3+Hy2V/4BFujPbnVyp22kBWzfEqmkWYHWtp7suHB4tIRpixBkOxUfZK3pKNp
 3if+wFMgJVKLB5l18B+xlQ2PvSRrYK7JUUXw9hYRRqJGog9nCDukipnzcB8JQva2ud
 vU6yoXClBVmfpyOauBwqJfZDCjEjpJkA5gAhLI949yZTMxVlrJcT6dogEykTG+uGM5
 yoKFvnlJ73LuA==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 252BCFBB90;
 Sat, 26 Mar 2022 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314046; bh=n+yVi6iAEC+yUDGtAiTeBRB6isAkXDN31MWea5bro/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i4ESBfHhBQWz8zVimJokPBUGs2luFLOMsiMFTqCcllthbc5FZeZbTFNW42j54RQyv
 oQzXJscmNfNsalEUNrLmkZZZXwdcucGRrIVZf8nBBRuxbGGBwSMRkigSoqaRA05Wlk
 uLDJDV/TcG97HIzxIFe9Nn3Fd2839k22PbjzE7HroPrKFG8M13lFCKnBzDHbYBbAMB
 0SC6cK9MMn9aXFAq0LwFSjsCK8mZHkghbvOLq3o0kyDY63E5IXFORegEUFguMfMTkL
 8s53a4Ig2fAPovHMcwMRDmIptgnTjXjHVQ3eE8Ujh78FcUVpv49dQfaBr1tXPA1/ue
 FLNxHoXHOsikQ==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 13/22] capi: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:00 +0100
Message-Id: <20220326165909.506926-13-benni@stuerz.xyz>
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
 drivers/isdn/capi/capiutil.c | 240 ++++++++++++++---------------------
 1 file changed, 96 insertions(+), 144 deletions(-)

diff --git a/drivers/isdn/capi/capiutil.c b/drivers/isdn/capi/capiutil.c
index d7ae42edc4a8..1213f5cb976e 100644
--- a/drivers/isdn/capi/capiutil.c
+++ b/drivers/isdn/capi/capiutil.c
@@ -38,102 +38,54 @@ typedef struct {
 
 static _cdef cdef[] =
 {
-	/*00 */
-	{_CEND},
-	/*01 */
-	{_CEND},
-	/*02 */
-	{_CEND},
-	/*03 */
-	{_CDWORD, offsetof(_cmsg, adr.adrController)},
-	/*04 */
-	{_CMSTRUCT, offsetof(_cmsg, AdditionalInfo)},
-	/*05 */
-	{_CSTRUCT, offsetof(_cmsg, B1configuration)},
-	/*06 */
-	{_CWORD, offsetof(_cmsg, B1protocol)},
-	/*07 */
-	{_CSTRUCT, offsetof(_cmsg, B2configuration)},
-	/*08 */
-	{_CWORD, offsetof(_cmsg, B2protocol)},
-	/*09 */
-	{_CSTRUCT, offsetof(_cmsg, B3configuration)},
-	/*0a */
-	{_CWORD, offsetof(_cmsg, B3protocol)},
-	/*0b */
-	{_CSTRUCT, offsetof(_cmsg, BC)},
-	/*0c */
-	{_CSTRUCT, offsetof(_cmsg, BChannelinformation)},
-	/*0d */
-	{_CMSTRUCT, offsetof(_cmsg, BProtocol)},
-	/*0e */
-	{_CSTRUCT, offsetof(_cmsg, CalledPartyNumber)},
-	/*0f */
-	{_CSTRUCT, offsetof(_cmsg, CalledPartySubaddress)},
-	/*10 */
-	{_CSTRUCT, offsetof(_cmsg, CallingPartyNumber)},
-	/*11 */
-	{_CSTRUCT, offsetof(_cmsg, CallingPartySubaddress)},
-	/*12 */
-	{_CDWORD, offsetof(_cmsg, CIPmask)},
-	/*13 */
-	{_CDWORD, offsetof(_cmsg, CIPmask2)},
-	/*14 */
-	{_CWORD, offsetof(_cmsg, CIPValue)},
-	/*15 */
-	{_CDWORD, offsetof(_cmsg, Class)},
-	/*16 */
-	{_CSTRUCT, offsetof(_cmsg, ConnectedNumber)},
-	/*17 */
-	{_CSTRUCT, offsetof(_cmsg, ConnectedSubaddress)},
-	/*18 */
-	{_CDWORD, offsetof(_cmsg, Data)},
-	/*19 */
-	{_CWORD, offsetof(_cmsg, DataHandle)},
-	/*1a */
-	{_CWORD, offsetof(_cmsg, DataLength)},
-	/*1b */
-	{_CSTRUCT, offsetof(_cmsg, FacilityConfirmationParameter)},
-	/*1c */
-	{_CSTRUCT, offsetof(_cmsg, Facilitydataarray)},
-	/*1d */
-	{_CSTRUCT, offsetof(_cmsg, FacilityIndicationParameter)},
-	/*1e */
-	{_CSTRUCT, offsetof(_cmsg, FacilityRequestParameter)},
-	/*1f */
-	{_CWORD, offsetof(_cmsg, FacilitySelector)},
-	/*20 */
-	{_CWORD, offsetof(_cmsg, Flags)},
-	/*21 */
-	{_CDWORD, offsetof(_cmsg, Function)},
-	/*22 */
-	{_CSTRUCT, offsetof(_cmsg, HLC)},
-	/*23 */
-	{_CWORD, offsetof(_cmsg, Info)},
-	/*24 */
-	{_CSTRUCT, offsetof(_cmsg, InfoElement)},
-	/*25 */
-	{_CDWORD, offsetof(_cmsg, InfoMask)},
-	/*26 */
-	{_CWORD, offsetof(_cmsg, InfoNumber)},
-	/*27 */
-	{_CSTRUCT, offsetof(_cmsg, Keypadfacility)},
-	/*28 */
-	{_CSTRUCT, offsetof(_cmsg, LLC)},
-	/*29 */
-	{_CSTRUCT, offsetof(_cmsg, ManuData)},
-	/*2a */
-	{_CDWORD, offsetof(_cmsg, ManuID)},
-	/*2b */
-	{_CSTRUCT, offsetof(_cmsg, NCPI)},
-	/*2c */
-	{_CWORD, offsetof(_cmsg, Reason)},
-	/*2d */
-	{_CWORD, offsetof(_cmsg, Reason_B3)},
-	/*2e */
-	{_CWORD, offsetof(_cmsg, Reject)},
-	/*2f */
-	{_CSTRUCT, offsetof(_cmsg, Useruserdata)}
+	[0x00] = {_CEND},
+	[0x01] = {_CEND},
+	[0x02] = {_CEND},
+	[0x03] = {_CDWORD, offsetof(_cmsg, adr.adrController)},
+	[0x04] = {_CMSTRUCT, offsetof(_cmsg, AdditionalInfo)},
+	[0x05] = {_CSTRUCT, offsetof(_cmsg, B1configuration)},
+	[0x06] = {_CWORD, offsetof(_cmsg, B1protocol)},
+	[0x07] = {_CSTRUCT, offsetof(_cmsg, B2configuration)},
+	[0x08] = {_CWORD, offsetof(_cmsg, B2protocol)},
+	[0x09] = {_CSTRUCT, offsetof(_cmsg, B3configuration)},
+	[0x0a] = {_CWORD, offsetof(_cmsg, B3protocol)},
+	[0x0b] = {_CSTRUCT, offsetof(_cmsg, BC)},
+	[0x0c] = {_CSTRUCT, offsetof(_cmsg, BChannelinformation)},
+	[0x0d] = {_CMSTRUCT, offsetof(_cmsg, BProtocol)},
+	[0x0e] = {_CSTRUCT, offsetof(_cmsg, CalledPartyNumber)},
+	[0x0f] = {_CSTRUCT, offsetof(_cmsg, CalledPartySubaddress)},
+	[0x10] = {_CSTRUCT, offsetof(_cmsg, CallingPartyNumber)},
+	[0x11] = {_CSTRUCT, offsetof(_cmsg, CallingPartySubaddress)},
+	[0x12] = {_CDWORD, offsetof(_cmsg, CIPmask)},
+	[0x13] = {_CDWORD, offsetof(_cmsg, CIPmask2)},
+	[0x14] = {_CWORD, offsetof(_cmsg, CIPValue)},
+	[0x15] = {_CDWORD, offsetof(_cmsg, Class)},
+	[0x16] = {_CSTRUCT, offsetof(_cmsg, ConnectedNumber)},
+	[0x17] = {_CSTRUCT, offsetof(_cmsg, ConnectedSubaddress)},
+	[0x18] = {_CDWORD, offsetof(_cmsg, Data)},
+	[0x19] = {_CWORD, offsetof(_cmsg, DataHandle)},
+	[0x1a] = {_CWORD, offsetof(_cmsg, DataLength)},
+	[0x1b] = {_CSTRUCT, offsetof(_cmsg, FacilityConfirmationParameter)},
+	[0x1c] = {_CSTRUCT, offsetof(_cmsg, Facilitydataarray)},
+	[0x1d] = {_CSTRUCT, offsetof(_cmsg, FacilityIndicationParameter)},
+	[0x1e] = {_CSTRUCT, offsetof(_cmsg, FacilityRequestParameter)},
+	[0x1f] = {_CWORD, offsetof(_cmsg, FacilitySelector)},
+	[0x20] = {_CWORD, offsetof(_cmsg, Flags)},
+	[0x21] = {_CDWORD, offsetof(_cmsg, Function)},
+	[0x22] = {_CSTRUCT, offsetof(_cmsg, HLC)},
+	[0x23] = {_CWORD, offsetof(_cmsg, Info)},
+	[0x24] = {_CSTRUCT, offsetof(_cmsg, InfoElement)},
+	[0x25] = {_CDWORD, offsetof(_cmsg, InfoMask)},
+	[0x26] = {_CWORD, offsetof(_cmsg, InfoNumber)},
+	[0x27] = {_CSTRUCT, offsetof(_cmsg, Keypadfacility)},
+	[0x28] = {_CSTRUCT, offsetof(_cmsg, LLC)},
+	[0x29] = {_CSTRUCT, offsetof(_cmsg, ManuData)},
+	[0x2a] = {_CDWORD, offsetof(_cmsg, ManuID)},
+	[0x2b] = {_CSTRUCT, offsetof(_cmsg, NCPI)},
+	[0x2c] = {_CWORD, offsetof(_cmsg, Reason)},
+	[0x2d] = {_CWORD, offsetof(_cmsg, Reason_B3)},
+	[0x2e] = {_CWORD, offsetof(_cmsg, Reject)},
+	[0x2f] = {_CSTRUCT, offsetof(_cmsg, Useruserdata)}
 };
 
 static unsigned char *cpars[] =
@@ -329,54 +281,54 @@ char *capi_cmd2str(u8 cmd, u8 subcmd)
 
 static char *pnames[] =
 {
-	/*00 */ NULL,
-	/*01 */ NULL,
-	/*02 */ NULL,
-	/*03 */ "Controller/PLCI/NCCI",
-	/*04 */ "AdditionalInfo",
-	/*05 */ "B1configuration",
-	/*06 */ "B1protocol",
-	/*07 */ "B2configuration",
-	/*08 */ "B2protocol",
-	/*09 */ "B3configuration",
-	/*0a */ "B3protocol",
-	/*0b */ "BC",
-	/*0c */ "BChannelinformation",
-	/*0d */ "BProtocol",
-	/*0e */ "CalledPartyNumber",
-	/*0f */ "CalledPartySubaddress",
-	/*10 */ "CallingPartyNumber",
-	/*11 */ "CallingPartySubaddress",
-	/*12 */ "CIPmask",
-	/*13 */ "CIPmask2",
-	/*14 */ "CIPValue",
-	/*15 */ "Class",
-	/*16 */ "ConnectedNumber",
-	/*17 */ "ConnectedSubaddress",
-	/*18 */ "Data32",
-	/*19 */ "DataHandle",
-	/*1a */ "DataLength",
-	/*1b */ "FacilityConfirmationParameter",
-	/*1c */ "Facilitydataarray",
-	/*1d */ "FacilityIndicationParameter",
-	/*1e */ "FacilityRequestParameter",
-	/*1f */ "FacilitySelector",
-	/*20 */ "Flags",
-	/*21 */ "Function",
-	/*22 */ "HLC",
-	/*23 */ "Info",
-	/*24 */ "InfoElement",
-	/*25 */ "InfoMask",
-	/*26 */ "InfoNumber",
-	/*27 */ "Keypadfacility",
-	/*28 */ "LLC",
-	/*29 */ "ManuData",
-	/*2a */ "ManuID",
-	/*2b */ "NCPI",
-	/*2c */ "Reason",
-	/*2d */ "Reason_B3",
-	/*2e */ "Reject",
-	/*2f */ "Useruserdata"
+	[0x00] = NULL,
+	[0x01] = NULL,
+	[0x02] = NULL,
+	[0x03] = "Controller/PLCI/NCCI",
+	[0x04] = "AdditionalInfo",
+	[0x05] = "B1configuration",
+	[0x06] = "B1protocol",
+	[0x07] = "B2configuration",
+	[0x08] = "B2protocol",
+	[0x09] = "B3configuration",
+	[0x0a] = "B3protocol",
+	[0x0b] = "BC",
+	[0x0c] = "BChannelinformation",
+	[0x0d] = "BProtocol",
+	[0x0e] = "CalledPartyNumber",
+	[0x0f] = "CalledPartySubaddress",
+	[0x10] = "CallingPartyNumber",
+	[0x11] = "CallingPartySubaddress",
+	[0x12] = "CIPmask",
+	[0x13] = "CIPmask2",
+	[0x14] = "CIPValue",
+	[0x15] = "Class",
+	[0x16] = "ConnectedNumber",
+	[0x17] = "ConnectedSubaddress",
+	[0x18] = "Data32",
+	[0x19] = "DataHandle",
+	[0x1a] = "DataLength",
+	[0x1b] = "FacilityConfirmationParameter",
+	[0x1c] = "Facilitydataarray",
+	[0x1d] = "FacilityIndicationParameter",
+	[0x1e] = "FacilityRequestParameter",
+	[0x1f] = "FacilitySelector",
+	[0x20] = "Flags",
+	[0x21] = "Function",
+	[0x22] = "HLC",
+	[0x23] = "Info",
+	[0x24] = "InfoElement",
+	[0x25] = "InfoMask",
+	[0x26] = "InfoNumber",
+	[0x27] = "Keypadfacility",
+	[0x28] = "LLC",
+	[0x29] = "ManuData",
+	[0x2a] = "ManuID",
+	[0x2b] = "NCPI",
+	[0x2c] = "Reason",
+	[0x2d] = "Reason_B3",
+	[0x2e] = "Reject",
+	[0x2f] = "Useruserdata"
 };
 
 #include <linux/stdarg.h>
-- 
2.35.1


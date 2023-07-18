Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970DC757755
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 11:03:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=XeCN7LNN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4tKR3W4tz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 19:03:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=XeCN7LNN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4tJX1pXdz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 19:02:51 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4tJJ2V9QzBR1P2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:02:40 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689670960; x=1692262961; bh=bT02sggsVqEAB0NLYnxjWOz/iex
	6u/qOqO+aB6iEZec=; b=XeCN7LNNT+bD68lvt00mqgR/ax6BJYqASKBME+gA1fA
	zvsz25xPxqTY3EJ6JC1hJ/J5A6LSJFpLwEzcTy5daIF/j4uzsI643DBlRIBOWhQ1
	ZMcfyQEY2GcJvA1nX16usJS4niQopD8d9dlSOQFGXeAftvNoLQ/32cNNcFH2HuK4
	IlJ85eU9pH1Q3Z6F7HdEcePL7oc6LzQEftON2Ot5+/FYal3o8SHeGB/H783cqhGQ
	pbBMO2zHFvTad+E7B1Og36Hm0YTo3vKLIFJCbfndy1aDa0tfLRZoUu578I/uKBpy
	1ijWcI6FiYYFaHKKjzC2N5yjzHAxXRsXwtCztLYOHaQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0_sRnySpQuYp for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 17:02:40 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4tJH5vvWzBJBfd;
	Tue, 18 Jul 2023 17:02:39 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 17:02:39 +0800
From: hanyu001@208suo.com
To: agust@denx.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, andriy.shevchenko@linux.intel.com,
 bhelgaas@google.com, kw@linux.com, mika.westerberg@linux.intel.com
Subject: [PATCH] platforms: 52xx: Remove space after '(' and before ')'
In-Reply-To: <tencent_ADAD5C6DD5F9824047356B25D53801910A06@qq.com>
References: <tencent_ADAD5C6DD5F9824047356B25D53801910A06@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <c5c33e6e390f6784b5599b8ea13b8e01@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch fixes the following errors detected by checkpatch:

platforms/52xx/mpc52xx_pci.c:346:ERROR: space prohibited after that open 
parenthesis '('
platforms/52xx/mpc52xx_pci.c:347:ERROR: space prohibited after that open 
parenthesis '('
platforms/52xx/mpc52xx_pci.c:348:ERROR: space prohibited before that 
close parenthesis ')'

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/52xx/mpc52xx_pci.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pci.c 
b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
index 0ca4401ba781..452723f8ba53 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pci.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
@@ -343,9 +343,9 @@ mpc52xx_pci_fixup_resources(struct pci_dev *dev)

      /* The PCI Host bridge of MPC52xx has a prefetch memory resource
         fixed to 1Gb. Doesn't fit in the resource system so we remove it 
*/
-    if ( (dev->vendor == PCI_VENDOR_ID_MOTOROLA) &&
-         (   dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200
-          || dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200B) ) {
+    if ((dev->vendor == PCI_VENDOR_ID_MOTOROLA) &&
+         (dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200
+          || dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200B)) {
          struct resource *res = &dev->resource[1];
          res->start = res->end = res->flags = 0;
      }

Return-Path: <linuxppc-dev+bounces-7376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECDDA753D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Mar 2025 02:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPfrC71LNz2ySF;
	Sat, 29 Mar 2025 12:26:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.205.221.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743161311;
	cv=none; b=Drsc9BtnFS1weIwkXCio3RJd6o01IM1cwnfgebufFrY6fl9O16y1TxGWSi8kmnPvsP+oUG6cg4dmIxofBvZ7k0y1qfyQiOv0eJtR6bKhSbTbe4UGsE00VON+elRYekeFwKoRCUw+8ja57jdaSCO9tPeCWHLaB/ANLx9risdgLnQ/OleWKILXe8Q6s7SzbhnWm5Btpe0oktdHZvuxDftUmrx9TO82AQZCOqL1ef+ER5E+ATV3t1rkMnNOw7aSMQ/rHad+W8AL+b53uDiZyEUbatUisf4zMWvBl/ddT2sSWvGNG7fdXYs6uWXZ2DhdzktFV1RWiE7/CMtsefWw7neIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743161311; c=relaxed/relaxed;
	bh=1e85Oa/sKsFTWBH/G9IQp83iHWcRwVIXznp66WaiQHI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=ILSnRC+0YkOZNgIFGUtO8gCoF4bVoxDYTt6lUDiFen/ajApsWxDoJ0AJIpyV3uZUfu7HrYegtpqUhHSQKAZ54FgCjRogMH6W4Qbq0flVrKzXRnKk0eDZkCQ9rkTzXmylbhj7p1JpmWmGOn8gwIwHinfV2cRA6+gpZWb2BG4bD1lM81GpoLtvAoBbEGrkLleAHZPq28lPpJfTtylWJsHNLBfH6eifOs7fOGmIrmtT+hNCI1DFMtd2AjrsI97ZtjK4I+p4epulduytMZXk3NUQz04bxyKTUup7vC3gAIwYmmDtyviu77L7JcKod9NM0BVaedxovWmEzokyxM1ENQPpsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Red54.com; dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=F6weEJmh; dkim-atps=neutral; spf=pass (client-ip=203.205.221.173; helo=out203-205-221-173.mail.qq.com; envelope-from=yeking@red54.com; receiver=lists.ozlabs.org) smtp.mailfrom=red54.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=F6weEJmh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=red54.com (client-ip=203.205.221.173; helo=out203-205-221-173.mail.qq.com; envelope-from=yeking@red54.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2895 seconds by postgrey-1.37 at boromir; Fri, 28 Mar 2025 22:28:29 AEDT
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4ZPJDs0lYZz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 22:28:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743161303; bh=1e85Oa/sKsFTWBH/G9IQp83iHWcRwVIXznp66WaiQHI=;
	h=From:To:Cc:Subject:Date;
	b=F6weEJmhQm0vEm23WxFLgDGpn8xhot6aeHpp4tSG+ZU3peXYulVPixXmcXIh/yWTR
	 Xouhk6JzpzCIjy9ih5gtVWEWhkuTYwU+1KO0eMeB2SiS+YIx0rjIr4hLYt9vSoYo3V
	 dn2Dm4fz46l7aam0IurrX005cWcJVTEoUuXONqI0=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 43905E82; Fri, 28 Mar 2025 18:16:57 +0800
X-QQ-mid: xmsmtpt1743157017t6i1oblj0
Message-ID: <tencent_6E57A00F6D56CF8475CF9FD13370FBC1CF06@qq.com>
X-QQ-XMAILINFO: Mrv6PNPZjcp6a2X0MvRwg1ZdbbuJgf7r968we+8kTrJcUDS3bpUY/6QdTk7OdW
	 llpTNLlpX4AQQ8NMl4BoXn3FjU5+Gs1puUS/q/bV1hCptUeUyyQjB+nge/IK46uoV5mBmL41fbXc
	 LeMttqDfgCNGWh/1935cKf36ydkGt478WSHAd0pz2ugg/eg3DDeArgzLy2L4zV3zH2jB9X6dIlMT
	 TBEyghcpzk3vl79pAyUvrno/9mENwE3i7dooLE8tNJnUvJm+OGPfNLtIxToaBQxtKsTf81bQ673K
	 zWE9P7snSw9EQK0jHmse+o7ml/sG+1xg5gq7Lt8AlcXBBM9Hy35Uuv1NvbZDBq4iZiKDMOEW6yhl
	 C7naxRSzu7idxwKuUDN0sZxE+rR/kA6u1ZZswAdnX78gH7GCNB63DgmpLnIcBK3ltB+zv5EYqFSR
	 FWkfBQlZaAIXLdxOxBgjI9ge/jOfvI27tXUrv1PlZWRfpliOmVZDVkFyno0I2qiemp9jdcL/7L3n
	 pwulnESigBKDhweSf3/sgwOljFSw9bVz8DJQLKFNNGftxGhGahADS6PLKVp4A8sBBkzxQxQZswgt
	 6errAhGvZ/0g3UseiVq0LR3uf2XGs5LaW5YS2XR/8hL+6gGqJnaYMUFiK/JHQ587bn4lXb7AWxEh
	 0auhViMaV+qH50JyBPyK8im6MNNKmCvbR/leGeuvaDvTRpk8OmwUUaRrvVmYHHmDTIjZeBFtqtPA
	 1hy71RAWFKtwnXYB4rqE4itUxOs8XAu31b6PVw77UctW/Gh8G5KSP1pwJemmlwGCJm1ZWJuWHE85
	 HZ+ifX3oVxJO+cF/IOnQFjXwznnV/FemlSlWoqw3Yz58hYiedON1i5/tlM7fiWpdAwkxEShm/LrH
	 qD24Rv4TY5qlDDC6vNLHYe1TwZ/8/QO//gZaVVpKuRn4uxlHD+KEVfBk1kLeD2irKWthDvP9wP7x
	 4E8YXgYS9G0/TwovYZaLyjbQeyPO8BuEkVb6Bnbty9cX+WMPXtVXPF1HblQoB4
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: linuxppc-dev@lists.ozlabs.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PowerPC: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:16:48 +0000
X-OQ-MSGID: <20250328101648.52932-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [203.205.221.173 listed in list.dnswl.org]
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.4 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  3.2 HELO_DYNAMIC_IPADDR Relay HELO'd using suspicious hostname (IP addr
	*      1)
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

It is the default command line appended to the bootloader command line,
not the bootloader command line appended to the default command line.

Fixes: d79fbb3a32f0 ("powerpc: Support CMDLINE_EXTEND")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/powerpc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a..bc56b9deb4ab 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1006,8 +1006,8 @@ config CMDLINE_FROM_BOOTLOADER
 config CMDLINE_EXTEND
 	bool "Extend bootloader kernel arguments"
 	help
-	  The command-line arguments provided by the boot loader will be
-	  appended to the default kernel command string.
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the boot loader.
 
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
-- 
2.43.0



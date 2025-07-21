Return-Path: <linuxppc-dev+bounces-10334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC6DB0BE75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 10:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bltQH3MtVz2xKd;
	Mon, 21 Jul 2025 18:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753073693;
	cv=none; b=dMbqPTnzd6zshYiuDB7h/WFkEkAUGbSYizTWlMdXVYk7ioRvyA9mptNFvy/P0VT9QpwvM+A3JAYQmHz2s01a2Qd7EsIBq3q2DrK2rWpnoSCZJcxmLex/4FDXemJs3fe31XiFFatagcFoO/i/c0C8lyibmJ2oOPGAX9qMDSgJ/WmF+b0ie0sME7zsMy+3FWRSblmPmtP6nYlj5YAOKbfmg0Tajnea5tad/I4kbl5mAMuy5XppStY5VQXQO7GFUfNJAD2zugDcdGrYInZ5z0c5NVpMjshyrgYiE0d+sW70IXIc5MBSjH/0Sw4rMLYCXhFk7YOg3k1BAyElEk7rHu+Itw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753073693; c=relaxed/relaxed;
	bh=huuCQOiCI/l/o5VOAp01tohbM7fD8xmvpEMzGbxvGwI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Oo25lP23zSN5UXzugfW72a7Ua0Wat131pwSaC1/Is7RKbq1KsFs30DJVIScaPQAZ7Q2lC9vtW9bAaj4FWZJETzu+y87PeMzi+cP4qLFDAOKkzSvYIASBU3YTWYEM+L8Go45E2BWCq+Xb9r7HgmJUvBO9wTTjKlDf3SWOKEcQeI/ZTOAVP0QBEq7UHgfGcQFZrIdAr9rdOjF4iY5onagHPf5KIhVVBSzGU7RMN8DYSU+SDo6PRmH/TTLFC+X0OxEijPxfR9Eu5OlbdEvRGi0zEaHEBfbKTqvgMDlAAnOy/Tt1uEEbRnBaFa+GKJDA64dnQa+el3S8jJtTZPNfuCVxvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=wd9gtk7n; dkim-atps=neutral; spf=pass (client-ip=203.205.221.236; helo=out203-205-221-236.mail.qq.com; envelope-from=1972843537@qq.com; receiver=lists.ozlabs.org) smtp.mailfrom=qq.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=wd9gtk7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qq.com (client-ip=203.205.221.236; helo=out203-205-221-236.mail.qq.com; envelope-from=1972843537@qq.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1846 seconds by postgrey-1.37 at boromir; Mon, 21 Jul 2025 14:54:49 AEST
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4blp3Y0Pr7z2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 14:54:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1753073685; bh=huuCQOiCI/l/o5VOAp01tohbM7fD8xmvpEMzGbxvGwI=;
	h=From:To:Cc:Subject:Date;
	b=wd9gtk7nyzSGXncwTzXsTfF9LKYpTdssrV4NQWxRKIe0wao6hEUADMNW5AmorDYys
	 qlYTSqoBSWrUSd7USLmlFok2p9hyLPSl2s/ycGXJPJi3gVuSq6wXkMianQfwnvpV49
	 hhCRKxusuDCVMHZ6BSUUamwp4HyS2367z1N963jM=
Received: from VM-222-126-tencentos.localdomain ([14.116.239.34])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 469040FD; Mon, 21 Jul 2025 12:17:41 +0800
X-QQ-mid: xmsmtpt1753071461tsh4xanrk
Message-ID: <tencent_E9EF29CDB2286A690EB871B78BFE62491908@qq.com>
X-QQ-XMAILINFO: MsOOLhKAF3pPEXAa6VcqPqM6yfUgLB3ZpPoC5IRU4CTBRBcx6fLzuitNnRl1OL
	 i5PghUVGrZYkOOMpRRsv6E2wNsBrGkSFzWB25dD8Ys8bh0Y2ccPa6OQv8lo5SChErfXnKtCJ83+O
	 v+TXt2v9dNh9i3Y+EwJS/XMlxNCniGYbWoggoRdRzWZ60VcKEy5CgddW2LI5YfA0L8EQzO92aqDx
	 lo1QqaM3oIJdKQxP7hW+U8ktlrJOQdO7pers5xgrITKgG8IvvabrFYX4LLwmDvqHsaG3CvbDWTdV
	 tkV5KGifRjazgnZv+3JAECNJyf9c+pSIeied5gwLZWyVYmOIh0ikAwsoekgiJm1Cni91HUtMurwb
	 h3TkK2tGIEFNzO+O1Ddzh3WxxWDFgXa/+gX3ehHtxJv66LYbjWqsRWDSoG7OHenyGjblnzDsPFsW
	 xcm9jncFOMS5rzx+3HPWZt4ufpg3Ki+n5Yk2KN2+N90cAkevp1rDJZUOzdHbVhPkB7n0gjmSidhh
	 nd7+sukXUfiN78MUvcWeMcC5GZaNE/A7AYgxsJUafQtepCiwc88EOnvP8O1f3d7e+SCfqD/V2J1R
	 vu5lmnvwHOwzemHtL5dTme33Y7Iv+Tlef5H7Ubi7vRCvzs7rQTHoRvDk8WXlTvjyFQCW8fRBq9UR
	 Kc9mNvKMSOG1hqSRRPFyzT3XQmQPXiMYUNFIn9anfvevF0U+uTcner60S/mwi8OUzFYs//A++2Sp
	 lgxv8/9U5nFgxNEBhz8I3mHRqDytXup/N+trrU0eK2+ZWM0YrmV2VqFNM2/7Z4ah4x1EU+D5DB0R
	 BzmU1BRtlQ1fIg/GXHEpfSE8k5coFr5IYV35hALOeRzmGz2OjU+XISVEWyELKOF8KR2BEBKx6BOB
	 I6BZD1+KIeQX76Kywk/pn/TJR/nUvMaWR+Hvh9RP6ifDHXT5HUPL5/gxcCXiUJxMyNl6B3M8NYGJ
	 u8dK92bv3U0NQJxDorBLe/RrX3Uu04/sJfGp91PYbzF3cB+divCU4rE+kqzTbzUrMYhtltzojBnJ
	 nxax7QKaMAP84zo9+K+JQI/pjpBbsPdZtDjUsjZ8l49DjwJmZ2LSPm0298v1e0PwpReJjf0KtOQO
	 dIGl6wJbnpgNcIsa4=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: jackysliu <1972843537@qq.com>
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	1972843537@qq.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc : fix resource leak in holly_init_IRQ()
Date: Mon, 21 Jul 2025 12:17:32 +0800
X-OQ-MSGID: <20250721041732.145920-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [203.205.221.236 listed in list.dnswl.org]
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [1972843537(at)qq.com]
	*  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
	*      digit
	*      [1972843537(at)qq.com]
	*  3.2 HELO_DYNAMIC_IPADDR Relay HELO'd using suspicious hostname (IP addr
	*      1)
	*  0.4 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Siyang Liu <1972843537@qq.com>

When the 'pic-router' device node lookup fails in holly_init_IRQ(),
the function returns without releasing the previously acquired
'tsi_pci' node. This violates the device tree reference counting
rules and causes a resource leak.

This issue was detected by rule based static tools
developed by Tencent.

Signed-off-by: Siyang Liu <1972843537@qq.com>
---
 arch/powerpc/platforms/embedded6xx/holly.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index ce9e58ee9754..fefb7fd2365f 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -178,6 +178,7 @@ static void __init holly_init_IRQ(void)
 	cascade_node = of_find_node_by_type(NULL, "pic-router");
 	if (cascade_node == NULL) {
 		printk(KERN_ERR "%s: No tsi108 pci cascade node found !\n", __func__);
+		of_node_put(tsi_pci);
 		return;
 	}
 
-- 
2.43.5



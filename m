Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBB4E87CC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 14:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRFvV3mjNz3c2f
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 23:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=XW7jQ0Jj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=vBbH8cJY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=XW7jQ0Jj; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=vBbH8cJY; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRFtw11QKz2ymw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 23:46:15 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 882B7FBBCC; Sun, 27 Mar 2022 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648385171; bh=G70xCP6D8WSn+bAqlXu192tXuBsjh/gv9sAawqfU9NY=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=XW7jQ0JjvkbBwWYcDnJe2nlVcVuRIXoXRSxf3PNWwPKilsznYeHIMaHkGHbpF6CPi
 nqty3MnXTqG+wOEmI6ELfBW3t6Ot8AvrXhUDwqW1UwZJf6kiQJniSr9SnP78twlnv0
 ZUgcLapZcbEI4qbn8OxvPWktNikL6Kc+Etx6Bphh9afk/Hjw9xpphYQkktP6pYTs4U
 LH6YzQsfUm6Srdnzw7PCZmDV1KvBPkO+9qnzYPwcN+LOHDfP1TScrzVJPWp75MbJFA
 PLeKhwC+Gp8yjNM/5t52esOjGU9lpx0aWVyem4iFCEGjhJnePoGwI4TGCoWVDXFMVG
 IaZqNMJ7zdbtQ==
Received: from [IPV6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8] (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 2060CFBBBC;
 Sun, 27 Mar 2022 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648385168; bh=G70xCP6D8WSn+bAqlXu192tXuBsjh/gv9sAawqfU9NY=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=vBbH8cJYXUrIhSgvFCWqsIlouOaWa0Ob/IwOKcnk6W9EsrhxCv3d9ruHzL3uCcOyT
 isUVW1tcpcwMZ4y6KY5ZxcD9C88CnxszLWDsiAskZjdJ53DER27M6zK0oaEhWWieSL
 Juy7xWTEZPuLwOj9cO6+/7dR2PqcKQxjkt2MABFO0zPwNEsjU2mafYbXnQPlZ2I0cL
 2ZDQJwWjnuzEx4AHGvLxNgfwyXB0lIDpMXfYtHANjMklviMBw30yLOvmuMA/WBhhwQ
 lTIOL/KwWHU60GJWJ06zwdDByMnoxCjLnfIwK3SRtaOMOkXk/Hr5rtRBTGuebT4pdB
 MUwu53koBYhbA==
Message-ID: <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz>
Date: Sun, 27 Mar 2022 14:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH 00/22] Replace comments with C99 initializers
Content-Language: en-US
To: =?UTF-8?Q?Benjamin_St=c3=bcrz?= <benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
From: =?UTF-8?Q?Benjamin_St=c3=bcrz?= <benni@stuerz.xyz>
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 pkshih@realtek.com, linux-samsung-soc@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 gregory.clement@bootlin.com, rafael.j.wysocki@intel.com, linux@armlinux.org.uk,
 krzk@kernel.org, jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com,
 linux-input@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 lenb@kernel.org, mike.marciniszyn@cornelisnetworks.com, rric@kernel.org,
 ajd@linux.ibm.com, arnd@arndb.de, kvalo@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 loic.poulain@linaro.org, bp@alien8.de, bhelgaas@google.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series replaces comments with C99's designated initializers
in a few places. It also adds some enum initializers. This is my first
time contributing to the Linux kernel, therefore I'm probably doing a
lot of things the wrong way. I'm sorry for that.

I've gotten a few emails so far stating that this patch series is
unnecessary. Yes, in fact this patch series is not necessary by itself,
but it could help me understand how the whole process works and maybe I
could help somewhere, where help is actually needed.

This patch itself is a no-op.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 7afd412dadd2..706f667261eb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,7 +20,7 @@
 *.dtb
 *.dtbo
 *.dtb.S
-*.dwo
+*.dwo
 *.elf
 *.gcno
 *.gz
-- 
2.35.1

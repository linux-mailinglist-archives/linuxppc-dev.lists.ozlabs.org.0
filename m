Return-Path: <linuxppc-dev+bounces-8718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2BABD304
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 11:15:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1pn14z4Lz2xQ6;
	Tue, 20 May 2025 19:15:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747732533;
	cv=none; b=RSk8wpG4xLJbJbmaMhVnpfsEkUzs5OP67D71ZBEi7dsmsQbSv/IoOiEGSo0hX7fWOheZguc95vH0duCP0Vmtdg40O7b95LKqAEf/SWTEbIG6rw9DZSX+Pof13bJMcRFjp9EHUN5FFc3nkiNCIsaZ7Jh0i+VeZKAByoBiBA2dBq4Urzz1SarBLHr59stv1jhM+8h0154rreX1PFO2/9S8woosoEa1OrIpnESbsmFt4nOfbBBVVASjb4UsfONFbKzcdsRlJS42ZVfTTk0S16k3ZAIbR8PuLJSXiFe50G/dfUMZw+3aFx43jUBjYqgcYvJpkWibVBUPouN+kW6ZFYneOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747732533; c=relaxed/relaxed;
	bh=V4sCxXvxpvRawCtXxPYoQQN+JYu9kxt0EaHHdA8X3vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gURNb6e3ZMlVlXzz+qj3q0/yyAukpUE4AjqUEMQAuc8IWXylru1hTyBJz9FBdRHlYldvAgNMsNQQf51T1TzlV+aMj2ckIG4nAV3uz3sHZyeDxBx9RE2QCovkhWF01FZv5NTtDvIYntz4WDXzNCZnxe1/jeuaH0jpdxLrI5Z80Ews23q6bky020ulyBklRcDNkzUgA9/O10yZeCluQmRdbwpuy8TS0LIJhJnKlqNhWassL2leVUpwuAvlepOMUb+889ny05DjDCTIYiZpzWIEuhqxfvp5dWAj5cGky00LuoX547hdjHpb6sRpipkWsdAiYSz/gtZJMcqW9kWvR7MKxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=hEp/g49x; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=hEp/g49x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1pmx4Mxpz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 19:15:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V4sC
	xXvxpvRawCtXxPYoQQN+JYu9kxt0EaHHdA8X3vQ=; b=hEp/g49xaDhjnfiVwEk9
	CwdRwTQPoBJ54ZoGuXbTEe5qo3K3e3yrJg3q+vaE2/+PcyFHfrn8igsKLWoEsnka
	2pCB99ysH4giA/enQV3E+Maq53VjraM7R6ISniazrQL0NYe5mpUt/d2aHY9+Tj/J
	lcV35nEmyg5IEB5+OzlY7JMcrrKt8IZYRLLtzFVqc2ejnNbRG/UPdzxyom+LgRrX
	vGbH0fS6RAMRlBF//0yD+Z14G1wtWd7zN7aQBMtbDNJycSlFGEIDHgXXoF8Mpp0c
	YFqu0C55YKoFmKN4cw9ZTNR6hZmzbozvi1+y37AVLEfL4sqUdgdPmqpnals/u7WH
	Cg==
Received: (qmail 2812780 invoked from network); 20 May 2025 11:15:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2025 11:15:21 +0200
X-UD-Smtp-Session: l3s3148p1@iP8asI01VnltK7KB
Date: Tue, 20 May 2025 11:15:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <aCxIKd1QjIpaviBT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
 <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTfnXA1eP0jlrO8H"
Content-Disposition: inline
In-Reply-To: <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--uTfnXA1eP0jlrO8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I took this patch in i2c/i2c-host. Please let me know if you want
> me to take also the others.

To avoid the dependency with your PR, is it okay if you drop it and I
take this patch via my tree?


--uTfnXA1eP0jlrO8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgsSCUACgkQFA3kzBSg
KbZAOw/6A3hDs9YQUYhu+1GXDjNFXv8Hb5AsfmmVZi5znohVcaBQNbiP+W1ONsmc
JYoazgpmysUb6ki2iVEGBzv56wUT8FVbzl60IzBaRIDohYXbBL5hIohM1snOmmVU
tUmQnU5hHEOAQxSKi1manKgLUpLxONNCIbNwAGg6jWmlCyRIMGUDpLuo3x7hpnMa
td1l6YsnbohsET5+tETJEFnzG6z1utXQFyAXM4WhZLvNV1ovwAoKuY63UOpm9TAN
80kR2W5DifS0wphUbZisTE/ZMTaIehrZGf/W8cMpYfztWYWg/u2EAxlfafShr0Lx
3PUEZCCYduS/1CMv/W7SmnO6wl+vxegGcQErsnr794XpX/2/9cq8C/G4/lst3ZNS
/zhLKUFR4Is+Y0S98XMB/t9pTW1YkX413BG13XcSD9OcOl2sZB52PaPc0y6fNM/o
+yNsFDGOH863nfL8lEPZ2d1lSR6QtSMucLuh+WcCPCPok1Ow5BoamnrA5owZTpHy
JFEtiSHmbpBIXL7eIJHFglYKRlRy2v3sOrdAmN5yvyNRrDG1TDsdGtck0tXvR0UX
DudPJc9ZqJcCWlRP0pU5JbFQpTSEIAsAAdra+kUu6gspkgDoqHXFgw2tZD3cZktV
qkKgr8J1m0A2ehocqy/WdLSgqwP3mawZdB4JHx22o6piVgwAJiQ=
=k0Qi
-----END PGP SIGNATURE-----

--uTfnXA1eP0jlrO8H--


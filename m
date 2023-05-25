Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F7711390
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 20:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRxCD64vRz3fL9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 04:19:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=opM6Zycx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=opM6Zycx;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRxB52lJDz3fG2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 04:18:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1685038584; i=deller@gmx.de;
	bh=K2LpqUproNVaEYfciKE2xUVes3IFu6inT1ojIZWxRK0=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=opM6ZycxGEnfKtweb5YWEWAN530UjohDS09mCOh47Kc3Snfr/ROPCfIOylBQndoe0
	 ZLTz1BjU2i+TZdc+BU0Vd8M8Wn96D0zdWLphkPmTjGKyUODaFFapwbEBfZpLnQWf0d
	 dDNTogpfAaB7eMI+zlKffM1IsnD9yA9fQ0FHEdBH+OCQx/CffzuPXvfzk6u5LnAuUt
	 M067+FohpOaj7qFR3mAh+CzlDbYZH+jOmfokYU4AbodaT2hf0dXJVQ7hiMqViMf2tP
	 X5HK8oTI4EYl71gYwno969NU7xlpu9Y0wSDTgqCs8agQDFU6yDz7gbf40EgYGT/v/B
	 FHSBhye0W50Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.173]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6mE-1qPBBj3Htk-00lXgN; Thu, 25
 May 2023 20:16:23 +0200
Message-ID: <dda2616a-f4d0-fca0-5c5c-7a0f49f947e3@gmx.de>
Date: Thu, 25 May 2023 20:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
Content-Language: en-US
To: Vlastimil Babka <vbabka@suse.cz>
References: <20230523091139.21449-1-vbabka@suse.cz>
 <be109b49-8510-5887-72ae-738db9945619@google.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <be109b49-8510-5887-72ae-738db9945619@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K1zdwa4g6OWygvqnRQK3gXolaxN9hnmaCD/sfFOygFxv5gAj6ei
 THk+aQNQMiH0oWH34qhfh7vFSX4rOi68z08hA0sfnE3E8jQpgoB8aCeQFBdovw6CWb27TGJ
 akSe+X2hZ+TCagNXuXGocolM7BrEtSmVXxnNOhc988TLQvzcbu0JUSnRiyxetx0lbRk6hr6
 RCFXL34mSj82AxaBd7hHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yGqLH3vcUq4=;IeBJUDWQ4H8EmLJY7QSDptEyjrX
 /7ngAukTu5+WessWpw6c7f8qrRpW4JGSC7nPNRjj+Y5miQDY0dsuPzsAcCL6qd/PR5VCMHBPS
 E8JgPITjt58RQW+LXkgbHua0lJgufsN2sZTZLtGxRxzIcjbZzYGkvgfhxHpgnt1Qc4bI1F2jH
 IlNjipVfrrLZ9EknTVNXHpIbNmuaggtQUROs1GNscWNeOXuTbRtIElWCD3lG/2SaGCh2bJZ0H
 4daYHz9js01cfK0Y+vipU98eZ+G9vFObXuVLs5A3ULpfabkfcqLBZBw47hiC7xjVhjH7LOQkC
 dgWx2wGHzp3Uf6q3Kt/Ea3Ycn9D/fCFtoYWAXLQh48dMj9o8wz7g8bC7D5QYUlEygTpq8uBVG
 UFrzmA5nd/gCh75Ei+6B1JKixUNOmUNdJZ++9RhNrF4FX0zlIuzQH/PcKIrCoZRsURDQt8ZuO
 wQkku4i+G0xieBvC3yyOQImF2uBxMLYG8UTDEWH+4+T+JUp9BWFsxXeAwg56xS7I7McvJrLLz
 tUA5Hn6e2vx6UPn4nvHeA6JSXM/5pOX7X7Kw5IGoWspGzdY+X1OI9nDxRatfMk0dBppo9VdoD
 LsvM4IGmGM9hJZJKrBm1b+lfQwisdHfAjHTHjE9g8ZrflyBl4SP2kv+7cQBSyjCzWpKHDt+OE
 PvlYbD52GIneTph324pRyi2niQIt6l7SOhAz7514Iox403svHi9vqbyrQWNteeRl8zG3kL3FN
 U6AGRE18ei2676TvUjU+wckhBVDKBIKQhctOycQFMN3fBiyv3XJQGOJlofBh6wSrv2FEmF678
 2NOdbX/20joBRFq4wL6mUlvDxvkNv/7q5ukMbQ9BdHyNMmcbfWCFUx4p+LIcsJ/taNp/x4e3S
 3D9bXJ7icV9nFtl0BFX9I8mT1bHrL1rslN/dCd4iHansWfGb+Pursh6OC6oYejd2RljJ8UM/1
 WDrEhvOseS9Yb+a/0lFfWeAlRuI=
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
Cc: Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-renesas-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-
 arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/24/23 02:29, David Rientjes wrote:
> On Tue, 23 May 2023, Vlastimil Babka wrote:
>
>> As discussed at LSF/MM [1] [2] and with no objections raised there,
>> deprecate the SLAB allocator. Rename the user-visible option so that
>> users with CONFIG_SLAB=3Dy get a new prompt with explanation during mak=
e
>> oldconfig, while make olddefconfig will just switch to SLUB.
>>
>> In all defconfigs with CONFIG_SLAB=3Dy remove the line so those also
>> switch to SLUB. Regressions due to the switch should be reported to
>> linux-mm and slab maintainers.
>>
>> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@su=
se.cz/
>> [2] https://lwn.net/Articles/932201/
>>
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>
> Acked-by: David Rientjes <rientjes@google.com>

I did tested SLUB on parisc with 32- and 64-bit kernel, so you may add:

Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge

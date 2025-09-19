Return-Path: <linuxppc-dev+bounces-12420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6DB89E24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 16:23:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSvqx4MzRz3cZ2;
	Sat, 20 Sep 2025 00:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758291805;
	cv=none; b=gvlUipvW6uew4CK+YOEVtNnUMWp+7M5mFr2srXVTbtgfqVbfrFM8FnvklB5jKku5Q9xhimR/dklgDqq5N/fnG/DGqBdOOu9tNQHMKuBw1BD0K438P2/4tU1PKVZnji+6ODAdgJNiwWcOjhR3yYGxMM/l07rz/Won3xjm/Qrxj7Modx4kHJf7A5SISe391uU3oD7wxsI7PaMx+AnSEOCP0t7eJ2jQHwJA7M+Xub3D4ZxFcI/YNJY8vRwA8M7F3x6Nd+A9sHrwSwJXw8LK0SrBqFyNHi+9oW85z2dYO8EAB248OlBIVR6iNPf5oOSzp5JpmSa1PdzXHbFjUzKFz50dIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758291805; c=relaxed/relaxed;
	bh=YRT5Nwn2wzURoZ8UuGQ3v7ArypGDz4ExisVSnJCpO/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wuv12DbfXKOpIFG8Fgc+Gh5kJKRlDtRNvhZ2XwDXZsKhpv8qb+0j90Zoh/d1eh6I3eXcMYLI8z966cWmOLZEApboc92z1gqpgVRtYFW8wC7gWgaJO9CtBn5AL7homrLOkKKf2PmiASCyITgOWYEZHaZnNHkXmD3FS7Ez1LFg1dJnMPGQWKRYYkWwZ5MS7mvNwKVjg5US1kJ21IqPCntdE/So1Av2r5YA43OqCT9S0otTvns7ov1F++nnHtsIWy155Wrf2/FuNpyrZSOSC/GgvE1vJwtk8AJRSZotkzPlconGcrlEnwqZc91NanH58kwbXKW8dg53GTFQLwYOMHvDow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=YgInmJE3; dkim-atps=neutral; spf=pass (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=350b08d43=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=YgInmJE3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=350b08d43=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSvqw1q1Fz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 00:23:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758291804; x=1789827804;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qurIkcqttoZIUncvhRG2Ez96lBIE03pACZ8DNjCjo6Y=;
  b=YgInmJE3N6Zjj4wqg6JnyRLl4bGPnsfNYgdJPsxj4//BBF8SFvU74ezE
   7guDNrQHlPCbhZv/pf+K6jGSPrOxyL9yqCczFrog4VdUU+Ff9afNVVh8I
   wea4afbMx4a//UDAxelmc+w0/gymWJGrJD+bOzqlZApe/kA086hAqSCgQ
   n9L1PEpT0nSmFsf3zKjz2oFnEbKLoWREx2cHYk0I6oC3GRKK390wQccUT
   JV/G28CJP1HRBV/3XPzS5LIfEghgJp7eTGw3upmJw6RwjrCO5S3GhoPvV
   n8Re/XC5ayYmJ3Kg06OIQhJ7rNbOHv2+5ciZtSuaBsc7jZBJ2U1j0+fds
   w==;
X-CSE-ConnectionGUID: JybeGcZkTJ+KqZUxcYOinw==
X-CSE-MsgGUID: 4qBXFe4MTX2xEanG6m6MKA==
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="52616540"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2025 07:23:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 19 Sep 2025 07:22:15 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 07:22:10 -0700
Message-ID: <775e175a-6699-4b7b-a997-3d142fdf64e4@microchip.com>
Date: Fri, 19 Sep 2025 16:22:10 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@nvidia.com>
CC: <ksummit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mips@vger.kernel.org>, <linux-mm@kvack.org>, <imx@lists.linux.dev>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger
	<richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, Andrew
 Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Suren
 Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth
 Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18/09/2025 at 15:12, Arnd Bergmann wrote:
> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>    get kernel updates, and the only one I can think of with
>    DDR3 support, but seems to be limited to 256MB total memory.

It is indeed.
No difficulty on this part of the product line ;-)

Best regards,
   Nicolas


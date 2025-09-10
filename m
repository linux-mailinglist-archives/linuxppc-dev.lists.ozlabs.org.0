Return-Path: <linuxppc-dev+bounces-12016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B5B5242C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 00:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMZrJ2bP7z3dHf;
	Thu, 11 Sep 2025 08:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.145.64.142
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757522577;
	cv=none; b=Xb1H5RAHWT9Z3UreLh5nY34eprX+ohg20aTcwWl59QZLPOTM6U4OQWS7xQ88cZc2JNWZbPsHF/ZxbeVecCctMWDo5U1pADpOuvw+mRckV3PvFemDHCreuTRntWpIqln2Pw4lSB5ra3Wexdz1WfkAFbHctyoWKfoUZfT6iFLfd+MxfT6y7ZXPU3scQb6poKpcdU+ZLBwMb6DB75dN27h4KFP0U6YbDawiii2oLz9oNNvwIbczSw71RhAHDSivn4CB7iagHMGqhYoA8+5+5xTUMWemf3QB1d3iaygfPcETpqh0zD9jsVV8S9c5/YDpisGYTZJM+lZU29A3Unj2W9vkow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757522577; c=relaxed/relaxed;
	bh=G1VGNtTxsSa5nO2Imc+ky+WEMJh0OsY2+KqAjaV/88Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILy4QgyDI0Wpj+HmEUajIFfGPMMHA8ig3Ad1wD1+OsoOJ0nx35JeYEQmWjSxrdKgH1RmHT0qanLnb3ZXmJ2OcA64Mz6jPzCVraZCPQil9ScsA3mbmdFZ/R4wN7jEy5p2Go5xO6MqMRxXHP0+iCMJX1w0BHNvJjEC7YgihUd8E+xL7hRfGySwphdgCajk7Yzgc/ith+jEa9o6PtlxvVfS5FaYC9rxdykudrRuWjBwydcTD8w4649h4xNQMQL2LODMoBIELUYzmLNkAxO4epzrb+/LcgKc+Hy3JWSY7AdmbNSLEfBwWU4SuQj/Mx5UICr8O6kclqNUNt5+2NaSHVpsKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sr71.net; spf=pass (client-ip=198.145.64.142; helo=blackbird.sr71.net; envelope-from=dave@sr71.net; receiver=lists.ozlabs.org) smtp.mailfrom=sr71.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sr71.net
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sr71.net (client-ip=198.145.64.142; helo=blackbird.sr71.net; envelope-from=dave@sr71.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 485 seconds by postgrey-1.37 at boromir; Thu, 11 Sep 2025 02:42:56 AEST
Received: from blackbird.sr71.net (blackbird.sr71.net [198.145.64.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMRM436kCz3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 02:42:55 +1000 (AEST)
Received: from [0.0.0.0] (unknown [134.134.139.69])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id 4234E20193;
	Wed, 10 Sep 2025 09:34:45 -0700 (PDT)
Message-ID: <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
Date: Wed, 10 Sep 2025 09:34:43 -0700
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
To: Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips <linux-mips@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>,
 Nishanth Menon <nm@ti.com>, heiko <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
From: Dave Hansen <dave@sr71.net>
Content-Language: en-US
In-Reply-To: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/10/25 07:04, Richard Weinberger wrote:
> I am part of a team responsible for products based on various 32-bit
> SoCs, so I'm alarmed. These products, which include ARMv7 and PPC32
> architectures with up to 2 GiB of RAM, are communication systems
> with five-figure deployments worldwide.
> 
> Removing high memory will have an impact on these systems. The
> oldest kernel version they run is 4.19 LTS, with upgrades to a more
> recent LTS release currently in progress. We typically upgrade the
> kernel every few years and will continue to support these systems
> for at least the next 10 years.
> 
> Even with a new memory split, which could utilize most of the
> available memory, I expect there to be issues with various
> applications and FPGA device drivers.
I'd be really curious what the _actual_ issues would be with a
non-standard split. There are a lot of "maybe" problems and solutions
here, but it's hard to move forward without known practical problems to
tackle.

Has anybody run into actual end user visible problems when using one of
weirdo PAGE_OFFSET configs?


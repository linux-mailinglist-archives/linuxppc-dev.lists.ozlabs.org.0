Return-Path: <linuxppc-dev+bounces-12073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0761B5488C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 11:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNVJj4yFKz3d3g;
	Fri, 12 Sep 2025 19:59:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757671173;
	cv=none; b=UPOTIWjxQgxsjTzJvKQxbuhPeRDcpaJc7vHXvCMNpt1wC7fWK6pA0sSdOmMWvfB4kNq9NdD1wIgwOD0ZNkdGWjnvBGHXn435jxeuKvHsFABNlANgjIfQS4Q+TptNc9OKc9cQEEjntJNmitgs4GaBhvWO5YbXPgClA1o66hs+GSy1quQB43MPwQG14dzQQmgXi4JqPiTjE4TFC7xJI69m5awULPVXy707Ub93js8cQJgsQDpKYKSPCxMihZhOc1PKjvQl/D8TEMMVBfrirPlv6/+nAuGmXtzappESKeSIH+2I4Ob61b/g+6r42fsnVc+wU6Hey63LC6HNtWCFhJIyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757671173; c=relaxed/relaxed;
	bh=wXwHzs3cuy4XVADNPAdl5sfqQoJprLOTD7qqu5IX6ek=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=inZljM9J1R+8DatXC0xXaemPcHC08C27IW/Y6pVqpj76xXhs7Mt5gQzxq/TwISyKN/5W7mq7K/D5tyQWqmh/3QFN5zeptWQkqJHw00EzPZwjsiSqz+szRScriz+LcfyuZhnFtao/NC80c9IRFud/cPDDQdIJp03JEBwptLO1iCRjI82QxoGZq4OHggZSTY4B2FLQ8iu7q1JGnGVXPTXGjBBy4i3AQ/qFg6T2l3paNKsStcZ+QqKg49NrtL1hFCqUEgroLldtWFY9C0RmhXWGjAZQ0tH6qvSG9aHnzNGZIEC2McEodEpDBbsur3PXDjuxfEv1Fn+k69XJqzK0QprpBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025082201 header.b=Iv4suKXi; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025082201 header.b=Iv4suKXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNVJh5bqcz3d26
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 19:59:32 +1000 (AEST)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58C9wovj1383935
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 12 Sep 2025 02:58:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58C9wovj1383935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757671132;
	bh=wXwHzs3cuy4XVADNPAdl5sfqQoJprLOTD7qqu5IX6ek=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Iv4suKXiAxoLsxR2i11aAdvhMLL0LO5cMcs1CvBme2/ey9ISbE8mmgQ2f9bOYVhlv
	 2l1qElf6X9ZwESTueasD9/lDo017OlrdCm8f2y4ckj3NA9QXf4T5BYDKS6pLCC2hQE
	 8q+SZy2Dwf91S5hGoA2CP767WUCArqI8deJyBK171k0gbhXOuRszd/TpSl98B8Gicy
	 pmBmXN/1mNCAHsS+pgcVurnG5yieK0YeNEr4nImgCKJ7mZJmOM5odOCX4B0Ck3SN+E
	 blt70msFBUwxUp3/M097HMDT54EEYk5VaHutWeDlQ5yVo3/5b/ggpIM2UrfLYw+JHB
	 /PgINChn3uJzg==
Date: Fri, 12 Sep 2025 02:58:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        ksummit@lists.linux.dev
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Message-ID: <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On September 10, 2025 10:38:15 PM PDT, Andreas Larsson <andreas@gaisler=2Ec=
om> wrote:
>On 2025-09-09 23:23, Arnd Bergmann wrote:
>> High memory is one of the least popular features of the Linux kernel=2E
>> Added in 1999 for linux-2=2E3=2E16 to support large x86 machines, there
>> are very few systems that still need it=2E I talked about about this
>> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
>> and there were a few older discussions before[4][5][6]=2E
>>=20
>> While removing a feature that is actively used is clearly a regression
>> and not normally done, I expect removing highmem is going to happen
>> at some point anyway when there are few enough users, but the question
>> is when that time will be=2E
>>=20
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason=2E Some
>> users obviously are alarmed about potentially losing this ability,
>> so I hope to get a broad consensus on a specific timeline for how long
>> we plan to support highmem in the page cache and to give every user
>> sufficient time to migrate to a well-tested alternative setup if that
>> is possible, or stay on a highmem-enabled LTS kernel for as long
>> as necessary=2E
>
>We have a upcoming SoC with support for up to 16 GiB of DRAM=2E When that=
 is
>used in LEON sparc32 configuration (using 36-bit physical addressing), a
>removed CONFIG_HIGHMEM would be a considerable limitation, even after an
>introduction of different CONFIG_VMSPLIT_* options for sparc32=2E
>
>Regards,
>Andreas
>
>

It really sounds like a self-inflicted problem=2E=2E=2E getting your custo=
mers switched over to the RV64 side is probably the best you can do for the=
m=2E


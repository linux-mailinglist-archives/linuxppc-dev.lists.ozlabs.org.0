Return-Path: <linuxppc-dev+bounces-12145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70587B5606D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 13:01:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cP7d0750Yz2xnh;
	Sat, 13 Sep 2025 21:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757761252;
	cv=none; b=O5bQg1rnEd1mAJNbAlSVTzhTZkagtjg6dszz3t+OZd5IrHGIfy0HABQ2XnL8ZerFCL6dpqm5G6Et0Y/TGJczMVUVkjWETkX8nm9oLstd2atfQaMPpmSSOOB5HbvqvkWO0S2ymGwP7AJNGNF6YcDEWvbNaA2mkuOpAyG5J/BIRqv9oaG/7cxJexcylPkJtKbwd2mmS600pc/wAEjSJQHeqmsLtkmfqhxVXjvCNvBUoXpwCfmhgLpRm9AZBLxdzjAKlFyHwYX2kXV/LjWY1lRe1Pb1qD4jV6yaFd1MQVnj3P/nyvS56JKGWqBG5MK84r03Ffm3nTPkWi/FxU7bHr1Znw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757761252; c=relaxed/relaxed;
	bh=1iZiELOPGgRZDBi2au223SZgjALhV2isPuOLR/SKVds=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=lSHG6oE/ee2Qhtpm41ZGqEPLYnPZij3kIqlZz6wLINWXPZcXLxbCFdtjh4WTgmzUpjN0oqXDxvrnXDOFjw4EoNibMN1tBdkICN94BHoyyxa5I1nbsC0SpjPGpT/XyAaXB/crlMqed7MFl1Kxq4eqKCr9s+DEHEvIj4dRa+g1WoEwQnBJ21RqAkKvnsWnFTX5h8R3othfABPwrWQqFlM90UydEiyPFm2Z+j28VjVQXKcq1yaKzVI1iEXzqsBR6JX9WmqtfkRJNvHVid2uPjFvHPEfpwuPlZsDz6e+2QsHUWgL0UF31gTXhvIVZZ588++yVhFbJabHzhogF5a2znuI2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=heyquark.com; dkim=pass (2048-bit key; secure) header.d=heyquark.com header.i=@heyquark.com header.a=rsa-sha256 header.s=key1 header.b=ZPwflY85; dkim-atps=neutral; spf=pass (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=ash@heyquark.com; receiver=lists.ozlabs.org) smtp.mailfrom=heyquark.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=heyquark.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=heyquark.com header.i=@heyquark.com header.a=rsa-sha256 header.s=key1 header.b=ZPwflY85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=ash@heyquark.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 425 seconds by postgrey-1.37 at boromir; Sat, 13 Sep 2025 21:00:49 AEST
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cP7cx5ngtz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 21:00:49 +1000 (AEST)
Message-ID: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heyquark.com;
	s=key1; t=1757760798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1iZiELOPGgRZDBi2au223SZgjALhV2isPuOLR/SKVds=;
	b=ZPwflY854lfR6+0k+h4yDgxJWLkTlhGcfYHnB/PhTWkU+vIwyWhZXL2UE3uTJ/Xix0zK+U
	66IwEf6xsXakDFWxyhzg5a83nJTtKwd9NJnINz/rCmXaV9Cc68bKyH7w0BLmHPvxDQnBrH
	/+l9KErxJkMkbsE2KDFnkgWqLYMw5nWZqZS9Px0jM1D+spx4jdK6KajIco0RNkdxxcHtaV
	3Eoi6Mp6KFCk2A78L+jA21XKKsmGZPFZGrvggAWwSeXCADlOjNHhaRyrU4FTMwimAHNr1o
	t7axN5rc/TW5uDrrhmLVPsGCp+EF2UhBiCCo9Je2k3qGp0KZ+JF6VdQTsEaskQ==
Date: Sat, 13 Sep 2025 20:53:08 +1000
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ash Logan <ash@heyquark.com>
Subject: 32-bit HIGHMEM and game console downstreams
Content-Language: en-US
To: arnd@arndb.de, christophe.leroy@csgroup.eu
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 officialTechflashYT@gmail.com, AWilcox@Wilcox-Tech.com,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello!

LWN recently did a piece on 32-bit support in the kernel, and thought as 
a user of 32-bit I would share my 2c. [1]

I maintain a downstream fork of 6.6 to support the Nintendo Wii U 
hardware [2]. I'm also in regular contact with another doing the same 
for the older Wii [3]. Linux on this era of game consoles is doing 
pretty well :)

The Wii and Wii U are both 32-bit PowerPC machines with holes in their 
memory map, which I think makes them interesting for this discussion. 
Let me summarize the hardware and kernels involved:

Wii (2006)
- 1x PowerPC 750CL "Broadway" @ 729MHz
- 24MB "MEM1" + 64MB "MEM2" (non-contiguous - MEM2 starts 256MiB in)
- Kernel 4.19 (+ CIP patchset), dev has been working on forward-porting 
all the drivers one major version at a time (he's currently up to 5.15 
last I checked) + limited upstream support (hardware bringup, UART, not 
many peripherals)

Wii U (2012)
- 3x PowerPC 750CL "Espresso" @ 1.2GHz
- 32MB "MEM1" + 2GB "MEM2" (also starts 256MiB in) + various small SRAMs
- Kernel 6.6 (+ LTS patchset), I also had a run at upstreaming some of 
it in 2022 [4] and would eventually like to go again

Special mention to the GameCube, basically a slower Wii with only 24MB 
direct RAM and 16MB of non-mapped "ARAM". Wii Linux has experimental 
support for this where they use the ARAM as swap.

All of these are flatmem devices, as that's all the 32-bit PowerPC arch 
supports, with the Wii U additionally enabling highmem for its 2GB of 
RAM. Both devices have a small memory area (MEM1) with the "bulk" of RAM 
starting at 256MiB. The Wii U in particular sounds like a candidate 
system for densemem - I would like to read up more about this if I can, 
I was only able to find seemingly unrelated information about CXL when 
searching online.

There is a somewhat active userbase for both devices. I only have stats 
for the Wii U side, but some rough nginx grepping for the last few days 
- Sep 7th-Sep 12th - shows 39 downloads of distribution tarballs and 
bootloader binaries in that period, not including torrents. In the past 
2 weeks - Aug 29th-Sep 12th - 9 people joined the community Discord, 442 
total. Anecdotally, the Wii Linux userbase appears at least twice as big 
(based on their Discord activity).

Distribution-wise, we're supported by ArchPOWER [5], Adélie Linux [6], 
and other distros. The Wii U's Espresso has CPU errata requiring a 
patched compiler, and both distributions ship separate package repos for 
this CPU. ArchPOWER requested I rebase onto 6.6 so they could have 
firmware compression - previously the Wii U was on 4.19 - so there is 
some demand for newer kernel features as well.

I know I'm talking about hobbyist use - and mostly downstream use at 
that - and I do suspect that in the event of a wider 32-bit deprecation 
we'd be fine on the final LTS, whatever that ends up being. Still, I 
think the Wii and Wii U represent a decent number of 32-bit users, so I 
wanted to add to the conversation here.

Thanks,
Ash

[1] https://lwn.net/Articles/1035727/
[2] https://linux-wiiu.org/
[3] https://wii-linux.org/
[4] https://lore.kernel.org/lkml/20221119113041.284419-1-ash@heyquark.com/
[5] https://archlinuxpower.org/
[6] https://www.adelielinux.org/


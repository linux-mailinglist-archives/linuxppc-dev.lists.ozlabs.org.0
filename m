Return-Path: <linuxppc-dev+bounces-11268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F8B34C8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 22:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9jYn14BWz3cmP;
	Tue, 26 Aug 2025 06:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756154909;
	cv=none; b=olsK59LMXy156tnF6jQNugymjChdW4mkZW+iWzFIZGgI2o+PTkxbBTzr0mzzgEUSV6ZBGojS75+V7Aku0PDrAAcW6SyQWcLckIp2QkniMBewPIX21/Q7kOAdbWzbeV0gi8zw+pOlld0ryhvN4Dib2oTtnbj18oWEyFdegeKXw5bjKf+tsm63ZQfTIc+Y2wDZke3GIXm87DepNFjZ+8CJENFbQ+upqx6jdVDz977qcWLe8NyrUdP0H9aiYx16P+epgLQOzsewZh/4XgwmEo6GUrwG3dKQEp0nZZr6OcGp48TWA529KaIf6mnj+1MGR+VbDxEvNKm+pU7M9RXYOEyPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756154909; c=relaxed/relaxed;
	bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j0qa9HH4Y5P4IRRVcNFjDo5rvgfseGSDpJuKEw+/rSJsUvGsg5h6GQqqeTyNk05qZA68VTzdPXxenFNWDdLieGYhhT+sBkrAq7Y3Ki4OrAiBcIhR38S09kmjsPfsuwPu2XHgCR4t6IannNN5VS6x04jhmmCAsWGEnNbX81XUJ+inudtV57SG/GJfvGwFzmlWkDwuKFK5DDusz4T3hNRTDm2Gwo3+Bu5oDmp6RoOjmR0WbcRhdfZvFnWr5xwDsPrrM4LAdss/q0vbdvVS2PzkQHgRQfkmIrhaqCZ9tFKmuoqdPQemj63Dmbl3JVEF1tztqCT9oXYHdj+M2S0rg1t3OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk; dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=w2SvBFrd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=w2SvBFrd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9jYl4Cjkz3cm7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 06:48:24 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3eb6da24859so14330805ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 13:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756154903; x=1756759703; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=w2SvBFrdNxpamv/WiRLo8GVDMK1A6FZgKLDL/otVqU9D78180HsLPD+tQlwyV1R6sB
         cZcyjFuINHyX+/7I1f3lh64MrBpxAkLvp4AwOPgJU/jc6Qcw99v3k5ie/SrhSu1JOPxB
         lLRuy7fwb1nh/HABXMaVjYFSFouADCLcctAzs/X+VngvAc7TdiRnBkBhwlr3DNU1FsZj
         /xhA8347C49u40ot1LXfoUAoDkQ8aMVgZro+zXkg1qMumeUwgS25uTC96v28GFqNyRAX
         3ym3lh0yzFKkxDMf5WQfbBjbuP355woajLrkTMIn1+vkKi3pWzgq6aXlf3pLuwzfgPDU
         9Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756154903; x=1756759703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=V65jGctbfIXiXOpkyYyQQK6kzd55dKB4dRYtfgPnyuBAc3mxrnvpj3CHkPI6qvpqU6
         bFU0totcpAbpY/Yjf44mKxdyBfX7Kz0sLj6hSTxVycTQN4WCTgwRk1kKM1XvnJzC6qiI
         3EVfeweJp3JkBKoUnRexaHJohQY3ZkPJgjzsHzknfMFIGqqukJgMbB1Rmv1bNKeHyv47
         Ybj60yTFoczIUO21VNnBWUNiUZgmrNmhxJl7azJcrxzzSfEbrJ+1XN+kSkwwdGwxpey6
         QaTLwH1oR0F9qUOOJPEi1QJD3rUG+/VSYKv1LwYySdbwglq0u5/q1avdrvBL3/p6FezM
         n6hw==
X-Forwarded-Encrypted: i=1; AJvYcCUCm3dDJvkTqUalPRltRftwpZrb57btxkR0V6EXxs9tECyk1bnjKS8mq45ZP4keL9pP+W1FAcJDj+zoq/s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhnqGdh26b8aH8Nfy3JDVwJSkN9UbufmOHkoSEVF9NM/dRgBhs
	YzavB9UukbqYlsvVVEYCdMPiK8ZBGEjYW87jJdTkvLhon7P+KduV5mtj9G3pI5PZAQg=
X-Gm-Gg: ASbGnctVl3ItNMAuaLTOSqLhzgkiJkKUU5yf8VYEUS1yOssFg6HWSrCaFHhOr33qCkx
	VDrTXOEQ8y0ob+w2+F9GipJIOd6IVi+OaVW97S5UNrgUuf4gPbCL15ubTtXAdxB8jAOkjRQUVg2
	xlYWS4mL5lq9vucYD3itSV/OO1yaBlFVEPuGGfm7d+9PtCyZdlZveqAfyTzYCGA3ti2FFkFp6Ed
	bDwdSS0DvE7Dr+kEbzfNKaDr/qqD+lbHyi0MqQ4hYoPBX8YFxCKzaqm21sJkis9XS1wGyb0t9Cl
	M1medD+8K/Y8orfgV9JnyCTT0buh1p1ghFiBRD7ya5q6RStk20bHJ0RIuSbrDtJgzyWKIpl5V3c
	piRUEQhMUioZUUA==
X-Google-Smtp-Source: AGHT+IGz/OLusjKqnvYuytsepj0QasUaFhQNGeebbI4cWxx4cpCIdsaTdG9b8SEzhdQW1utDLqTgxw==
X-Received: by 2002:a05:6e02:1582:b0:3eb:cca5:5586 with SMTP id e9e14a558f8ab-3ebcca5874cmr83676445ab.17.1756154902655;
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4effe70csm53084775ab.51.2025.08.25.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>, 
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-Id: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Date: Mon, 25 Aug 2025 14:48:21 -0600
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> There are a few places in architecture code for the floppy driver
> that may be cleaned up. Do it so.
> 
> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> 
> Changelog v2:
> - combined separate patches sent earlier into a series
> - added tags (Helge, Geert)
> - fixed typo in the commit message (Geert)
> 
> [...]

Applied, thanks!

[1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
      commit: d74968780bf287958e2815be5f088dd6c7b7aa19
[2/3] floppy: Replace custom SZ_64K constant
      commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
[3/3] floppy: Sort headers alphabetically
      commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

Best regards,
-- 
Jens Axboe





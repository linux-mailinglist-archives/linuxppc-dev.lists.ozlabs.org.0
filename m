Return-Path: <linuxppc-dev+bounces-12259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A037FB58B96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 03:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQlQm20jnz303F;
	Tue, 16 Sep 2025 11:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757987856;
	cv=none; b=Jbh3O9bZ7msMVhiyFGzrOQPfvjtfsk41JSWL5l3pzEmjizHYkyGWtvET/dR/F3uwD6vR37MGrv2n+mwWww4gQGonW8QYLnOOttXwAG6eEft3IxzM4809yJcdQ1aB7zH+bZi6NyVOHNi1zQQAX+BHqqCe2nvqfu01mI+7zA9eGloe2ZAwhJIDatNe8Ve8/o7qQ43jXhI8yx88ifQ66lMf0zamHtKfu1a/vYbw+JX1SmD+IEtm+dkMJaeyr12jmpA4sb1Lo8FAClO18wSTvsani70Y0CMLfXvNoKZzm8Q3QqoiCtfZstggRohDM86xGmfjyCxHNiKQUwHqyb7jldiWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757987856; c=relaxed/relaxed;
	bh=Vre4VQdls+C6Fg3+3Ay6LAhZabA5fF49M2ujQWAzVo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRMqfwuYfNe4vj1QX33tpy3+Gze21hggGdgmvuRoFLoFZZv9WeG+GLWVPVwoHA4CO9sNKNRzsdfjJIqpNIkNdTCNiAF7WLpDbDxhqvrrvmmGxUnIwymzxJmHJX88J6K9H56XGa5Kkp+wEVCkkc+hzhjH2zpof+OlymIXdVOjuBAKK3134v8MJP9WX+CnNykOmicH5FbIbwDacwh23OilFD93/Gm8ELi45e7WHZx5dj3NgYR4fxxbRR6i8KotEzcaei1nhTFEedb0ZZT5MgkdRtx0zdTavLrcaTWweCMnQEnvX80LXkFAblShBSCwJwQTztwr/BebbvEH9umopP14/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=heyquark.com; dkim=pass (2048-bit key; secure) header.d=heyquark.com header.i=@heyquark.com header.a=rsa-sha256 header.s=key1 header.b=Op0/4x4X; dkim-atps=neutral; spf=pass (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=ash@heyquark.com; receiver=lists.ozlabs.org) smtp.mailfrom=heyquark.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=heyquark.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=heyquark.com header.i=@heyquark.com header.a=rsa-sha256 header.s=key1 header.b=Op0/4x4X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=ash@heyquark.com; receiver=lists.ozlabs.org)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQlQj1CqLz302b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 11:57:30 +1000 (AEST)
Message-ID: <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heyquark.com;
	s=key1; t=1757987830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vre4VQdls+C6Fg3+3Ay6LAhZabA5fF49M2ujQWAzVo0=;
	b=Op0/4x4XJ5x0+J+qr5sJ60cG5jP5EnaIQDUlXmonQR64r8S5O5rmQQ1lj2Zw4CPEUVmg0q
	g6Vl5Sr8zZ+We27APTCUqWuUvu6z7UGgQ1ZK0y2hDgz5DCgGAOFmZkxAkM9Fo/6+/DzxJc
	ImNn2O1iuk3qg2u69HVTKjaKqPdR3V/6ZnI/9qp2L4dDg/mXdfYVMGsvfcs/hbTFxtn2H6
	WbsgllneruKh9bNDGUfuLSeja3E6Zuk2JLcJd9jPVz8PwagQKAG0SxMh+BhZHz7vnNDbgl
	9KHx87PJl/A/NAniPpiYLoggz0E4uvxRVNJEz27IZuh4qnMPi0GcfFcxxvPJ0A==
Date: Tue, 16 Sep 2025 11:57:00 +1000
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
Subject: Re: 32-bit HIGHMEM and game console downstreams
To: Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 officialTechflashYT@gmail.com, "A. Wilcox" <AWilcox@wilcox-tech.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
 <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
Content-Language: en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ash Logan <ash@heyquark.com>
In-Reply-To: <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13/9/25 23:52, Arnd Bergmann wrote:

Hi Arnd! Thanks for your reply.

> Like most other machines, this one is probably fine with a combination
> of a custom LOWMEM_SIZE setting and using zram-highmem, even if we
> end up removing support for highmem page cache.

Good shout - I'm now testing a 2G/2G split which allows for 1536MiB 
lowmem. I know that's a somewhat aggressive setting for userspace, so 
we'll see if anything breaks. I read Rasbian shipped similar kernels and 
had issues with Wine, though that's not a common use case on PowerPC ^^

> The smaller devices are probable getting problematic sooner, 96MB
> in the Wii is already really tight and this only gets worse over
> time.

The maintainer of that downstream claims to be able to boot modern 
text-mode distros on the GameCube' 24MB, which I find really impressive!

> Just to be clear: there is no general 32-bit deprecation going on. When
> I talked about phasing out 32-bit platforms over time, that is purely
> going to be those that have no users left, or the few ones that are
> causing more work than they are worth. E.g. The ppc405 ones got
> removed recently (after many years of discussion) because they were
> making ppc440 maintenance harder and had no known users.
> 
> Highmem does get in the way, but unless more -mm folks make a strong
> argument in favor of removing it all, it's more likely that we'll
> go with Willy's suggestion of keeping highmem on page cache (anon
> and file mappings) than just keeling zram, and even that would
> still work.

That's good to hear. I would like to have the page cache, though I'm 
still going to try and maximise lowmem as well.

Thanks,
Ash


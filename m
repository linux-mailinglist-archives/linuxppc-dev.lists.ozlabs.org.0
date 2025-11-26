Return-Path: <linuxppc-dev+bounces-14503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED608C8AB46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 16:40:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGkKv4mPJz2yvH;
	Thu, 27 Nov 2025 02:40:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764171651;
	cv=none; b=epH3Hexr1iZXN7bgzkOtI9nAutUVP2ZPlfI3ZMHOiSnCbbQwNtQ4NrpXfzKV6nRJp0caZwfNw3yQmEZj4oEupUVvMZK8Nv+Dalt4sLoMlwWSZIGrQ84OHAFoEuQhV4t3bf1pt9EOwa3R2OKus4ds1zXUGLJUau2vuZ8F6vCxLju24ii2tXfXWWFzvmhj6JpWlLKM18EDFZKq3qiU2qwo7gEF8AciSCOqKoEUd3l3DCZWGueZhrWSCJ5gUMkja1NoZYEO+hTSwCk/iu2bXq/nLY7cVbKC+r6FubyVTUNHnwKyNZcb8pcRqiOL/Z14F4EYRPdSjdpLvgS8szwKXed6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764171651; c=relaxed/relaxed;
	bh=zzOF3tvR7o3R3IAAXkAJcJBuFT2H7QQH4LkP1o4BoiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNeEYGc7VGJLc9bOGMGZw1RBs9Je4vzp/3TRhpLwLmRg1y8nz+mYIQXcNPOsqhm4zPp7k8DKwmKSxjEIQcGx/+XR8aKSDZMUtXf5Ye+pjau9I1qA9G3symlVqJttLSmpnRy5rhr2789uSUwUy/dtBF9xOpWBKKGx0nyr1DuXsgy+APtYIp/fjQD6Afqu1LP6d6le27bqph+ksykLnPrXu/cnyQWAnU+X/GPMPszuuX5vFe91K/BaLM63HXtWdVyVYlUgZl4rTwPP0jfLLpLWrAarWMIxSdt8qN6mwVU/1hqrqKaLaftDm0JoavZbLxrCRS3GTUif4Gsg2jaBOu7qDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rtokxXzs; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rtokxXzs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGkKt0GlFz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 02:40:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E28E41AEB;
	Wed, 26 Nov 2025 15:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9550DC4CEF7;
	Wed, 26 Nov 2025 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171647;
	bh=U3CDHUxKiNPdkrp06riE1Ud7PWKu//nHZU4THiPNmDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rtokxXzs+3GkijwTkI31NZ8qULKTsdF1sEnmAlo1/YkZPiBhxtjy/OoAtGxAJYHbC
	 g8BJB1d9Vz2iPvwvV+9IZas4F86j4Oe76lSj35puhPm8NBLjFfkmhhHfPPNA2rBb+X
	 ohdYK7ot5RXjCMVQEQpY8pt59bBFY8s5OqMW5H8UQ5kScAhEzGF1c3EZIhqB+yq5J/
	 C/OJZqstWtL9PLWWontvzh+Jq963cH068mf9FRDhYYv/U0VQG0Mpq0mgDTC3/IQlYO
	 MRQUpVLBr9u6iBpeqsDKy2xnqCM9C3LDwyz3P7F9vs6RF5nqB396YkmlrGTgUnspUz
	 P0975f0G6/GSg==
Message-ID: <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org>
Date: Wed, 26 Nov 2025 16:40:43 +0100
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
Subject: Re: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20251021100606.148294-1-david@redhat.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251021100606.148294-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/21/25 12:06, David Hildenbrand wrote:
> Two smaller fixes identified while doing a bigger rework.
> 
> Compile-tested only as I don't have an easy way to test right now.
> 
> I would prefer for these patches to go through the MM tree as I will
> be sending out a bigger version soon that is based on this series --
> I split of the fixes from the other stuff.
> 

Ping,

I tried to get CMM running again (using the simulation mode I introduced 
a while back), but so far my attempts to get a reasonable powernv VM 
booted in QEMU failed :(

(e.g., Fedora qcow2 images use xfs, but the open powernv loader is based 
on a 5.10 kernel without some mystical XFS feature ...)

-- 
Cheers

David


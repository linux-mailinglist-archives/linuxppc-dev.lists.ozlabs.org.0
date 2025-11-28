Return-Path: <linuxppc-dev+bounces-14534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6705C910AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 08:36:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHlTq3cPQz2yG5;
	Fri, 28 Nov 2025 18:36:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764315375;
	cv=none; b=kJYRuJOuvbk59BTsKx1yxYkBTmz3hrN/a01y/VyoGH5Dd0h6a2iX9QxdJ8aVJUJUvMK5Exs527uYeuDzjzJI9aFp/Vex185Ivpfuyc3FYaj1il+AEiEMvFjeCQ9BUdlmGJzejzjF9UXj0z5HyNLCzEiGTlWMe+H+hPiPEZ4rD4EcvD1kNJVCTNyP0Eb1AuFHR1tRq98mP0xq6/U22aRU4BHT9Y9WXXKvVu2RCHtTWMgOe7fa7CGgP2KH5P/UEABtZPoDUr3pLbovFpYUlWGb5snNeUPlX20JIbx3JmNjSY0nmBqkRpB5LcEXLmapPlNpmdD6rQUL5k8C9NU4Pa0Icg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764315375; c=relaxed/relaxed;
	bh=nyOJQbdW3Gq0Bb6MHseviCpECS61Cyxq1QxdXycVmgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vr6VdmnmexhRXnl0Ak8tyQcSWgcZ8zrWKnw7CzP3Wvj2aijoGD93Roo2/KNar8M5kCrlSkQRmTGozoRl6MjbQXXGuIYF2R5rj8vQVTE0/e00MkB2HZ3i33Pn/hlh+VQff5DpE6c8Jtmz1dd2BmA8z9PDtFPva/dirtgEcAbrX23McO1rmM0Y65OTRoBWxxt9vLipWNieA8/gdK/JL9qbBwThU2ieJhS4/ctGEV0ewtbMVkFLpt3WCXsgZ/6BZo2I3PtrXnpPUlEsIQX1CdmUAGrycQCp70xeCxZ217ygDINkJl6TQbp52eoKhbj/u/uPK6t9iveVeDmfHN+QzsZ0mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nrrHHsHU; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nrrHHsHU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHlTp3Ddjz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 18:36:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B356842E01;
	Fri, 28 Nov 2025 07:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599B7C4CEF1;
	Fri, 28 Nov 2025 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764315371;
	bh=8dndaidv7PWdI9f8/GeBMTDI2VguxBhw3M/fNnSgSBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nrrHHsHUrLlLfaq4SklPUnzUaCWikqrMZGyRmcI0edgfE39prJtGrl6Q1rPCOhD/H
	 eYJP8uOcHPDXDRpXx1l5haNcDfsXMl3Q1KxqV5Vw0W3wsTHxepowC3OJTL1nDr9YoO
	 gIa/oANTVa8HEG8QKdyr2XiJlAuYnoPjuV74BuKh4gi+0DvA2ShwaJoHiogCsc0mZf
	 /tNQfRuopsB36bwi/HSSSYfCxUZ8BCG7XmbktEkX5RvvMA4Er2jhiNAYSC0p3L1XpY
	 Au2Hphs0H8ru0T50gjxuzWMiEQPy9qeC5UAzvPiaOo2UGfwssaZZYHgDolcl+bELtF
	 My28HZWFK3vTA==
Message-ID: <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org>
Date: Fri, 28 Nov 2025 08:36:06 +0100
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
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20251021100606.148294-1-david@redhat.com>
 <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org>
 <87zf86n3vq.ritesh.list@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <87zf86n3vq.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/28/25 06:05, Ritesh Harjani (IBM) wrote:
> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
> 
>> On 10/21/25 12:06, David Hildenbrand wrote:
>>> Two smaller fixes identified while doing a bigger rework.
>>>
>>> Compile-tested only as I don't have an easy way to test right now.
>>>
>>> I would prefer for these patches to go through the MM tree as I will
>>> be sending out a bigger version soon that is based on this series --
>>> I split of the fixes from the other stuff.
>>>
>>
>> Ping,
>>
>> I tried to get CMM running again (using the simulation mode I introduced
>> a while back), but so far my attempts to get a reasonable powernv VM
>> booted in QEMU failed :(
>>
>> (e.g., Fedora qcow2 images use xfs, but the open powernv loader is based
>> on a 5.10 kernel without some mystical XFS feature ...)
>>
> 

Hi Ritesh,

> Sorry, I missed seeing this earlier.
> 
> Do you have the link to simulation mode which you are referring above
> please? So far I didn't find the support of this beyond Linux LPAR
> (pseries), but maybe I missed it.

When I did a rework of the CMM balloon in 2019, I needed a way to test
it. So I added

commit b1713975c31ae20ecc40fd00191ee3fa51445d4a
Author: David Hildenbrand <david@kernel.org>
Date:   Thu Oct 31 15:29:31 2019 +0100

     powerpc/pseries/cmm: Simulation mode
     
     Let's allow to test the implementation without needing HW support.
     When "simulate=1" is specified when loading the module, we bypass all
     HW checks and HW calls. The sysfs file "simulate_loan_target_kb" can
     be used to simulate HW requests.
     
     The simualtion mode can be activated using:
       modprobe cmm debug=1 simulate=1
     
     And the requested loan target can be changed using:
       echo X > /sys/devices/system/cmm/cmm0/simulate_loan_target_kb


I allows for bypassing the absence of FW_FEATURE_CMO.

Back in the days I was able to test it with a pseries (or was it powernv?)
machine we had here at RH. So far my attempts failed to test it in a
similar fashion in QEMU.

-- 
Cheers

David


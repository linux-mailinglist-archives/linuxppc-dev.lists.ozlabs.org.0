Return-Path: <linuxppc-dev+bounces-14539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C51C91229
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 09:24:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHmYQ0jqcz2yvW;
	Fri, 28 Nov 2025 19:24:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764318265;
	cv=none; b=KLFSKdvKtjaN/WD+GBBnjKIUZoUeC351S9Wf5hDICvEYgfyVamRf4Rz55pTH5NBo8gb/Ldc5uaKRwSzEakMtM3WsIEAzHCslfpzJ+Fkb1y1+upoFRxrGKPYScje84Tsa5vkOegbRvHSEIEAG/LXYA1/Eg+LWI7M04AvBjUPAtd/v20rojpYzPt3Ca3v+noMpc4J6/akclRPRavqIKNuC+oDm2MTamV6Zlcm2OjCjcE6/9Gnt+wZEG3bg63qB5LAHpS+LYhinlwexBBYFGKVW8gbfiKMc42eCBqH9F6mdW2CvBUvzXLoLHi+pgUfRHfsIWjdyyTgtTlzhhw84shCf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764318265; c=relaxed/relaxed;
	bh=PXW7UNXJFYx4G9lq8NN1HG+QrUM+GUTQsjvSKu1sfEI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oU+qdprUYUyPJtfkH2z8mrtT9rHOQB7jU0/R1yRiQB/BM+SwHRhYeKO1fzLJXXtlhmuVgjagFvYErL3OCw/EkK4zUIdMCa0DqXTfWC59ijI3YVFaxopZ17BKZR9febs28ECd0L39d2f40xG6z4kVgjQbjipXt7T87aXe3DLSNA++YzS0GjU4z47haHFlfZhYmJqL1A99GV1GbtaYFFhW2Bxd165A837PlPXexJ4VE+q31YVEzS+7RPPhJTZpUOx/xCWyiL7fgklvH4aNKP5EmxoNnLWdZuZdBYIiUwol5yx9Na12QDjbT0AL9ORUMk/8uBKJV94HsidBB3/NO+chsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=twHtpgRh; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=twHtpgRh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHmYP2JYVz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 19:24:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1F3940315;
	Fri, 28 Nov 2025 08:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0723C4CEF1;
	Fri, 28 Nov 2025 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764318263;
	bh=TxbNUU5rEWpRsji0Fkm5s4PvabTJgP9dBBi/HLey9tQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=twHtpgRhhqE2tes1gOGyLCWGfpBFWRDX4cC2jloOgeNAgnHcsJXK22YYZNRKLZqVO
	 KC5JktvEpqre7T6bIsziqWJxGC8KoM6qVMgKK59bYLUE1AzIyg9CNOb9hC7IPTiMBL
	 W6HdAYLuASAw9xkkC+jfmsgPyODM5VRNFMhHBzZxCnTvsa7gAQlxnzB5do4SFNZAiR
	 bOmkUkzx5bun2aKrKsXOZ8HTij4aGIfQiTU32nVQfyXBVs69qIP4Os4+HI76J3NoKC
	 YijfesC/QO8JXGq2zeqH6BaftFiziXAaJeudYSE3BY7TJjYO3b1ob7sr31+15N13g+
	 DwIU9/pV/9fqw==
Message-ID: <189ac734-b194-4b52-9752-18d8c0b71377@kernel.org>
Date: Fri, 28 Nov 2025 09:24:18 +0100
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
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
 <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org>
 <87y0nqmwaz.ritesh.list@gmail.com>
 <a3bb0e8e-72c9-4a9c-b347-e899ae29b289@kernel.org>
Content-Language: en-US
In-Reply-To: <a3bb0e8e-72c9-4a9c-b347-e899ae29b289@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>>
>> Right. Let me give it a try first with pseries Qemu. Otherwise I have an
>> access to pseries LPAR too. I can verify it there.
> 
> Ah, now I realize my problem: I tried with Fedora 43 in a powerpc VM but
> the modprobe didn't do anything.
> 
> Looking again:
> 
> # grep CONFIG_CMM /boot/config-6.17.1-300.fc43.ppc64le
> CONFIG_CMM=y
> 
> So modprob'ing won't do as the module is built in.

Right, so doing "cmm.simulate=1" on the cmdline in a Fedora 43 VMs 
properly creates the CMM device.

-- 
Cheers

David


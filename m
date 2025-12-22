Return-Path: <linuxppc-dev+bounces-14937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EEECD5968
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 11:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZZ9y4R8Rz2xpm;
	Mon, 22 Dec 2025 21:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766399334;
	cv=none; b=YktSGSGq0LK4BQFIFgK77S8iBgMSrKmFN+dJ/zAbcXyZt6RHiJDCgtZ4S8gsIIjXvM0KnGlSkOIMlP9ObtUsc5PoywVZ3RcvEVm2h5yHpS60c3w59tz5vKR3MsmIjEIVjbNjVWAvJ7j/ouUeZY7YSJ+/itYfYUbxNgAjbsbc4hfxeyRRISJuBHh+/lI8M1tTiKEtYAajj67Q4amV0LOz25U+1M7LpLC0kdR4HfMPYygEH4gOlnaqAA3k6fbnaK/5RVArbI9zmUT4mx8cI5CBDATUJ8naU/ZK1mvp+7El+a2C6j+msXJo+JarukKDGZP22UJXW+CyjwAzVb6YLzh2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766399334; c=relaxed/relaxed;
	bh=nMa4TpGP7tPnCT3xmqQAoDtMNFmQhiNkcFkEgqznJC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCqb/xQSYiP13M1ubWpCsqZ4Yn6/INih4BeGpUXA6iHilUs213U/Xdkh4CqRiYXsmSIkNoON0ycABzmLab9S3OI0Sl7BS29fl9c9SmYSztCAu6+xo2P9nWylJ1pNckcMjK03bRC0GdW6aO2GZyt/bAd0gp99OBICK8U35ACu/hhklpYOaBGbAb+E9Y10gh0f/lJuCX9tt+n+4vd/H1WsaqaLw7Buj3zbC8Y0xK6o5246FKVTOLkL/eVpfGtlbOPNOlKhgZF9qUtDlvg5NkfikPtNBlcB1Xl4sPgWu1uHFWp5VX7Xh4g3q4iE6Rq0mPgNE7gXjy0S19jXG7j0lVJSIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzi5UKY+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzi5UKY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZZ9x3tGSz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 21:28:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 307FD40180;
	Mon, 22 Dec 2025 10:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFE9C4CEF1;
	Mon, 22 Dec 2025 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766399331;
	bh=gpI81CYAZDI5HhhxXAwfSCUYaYR7sSbyLFN423qq0Z8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzi5UKY+SCvVFYHfm5csTU5OI5er+dNklX9M5m/zec7X5fgX33WqOMbRBtk83enAa
	 OvCxPPfAahY/yFpkkTd4hZ530UhdVQLFACAX1EHZBBAxzMcBLg3RdOTdKs8s0OGnoa
	 laMPM1Rh+W/W8wsGe4ej6Ds3yrnXVkVDiZTlkHGUJvPTdBlxF2qE0V2hDFEEeXLyWZ
	 hBDQGVdCa4J8o3OUq9ldWfnMXOi3+kNjaTgBbDq3Q0mjCHIm6QPqAlD2604+OaiqMJ
	 2AZ4wdtOrh99mmswzzFltUtta6Xn7nX84Aodf9HucX2Yc7T6xHrHjnlug9uPBbpQTE
	 0HhhJWryqziRg==
Message-ID: <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
Date: Mon, 22 Dec 2025 11:28:43 +0100
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
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
 <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
 <87fr93ky5i.ritesh.list@gmail.com>
 <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/22/25 06:57, Sourabh Jain wrote:
> 
> 
> On 22/12/25 08:42, Ritesh Harjani (IBM) wrote:
>> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
>>
>>>> Coming back to the fixes tag. I did mention a bit of a history [2] of
>>>> whatever I could find while reviewing this patch. I am not sure whether
>>>> you have looked into the links shared in that email or not. Here [2]:
>>>>
>>>> [2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/
>>>>
>>>> Where I am coming from is.. The current patch is acutally a partial
>>>> revert of the patch mentioned in the fixes tag. That means if this patch
>>>> gets applied to the older stable kernels, it would end up bringing the
>>>> same problem back, which the "Fixes" tagged patch is fixing in the 1st
>>>> place, isnt' it? See this discussion [3]...
>>>>
>>>> [3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae
>>>>
>>>> ... So, IMO - the right fixes tag, if we have to add, it should be the
>>>> patch which moved the hpage_shift initialization to happen early i.e. in
>>>> mmu_early_init_devtree. That would be this patch [4]:
>>>>
>>>> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464
>>>>
>>>> Now, it's not really that the patch [4] had any issue as such. But it
>>>> seems like, that the current fix can only be applied after patch [4] is
>>>> taken.
>>>>
>>>> Do we agree?
>>> I think we should document all that in the cover letter, an describe
>>> that this partial revert is only possible after [4],
>> Yes, I agree. Let's add the above details in the commit msg.
>>
>>> and that that must
>>> be considered when attempting any kind of stable backports.
>> Sure. I would prefer if we change the Fixes tag to the one which I
>> pointed in above [4] (with explaination in the commit msg). However I am
>> still ok if we would like to retain the existing fixes tag and show [4]
>> as a dependency.
> 
> I think we should keep the current Fixes tag with an explanation for
> dependency
> on [1] in the commit message.
> 
> Would anyone have a different view?

Whatever introduced the issue should be called out in the Fixes tag; if 
there are dependencies for the fix through other patches that were 
already merged, that can be documented in the patch description 
(relevant for stable or distro backports only).

-- 
Cheers

David


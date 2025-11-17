Return-Path: <linuxppc-dev+bounces-14213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4EAC62A75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 08:06:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8zLj2wj3z2ynC;
	Mon, 17 Nov 2025 18:06:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763363197;
	cv=none; b=mSmps7RalZ8fFZeO7HadQVFUYI1Q9jBu+5213P/4/c3MzudvjsABTiYuWs69ySVSWnPCKCya8bDYIimgmqAMAHRxgkPMynbKcDcDwQhHZod3Yq/7UrT+m07VrhyQK5YWE0LNMeZX1FLhrQA9/Xi+QcZMzCIOzYN1SpXAsnJnzFZLmyzBlbqME+j+tosGChFXWh/1PAYt7yqe29vOUuFcEKI2GlcmM34wpn53Ri22s3aAUwfEs9DKBDr76y37YxzT1ue+NgvZDUjSakvr7BPlCQvfLAA8xRRYlddxo2LR/OMxqQd4x73PEBNw+5CVl5CBqDaLFsZU/tdGfUKsh7wrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763363197; c=relaxed/relaxed;
	bh=CgAlBxTnQiZUHlfmmlaAo9CminAmrOucM55BFkwx+JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuTlIsRqdlQAfQhG8X54ICtADyB8m0d2+V3hKDA0fJydfie8IIvru3O/VW+nN5ScDOYCXkw6+YVlPJJPBaj0i8rKvP/wzk+4mFsbcPS8+JyY2VBhachrrxUKxvPRXvHI4diYQVZ+Fzk2NvVZep0LhMDNu4wzt5FFFkt7524y6qUSxFs8G+ApTauw4yAkuV4MxHpUspssYs/DCrIzIhKiRLjpuE2AzhGzKbwyerqkTEMIwedeehyGH9J+l9ncS5AW0LyKeRaeYKh77wIYTHRnYEFYn7EcvwJT2FO7kcK/JXhJSVZFoSoy2fFiUnsOWR8SSI05N5R2weli/7MgLcS8yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ajEn9Lum; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ajEn9Lum;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8zLh1tJpz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 18:06:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79B81601A3;
	Mon, 17 Nov 2025 07:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61424C4CEFB;
	Mon, 17 Nov 2025 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363193;
	bh=KDZd9YTazDXwxaHEWm8apDVEeSXEzTkuHWdA30q5ZJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ajEn9LumigFa0k/MwaUalDCto9I/GU9myHvWejQEoX/l4a5N70RlXaG4RM8zdYQ5V
	 q5AlLAiLHNyw8Auc2iXYWyjirLMUunXwVIJRBBTSm0CsBXfuSu+xp1aeJvKRvQOeP5
	 IKKHSlAPe9WWC46RAq6JRoE5JZyQo7+xG0bXflZgM0Vh+hwzedx+BQgFK7ZKX1Y8mW
	 MqbF7TvBfY0nFt0925Qvz0X/J+9PSYlxmYZlqngxcu/xVebBja/rs6K5Vnqat89cNL
	 a0nVh6f8/YD5O81vU7tSUxSptEbbzIYEPaX4S8SbDgBkl70ZW1Da/53BDrTYOLa7hN
	 kFR5h3B1TFZxg==
Message-ID: <af101dba-b02f-4863-a893-789fa08124d0@kernel.org>
Date: Mon, 17 Nov 2025 08:06:26 +0100
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
Subject: Re: [PATCH v4 02/10] uaccess: Add speculation barrier to
 copy_from_user_iter()
To: Thomas Gleixner <tglx@linutronix.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Andre Almeida <andrealmeid@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet
 <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1762427933.git.christophe.leroy@csgroup.eu>
 <598e9ec31716ce351f1456c81eee140477d4ecc4.1762427933.git.christophe.leroy@csgroup.eu>
 <87jyzr9tuo.ffs@tglx>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <87jyzr9tuo.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 15/11/2025 à 16:51, Thomas Gleixner a écrit :
> On Thu, Nov 06 2025 at 12:31, Christophe Leroy wrote:
>> The results of "access_ok()" can be mis-speculated.  The result is that
>> you can end speculatively:
>>
>> 	if (access_ok(from, size))
>> 		// Right here
> 
> This is actually the wrong patch ordering as the barrier is missing in
> the current code. So please add the missing barrier first.

Patch 1 is there because Linus was worried with the performance 
degradation brought by the barrier on x86, see [1]

[1] 
https://lore.kernel.org/all/CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com/

If we change the order, it means we first degrade performance on x86 
with patch 1 then we fix that degradation with patch 2. It seems more 
natural to first ensure that the barrier won't degrade x86 then add the 
barrier.

An alternative is to squash both patches together, after all they touch 
the exact same part of the code.

Let me know what you prefer:
1/ Leave in that order to avoid intermediaite performance degradation on x86
2/ Change order
3/ Squash both patches together.

> 
> As a bonus the subject of the first patch makes actually sense
> then. Right now it does not because there is nothing to avoid :)
> 
> Also please use the same prefix for these two patches which touch the
> iter code.

Sure I'll do that.

> 
>> For the same reason as done in copy_from_user() by
>> commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
>> copy_from_user()"), add a speculation barrier to copy_from_user_iter().
>>
>> See commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
>> copy_from_user()") for more details.
> 
> No need to repeat that. Anyone with more than two braincells can look at
> that commit, which you mentioned already two lines above already.

Ok

Thanks
Christophe


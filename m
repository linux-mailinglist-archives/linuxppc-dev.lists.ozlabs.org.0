Return-Path: <linuxppc-dev+bounces-14214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF6C62AC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 08:11:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8zSB04rWz2yvM;
	Mon, 17 Nov 2025 18:11:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763363481;
	cv=none; b=FbtsX+0Nmh/2lhyt7S3m0llRG3w9Bx1jZz5r0V3hDlqypCmRWDsQ68eywbNM4Ey/j0pcrwBGyRjUF4V2SWQinLdeEpE8O7EGFrllFS0S0JqJXal0yE+IRBvotzPRURgF7rMTCaL2260atb9yiTfHy6/ARTASY+94Nn4QT4/ea1EJxew8XgSvurHQVjZjmC9BuMcBG4WjaonVkez8K9ioTOMyXyLeiaNCbF42Q3/tPlsud3M6+D50Xq1m8/lPU4uzLuHoosvfz0oOny7Zaw4ILlWXjQDo1b7yhiUHGI0OOcDfpoQ4Gm5W+a/01NUKmpWThOmAwD43MiR0dVUNUwRnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763363481; c=relaxed/relaxed;
	bh=u52wYyk+f5DJTrPAjp/L9fyMn2f6tntIgLB1CA3+PXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lC3/1L7iXkAK/4PEJ9Ve9WBkK4mry2bbpnEMsUN/tY0hj9Zv/CcsCnT88Er9hPute7Ea1rnLaLHv/CyxEqldNWD0NgiiTV9fOgy7H6MSGaEuY2wrGT1P8WALfqryj8+FiImlZiOHN3NQHM6mSO0XgkFbYWZ9RhQLcyCA9Wp/bPX7YtMCK9fVgKcEkuXsrlrPFb42JcrEdICdeg0h8DTiZwqKmnhgWISFhv06i/mVUqHM5QZ1ifC/jIIUMlpTVdybuDLwbl9P4muulY519qINZ+EQpD0ClWL3kVXQ/iUDNwC8OfsxiE+Hb5PX6Wr+CsRDg9tjXGQjMVsJWJS2ad4tfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsfQNHX4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsfQNHX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8zS916lMz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 18:11:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 605EF601AD;
	Mon, 17 Nov 2025 07:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CB7C4CEF1;
	Mon, 17 Nov 2025 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363478;
	bh=n/Lorf00oIeL8NcXXfKtNjzNM8fzyT8fT3D731d/Zfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DsfQNHX4yHKMEuQNzivLmPSvNg1GT14FSWM8cLhfJduQojTUVNLgOs8iq/0syOojh
	 WuGuaPAGYKsQdP/DTSQDb9+unoP5KJ0tkl6le5fgCvcevJvCeiN2D95pWt0LwJP735
	 ZRKVcx3qQ2zWb+seVPgj7YbVDiWyFqhO5+ePRYpWWGZeufxCZ665RjJd9ewM4tNyON
	 ip5+0Cpbucoq/0HGmYoAtYsApisjo0N6ae+W9VbkZP/HwJhrARilXWfQH4AykjNS+t
	 5ZdX7Yoj0rZio3OoCbYdkDqfe9H07IfcFHZWl5/1biRvZIH/VBh4qBvczCi+LqtEEJ
	 rKmC312gtIFWQ==
Message-ID: <4758205a-14ae-498e-8dcd-6770787ddb3f@kernel.org>
Date: Mon, 17 Nov 2025 08:11:11 +0100
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
Subject: Re: [PATCH v4 03/10] uaccess: Use
 masked_user_{read/write}_access_begin when required
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
 <5effda898b110d413dc84a53c5664d4c9d11c1bf.1762427933.git.christophe.leroy@csgroup.eu>
 <87h5uv9ts5.ffs@tglx>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <87h5uv9ts5.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 15/11/2025 à 16:53, Thomas Gleixner a écrit :
> On Thu, Nov 06 2025 at 12:31, Christophe Leroy wrote:
>> diff --git a/net/core/scm.c b/net/core/scm.c
>> index 66eaee783e8be..4a65f9baa87e7 100644
>> --- a/net/core/scm.c
>> +++ b/net/core/scm.c
>> @@ -274,7 +274,7 @@ int put_cmsg(struct msghdr * msg, int level, int type, int len, void *data)
>>   		check_object_size(data, cmlen - sizeof(*cm), true);
>>   
>>   		if (can_do_masked_user_access())
>> -			cm = masked_user_access_begin(cm);
>> +			cm = masked_user_write_access_begin(cm);
>>   		else if (!user_write_access_begin(cm, cmlen))
>>   			goto efault;
> 
> Shouldn't this be converted to scoped_....() ?

Sure. I made the same comment to you when reviewing your series, see [1]

[1] 
https://lore.kernel.org/all/e0795f90-1030-4954-aefc-be137e9db49e@csgroup.eu/

Do you prefer me to do it as part of my series ?

Christophe


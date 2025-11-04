Return-Path: <linuxppc-dev+bounces-13725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FABC3076C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 11:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14Fx5VD6z3bfM;
	Tue,  4 Nov 2025 21:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762251605;
	cv=none; b=mknh+8TVSPXktMHtYgcvY3PqWXnC8vHsjgUe61J4FfdEHLWkgln/h6rXzBXuAu6egw0XqZD/LaWZeJztN2uoluW3uUYVfaE4SPMSEynMxfMH0fFlrLMzsfYq0uqlULhDoTQO42mJ1Ns5k4hmC6DcaAuN6j9Ly2ddSK2NeMdgO3tvwLxj2huAorOdGbqfunvRvlC+h9Z1y5yzXfvOj7xPhiSkQXqRmfTeJ8M1phsST3b1yADH0MLkSlzHSvOgCYvBMPOddTHt6heLeWahqFxOHNosApvY/caKTDb1l7j0H/FMK0gFsuQhRIZHlcFdZ2Urnj7BAjyj+a4eVkv0jmBjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762251605; c=relaxed/relaxed;
	bh=X0kwE9q3mSVamT/IFP5c9E61eZpRynHA4Su8tf+BwVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyoPivgCcaMtH4CiBT6GaWCj+C6/YZ2DHrAY6vRPGG2RBqROaFqB5RE5arFHipPnWMYsA79AMZ1hszNmv5XhPvGGugVhxiz6FnRy9MP9RNTyc0IBqIsZWeaD4woPTHdghwHes/f9UzCzn2uUyktcCl9gd5E6scBw3uD6HEXYcbcBkpukpLyyf31tnEm6wZ9leF8PEN0iKUaYGzYGchRvEOs8ec8/ZlDt3N/tOktCIIDOAUCtr8K2J6AhEV5hTN0eVj8XgKfsS9g7nZIQwr+etrfZZDh+Bor5jImEtRudcBH5bQ1a7O2Mhsy1AZ3r4CHlj032G600fJza/rZ8+VUxTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14Fx0Gmhz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 21:20:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0zMS3Cgtz9sSm;
	Tue,  4 Nov 2025 07:39:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVa3bC_JehNO; Tue,  4 Nov 2025 07:39:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0zMS2Q1Zz9sSj;
	Tue,  4 Nov 2025 07:39:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 409D08B76C;
	Tue,  4 Nov 2025 07:39:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CzfwR0aRXjyU; Tue,  4 Nov 2025 07:39:32 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD5B78B763;
	Tue,  4 Nov 2025 07:39:30 +0100 (CET)
Message-ID: <01d89f24-8fca-4fc3-9f48-79e28b9663db@csgroup.eu>
Date: Tue, 4 Nov 2025 07:39:30 +0100
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
Subject: Re: [PATCH v3 03/10] uaccess: Add
 masked_user_{read/write}_access_begin
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
References: <cover.1760529207.git.christophe.leroy@csgroup.eu>
 <a4ef0a8e1659805c60fafc8d3b073ecd08117241.1760529207.git.christophe.leroy@csgroup.eu>
 <87bjlyyiii.ffs@tglx>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <87bjlyyiii.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/10/2025 à 19:05, Thomas Gleixner a écrit :
> On Fri, Oct 17 2025 at 12:20, Christophe Leroy wrote:
>> Allthough masked_user_access_begin() is to only be used when reading
>> data from user at the moment, introduce masked_user_read_access_begin()
>> and masked_user_write_access_begin() in order to match
>> user_read_access_begin() and user_write_access_begin().
>>
>> That means masked_user_read_access_begin() is used when user memory is
>> exclusively read during the window, masked_user_write_access_begin()
>> is used when user memory is exclusively writen during the window,
>> masked_user_access_begin() remains and is used when both reads and
>> writes are performed during the open window. Each of them is expected
>> to be terminated by the matching user_read_access_end(),
>> user_write_access_end() and user_access_end().
>>
>> Have them default to masked_user_access_begin() when they are
>> not defined.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Can we please coordinate on that vs. the scoped_access() work as this
> nicely collides all over the place?

Sure, I will rebase on top of your series.

Once it is rebased, could you take the non powerpc patches in your tree ?

Thanks
Christophe


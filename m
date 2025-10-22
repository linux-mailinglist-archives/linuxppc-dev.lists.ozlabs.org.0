Return-Path: <linuxppc-dev+bounces-13172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8117EBFD72E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 19:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csFsP0MTDz30RJ;
	Thu, 23 Oct 2025 04:05:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761152712;
	cv=none; b=XvMnT6UNQbXTyGRNgxy4wLKMzsrrrla5yio9FcP5fk55RA+3kMY7Fe75/5OIkPXfE/Ox8HlUVJQ/cWz4WTJR6RSodK0yrEwi0SgaOx8cUNlOU3HBjRqvNi+olP0BsdH76PNcyVqfi3mSWKSh03CnhLJ28IwrXj0+doiCAwGVZ0bcGK34JE5h9dYdsSMYnYDDZri4Go6Zkrygr3dDkwf9z8HrndNzcxFlTFSGX6Vx7eEP2VKSBvAQItQl40RNgO58rqnFp1vM9WXvRhNFLNSZLHQaCjPGEqeVjJpVmRPFwRosvqG3/f+Hwhvh6IMQxbAaXLRlqVSgfReHffwRXmiEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761152712; c=relaxed/relaxed;
	bh=oQ2RBVYKWQ5VGf96MS/2zH2TN/ADfNL38D/U5RR3xQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kw4JNzunNo8uR9szFSpKR7jt0vQjkf9h3IiRO1mOYGvttvidvaq+c1tXRC/JErw78pFtsa4OjdWX02k5qnLGYHEsHCNki+kJSgxuerdask/aSpkByV+d5wfI3wQqtdOPGpnJTBX0CTBR6VQPDu1yH8I9HSDWFq167zgjirtfU3bOYunFVvT/O6SWcfNsdhAw5x8ql/8ZMZRR1K3DGHI0ExFQ40HOAnBeZwYbleHxkX4nwE1FbMAG8jRC+5124GpSHH/mq/9M63uWjQjxnQ3KAcS190FhGDYwcx3CC0BsZQKKpWxwK4Or6vdAnq/TYHL64ry6WvLRiQmuP0hHHdB6Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pbJR9jVQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sCG7m/Gr; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pbJR9jVQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sCG7m/Gr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csFsN1Prfz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 04:05:12 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761152709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQ2RBVYKWQ5VGf96MS/2zH2TN/ADfNL38D/U5RR3xQM=;
	b=pbJR9jVQB5nr+G8FFj8RmvDtwsOIWSvd8E6t+m3j3n+0H3B0jqNrjeiEi2dk1Plj3VirQN
	yA/1V7sUF8faAQfZfcsGicIAzo3BuCrCtp9sM1r+CCFvRumcubP0BTQjKsmmkHkqsU4SB6
	P4FKQ4SXRCBNVgzpu7rNh5bRZmUxbM5wYzbEVt4q3BfiT2pVRWQKtJjAhC7QXvUch9Wc5g
	1ykJvAtC37H+CceUcCldztlAX1LwExlWrqz+ncLjsiQfm/fPFU+/nr5IWQvZalrCr+kiBY
	+AAFXvOu5w0HuDFiuQYd4GUcnBqs1oot36h5XkZZ06TOGao+ogzZSCsP6vRpTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761152709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQ2RBVYKWQ5VGf96MS/2zH2TN/ADfNL38D/U5RR3xQM=;
	b=sCG7m/GraXt0ezpnYBgZ/Npnx8XVxrxQ5s9GmVsZF5pgEe3UYpCM3NR8gSrtBKmgBh+DVK
	EdE+sr9Ir7P4SxDw==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman
 <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 03/10] uaccess: Add
 masked_user_{read/write}_access_begin
In-Reply-To: <a4ef0a8e1659805c60fafc8d3b073ecd08117241.1760529207.git.christophe.leroy@csgroup.eu>
References: <cover.1760529207.git.christophe.leroy@csgroup.eu>
 <a4ef0a8e1659805c60fafc8d3b073ecd08117241.1760529207.git.christophe.leroy@csgroup.eu>
Date: Wed, 22 Oct 2025 19:05:09 +0200
Message-ID: <87bjlyyiii.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17 2025 at 12:20, Christophe Leroy wrote:
> Allthough masked_user_access_begin() is to only be used when reading
> data from user at the moment, introduce masked_user_read_access_begin()
> and masked_user_write_access_begin() in order to match
> user_read_access_begin() and user_write_access_begin().
>
> That means masked_user_read_access_begin() is used when user memory is
> exclusively read during the window, masked_user_write_access_begin()
> is used when user memory is exclusively writen during the window,
> masked_user_access_begin() remains and is used when both reads and
> writes are performed during the open window. Each of them is expected
> to be terminated by the matching user_read_access_end(),
> user_write_access_end() and user_access_end().
>
> Have them default to masked_user_access_begin() when they are
> not defined.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Can we please coordinate on that vs. the scoped_access() work as this
nicely collides all over the place?

Thanks,

        tglx




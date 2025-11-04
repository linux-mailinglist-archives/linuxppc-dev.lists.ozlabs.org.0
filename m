Return-Path: <linuxppc-dev+bounces-13718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F563C2FC07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 09:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d11Bk07GXz3bf4;
	Tue,  4 Nov 2025 19:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762243325;
	cv=none; b=UBnBaEmr4zwJoYYqTBM0tzWsv5UOcZjQC+FrZZ1iSrxq2gZ43rDV6O2MARxwlqOyuVpKKTYAbsJMNdAA424yIwXU4i5W3qZLFWIcQAw+nmkNx+7oHBJrI5cFYDltZuvUx6ZwoDi4ulHe0vv3RYUjQBXkvfzMf3qejiwIk/dOZdx0af7XoSag+9+4aC3tJxpEczmFw9A22t054MN3z/zEIppCyyjnyKkDQyMzaffjf5K4RlKwPJyCxIjuOFTubMpwtjkAUgM4j+DwMkHzOcjS/vmP5t1OpwWmvO/1MrWY2UGdgCoLfpD18CLVaEWZ6XLtC0+84c4D9+jVK3EIwgxd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762243325; c=relaxed/relaxed;
	bh=WxHg295CBRsqPu2lBIqw5Sn0fGrCLg/ElUlxqApeBLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iLT8TFhW14+jWeibKOYBZmgAVECgKqbplJNA2JiqetVD0E+9pukBDFoa/LeZ4XZ4Kfde1mWsSEhD+7FishSTU9ASiiOQkYgoV3FRNG8zAW+Q1rNOr9tyAnqzBJHClXFpO50+Yj25q8ftvPp/jhovoYNcJWU2qLCI1yw6h2ciNBAjsupDcaalqCQD1qnfyAg7lbo3I9/OcF53GMS4kzpEe3CrJEW0woXTCDIbCeON2ZkcX11snWkKRS3Ur0BO3TDgVpZKWhRyO+Dn/YoYX7JfAz3JJR2rKEd071bR9xObICTCOkYSMWeujl4Pa+ur16uO3dL9lV8Pz0JcW4zSgcZOWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Jgwl2Vop; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=t8JDRw+f; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Jgwl2Vop;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=t8JDRw+f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d11Bj0W1Pz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 19:02:04 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762243320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxHg295CBRsqPu2lBIqw5Sn0fGrCLg/ElUlxqApeBLM=;
	b=Jgwl2VopvLhsHH+YYqRsae6+FKzyHIS0wgTmsM6zvXdnRYVO1Mp+3CjSgP12sRf79JdkIC
	hx50TnrXAEfEN5ICnRweGj/sSAz5nUPqUFikzhoLJZNQyXaN5ymoCj4E2L3wBjx4OeG4vN
	lcnERol2ohNQ5nXcU3OkM3UJOm2NJRST4BTxh1MoYrChOMqgAT9DLUj9eFzBzflyLWH87K
	qqDczZQWcFWGe/iPVZhDUA34+WNIo7S9c1kgflcSpKmM0UaRdPJMv7RLP9TTDCTxs4B7XJ
	XLq2JS1KXSF/YOo8ZUxjIZTH8AN+3Axixi4ToMHu6WXnTGvIMsd2QaBZquI9Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762243320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxHg295CBRsqPu2lBIqw5Sn0fGrCLg/ElUlxqApeBLM=;
	b=t8JDRw+fUTFLMI+7oIYVrsnas628xW2/vuKmoPeHnnr/Dd9LlRlJTGnA4BulGKiXBQPkro
	pOJgImdDLmiQK4AQ==
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
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 03/10] uaccess: Add
 masked_user_{read/write}_access_begin
In-Reply-To: <01d89f24-8fca-4fc3-9f48-79e28b9663db@csgroup.eu>
References: <cover.1760529207.git.christophe.leroy@csgroup.eu>
 <a4ef0a8e1659805c60fafc8d3b073ecd08117241.1760529207.git.christophe.leroy@csgroup.eu>
 <87bjlyyiii.ffs@tglx> <01d89f24-8fca-4fc3-9f48-79e28b9663db@csgroup.eu>
Date: Tue, 04 Nov 2025 09:01:58 +0100
Message-ID: <875xbqw7ih.ffs@tglx>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04 2025 at 07:39, Christophe Leroy wrote:
> Le 22/10/2025 =C3=A0 19:05, Thomas Gleixner a =C3=A9crit=C2=A0:
>> On Fri, Oct 17 2025 at 12:20, Christophe Leroy wrote:
>>> Allthough masked_user_access_begin() is to only be used when reading
>>> data from user at the moment, introduce masked_user_read_access_begin()
>>> and masked_user_write_access_begin() in order to match
>>> user_read_access_begin() and user_write_access_begin().
>>>
>>> That means masked_user_read_access_begin() is used when user memory is
>>> exclusively read during the window, masked_user_write_access_begin()
>>> is used when user memory is exclusively writen during the window,
>>> masked_user_access_begin() remains and is used when both reads and
>>> writes are performed during the open window. Each of them is expected
>>> to be terminated by the matching user_read_access_end(),
>>> user_write_access_end() and user_access_end().
>>>
>>> Have them default to masked_user_access_begin() when they are
>>> not defined.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>=20
>> Can we please coordinate on that vs. the scoped_access() work as this
>> nicely collides all over the place?
>
> Sure, I will rebase on top of your series.
>
> Once it is rebased, could you take the non powerpc patches in your tree ?

Sure. The current lot is at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git scoped-uaccess

Thanks,

        tglx


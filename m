Return-Path: <linuxppc-dev+bounces-14929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E5CD4431
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Dec 2025 19:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZ9LJ0Vjbz2xlF;
	Mon, 22 Dec 2025 05:49:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766342983;
	cv=none; b=S2xfxlTJhDjuWsx1Dca+rOVtQVM0F3LH4i45RIj5EZ402//XkmW/o9JFNkYJn7jZO3QzqCLFPDXc1RriFTy80xKvijkGMreBNKnyKqoK6mEty9y79I4N/F5kv7hlLtICPWVYdxISvQz4iGf6DguV83OgoQprwlKoFJ8Rl5wfPuUPVxMX5CWV9JYJiAQfYvcqb4QFeuVmu8oOXfNStxwHmYqdBtDofCR1q2AQXBA7K4J3r8qBDk6L6+focc1g6AlZVB0CU57q1Mcbp2vk5jPzLnBcye+ZleQCU02om8ITASw1AHhnDkI4PTB+HKonpAYT5pTZ5xPxfTMbDXvc6u4kZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766342983; c=relaxed/relaxed;
	bh=Ka0RVuUzcoyLTnWLXL6FupyMPRC2ai/Qs3l4AmXzsY0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=foVgtwZdNfMrXYTLVAzfIzeNv5n3ANDr3rFclHtaZDv7kksSXp6DqmQY0cpRb6eg86zQmKpkxKhLYNnNo98o+fja1V7DPGSugvZ7VvPCJTXzQjXytWDuUgyD6xZRx6MgRQBJtItx60biiBaTw0fjmW4fjnuf/ofLT+Aop6cTmw7besTNWLT9mYJ7iYWOQmwKTToyLkG2xp3Cs5fVl86bxk6TnRXEIks2AnnsSofQOMX+PLmQ/wYj4QCAwi6UTwBpXyyVGILcTqeqwz6lEjtgQOc9jBN1yqYQhv05JydhMqpHCL/yMjCmkDCnALqBBE0E2AmfTGKDPmKn/bGhSOWANw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nJr+00XR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nJr+00XR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZ9LG3pZ7z2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 05:49:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0B7F6001D;
	Sun, 21 Dec 2025 18:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87ECC4CEFB;
	Sun, 21 Dec 2025 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766342948;
	bh=IJXA+QzQQpGmzrjmRsOKwVn2upf0r1hQr276K/HQbNg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nJr+00XRdPtzlvH9JOjETY8okc5IoS3PxdQmW9oo668Rvqkalq9mXrLUjB0AbsyW/
	 eIKKrW8sm5ef9jKskfyVXa7x3lRrVXMySdJZN2ki5xU01eOomWskWSJRcFhhR668sx
	 3LiGEKDsBGq2NxgVr0zHtc+LHnCm1WTs0bAiuqPg=
Date: Sun, 21 Dec 2025 10:49:07 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Sourabh Jain
 <sourabhjain@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
In-Reply-To: <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
	<87a4zcml36.ritesh.list@gmail.com>
	<655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:

> > 
> > My main concern was -
> > A fixes tag means it might get auto backported to stable kernels too,
> 
> Not in the MM world -- IIRC. I think there is the agreement, that we 
> decide what should go into stable and what not.
> 
> Andrew can correct me if my memory is wrong.

Yes, -stable maintainers have been asked to only backport patches where
the MM developers asked for that, with cc:stable.  There may be
slipups, but as far as I know this is working.

I don't actually know how they determine which patches need this
special treatment.  Pathname?  Signed-off-by:akpm?

> But we can always jump in and say that something should not go to stable 
> trees.

Yes, please jump in if there are any thoughts about
ordering/priority/timing.  In fact, please jump in if there are any
thoughts at all ;)



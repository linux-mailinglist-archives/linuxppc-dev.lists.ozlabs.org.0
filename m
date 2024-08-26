Return-Path: <linuxppc-dev+bounces-524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EECB95EBDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 10:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WskLr6rl9z2yFK;
	Mon, 26 Aug 2024 18:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724660852;
	cv=none; b=VY3O14IA/CEwf1fmjDK8WqJDoooQlnYJBPC07XqCMTpMsxUQ9cAT6T6uH8y/pFwtzsA0BEZHClFKcsG1L5p94e7yCFqsdR6JOxI7RIaaZWdDKTtqttKVobCMqmOPI9GxQACrEKtbbeGJG6EjlEu5oM3WWNIA5PHBRLUWmv1H7YDlL5fzVnOgvIwc92Xj8+H+QxdZ/fKm7l3Q/QJ5Jq4IdomZ1sS67HQEtoAXnkWvkLurR2GaxQo3oP3WoO7a1d9veZ7lLCR5MgzCXopZ76+PPc6HcRum4SRlPEp8CmVivUpCz4WTioY8w56/TuJ9ea5ga2HuydOMBtnGj8I+N6yZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724660852; c=relaxed/relaxed;
	bh=HBUmQTDhGzpRlPPsawchQxtsrEP7CCWrGrVX0xuqkFU=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=eNBVHA4gmGHTx6IkOdW+COqW0Cj+0jrve4xzr3fp4gLdzzjpoWhb8irP/N5Hr6aVNrjH66sJQ5jWBWm8D5OJaHckjr/SSTRYNrkBRAIf/1P82Ln+RUStbbD2X9lZTPwNDJnMjiyI9VJQu/K8kEIny4HC1bdW0hQQEE7IaTwuLE917J8P4u30iJbtL8ec61OwZX0xlq+U+Dj0+yuUAQUNYuKTxgIRpcIkf1FaUhHJTbFiDBxURTaJ9hGntMhr7CZz+20IUI+IA4hhBqOKZUuv1imWXhmVimjcVKzMTq7mno/L8270y+BPXkdx7ndD2mrif4k5vSlt2g98FT8Ie5PwUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=G+es6dtJ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=G+es6dtJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WskLp60Ylz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 18:27:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D178EA42008;
	Mon, 26 Aug 2024 08:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1164C8CDD3;
	Mon, 26 Aug 2024 08:17:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="G+es6dtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724660223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBUmQTDhGzpRlPPsawchQxtsrEP7CCWrGrVX0xuqkFU=;
	b=G+es6dtJI+WdfXP/RQZRpJVmw+L7y4//5XG1cNyFbgtT4lVYwh1zPdS8zRYE7pYEOQOEki
	TsL3YKWBg+PZmKHNR6I88paWRAUxfSXKDLMR4TfUocs2r4RP+Vb9eYYFuZRfwZEIQam7j3
	UacCwC9xjKUV4ZgUbKdPU2VtnWlD9kk=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf114949 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 08:17:02 +0000 (UTC)
Date: Mon, 26 Aug 2024 10:16:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 06/17] vdso: Change getrandom's generation to unsigned
 long
Message-ID: <Zsw59hqqbixw3A66@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <525b48eb79978ddba2d1b8ee23b27bd6c5b0b4ee.1724309198.git.christophe.leroy@csgroup.eu>
 <Zswzu1l3xO99KN3I@zx2c4.com>
 <7d58be73-a8e5-4ec7-bbdc-238b0c25c77b@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d58be73-a8e5-4ec7-bbdc-238b0c25c77b@csgroup.eu>

On Mon, Aug 26, 2024 at 10:01:17AM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2024 à 09:50, Jason A. Donenfeld a écrit :
> > On Thu, Aug 22, 2024 at 09:13:14AM +0200, Christophe Leroy wrote:
> >> Performing SMP atomic operations on u64 fails on powerpc32.
> >>
> >> Random driver generation is handled as unsigned long not u64,
> >> see for instance base_cnrg or struct crng.
> >>
> >> Use the same type for vDSO's getrandom as it gets copied
> >> from the above. This is also in line with the local
> >> current_generation which is already an unsigned long.
> > 
> > This isn't going to work when 32-bit userspace tries to access a 64-bit
> > kernel.
> > 
> > I had "fixed" this with a vdso_kernel_ulong type way back in an earlier
> > version: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20240528122352.2485958-5-Jason%40zx2c4.com%2F%23Z31include%3Avdso%3Atypes.h&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C41747dd989164267c1cc08dcc5a3c424%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638602554376441761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=Tf9ShSN6aOOFZ1HymAmHhj0xhQ6BUtHJX95t50gsp9k%3D&reserved=0
> > 
> > But tglx pointed out in that thread that this actually isn't necessary:
> > 
> > | All of this is pointless because if a 32-bit application runs on a
> > | 64-bit kernel it has to use the 64-bit 'generation'. So why on earth do
> > | we need magic here for a 32-bit kernel?
> > |
> > | Just use u64 for both and spare all this voodoo. We're seriously not
> > | "optimizing" for 32-bit kernels.
> > |
> > | All what happens on a 32-bit kernel is that the RNG will store the
> > | unsigned long (32bit) generation into a 64bit variable:
> > |
> > | 	smp_store_release(&_vdso_rng_data.generation, next_gen + 1);
> > |
> > | As the upper 32bit are always zero, there is no issue vs. load store
> > | tearing at all. So there is zero benefit for this aside of slightly
> > | "better" user space code when running on a 32-bit kernel. Who cares?
> > 
> > So I just got rid of it and used a u64 as he suggested.
> > 
> > However, there's also an additional reason why it's not worth churning
> > further over this - because VM_DROPPABLE is 64-bit only (due to flags in
> > vma bits), likely so is vDSO getrandom() for the time being. So I think
> > it makes more sense to retool this series to be ppc64, and then if you
> > really really want 32-bit and can convince folks it matters, then all of
> > these parts (for example, here, the fact that the smp helper doesn't
> > want to tear) can be fixed up in a separate series.
> 
> So yes I really really want it on ppc32 because this is the only type of 
> boards I have and this is really were we need getrandom() to be 
> optimised, indeed ppc64 was sherry-on-the-cake in my series, I just 
> added it because it was easy to do after doing ppc32.

I saw that you did in fact find a bit on ppc32 for VM_DROPPABLE. So it
looks at least possible. Because of this generation counter business, I
still think it might make sense to do in two steps, though, first doing
64-bit, and then doing 32-bit after.

As for the generation counter error you're seeing, I guess what we want
is smp_store_release memory ordering semantics, but letting tearing
happen (since the upper 32-bits will be zero anyway). I'm not sure the
best way to do this, whether it's a new helper, or doing a WRITE_ONCE
together with an smp barrier, or what. But I imagine it's something like
that.

Jason


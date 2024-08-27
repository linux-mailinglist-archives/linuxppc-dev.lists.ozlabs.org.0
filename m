Return-Path: <linuxppc-dev+bounces-569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B519601A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 08:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtHgY0gCHz2yQn;
	Tue, 27 Aug 2024 16:28:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724740137;
	cv=none; b=JzamKxgWfNlcJXV1bbNBF0dQDmP5KnLnxwlQirBaUjRHt5nZkghBeE5uOodC08iaz+TcPuCYJ0QMuZzyHZWDAZM9UZeI8u5h2o3riCx6hBfkNrwZ615iVmKB7l13mHnflq7kuSkUG+oVOIYE4IudKNdbk01frBtIGfehmCxZ873NBGelz8TE9pCe3yb9oXwQENMakaTL4Qk45jjK83xwogL+o9WyewCV/5Pg3ntkR16iVGTOGYCH+ez0m6VIQOE7ZNODzsoF8beia/vL1xgl/l54fv9mdCBqws82j25uNn3iD683TjQkuiNyMQggR52c9fLAyb+grkDBmIgakle20A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724740137; c=relaxed/relaxed;
	bh=z+C8gY7gcEhVPp7kCR51huSkzhJ+q20c1yi/iO/q90U=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type; b=n1KTQUc7y8Z0mPfuCljDw3HOKDk18c46XnwyARf7XxFdMNO+pRObwvayifS3Q01a+AB6jQg4IPJ4Rm5mt3IqUaFRHdJeM5vI2PwscUzC6DY5f7vDq/AfkFb6WTBDOW8/HhcJUb8z3JGfGD+ltTLL09vqSfSdNbHeJ7bbey9TaETX4f1C/ojeymkwZ2I4WXBdZFPT/WIkRbScpljCjGzM03uhtQDgFCkogGnVdKGGszBPG5D7F33N6cq4koY5idLMZwQB/6YXfB2K9tnCrisV8NSba53sKGPIMaut9noZ2IMe2ZfLiJLBFuvK3gNmg2Rlw8Bo9e5f/LLg8pLrhTL8rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lDZzXlr6; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lDZzXlr6;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtHgX4Ks5z2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 16:28:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724740134;
	bh=z+C8gY7gcEhVPp7kCR51huSkzhJ+q20c1yi/iO/q90U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lDZzXlr6lwPuFNtfA1Ndz9kbTPGq0s6a7IGnbUxXwjUN7KdO85Hf3/GRT9DUkxjc5
	 XEoYBERZI102fmKh+HZM1HyV5tp3il3QVRBMKgkQKkuuzS53MrY46VSprpvvseFHXc
	 Fzsid+Pbmc4aegNE6EprN+C1WpMq3RXpMyrYebYXNUs76bqHvCGbA8Q/gyQfOfG/6e
	 skKPNFTu1Senc0eK1B4fWLBwfAjWNnFlvLPFIxKa9uURWf9ikJViHfxYaLTdV0whJf
	 E0AY4oEg2fR2BnXBQ9TkHxPj2bLA92xztsZqmK1DiR2w8V0mde8jZJFpo2RPzCL/ks
	 UtgS2D0I9vr5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtHgV1ZqMz4wj2;
	Tue, 27 Aug 2024 16:28:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, djwong@kernel.org, ritesh.list@gmail.com,
 linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
In-Reply-To: <20240826154818.hzqnvofdmaxvuwrh@quentin>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
Date: Tue, 27 Aug 2024 16:28:53 +1000
Message-ID: <877cc2fpi2.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com> writes:
> On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the vfs-brauner tree, today's linux-next boot test (powerpc
>> pseries_le_defconfig) produced this warning:
>
> iomap dio calls set_memory_ro() on the page that is used for sub block
> zeroing.
>
> But looking at powerpc code, they don't support set_memory_ro() for
> memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
>
> /*
>  * On hash, the linear mapping is not in the Linux page table so
>  * apply_to_existing_page_range() will have no effect. If in the future
>  * the set_memory_* functions are used on the linear map this will need
>  * to be updated.
>  */
> if (!radix_enabled()) {
>         int region = get_region_id(addr);
>
>         if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>                 return -EINVAL;
> }

We should probably just turn that into a printk(), WARN is kind of heavy handed.

> We call set_memory_ro() on the zero page as a extra security measure.
 
Or a data integrity measure. But either way it makes sense.

On architectures that do implement set_memory_ro() it potentially breaks
the linear mapping into small pages, which could have a performance impact.

cheers


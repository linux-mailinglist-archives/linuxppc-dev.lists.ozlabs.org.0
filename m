Return-Path: <linuxppc-dev+bounces-1462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181997C968
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 14:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ztr5sYPz2yGX;
	Thu, 19 Sep 2024 22:43:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726749796;
	cv=none; b=FzKAmxVxgVQ30tVMTX3UG9I8zJdNFhLsMRj3+FKLXLxG+wKOCPR79HDeFcVNeOHcnmKSYDdmO0qtAXS1mgvcdrXDKVFirYwdOVVloBzvHUaHNCYxkl4lmwF1ZoY7vucrDAb80nhZjbszZw1Eqdj1zrobOABIPThU/H3K8xcMAMl0in8WOrYcGKnjn4hgaq+S7Sq/rPRH+S5Xwm+U4YdZOFmqHKhWlY39VGvCuPxysZDzDDoH4hQOg3HT0/1Doo1JikuD96sWDIb6BRgxIf2mGduTfJsx3h534QD+qebq3Yoq7pEKMwEIKerI8KiEjHENDvCnULTNeBreKW/MRGkwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726749796; c=relaxed/relaxed;
	bh=+4ltGAVEzrHoagPXKaFdfBj/AJkWKcAhVfPM62hcyyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QyB2y1Z0Hn6H8TooKX01ImLS9DYHiTlIcQ2CNvbwZ/AQ0007COPryosBccxRUhaGpsrqRBIAbDG4+PFFIOyeUstaxUaCZSJ30xWIh3NUPPmbKR/O7WMcNbQt8a/n2NEvy7Jzjx4iyvrtfT9YbhWpKau12jNRHXlb9y3RHdtaOWBj2BIX1KiFVn+xvyVnhH3wZHs2BixZEXWOv7qUm83YmigC3vEOCJwW2Sl2uJ2zpk1D5IBMa9ndazNtrtvvrKpsbtDayifPIR4rWIZ9stpNb+5UUx/8KwqqHJOx1vO7m69YfkjGrcOW35d0dOY5vOR6c4FRwzhg8zGe/XbElIbqUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WmVYim2V; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WmVYim2V;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ztq3c00z2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 22:43:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726749791;
	bh=+4ltGAVEzrHoagPXKaFdfBj/AJkWKcAhVfPM62hcyyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WmVYim2V/4PUaKRq9MRgUC5zdyhXQ7tSQ76it7dTsMSEQUwtKtK/WvohX6DyAmMcN
	 D1GaGr5ck9B/RLLLjojYdILfGiwUkiAc42xY31sJVuIgu1iCDSB5Ne8WoV0jLCqI8d
	 zrQVH2/E8wHrzeL472ZLIgKvcRebtNP0/pDHSIeMrOMs1K3UHnNiSWWyaDfov92n6B
	 nX+72Kkyna45gtpiXraRHWX8dA2MM2VAD3/mATghE5+9YSoGPDZR+jxbVLBJfj7SYt
	 +PZlFeirujvDyDFZLcpTy+hpNAk8k+YbLWlsrFQSPy8kfZwx9aUoN4J9MxpblfUpCb
	 Cm5dILFZG65Ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8Ztl2z32z4wb5;
	Thu, 19 Sep 2024 22:43:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
 sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, almasrymina@google.com, kuba@kernel.org
Subject: Re: [PATCH] powerpc/atomic: Use YZ constraints for DS-form
 instructions
In-Reply-To: <20240917073750.GZ29862@gate.crashing.org>
References: <20240916120510.2017749-1-mpe@ellerman.id.au>
 <20240917073750.GZ29862@gate.crashing.org>
Date: Thu, 19 Sep 2024 22:43:10 +1000
Message-ID: <87o74jrezl.fsf@mail.lhotse>
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

Segher Boessenkool <segher@kernel.crashing.org> writes:
> Hi!
>
> On Mon, Sep 16, 2024 at 10:05:10PM +1000, Michael Ellerman wrote:
>> The 'ld' and 'std' instructions require a 4-byte aligned displacement
>> because they are DS-form instructions. But the "m" asm constraint
>> doesn't enforce that.
>> 
>> That can lead to build errors if the compiler chooses a non-aligned
>> displacement, as seen with GCC 14:
>> 
>>   /tmp/ccuSzwiR.s: Assembler messages:
>>   /tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multiple of 4)
>>   make[5]: *** [scripts/Makefile.build:229: net/core/page_pool.o] Error 1
>> 
>> Dumping the generated assembler shows:
>> 
>>   ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t
>> 
>> Use the YZ constraints to tell the compiler either to generate a DS-form
>> displacement, or use an X-form instruction, either of which prevents the
>> build error.
>
> Great explanation text, a perfect commit!  :-)

Thanks - I'm sure there's something that could be better, but I do try :)

cheers


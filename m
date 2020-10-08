Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1D28723C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:09:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Rkv6q40zDqWP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:09:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6RhQ4YpXzDqBj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:07:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ixnS8cV4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6RhP00Qvz9sT6;
 Thu,  8 Oct 2020 21:07:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602151637;
 bh=eNG1RyjqNmOm7441Ouc9ni/lGO8jgy6V8+FrXQf4kmE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ixnS8cV4Q4MSAGho2zjlIKJJgNmnrvBVFjwDxHWNwsbJaAGA8W9fiKzWBlwLQI+CW
 cP7//cRdNpcodhyaIIesDXI9Pytf38ooJ8OZ0kiqQ1uE6iaoKe9c7ZaEX3GPLjcsBm
 /h/SUVum41uWKLr66a0yv6Z+wABkvxDe7MHwVD5g5lLtfSwIW96KlDn3EtVudTeCzX
 inJNjToJOuirp0ZMHIqpBuSFG8TPtmlN0HZAGSFiwPMSixe472j2YL4rnD/HMGtvuS
 FxTMHwuDDUBdeRj1/Nfu+cZy9GV6fB+oVzI/ccDHkEAt/Kci6O2RJ+0CfjGQZuTNfm
 ltjSQgJfYQNtA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, Sasha Levin <sashal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/rtas: Restrict RTAS requests from userspace
In-Reply-To: <87v9fl117r.fsf@mpe.ellerman.id.au>
References: <20200820044512.7543-1-ajd@linux.ibm.com>
 <20200826135348.AD06422B4B@mail.kernel.org>
 <421cba41-20bf-f874-c81a-8b7f9944c845@linux.ibm.com>
 <87v9fl117r.fsf@mpe.ellerman.id.au>
Date: Thu, 08 Oct 2020 21:07:16 +1100
Message-ID: <87sgap1163.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, stable@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Andrew Donnellan <ajd@linux.ibm.com> writes:
>> On 26/8/20 11:53 pm, Sasha Levin wrote:
>>> How should we proceed with this patch?
>>
>> mpe: I believe we came to the conclusion that we shouldn't put this in 
>> stable just yet?
>
> Yeah.
>
> Let's give it a little time to get some wider testing before we backport
> it.

So my fault for not dropping the Cc: stable on the commit, sorry.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566431172A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 00:34:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXWwc67mkzDwrM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 10:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXWtk11mvzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 10:33:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HIpXaQUI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DXWtg3J8rz9sVq;
 Sat,  6 Feb 2021 10:32:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612567981;
 bh=YEW0go1tFxFTxPolBx8L31xUfYen5gFpEkFsTBzAGzI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HIpXaQUIpsnljSZbduOd3aUyuZSR5xDnELAdF1j+5z/HWCYImoa+1yAm1XltVrrvv
 D33mnCqMEFECxr9UnWzV1mvmfmkqsbcJr5f3aITbibDk5vjienHXHJMRbEI12PDhqK
 gI3BeEz2UjvpjcBHeEn4bGI/EcmPBUU1fiSljcQRZEFvTgZnVlVf/gaGg4kEjv8RA0
 SFBAju1jx5nuVG35gO2HG74GoQhFmiVjbJZASsr1ftGXA5uVvfkCt5k/E7LAyDyKi8
 oN9TZIft6KvJvKjwgvOvNChlr4QYR3rhkgjgj8oMkPrj1k7h69noE05DZPEN/SDELL
 nKIfAUDWlTobQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Frederic Weisbecker <frederic@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jordan Niethe
 <jniethe5@gmail.com>, Leonardo Bras <leobras.c@gmail.com>, Paul Mackerras
 <paulus@ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
In-Reply-To: <1612506268.6rrvx34gzu.astroid@bobo.none>
References: <20210205060643.233481-1-leobras.c@gmail.com>
 <1612506268.6rrvx34gzu.astroid@bobo.none>
Date: Sat, 06 Feb 2021 10:32:58 +1100
Message-ID: <878s82ozth.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Leonardo Bras's message of February 5, 2021 4:06 pm:
>> Before guest entry, TBU40 register is changed to reflect guest timebase.
>> After exitting guest, the register is reverted to it's original value.
>> 
>> If one tries to get the timestamp from host between those changes, it
>> will present an incorrect value.
>> 
>> An example would be trying to add a tracepoint in
>> kvmppc_guest_entry_inject_int(), which depending on last tracepoint
>> acquired could actually cause the host to crash.
>> 
>> Save the Timebase Offset to PACA and use it on sched_clock() to always
>> get the correct timestamp.
>
> Ouch. Not sure how reasonable it is to half switch into guest registers 
> and expect to call into the wider kernel, fixing things up as we go. 

Yeah it's not.

We need to disable tracing on those routines that are called in that
half-exited state.

cheers

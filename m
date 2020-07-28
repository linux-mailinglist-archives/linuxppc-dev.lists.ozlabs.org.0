Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18778230897
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 13:24:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGDpY22r2zDqw1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 21:24:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZV91GvcK; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGDmy2ckrzDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 21:22:57 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l63so11698159pge.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+H8mbfz5G/XdCrlZ7IyriBgUJEkjk8H0AAeiqtbMsJA=;
 b=ZV91GvcKpfS8oMm4oA56q3PJts9xJtLVCObdQv7mQ8YLDgxzlYe8aW/kICb4Irs9iM
 1WD6vpmJxAAvQXwIon2pgUY5xGf4dLPerRktobcdaWsJZhjqvNB1mWUpStQZvjk+dYIV
 2W/fFhebuSrFiQpafQZMm3TPKPBec1gVNfwJwba60dXr8Yslz4lGpMSiKT/0BpHiTTHp
 xV2fnUHRauQkSqV079H2TH6WkCikFY7eX3TGXyl/lfFSDy/7KRBNkZ47cRNTSyvlYV9q
 B3FCAIj7KsJKBK2oEXHPQ5Fc5/JWwW/p4pF4FE4zy9pj4mOCQhvwoStVejW6IDMSrodW
 M3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+H8mbfz5G/XdCrlZ7IyriBgUJEkjk8H0AAeiqtbMsJA=;
 b=raW8Z1qTGE7BupyAnYbikGB7qcIKyUj1NeKVi/OqT8TKqn7ULLOx6CzvhN3b0m8FWF
 CwZDv7L5jVAFtfJbT1Jb1doGP7Dw1ZHc/LUR35aso7D3agajqFjRx/20xT3OhtO0jxuX
 9Z0bRI42GzipRc75tBv/YL8JtUJAsCjrbc0vAS9LStp6n/vB7zwbEN2Y15EA6G9Gzgai
 4T4nm0/TuQt5g5VkhKNEhjvgAfdXhwRrLErpaCsvtrErA/gpBT7ocZdFJGzajzt/P4+a
 RFRV9KijkFe5a1tj2kS6LX+8rim9gsh/+n7+uV0YBfdLsv6s0RtqFRk3MJo6aK5YtZ4V
 GhiA==
X-Gm-Message-State: AOAM533OkbZ9QXnPscLslzJRuH0RKu/lC8NLD/gtGZWLpvwhI93RdTL/
 ot8OEH20+BB5Wu/uS4sJUMQ=
X-Google-Smtp-Source: ABdhPJyc88XpIEAWy7T80FPO3au3IMlAnQJQgd80vb9ee0D2KN8IYKKugRZS+LKGSsxnKrBu7QaSgw==
X-Received: by 2002:a62:ab15:: with SMTP id p21mr25070853pff.146.1595935373634; 
 Tue, 28 Jul 2020 04:22:53 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id y6sm2753154pji.2.2020.07.28.04.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:22:53 -0700 (PDT)
Date: Tue, 28 Jul 2020 21:22:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
To: peterz@infradead.org
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200725202617.GI10769@hirez.programming.kicks-ass.net>
 <1595735694.b784cvipam.astroid@bobo.none>
 <20200726121138.GC119549@hirez.programming.kicks-ass.net>
In-Reply-To: <20200726121138.GC119549@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1595934957.l1u0ucmyps.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from peterz@infradead.org's message of July 26, 2020 10:11 pm:
> On Sun, Jul 26, 2020 at 02:14:34PM +1000, Nicholas Piggin wrote:
>> Excerpts from Peter Zijlstra's message of July 26, 2020 6:26 am:
>=20
>> > Which is 'funny' when it interleaves like:
>> >=20
>> > 	local_irq_disable();
>> > 	...
>> > 	local_irq_enable()
>> > 	  trace_hardirqs_on();
>> > 	  <NMI/>
>> > 	  raw_local_irq_enable();
>> >=20
>> > Because then it will undo the trace_hardirqs_on() we just did. With th=
e
>> > result that both tracing and lockdep will see a hardirqs-disable witho=
ut
>> > a matching enable, while the hardware state is enabled.
>>=20
>> Seems like an arch problem -- why not disable if it was enabled only?
>> I guess the local_irq tracing calls are a mess so maybe they copied=20
>> those.
>=20
> Because, as I wrote earlier, then we can miss updating software state.
> So your proposal has:
>=20
> 	raw_local_irq_disable()
> 	<NMI>
> 	  if (!arch_irqs_disabled(regs->flags) // false
> 	    trace_hardirqs_off();
>=20
> 	  // tracing/lockdep still think IRQs are enabled
> 	  // hardware IRQ state is disabled.

... and then lockdep_nmi_enter can disable IRQs if they were enabled?

The only reason it's done this way as opposed to a much simple counter=20
increment/decrement AFAIKS is to avoid some overhead of calling=20
trace_hardirqs_on/off (which seems a bit dubious but let's go with it).

In that case the lockdep_nmi_enter code is the right spot to clean up=20
that gap vs NMIs. I guess there's an argument that arch_nmi_enter could
do it. I don't see the problem with fixing it up here though, this is a=20
slow path so it doesn't matter if we have some more logic for it.

Thanks,
Nick

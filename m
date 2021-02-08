Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 994113139A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 17:39:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZBZ11jDBzDvVT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 03:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZCnSrK8L; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZBX51GCSzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 03:37:38 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id x3so8827876qti.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=0HGJhzf1G3q3frtQdQfHf7vZn5MRVAT2xn4qaxvZi1U=;
 b=ZCnSrK8LjbN2c5cFVRG8Y/oJxehO4A8/tz5FWWPFXPIFK20ClWGSl1ycugUiWZv96X
 gnzaSQox2p06FwUSGLgIjEcfLTyaVjRP3zWJ0jDIJ3pBkNuSYszTkRDAFNGc0Z+2vPmj
 kE5KOYOGtCJ8rO1KdQXK8f29i7lWJcft/u45IPrhagQnf+B2Iho/kXPiCy2Idhksu8Gy
 JrQo92inlAM87m/A/agpxNoW3/F2ASQXN0ZG33LgSo08ttpQpdqBGtQ7z0WFU3zPtDm8
 LGXi1Ad9ZyFxGDBwWOmAypp/fg0KxfxrToUsRIEge7jkM8qFAj7UzxuQYPn6c3ikH7Pz
 L9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=0HGJhzf1G3q3frtQdQfHf7vZn5MRVAT2xn4qaxvZi1U=;
 b=ZH1wlz60CS1VhubOXzDZoPaVKlnbboi31K/WedzlGGRmVDxtKGI8apAWoi0goxO/uU
 r/1YW2ex8Q6zz20A3QncNlhlCpSMjaaaAXf7JV/oFQvS9KqVQaXtX9o/VBzKbwwSQe0x
 PkJd/2k8N80Nj4zXyUi44wxEfihg7mgBXEAp2NNTnwG+dJBLabZCnnAPB4pZirHGt+YR
 Me60fRyYsmdh1skBP1CNtEQowNMJVDoEG7rsVc4dyJpQIppxe2+zSWdc790WyiMil1yH
 RWZHOgw6EY4YZuqVNtTfTRgaz2eFNsNkNV7aJfaEqomAk43hhmNKr4ejq+nsF5A9eM1p
 WwoQ==
X-Gm-Message-State: AOAM533yuodZmWIwMDrKGPuLTzGHqDjHivWjEaDt63cCrPmIzl4XKMr7
 3VAa6SqTwx5t1uqEpoZ24So=
X-Google-Smtp-Source: ABdhPJxNBkhFgcpxYqi/I81KZzI4gTQD8gRxnBMkUmMMD7+YFyASMpNVveQ5vs6x229sbqpsjBgABw==
X-Received: by 2002:a05:622a:44d:: with SMTP id
 o13mr9623179qtx.378.1612802254979; 
 Mon, 08 Feb 2021 08:37:34 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 (186-249-147-196.dynamic.desktop.com.br. [186.249.147.196])
 by smtp.gmail.com with ESMTPSA id c17sm16409866qka.16.2021.02.08.08.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 08:37:33 -0800 (PST)
Message-ID: <5f267a8aec5b8199a580c96ab2b1a3c27de4eb09.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
From: Leonardo Bras <leobras.c@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Frederic Weisbecker <frederic@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jordan Niethe
 <jniethe5@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 08 Feb 2021 13:37:04 -0300
In-Reply-To: <1612579579.ztbklit4un.astroid@bobo.none>
References: <20210205060643.233481-1-leobras.c@gmail.com>
 <1612506268.6rrvx34gzu.astroid@bobo.none>
 <7e231b91e41c3f3586ba2fd604c40f1716db228d.camel@gmail.com>
 <1612579579.ztbklit4un.astroid@bobo.none>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello Nick,

On Sat, 2021-02-06 at 13:03 +1000, Nicholas Piggin wrote:
> Excerpts from Leonardo Bras's message of February 5, 2021 5:01 pm:
> > Hey Nick, thanks for reviewing :)
> > 
> > On Fri, 2021-02-05 at 16:28 +1000, Nicholas Piggin wrote:
> > > Excerpts from Leonardo Bras's message of February 5, 2021 4:06 pm:
> > > > Before guest entry, TBU40 register is changed to reflect guest timebase.
> > > > After exitting guest, the register is reverted to it's original value.
> > > > 
> > > > If one tries to get the timestamp from host between those changes, it
> > > > will present an incorrect value.
> > > > 
> > > > An example would be trying to add a tracepoint in
> > > > kvmppc_guest_entry_inject_int(), which depending on last tracepoint
> > > > acquired could actually cause the host to crash.
> > > > 
> > > > Save the Timebase Offset to PACA and use it on sched_clock() to always
> > > > get the correct timestamp.
> > > 
> > > Ouch. Not sure how reasonable it is to half switch into guest registers 
> > > and expect to call into the wider kernel, fixing things up as we go. 
> > > What if mftb is used in other places?
> > 
> > IIUC, the CPU is not supposed to call anything as host between guest
> > entry and guest exit, except guest-related cases, like
> 
> When I say "call", I'm including tracing in that. If a function is not 
> marked as no trace, then it will call into the tracing subsystem.
> 
> > kvmppc_guest_entry_inject_int(), but anyway, if something calls mftb it
> > will still get the same value as before.
> 
> Right, so it'll be out of whack again.
> 
> > This is only supposed to change stuff that depends on sched_clock, like
> > Tracepoints, that can happen in those exceptions.
> 
> If they depend on sched_clock that's one thing. Do they definitely have 
> no dependencies on mftb from other calls?

We could change that on get_tb() or mftb() @ timebase.h, which would
have a broader reach, but would not reach any mftb from asm code.

> > > Especially as it doesn't seem like there is a reason that function _has_
> > > to be called after the timebase is switched to guest, that's just how 
> > > the code is structured.
> > 
> > Correct, but if called, like in rb routines, used by tracepoints, the
> > difference between last tb and current (lower) tb may cause the CPU to
> > trap PROGRAM exception, crashing host. 
> 
> Yes, so I agree with Michael any function that is involved when we begin 
> to switch into guest context (or have not completed switching back to 
> host going the other way) should be marked as no trace (noinstr even, 
> perhaps).

Sure, that would avoid having to get paca->tb_offset for every mftb()
called, and avoid inconsistencies when different ways to get time are
used in code.

On the other hand, it would make it very hard to debug functions like
kvmppc_guest_entry_inject_int() as I am doing right now.

> 
> > > As a local hack to work out a bug okay. If you really need it upstream 
> > > could you put it under a debug config option?
> > 
> > You mean something that is automatically selected whenever those
> > configs are enabled? 
> > 
> > CONFIG_TRACEPOINT && CONFIG_KVM_BOOK3S_HANDLER && CONFIG_PPC_BOOK3S_64
> > 
> > Or something the user need to select himself in menuconfig?
> 
> Yeah I meant a default n thing under powerpc kernel debugging somewhere.

So, IIUC all we can do is split this in 2 changes:
1 - Adding notrace to those functions
2 - Introducing a kernel debug config that reverts (1) and 'fixes' mftb

If that's correct, I have some ideas we can use. 

For debug option, should we add the offset on get_tb() or mftb()?

Another option would be to adding this tb_offset only in the routines
used by tracing. But this could probably mean having to add a function
in arch-generic code, but still an option.

What do you think?

> 
> Thanks,
> Nick

Thank you!
Leonardo Bras


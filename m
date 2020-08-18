Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7A247F52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:24:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW2V74XlFzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 17:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TSPQYiEu; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW2S60k8fzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 17:22:44 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so8845370pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ngrPbPBRbUsq6w+flBSZQV2nOcmo/y3wzfu+I9RjOwM=;
 b=TSPQYiEu1Z3JAOqWBoqY0hkMurM6qzutlorBVGTCiYHNvCTc6oGO2lvpnf9ygeWYuk
 /hGBax/Aor+9svcSrfngM0CKK3dbpDJc8onXTK9HHtR8G1nWkVBzOz/GzwYyI2Yydf0y
 28NXnmPerG5D0pXpjDvuYp+cFFSYBQujB7GhYS9wU9QhpDn82QALLxrH4lMdBz4XlGEL
 ZyWsXpMC/yMp1GmvYiGoqK5+pBRrbFENkDXjDALUFLx+piH1/xZ2McUr3DB0MXJB/zJR
 Ev8G5+7QjObdSdOFB4uNtu0xANrJPcsSOfvdEN/I3bu5ZF5+xyaxjBcJno801fSmWgRr
 yxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ngrPbPBRbUsq6w+flBSZQV2nOcmo/y3wzfu+I9RjOwM=;
 b=TnjgA6CI5HdEH56dGAa0G11GxZgavETl3SXTMnggzC9w9/uR44bTmV+sG8T4Aa0Sxl
 JVjped5WarNDS3Q5B3Q1FekEjtnj5be0k2rm9CPH+LjOyw9cnMBeZQC3fAmOWdDSAwnp
 /BZ3fs8IN6JB8qE871spAkkP3Bgf+imfZCybN8+X+DXrcOoKOK/RtKP34N3xgApFpwxo
 nZIr6tsIbO+rHpIlc5NK6YiyLa+AL1j4MdYRiZIZlh08z5jv6MVIhXQVSvAURyG9JqaC
 8QZLlkZ9HWi7AbjychTAooF7o482CCFqmbk7JWedq3iVbo0BgTOEJ/bYjkAWAJlQHhNe
 1eUw==
X-Gm-Message-State: AOAM531gvTO5UGGQTD3cZrUsbhCsiVKQzxdKIsZxdSjJKVcgrkiAbjhg
 jv8VNcXJFkqUGp4c6Armvq4=
X-Google-Smtp-Source: ABdhPJwWicVHjLC3nLnAfAzUswzycukvUhFKVQxdfOgfh/aUNHN6aaAIYbgqXGGLh0wn8G5+FzQeQw==
X-Received: by 2002:a17:90a:e990:: with SMTP id
 v16mr16323320pjy.194.1597735359589; 
 Tue, 18 Aug 2020 00:22:39 -0700 (PDT)
Received: from localhost (193-116-193-175.tpgi.com.au. [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id z26sm21152854pgc.44.2020.08.18.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 00:22:39 -0700 (PDT)
Date: Tue, 18 Aug 2020 17:22:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
To: peterz@infradead.org
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200807111126.GI2674@hirez.programming.kicks-ass.net>
 <1597220073.mbvcty6ghk.astroid@bobo.none>
 <20200812103530.GL2674@hirez.programming.kicks-ass.net>
In-Reply-To: <20200812103530.GL2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1597735273.s0usqkrlsk.astroid@bobo.none>
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

Excerpts from peterz@infradead.org's message of August 12, 2020 8:35 pm:
> On Wed, Aug 12, 2020 at 06:18:28PM +1000, Nicholas Piggin wrote:
>> Excerpts from peterz@infradead.org's message of August 7, 2020 9:11 pm:
>> >=20
>> > What's wrong with something like this?
>> >=20
>> > AFAICT there's no reason to actually try and add IRQ tracing here, it'=
s
>> > just a hand full of instructions at the most.
>>=20
>> Because we may want to use that in other places as well, so it would
>> be nice to have tracing.
>>=20
>> Hmm... also, I thought NMI context was free to call local_irq_save/resto=
re
>> anyway so the bug would still be there in those cases?
>=20
> NMI code has in_nmi() true, in which case the IRQ tracing is disabled
> (except for x86 which has CONFIG_TRACE_IRQFLAGS_NMI).
>=20

That doesn't help. It doesn't fix the lockdep irq state going out of
synch with the actual irq state. The code which triggered this with the
special powerpc irq disable has in_nmi() true as well.

Thanks,
Nick

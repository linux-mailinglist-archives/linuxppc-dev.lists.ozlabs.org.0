Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5632D1E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:37:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrpkS426Qz3d23
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:37:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h+SU9xNx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=h+SU9xNx; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drpk33SvLz30N6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:36:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Drpjz4ZPsz9s1l;
 Thu,  4 Mar 2021 22:36:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614857817;
 bh=xB2NH2RDnNFxOP2JfengPRlNHO42YuHU5/2Vw/S7pOg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=h+SU9xNxDWKhrRHWY/w+mIUHKv4safweEwbe083MPF1DIbA7ozVlnplRYLYEjYAJ9
 wmqzCycYy60nUrMIYRuUbUc8kfqkqyoXVfHOhL1PrnVbCGfQoikWh8cwN3Px8TDDal
 iPykVzq3qLmTkoF12otE7RCTAO94F5bXu9pENzh2D6xV+cphX+YS6+pydN/uTFbjVn
 NGqsD1AYnCk6lTCcv3zCzqYeWc8SzeOJgerEiFcKSnSiv3iYaIdfWNjWqJPbCiRhgQ
 o4LWE4StUWHNoBxWpYGN7JxTSJ3k2Poipicav9hVjHVnv3Fl8tWaC6HcUjZJUHuGYz
 gMeTf6WFlNGfw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 elver@google.com, rostedt@goodmis.org
Subject: Re: [PATCH v2] powerpc: Fix save_stack_trace_regs() to have running
 function as first entry
In-Reply-To: <20dad21f9446938697573e6642db583bdb874656.1614792440.git.christophe.leroy@csgroup.eu>
References: <20dad21f9446938697573e6642db583bdb874656.1614792440.git.christophe.leroy@csgroup.eu>
Date: Thu, 04 Mar 2021 22:36:49 +1100
Message-ID: <878s73rvzi.fsf@mpe.ellerman.id.au>
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
 kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> It seems like other architectures, namely x86 and arm64
> at least, include the running function as top entry when saving
> stack trace with save_stack_trace_regs().

Also riscv AFAICS.

> Functionnalities like KFENCE expect it.
>
> Do the same on powerpc, it allows KFENCE to properly identify the faulting
> function as depicted below. Before the patch KFENCE was identifying
> finish_task_switch.isra as the faulting function.

Thanks, I think this is the right approach. There's kfence but also
several other users from what I can see with a quick grep.

...
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Fixes: 35de3b1aa168 ("powerpc: Implement save_stack_trace_regs() to enable kprobe stack tracing")
> Cc: stable@vger.kernel.org

I'm not sure about the Cc to stable. I think we are fixing the behaviour
to match the (implied) intent of the API, but that doesn't mean we won't
break something by accident. I'll think about it :)

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC881F5310
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:23:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hl3K4lCczDq9b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hjTW2bV6zDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 20:12:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rexwtAZx; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49hjTT2Stlz9sRh;
 Wed, 10 Jun 2020 20:12:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591783933;
 bh=6MdS/FrXRihHOHwCWI3wY0oUCxFXp63aKB1vDbSR0HQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rexwtAZxOGeqWScfyZVmEUfI+g1Pta9Fi1LU2fxYj0/NLfSptLzbKLFT6s+H8Kcfe
 VSl8NcsAiM1nX+QCxl7kWEQWa0IUo47fzZOfgbR1D9aQOHdi7VV4MyvCEX1LIEPQK7
 4cazo84S9CwcRIF4f7FFY89q36VoOE0v7+4SeKPg+r+RoWjSJhmgY5ZawCKzlCghfu
 uh9/OXVHVzF9/TX9Gp+gXE7LVCJs1o9l0Njquu5UmQMVu6BobO6peK5kWIvyynd0le
 Wo06N0NgINf2RyO2Tvt/bWgxgWcmIP2W8FGb9282mp2kAGKICMj+mcFg0NGvetSAel
 90lpGQzaLuTFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@infradead.org>,
 Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kprobes: Use probe_address() to read instructions
In-Reply-To: <20200609055320.GA14237@infradead.org>
References: <7f24b5961a6839ff01df792816807f74ff236bf6.1582567319.git.christophe.leroy@c-s.fr>
 <159168034650.1381411.840854749818290996.b4-ty@ellerman.id.au>
 <20200609055320.GA14237@infradead.org>
Date: Wed, 10 Jun 2020 20:12:39 +1000
Message-ID: <87r1unfcvc.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@infradead.org> writes:
> On Tue, Jun 09, 2020 at 03:28:38PM +1000, Michael Ellerman wrote:
>> On Mon, 24 Feb 2020 18:02:10 +0000 (UTC), Christophe Leroy wrote:
>> > In order to avoid Oopses, use probe_address() to read the
>> > instruction at the address where the trap happened.
>> 
>> Applied to powerpc/next.
>> 
>> [1/1] powerpc/kprobes: Use probe_address() to read instructions
>>       https://git.kernel.org/powerpc/c/9ed5df69b79a22b40b20bc2132ba2495708b19c4
>
> probe_addresss has been renamed to get_kernel_nofault in the -mm
> queue that Andrew sent off to Linus last night.

That commit above is actually already in mainline, I was just _really_
behind on sending the patch notifications.

cheers

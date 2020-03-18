Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C9F189AD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 12:39:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j7Nj6qM5zDqRY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j7Jq6ny7zDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 22:35:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pmUJrk5X; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48j7Jq0PMzz9sPF;
 Wed, 18 Mar 2020 22:35:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584531355;
 bh=nZ8h3rQzS7YUxkreuIxZFpLLT3jR0FhsbHFPgoPcdJI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pmUJrk5Xi8xhUIwDPK7RrBSmTM7bfHYLCmcnCkHMDg5Mmcz2XrHOFCHIJu8d2FlsI
 q4MJLY3tFtJRGP3j6muDyAgYj5t4txrvmiLBDKQOHLKJSM/fJqUxMNtMiYVBhjk962
 x/hM9lkekXwoYrv/d1iYTXxMG9voCWP9K+vLLxRB/q32U3+Eo8prhE6BRnptmK4GiD
 2g66VqtlIc+3d59dicdTUduQ1qDnhfzseYMli0JI7mkiTC52390FQPTY2AQ3PGC9EL
 OfC72sdtOYl+P20j8LvGjJaBpOAXWkPkpEEYeOHDBmPC7He/nYbKpLSrEWAbYjyqDh
 KnwmX6AS15LxQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org
Subject: Re: [PATCH 12/15] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
In-Reply-To: <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-13-ravi.bangoria@linux.ibm.com>
 <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
Date: Wed, 18 Mar 2020 22:35:56 +1100
Message-ID: <87zhcdevz7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 09/03/2020 =C3=A0 09:58, Ravi Bangoria a =C3=A9crit=C2=A0:
>> Currently we assume that we have only one watchpoint supported by hw.
>> Get rid of that assumption and use dynamic loop instead. This should
>> make supporting more watchpoints very easy.
>
> I think using 'we' is to be avoided in commit message.

Hmm, is it?

I use 'we' all the time. Which doesn't mean it's correct, but I think it
reads OK.

cheers

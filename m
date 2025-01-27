Return-Path: <linuxppc-dev+bounces-5593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D04A1D53E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 12:20:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhQvF5lXLz2yVG;
	Mon, 27 Jan 2025 22:20:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737976825;
	cv=none; b=Z6M6a3PbAzyonQeB1Bh11NVKdgOCS7A3wvHznNn4Zpn6cNGUcxGDjH3ZmWUeOFXROJlLi+ua70HJKr5vkXX/ghmMFDhSq9T7tB7XK9XfOCVXavqhsiF35+kMlVjwdDifBNdrz4wyOdqwSwFaN55pxLgKaJpLQs7m0e2WlRfcWl+waXhEojV5I1cfJLlPBQ5YfZBgs1VXJ28QS6krA51sNnS5GZ0BKGquPlMyQh9wfwMlEK04c5gzNrWwkHFx8bzKwq44TI19uy1enF4eBz7oDFYO8cvW2jjeJnglujcQbzg84d/UkmhiupjzqHesd70u+fD+KVYigOPg6qxI+D5U/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737976825; c=relaxed/relaxed;
	bh=Id0dzuNOOGjop0865qqU7sm20SXdLKEsq53Fv3o/W+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wwrqgzy1D31bgJ8Je2ZEt6NqA3AZut9gO5gOv0dr5mxrqHkYJKlX0mPmAL0wdFx2ubWLqmNDtAYEJGB0nEM5mSNHfZ3DH2oBhWJEbbh3sBqcA+pST9dYBxw+7K037cz1gBBaS33w5WsZJNG8XWILY9bQOqCNzU1slPIk3F4ExqZKXziTsV3JNbc4ZQ+tvGKvyxveEpeM1jFFfNxrCNcAHU3d2h1j53C3nJUy5e7lFuVKeviInB6UlEXNOErazTC0POdbC72ZWFjgHjCivaktFtqXAniAmZevVZ20WAighxwJnsBYQscY90oWk3V+LoFgYV832S+uGE2tXR7XI73jhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhQvF0VW5z2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 22:20:25 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id A0E3972C8CC;
	Mon, 27 Jan 2025 14:20:23 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 8F3167CCB3A; Mon, 27 Jan 2025 13:20:23 +0200 (IST)
Date: Mon, 27 Jan 2025 13:20:23 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250127112023.GB29522@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 23, 2025 at 11:07:21PM +0100, Christophe Leroy wrote:
[...]
> To add a bit more to the confusion,

Looks like there is no end to it:

static inline long regs_return_value(struct pt_regs *regs)
{
        if (trap_is_scv(regs))
                return regs->gpr[3];

        if (is_syscall_success(regs))
                return regs->gpr[3];
        else
                return -regs->gpr[3];
}

static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
{
        regs->gpr[3] = rc;
}

This doesn't look consistent, does it?


-- 
ldv


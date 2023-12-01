Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C78001EF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 04:13:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AYWCthT3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShJ6h1zm5z3dBp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:13:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AYWCthT3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShJ5p66lnz3bws
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 14:12:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701400357;
	bh=F+eemxID8zfTy/ruTCOTo0d3EXe5X2w1QPkRpR78dqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AYWCthT3Cc4OavkvdIPlxGVT5FPG5D0Kcpf9gVQ4prm9G7rkEb2GPFX9FzsImp7ed
	 cqQrqeLBqaSYkB1cE2WZicIwpuZk+lXzMO/orjH6HZ6sVSqimW9T/yyVkgkXKI8VRk
	 SONQqxKO1u3+xEnnJKMZ/faR7CiXyf5gLYr1sQEgA9fbKj4s3sdDZjIfTBo3vwpz/P
	 rHWkHyGH9BU1p6184e238DoUma4l6EVcDT1fc9QAF65xbXE4lI0zFlBgtgV//6eQyv
	 KGpDj3InY9LhNYovM/Jo9ik2rdyIe/WTlaC1F2j9jtkvTUa+GjyI7jxjHti+S8WAM5
	 ZLISLjLJq4lZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShJ5c58N9z4wdD;
	Fri,  1 Dec 2023 14:12:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the mm tree
In-Reply-To: <20231130145251.f9dca8d062117e8ae1b129c1@linux-foundation.org>
References: <20231127132809.45c2b398@canb.auug.org.au>
 <20231127144852.069b2e7e@canb.auug.org.au>
 <20231201090439.7ae92c13@canb.auug.org.au> <87sf4m27dz.fsf@mail.lhotse>
 <20231130145251.f9dca8d062117e8ae1b129c1@linux-foundation.org>
Date: Fri, 01 Dec 2023 14:12:27 +1100
Message-ID: <87msuu1uqs.fsf@mail.lhotse>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Fri, 01 Dec 2023 09:39:20 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> > I am still carrying this patch (it should probably go into the mm
>> > tree).  Is someone going to pick it up (assuming it is correct)?
>> 
>> I applied it to my next a few days ago, but I must have forgotten to
>> push. It's in there now.
>
> I'll keep a copy in mm.git, to keep the dependencies nice.  I added
> your acked-by.

Sure thing. Thanks.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E46D6CBEBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 14:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm7p63pBhz3fRc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 23:11:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l2dYj3aN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm7nD2fGQz3cKk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 23:10:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l2dYj3aN;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pm7nC4Rqbz4x1N;
	Tue, 28 Mar 2023 23:10:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680005455;
	bh=+DEqLnF+sWaySTrVEA7F2wtjTWfTMXFCRHTp7/7c/E4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=l2dYj3aNj6ejE8LuBRIstdiSDe6fP/eaHbYwR6cYNKA0XqKF96UNw1Bx84q1Mbq7Z
	 wJOYZFUhpCiwn/UJlqfkD+fdcJbB8yxnsPgSw0K70tHkR0PC/kchxj9R4eT8IhW9m6
	 /PRtxTKAb21CJle53Zb/rHUpThcVZTm0He64bf6Cfpww7Zp746Ebi3SimGqmTYjujr
	 q01U6x8ILbuPF3itm+0sK72eESdJ1cqQpbw/KA3YIv+xMz/uacQbE/SK8+Aih2CdhI
	 gz+t2y9v6Tj31oY7y9kQjrGuK5pOuQeIm3xgO14yNFr3tZ3yP93TnktGTXHpaNNzHC
	 899i2yGmKs64g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Black <daniel@mariadb.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Memory coherency issue with IO thread offloading?
In-Reply-To: <CABVffEN2=G3nFyk12qwWwtk6ZZiXoNquXUJ_oYTKa0q2=GE76Q@mail.gmail.com>
References: <CABVffEN2=G3nFyk12qwWwtk6ZZiXoNquXUJ_oYTKa0q2=GE76Q@mail.gmail.com>
Date: Tue, 28 Mar 2023 23:10:55 +1100
Message-ID: <87cz4tcbzk.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Black <daniel@mariadb.org> writes:
> Thanks Jens, Nick, Christophe and Michael for your work so far.
>
> Apologies for the out of thread email.
>
> Confirming MariabD-10.6+ is required( when we added liburing), and
> previous versions used libaio (which tested without incident as mpe
> retested).

Thanks! I was trying to follow the threads from the mariadb/server
github to find the CI but didn't have much luck. No .travis.yml these
days :)

> We were (we're now back on the old good kernel Jens indicated) getting
> failures like https://buildbot.mariadb.org/#/builders/231/builds/16857
> in a container (of various distro userspaces) on bare metal.
>
> bare metal end of /proc/cpuinfo
>
> processor    : 127
> cpu        : POWER9, altivec supported
> clock        : 3283.000000MHz
> revision    : 2.2 (pvr 004e 1202)
>
> timebase    : 512000000
> platform    : PowerNV
> model        : 9006-22P
> machine        : PowerNV 9006-22P
> firmware    : OPAL
> MMU        : Radix

Thanks, looks like that's a Boston, which at least has the same CPU as
the machine I'm testing on.

I have also reproduced it on bare metal now, but it seems much easier to
hit it in an LPAR (on P10). Not sure that's an actual data point, could
just be due to other activity on the box.

cheers

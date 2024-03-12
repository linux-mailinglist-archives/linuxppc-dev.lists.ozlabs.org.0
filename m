Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D740E8792BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 12:08:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KfNPgIqS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv9qf4jhrz3dSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 22:08:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KfNPgIqS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv9pz1nVJz3bws
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 22:07:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710241675;
	bh=lcy9Eb1cZW7ubgW871++ju60s8L1NTUuFdFau4whLVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KfNPgIqS2pK4ZAGExh6slU7/0hwPWNQAPXef7O0hrKvIxYmJqPFgpJeT3ZyF/JkMf
	 FLxgVTnVmI73qTgJJnVzls0uClnBtBC18gXkH5OD9dK7fnJP44BVpZEoXHKWzSo7Up
	 wf/WEZk6oLO8DDyRVJBhT8hs84y1CVgnSUq7vn4xFYd7yY8rpxbxk5do1hERxFjaJB
	 lQD+SKxtq1i3munPZUYm6Gwy9P6PeVCIdEgAVo/yWgUNJ9btgk/PSVfJe4QU7R0FZA
	 t6cxSL3H8MOY/F/rT0ssP5GyJehmvw0FrI1FPJTsshj1/1SKm7dKpUGcYOxYtj6X94
	 AlUBuJxmdMK8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tv9pz00lQz4x0n;
	Tue, 12 Mar 2024 22:07:54 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Breno Leitao <leitao@debian.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
In-Reply-To: <ZfAa59Z8njiGUnRW@gmail.com>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
 <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
 <ZfAa59Z8njiGUnRW@gmail.com>
Date: Tue, 12 Mar 2024 22:07:54 +1100
Message-ID: <874jdb4sj9.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Breno Leitao <leitao@debian.org> writes:
> On Tue, Mar 12, 2024 at 08:17:42AM +0000, Christophe Leroy wrote:
>> +Nathan as this is RTAS related.
>>=20
>> Le 21/08/2018 =C3=A0 20:42, Breno Leitao a =C3=A9crit=C2=A0:
>> > The rtas syscall reads a value from a user-provided structure and uses=
 it
>> > to index an array, being a possible area for a potential spectre v1 at=
tack.
>> > This is the code that exposes this problem.
>> >=20
>> > 	args.rets =3D &args.args[nargs];
>> >=20
>> > The nargs is an user provided value, and the below code is an example =
where
>> > the 'nargs' value would be set to XX.
>> >=20
>> > 	struct rtas_args ra;
>> > 	ra.nargs =3D htobe32(XX);
>> > 	syscall(__NR_rtas, &ra);
>>=20
>>=20
>> This patch has been hanging around in patchwork since 2018 and doesn't=20
>> apply anymore. Is it still relevant ? If so, can you rebase et resubmit ?
>
> This seems to be important, since nargs is a user-provided value. I can
> submit it if the maintainers are willing to accept. I do not want to
> spend my time if no one is willing to review it.

My memory is that I didn't think it was actually a problem, because all
we do is memset args.rets to zero. I thought I'd talked to you on Slack
about it, but maybe I didn't.

Anyway we should probably just fix it to be safe and keep the static
checkers happy.

I'll rebase it and apply it, I'm sure you've got better things to do :)

cheers

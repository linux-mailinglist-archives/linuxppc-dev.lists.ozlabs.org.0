Return-Path: <linuxppc-dev+bounces-3027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE919C12B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 00:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkzMG1lsMz3brC;
	Fri,  8 Nov 2024 10:49:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731023386;
	cv=none; b=lZ6FVSvfYbABt1F4vui3Iz/3kvCbczac4tijQ7nLbN3fUUSPc4W9XUp9o3R0TsGeaKUV+X67YK8p8AZpQ6wTDKk6wx2WNvPJ2YRwmOivQN56akp6HlrWmav7aZAZknT4wPj3m8yZK64bIXKoy8MZbwzvEDqCMQAqx++f1HGLLfnhRPw8FxzT755fPkfDYFIfpgXiDhh6ArBeDCKcR0k2y9Y90193JH/Ih/5NMAu5rLrMOQMZbi+WsYWoSp2J/Mde+nlEWGi21kav2W5dgwthrBlDVnlvvnn7GBk9w5ec0qXtZz9yfDIKOndJFsBPEfXf4g/Bwxy6Ka7ZncjQWeiAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731023386; c=relaxed/relaxed;
	bh=1UjGmzJI5YomK2L9/tQso2d7SjKdXqaBlKYPlkpu4U8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NK/wHHHgbk+PkdDz74sZ+pyLq5Fsyb/PKiBy+2nA2ZhH8joFDZn96gFyLdiaQK0o4wN1/7g5Zj71s3PwDE4RiiJzK9EfXcX/IT40PbT0EKgNgdufu9vM/duku1qPK0yjNP7bNYUKf1K8D3rUDB58QOzICJ2mZ7/7SjFiv+xXNJFUhMYw2cOZcDKvAkhwR6G5JK1nj1ojYVea3wLOvugvnqtkbVAR9VWoNfAlKA9OEiVMTye5Igw32gxu+6SCpUNKoFvnN/DiYUdBEvSh+gLEGfHAQs8VYhnFupMATZ1gMmUYFy+hBrW4lhgJhe/SwIOn9S/RTON8BmEKCNHM1n8oBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IC7u/7nf; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IC7u/7nf;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkzMF2ncYz3bn9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 10:49:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731023382;
	bh=1UjGmzJI5YomK2L9/tQso2d7SjKdXqaBlKYPlkpu4U8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IC7u/7nfsujlFq9JdHYwNOAsjCDXS0JEsT3nczJyq/0VVUy6teXkspmcTP1OmwKjp
	 Z13MzhjyMX4WT9pPqKP6WvFIHZnC1sybMGcq1wso3Z700NL8/0CsaI25aKVMJQH3Zr
	 n4Q5+qlMOxXpmCI/f4/AbDLDzDktWiyRA6SKKtpr/7lWGgWkUOuZmQAftBK/wshZG/
	 SPFE1zxNGwRS+K+0ugYB5zu1KVrvDEXB2s1ZWV7hnv1y38S+GW4cvmWCnqXgdD0cCo
	 tXHGqAQXScCLaY5i6c5jDKDsH4TztJbCcPDGu8fmaeOmBao1E20jCqfaWw8bH7PI5m
	 U6mmSa55RCtTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkzMB1xXbz4x6n;
	Fri,  8 Nov 2024 10:49:42 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Yang Li
 <yang.lee@linux.alibaba.com>, npiggin@gmail.com, naveen@kernel.org,
 maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Abaci Robot
 <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] powerpc/machdep: Remove duplicated include in svm.c
In-Reply-To: <ed3a5d53-af06-498f-a8fe-0fe1e3a293bc@csgroup.eu>
References: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
 <87msibcmeb.fsf@mpe.ellerman.id.au>
 <ed3a5d53-af06-498f-a8fe-0fe1e3a293bc@csgroup.eu>
Date: Fri, 08 Nov 2024 10:49:44 +1100
Message-ID: <878qtud2p3.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 07/11/2024 =C3=A0 12:29, Michael Ellerman a =C3=A9crit=C2=A0:
>> Yang Li <yang.lee@linux.alibaba.com> writes:
>>> The header files linux/mem_encrypt.h is included twice in svm.c,
>>> so one inclusion of each can be removed.
>>>
>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D11750
>>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>>> ---
>>>   arch/powerpc/platforms/pseries/svm.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>=20
>> The two includes only appear in linux-next, and they both come from
>> different trees. They are required in each tree to avoid breaking the
>> build.
>>=20
>> So no one can merge this patch until the two trees are merged into mainl=
ine.
>
> But can't those two trees coordinate the patches so that the include=20
> goes at the same place avoiding duplication at merge ?

Yes that would work.

Except that in this case it's too late because the commits have already
been applied to both trees for over a week - neither maintainer is going
to want to rebase for something trivial like a duplicated header.

I could apply a patch to my tree to move the include to the same line as
the commit in the DMA tree, but even that seems like overkill for a
duplicated header.

I'll try and remember to apply this once the trees are merged in
mainline. But if not the bot that detected it in the first place can
just detect it again and repost.

cheers


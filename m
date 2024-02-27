Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF58688D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 07:08:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SMAjj3hw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkRqv0HDNz3dng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 17:08:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SMAjj3hw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkRq570Gyz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 17:07:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709014062;
	bh=20EfPIHxyQmybVUOaqQJjyWj5FqndYMB2UQnS5e1DH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SMAjj3hwsEHrCVNHNpUo6f81S+hVoit86vYtw+/8Ycxz6e9h6EJcvRgpR4uSy8PEY
	 6Bi5rZJLKiuiHel+o5eZYodjQuvjMnbhittjjBZ5j6hqe+9HUYtvwSaQlX80jAbUln
	 PGveJMRq1LOdNRhaGc1Us0tRIpAPALInbEfIYt1JxYvMFijKxrQcs2jFaAvq+mJHqv
	 rfJeSASYGWNopbWe9MhHfMXZv8ogA0cxDIaxh06bGwM0gYoL0SXT/wquqXTXGZZw8N
	 /xLwz+73DqWoz7ljz3EkCT8QGphGwwk9aSrKF1kc47Mqy6wywUbFGPGPhQqrxSgMNF
	 EK3jTevCoCwGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TkRq16g4Dz4wby;
	Tue, 27 Feb 2024 17:07:41 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kunwu Chan <chentao@kylinos.cn>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
In-Reply-To: <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
References: <20240125092624.537564-1-chentao@kylinos.cn>
 <87h6hva4b0.fsf@mail.lhotse>
 <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
Date: Tue, 27 Feb 2024 17:07:36 +1100
Message-ID: <87jzmq5tjr.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kunwu Chan <chentao@kylinos.cn> writes:
> Thanks for the reply.
>
> On 2024/2/26 18:49, Michael Ellerman wrote:
>> Kunwu Chan <chentao@kylinos.cn> writes:
>>> This part was commented from commit 6d492ecc6489
>>> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
>>> in about 11 years before.
>>>
>>> If there are no plans to enable this part code in the future,
>>> we can remove this dead code.
>> 
>> I agree the code can go. But I'd like it to be replaced with a comment
>> explaining what the dead code was trying to say.

> Thanks, i'll update a new patch with the following comment:
>      /*
>      * No CPU has hugepages but lacks no execute, so we
>      * don't need to worry about cpu no CPU_FTR_COHERENT_ICACHE feature case
>      */

Maybe wait until we can get some input from Aneesh. I'm not sure the
code/comment are really up to date.

cheers

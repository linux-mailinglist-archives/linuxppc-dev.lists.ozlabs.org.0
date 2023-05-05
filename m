Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BB6F825A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 13:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCThB3CBWz3fJw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 21:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pAnBmTvp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCTgJ3863z3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 21:56:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pAnBmTvp;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QCTgG04Kbz4x3k;
	Fri,  5 May 2023 21:56:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683287802;
	bh=wL0ut7KPgA2OC3Dll+ns1sPtjzsQDnTnwgItU5roP2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pAnBmTvp2iT6sEDsOS3XkU3XM/V1lGsw9QC2wCL8EmIE9d0cEUAwxoibwuvYo/6Cs
	 BbXtw4WRlWj1hdo4z6MV1fxNWNIpN0w8YVqJBpoGofE05Bs4wpvsM108zY+XJsHu1n
	 rObjiNrn/fjQRwK2NQ9KwrdPQ/NE6EcZwUgh1j0uX7JqgUiYAiZ/K348c4FM4qoZ/j
	 H0i3KKVzdi+3D6u1M+3FDapoVJCy2C1r11M23k7XKnDVjh17qBledtTGpPxTrIaSH3
	 IUrCmu+2us/uZTtygzUq5yv6gPMf8Iplw9akcH6uM+qiFLpwClsixZUEipR7XYJGVU
	 dqpTxyBv+iOGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH] mm: kfence: Fix false positives on big endian
In-Reply-To: <CANpmjNOmtTU=__W7=pKVibVZ3OnfgSsXeSsqHA7y=e3D-G026Q@mail.gmail.com>
References: <20230505035127.195387-1-mpe@ellerman.id.au>
 <CANpmjNOmtTU=__W7=pKVibVZ3OnfgSsXeSsqHA7y=e3D-G026Q@mail.gmail.com>
Date: Fri, 05 May 2023 21:56:40 +1000
Message-ID: <87zg6j56vb.fsf@mail.lhotse>
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
Cc: zhangpeng.00@bytedance.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, glider@google.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Marco Elver <elver@google.com> writes:
> On Fri, 5 May 2023 at 05:51, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance of
>> __kfence_alloc() and __kfence_free()"), kfence reports failures in
>> random places at boot on big endian machines.
>>
>> The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the
>> address of each byte in its value, so it needs to be byte swapped on big
>> endian machines.
>>
>> The compiler is smart enough to do the le64_to_cpu() at compile time, so
>> there is no runtime overhead.
>>
>> Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of __kfence_alloc() and __kfence_free()")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Reviewed-by: Marco Elver <elver@google.com>

Thanks.

> Andrew, is the Fixes enough to make it to stable as well or do we also
> need Cc: stable?

That commit is not in any releases yet (or even an rc), so as long as it
gets picked up before v6.4 then it won't need to go to stable.

cheers

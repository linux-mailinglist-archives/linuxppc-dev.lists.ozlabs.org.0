Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A5D400A8E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 13:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1sg16kNqz303f
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 21:21:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=luaLPnw8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=luaLPnw8; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1sfM4P5qz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 21:20:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630754434;
 bh=rKIJGr4LxNvf6bGeq19fnSd30tX36l40x3zNqhpTpvs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=luaLPnw8QYAsNQGZqh0g5RYKx8r7mBIqT/9Y3PGDLZthzqEuG71MY6vpLer+nTjy/
 w3QwMkdUjQfuwEIpnylzNgP/SwOg7Rn5kxujT/upa9icQM2g+KzdhvwKOmaR1PPHmj
 3roNx8acOBkcpfMjcP4omZZl+COk4n52P0YFRB5tQ/zMn3nOWDg51633mcCQxIKzBv
 QR6DpFWuVfdBoJVpVF27hORP0IEgujZn7BHMHWtALMkKkRBnhmdIjYpDUfjNch6DZO
 iKX+/OPCkkiOZkApdopXBmM+FD20ZY1lHXjjhpoi70+cvEbs35VG0iDjSXYjCLFfXT
 /G6IOz1qMJzTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H1sf91PV3z9sVq;
 Sat,  4 Sep 2021 21:20:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nanyong Sun <sunnanyong@huawei.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, benh@kernel.crashing.org, paulus@samba.org,
 akpm@linux-foundation.org, npiggin@gmail.com, christophe.leroy@c-s.fr
Subject: Re: [PATCH -next] powerpc/mm: check base flags in ioremap_prot
In-Reply-To: <e27f8786-7d43-4191-9b65-5a55a64cf158@huawei.com>
References: <20210903090339.3671524-1-sunnanyong@huawei.com>
 <90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu>
 <e27f8786-7d43-4191-9b65-5a55a64cf158@huawei.com>
Date: Sat, 04 Sep 2021 21:20:25 +1000
Message-ID: <87fsukzix2.fsf@mpe.ellerman.id.au>
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
Cc: wangkefeng 00584194 <wangkefeng.wang@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nanyong Sun <sunnanyong@huawei.com> writes:
> On 2021/9/3 17:16, Christophe Leroy wrote:
>> Le 03/09/2021 =C3=A0 11:03, Nanyong Sun a =C3=A9crit=C2=A0:
>>> Some drivers who call ioremap_prot without setting base flags like
>>> ioremap_prot(addr, len, 0) may work well before
>>> commit 56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags in
>>> ioremap()"), but now they will get a virtual address "successfully"
>>> from ioremap_prot and badly fault on memory access later because that
>>> patch also dropped the hack adding of base flags for ioremap_prot.
>>>
>>> So return NULL and throw a warning if the caller of ioremap_prot did
>>> not set base flags properly. Why not just hack adding PAGE_KERNEL flags
>>> in the ioremap_prot, because most scenarios can be covered by high level
>>> functions like ioremap(), ioremap_coherent(), ioremap_cache()...
>>> so it is better to keep max flexibility for this low level api.
>>
>> As far as I can see, there is no user of this fonction that sets flags=20
>> to 0 in the kernel tree.
>>
>> Did you find any ? If you did, I think it is better to fix the caller.
>>
>> Christophe
>>
> I see some vendor's drivers which are not on upstream ...

Sorry, but we don't carry extraneous checks in upstream for the sake of
out-of-tree drivers.

cheers

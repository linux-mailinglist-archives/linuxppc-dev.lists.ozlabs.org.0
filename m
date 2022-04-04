Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 546544F14E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 14:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX9Br1f1Gz2yHB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 22:32:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L8UxTIfR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX9BC0XqSz2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 22:31:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L8UxTIfR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KX9B809kHz4xLT;
 Mon,  4 Apr 2022 22:31:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649075488;
 bh=hG6TZKEJZxMsTA02FMCiW8eZLr8jMlFUkObaIFUyTbI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L8UxTIfRsNHbVWg4V6jVyub1n8Ldvb7dX6QfXFLdjJhDGEOw25R9QtIaRWIJX5iC7
 lnxvvLG2KzWhM/JpGHUE9LIjgtO3mD1Am9nIDlWIeF8CS8VpA+PBQDJo+uITDuG9AW
 ZpgS6vBov1FuXD/DvHOx7Qdgs5eWt8gz3lU9LMRWITkcjHhEKlkpPJrNE0ne2qBJoa
 2UPJm3fnhPbJtaqJxVJWPUQ4FG/zlQM2Vu1Rc8r1zBI16GRnyYtLU0fQjncEV16FOk
 uFvNLnERwz2N0NkmgdBbc1NS3W0ruURAqYr/ZzOE8Z8gzQ0fmYP/kz/2DkoEfmyLMA
 9WBkKCOkcTDUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v4 1/2] Revert "powerpc: Set max_mapnr correctly"
In-Reply-To: <0c6e13cc-f768-2cb4-0aa3-cd090b99fc8f@huawei.com>
References: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
 <b2ff771c-01ef-3f14-f22d-9248735fdc77@huawei.com>
 <de3e12e2-6dff-90cd-3f47-fe8deaae1fa8@csgroup.eu>
 <0c6e13cc-f768-2cb4-0aa3-cd090b99fc8f@huawei.com>
Date: Mon, 04 Apr 2022 22:31:27 +1000
Message-ID: <877d8581y8.fsf@mpe.ellerman.id.au>
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
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "songyuanzheng@huawei.com" <songyuanzheng@huawei.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
> On 2022/3/28 22:12, Christophe Leroy wrote:
>> Hi,
>>
>> Le 26/03/2022 =C3=A0 08:55, Kefeng Wang a =C3=A9crit=C2=A0:
>>> Hi maintainers=EF=BC=8C
>>>
>>> I saw the patches has been reviewed[1], could they be merged?
>> Thinking about it once more, I think the patches should go in reverse
>> order. Patch 2 should go first and patch 1 should go after.
>>
>> Otherwise, once patch 1 is applied and patch 2 is not applied yet,
>> virt_addr_valid() doesn't work anymore.
>
> Should I resend them or could the maintainer reverse order when merging=20
> them?

I'll reverse them. I've found some breakage in other code while testing
this, so I'll fix that up first before merging these.

In patch 2 you didn't say what hardware you hit this on, what CPU does
your system have?

cheers

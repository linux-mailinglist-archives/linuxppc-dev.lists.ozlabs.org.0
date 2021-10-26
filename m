Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BE43BD3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 00:31:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf64P1vlGz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 09:31:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=esTDXAO9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf63h5qLjz2xYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 09:30:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=esTDXAO9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf63f3HMqz4xbG;
 Wed, 27 Oct 2021 09:30:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635287454;
 bh=XefSZASUt0Shq3/7ecZYzgnUVFy7rObUidTFXFQDrPU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=esTDXAO9VPl+gb2NPopWhgwRcoAKMImKj95UXpm2end2j9VxyW8qWOQExKFdCD2r3
 4a+mjM6PhzR1Dx7NnsaUdKC8A9h4hQH8QbVPjd0w64niF0gJtD2paXrzLs8gGsawPB
 5r24B/zV9OZLLbD5DXlXDGV2qQNPcx+t4qsHIlI0w/eZSBKNSktsUqTd548ZBrjqqb
 T5icJ4Tw5eSz+Vn8mjFyVNqqP2DygNPnzsYuRsql1asJwyp5nXjpt5mhkHuoVqt/R5
 1RGTLcyFsedb3kM/5vatFc5wmHDc+TE+SvCghW+DRTZvNfXBYMfBhO26O2selqltlS
 Z9O13Qfolda3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Tyrel Datwyler
 <tyreld@linux.ibm.com>
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
In-Reply-To: <20211026184201.GB1457721@embeddedor>
References: <20211015050345.GA1161918@embeddedor>
 <97c42e43-15b9-5db6-d460-dbb16f31954d@linux.ibm.com>
 <20211026184201.GB1457721@embeddedor>
Date: Wed, 27 Oct 2021 09:30:53 +1100
Message-ID: <87h7d3beqq.fsf@mpe.ellerman.id.au>
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
Cc: Haren Myneni <haren@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gustavo A. R. Silva" <gustavoars@kernel.org> writes:
> On Mon, Oct 18, 2021 at 02:09:31PM -0700, Tyrel Datwyler wrote:
>> On 10/14/21 10:03 PM, Gustavo A. R. Silva wrote:
>> > (!ptr && !ptr->foo) strikes again. :)
>> > 
>> > The expression (!ptr && !ptr->foo) is bogus and in case ptr is NULL,
>> > it leads to a NULL pointer dereference: ptr->foo.
>> > 
>> > Fix this by converting && to ||
>> > 
>> > This issue was detected with the help of Coccinelle, and audited and
>> > fixed manually.
>> > 
>> > Fixes: 1a0d0d5ed5e3 ("powerpc/vas: Add platform specific user window operations")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> Looking at the usage pattern it is obvious that if we determine !ptr attempting
>> to also confirm !ptr->ops is going to blow up.
>> 
>> LGTM.
>> 
>> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>
> I think I'll take this in my tree.

I've already put it in powerpc/next:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=61cb9ac66b30374c7fd8a8b2a3c4f8f432c72e36

If you need to pick it up as well for some reason that's fine.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9608358FD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 03:45:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zfhq3rZyzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 11:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zffs0fbpzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 11:43:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Zffr6p0rz9s3Z;
 Fri, 28 Jun 2019 11:43:16 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Haren Myneni <haren@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] crypto/NX: Set receive window credits to max number of
 CRBs in RxFIFO
In-Reply-To: <20190627062610.olw3ojckkwil4jlk@gondor.apana.org.au>
References: <20190627062610.olw3ojckkwil4jlk@gondor.apana.org.au>
Date: Fri, 28 Jun 2019 11:43:16 +1000
Message-ID: <87tvcascwb.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herbert Xu <herbert@gondor.apana.org.au> writes:
> Haren Myneni <haren@linux.vnet.ibm.com> wrote:
>>    
>> System gets checkstop if RxFIFO overruns with more requests than the
>> maximum possible number of CRBs in FIFO at the same time. The max number
>> of requests per window is controlled by window credits. So find max
>> CRBs from FIFO size and set it to receive window credits.
>> 
>> Fixes: b0d6c9bab5e4 ("crypto/nx: Add P9 NX support for 842 compression engine")
>> CC: stable@vger.kernel.org # v4.14+   
>> Signed-off-by:Haren Myneni <haren@us.ibm.com>
>
> I presume this is being picked up by the powerpc tree?

No. I assumed you'd take it because it's in drivers/crypto.

If you want me to take it that's fine, just let me know.

cheers

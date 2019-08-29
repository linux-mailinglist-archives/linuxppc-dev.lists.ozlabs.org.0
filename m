Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E38A151B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:44:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JyNy5DC0zDqM4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:44:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JyM50f59zDrNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 19:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46JyM35CvPz9s4Y;
 Thu, 29 Aug 2019 19:42:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] powerpc: use the generic dma coherent remap allocator
In-Reply-To: <20190828142546.GA29960@lst.de>
References: <20190814132230.31874-1-hch@lst.de>
 <20190814132230.31874-2-hch@lst.de> <20190828061023.GB21592@lst.de>
 <87blw9v2ge.fsf@mpe.ellerman.id.au> <20190828142546.GA29960@lst.de>
Date: Thu, 29 Aug 2019 19:42:15 +1000
Message-ID: <87zhjstiiw.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> On Wed, Aug 28, 2019 at 11:34:09PM +1000, Michael Ellerman wrote:
>> Christoph Hellwig <hch@lst.de> writes:
>> > Michael,
>> >
>> > do oyu plan to pick this up?  Otherwise I'd love to pick it up through
>> > the dma-mapping tree as that would avoid one trivial conflict with
>> > another pending patch.
>> 
>> It conflicts a bit with the ioremap changes I already have in next.
>> 
>> And it would be good for it to get some testing on my machines here. So
>> I guess I'd rather it went via the powerpc tree?
>
> Sure, feel free to queue it up through the ppc tree.  I am about to
> queue up a patch to move the dma_atomic_pool_init call to common code,
> so as linux-next / Linus fixup we'll have to eventually remove
> atomic_pool_init() again.

OK.

cheers

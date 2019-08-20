Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63121952B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 02:23:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CBN13YlfzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CBJh4sLJzDqq8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 10:20:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46CBJg0XFkz9sNC;
 Tue, 20 Aug 2019 10:20:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 05/10] powerpc/mm: Do early ioremaps from top to bottom
 on PPC64 too.
In-Reply-To: <1566221500.6f5zxv68dm.astroid@bobo.none>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
 <1566221500.6f5zxv68dm.astroid@bobo.none>
Date: Tue, 20 Aug 2019 10:20:16 +1000
Message-ID: <87r25g662n.fsf@concordia.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Christophe Leroy's on August 14, 2019 6:11 am:
>> Until vmalloc system is up and running, ioremap basically
>> allocates addresses at the border of the IOREMAP area.
>> 
>> On PPC32, addresses are allocated down from the top of the area
>> while on PPC64, addresses are allocated up from the base of the
>> area.
>  
> This series looks pretty good to me, but I'm not sure about this patch.
>
> It seems like quite a small divergence in terms of code, and it looks
> like the final result still has some ifdefs in these functions. Maybe
> you could just keep existing behaviour for this cleanup series so it
> does not risk triggering some obscure regression?

Yeah that is also my feeling. Changing it *should* work, and I haven't
found anything that breaks yet, but it's one of those things that's
bound to break something for some obscure reason.

Christophe do you think you can rework it to retain the different
allocation directions at least for now?

cheers

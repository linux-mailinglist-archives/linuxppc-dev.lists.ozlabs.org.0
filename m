Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 067AE232949
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 03:00:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHBs81MGnzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 10:59:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHBpb50BLzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 10:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XXby88pg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHBpZ102Qz9sRN;
 Thu, 30 Jul 2020 10:57:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596070662;
 bh=rY7j/lpAaiE/yJIIG3Dv4Q34+OGeOt90Rrtbh9eLqm4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XXby88pgcFASWvlRTD75nfrIeuVipbFcU/1yJ3aaryWOBiwCaH0lIQ0g7CuaPdiJu
 6/y/AKmWEqCnySq6BC+4Dkqa2k6xaSIqF8G9DJ/1tsjB+2DGBGafOCyS+p8uNeiPCN
 xf3pPHX/LlkAKSSLbd7jDcvLroJFw0GhZHbOX7fZLb4ua4xzAkyGH1SV+7WjtjOobx
 Jfxj3WlxQydeC8EZIJhX3XeNl3iSew3Fvjf3udQ32OSIwnu+FHmPhA5V6Z0VZp8iY2
 B5iQDp2xlsTNzoWLKtDHVyv4AH1Xw0IegIOYhejLKedozP8RANk1C/olCSpCJcs9RE
 /0ALNlxxLi/tA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
In-Reply-To: <878sf31m8k.fsf@linux.ibm.com>
References: <20200728173741.717372-1-nathanl@linux.ibm.com>
 <bd9225f2-40c9-0460-ba45-c29c920b5f91@linux.ibm.com>
 <878sf31m8k.fsf@linux.ibm.com>
Date: Thu, 30 Jul 2020 10:57:38 +1000
Message-ID: <87lfj16cql.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> Le 28/07/2020 =C3=A0 19:37, Nathan Lynch a =C3=A9crit=C2=A0:
>>> The drmem lmb list can have hundreds of thousands of entries, and
>>> unfortunately lookups take the form of linear searches. As long as
>>> this is the case, traversals have the potential to monopolize the CPU
>>> and provoke lockup reports, workqueue stalls, and the like unless
>>> they explicitly yield.
>>>=20
>>> Rather than placing cond_resched() calls within various
>>> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
>>> expression of the loop macro itself so users can't omit it.
>>
>> Is that not too much to call cond_resched() on every LMB?
>>
>> Could that be less frequent, every 10, or 100, I don't really know ?
>
> Everything done within for_each_drmem_lmb is relatively heavyweight
> already. E.g. calling dlpar_remove_lmb()/dlpar_add_lmb() can take dozens
> of milliseconds. I don't think cond_resched() is an expensive check in
> this context.

Hmm, mostly.

But there are quite a few cases like drmem_update_dt_v1():

	for_each_drmem_lmb(lmb) {
		dr_cell->base_addr =3D cpu_to_be64(lmb->base_addr);
		dr_cell->drc_index =3D cpu_to_be32(lmb->drc_index);
		dr_cell->aa_index =3D cpu_to_be32(lmb->aa_index);
		dr_cell->flags =3D cpu_to_be32(drmem_lmb_flags(lmb));

		dr_cell++;
	}

Which will compile to a pretty tight loop at the moment.

Or drmem_update_dt_v2() which has two loops over all lmbs.

And although the actual TIF check is cheap the function call to do it is
not free.

So I worry this is going to make some of those long loops take even longer.

At the same time I don't see an easy way to batch the calls to
cond_resched() without more intrusive changes.

cheers

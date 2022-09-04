Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C65AC41F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 13:33:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ML8fH0YmKz3bkm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 21:33:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QnNmWbRC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ML8dh3l9kz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Sep 2022 21:32:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QnNmWbRC;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ML8dh0h9pz4xD3;
	Sun,  4 Sep 2022 21:32:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662291160;
	bh=mLGcxzbnnbxu6EKrXGdhCH+nPAYj+1VHsPHafBchnyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QnNmWbRCa0lnHBgLJ47GutZ6jrIQhZ1hDyo8cLtCKHqGT9lWCmKz5AnfwLOtwwj4c
	 Er1287gU5yBYS4nlMe3NluCuWTzJ/AZ2P7mO0GZxMQyFOECGMErUS1/BSnoSbhMolK
	 vPx5WXywuwRLwGOeGyljUmZ5NMpN7X0Up3ozMJIR+OJlydOIqhJU0bUv/Pcy1QHkG7
	 3y5KpMRswXzsjB+YsoD0hCYs1aV8iqyJFacG92VrIfEBglV01004PdORtR/zRX+OO+
	 T0fZFQ5+LytAuWP9fGNKRZkM0f0z48SYkKv3WSDpDt/CadcnlqAI3WHSzBPjp4FBGl
	 13jCMj/OWlpQg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] powerpc/mm/64s: Drop p4d_leaf()
In-Reply-To: <4c607d70-6b1e-46d1-72f2-8bbf0fc40949@csgroup.eu>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
 <20220903123640.719846-2-mpe@ellerman.id.au>
 <4c607d70-6b1e-46d1-72f2-8bbf0fc40949@csgroup.eu>
Date: Sun, 04 Sep 2022 21:32:39 +1000
Message-ID: <87leqztlwo.fsf@mpe.ellerman.id.au>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 03/09/2022 =C3=A0 14:36, Michael Ellerman a =C3=A9crit=C2=A0:
>> Because 64-bit Book3S uses pgtable-nop4d.h, the P4D is folded into the
>> PGD. So P4D entries are actually PGD entries, or vice versa.
>>=20
>> The other way to think of it is that the P4D is a single entry page
>> table below the PGD. Zero bits of the address are needed to index into
>> the P4D, therefore a P4D entry maps the same size address space as a PGD
>> entry.
>>=20
>> As explained in the previous commit, there are no huge page sizes
>> supported directly at the PGD level on 64-bit Book3S, so there are also
>> no huge page sizes supported at the P4D level.
>>=20
>> Therefore p4d_is_leaf() can never be true, so drop the definition and
>> fallback to the default implementation that always returns false.
>
> Then here as well, you are removing the only architecture which=20
> implements a non 'always false' version of p4d_leaf().
>
> x86 has on that is always false:
>
> #define p4d_leaf	p4d_large
> static inline int p4d_large(p4d_t p4d)
> {
> 	/* No 512 GiB pages yet */
> 	return 0;
> }
>
> So, should it be dropped as well and all uses removed from core mm ?

Probably?

I see very few uses of p4d_leaf(), so I suspect it's not actually being
called in all the places it should be if it ever returned true. See eg.
follow_p4d_mask() which doesn't call it.

I think it would be best to remove it and if anyone ever implements huge
pages at that level (unlikely?) they will need to go back and add
support in the right places.

But ultimately it's up to the mm folks to decide IMHO.

cheers

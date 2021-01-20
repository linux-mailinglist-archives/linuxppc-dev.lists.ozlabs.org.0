Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D272FCFE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 13:19:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLPhc2T32zDqv6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 23:19:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLPZK4qQSzDr3D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 23:13:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RYrGbM9n; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLPZ26GRRz9sSs;
 Wed, 20 Jan 2021 23:13:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1611144811;
 bh=ppadVC+DL6S8kUf6MYt+6Kmx9PUix51IZVSbnepnAnc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RYrGbM9ngTO+dfsaJhMTrkr+H1le5n+yE8WF11w4k2b2aPiETn8QJSr2WwjBSmwA9
 7ihvGsX26SsszUYSmrFE+7YpG5gMX75fslCZeib1Oz/gLAn9JHvyuiYk5L4M22LB9H
 Ndif/KYCiPSs3p+KoAaTIX2MyS0D3DwfjmiC+ciWnIFQruTlML1TSAbIaSq6GTbhX/
 1w8xCrU8KGN1g6xNJ5nY2b+is0B4ITjus7PAd1ttlou7qdGnMKlQYeW4oeqLEeyByv
 g9F2EiMhzHFhpkkbAo1pFwYHGBfvCj5Z1vqz7enzGgV6LmWme3mGBm1bnDyrKnSwIu
 ftFX9rR98sH7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <874kjcy73z.fsf@linux.ibm.com>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <87mtx5qp1g.fsf@mpe.ellerman.id.au> <874kjcy73z.fsf@linux.ibm.com>
Date: Wed, 20 Jan 2021 23:13:28 +1100
Message-ID: <87czxzrel3.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru, tyreld@linux.ibm.com, brking@linux.ibm.com,
 ajd@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Memory locations passed as arguments from the OS to RTAS usually need
>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>> first logical memory block reported in the LPAR=E2=80=99s device tree.
>>>
>>> On powerpc targets with RTAS, Linux makes available to user space a
>>> region of memory suitable for arguments to be passed to RTAS via
>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>> API during boot in order to ensure that it satisfies the requirements
>>> described above.
>>>
>>> With radix MMU, the upper limit supplied to the memblock allocation
>>> can exceed the bounds of the first logical memory block, since
>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB.
>>
>> Why does the size of the first memory block matter for radix?
>
> Here is my understanding: in the platform architecture, the size of the
> first memory block equals the RMA, regardless of the MMU mode. It just
> so happens that when using radix, Linux can pass ibm,configure-connector
> a work area address outside of the RMA because the allocation
> constraints for the work area are computed differently. It would be
> wrong of the OS to pass RTAS arguments outside of this region with hash
> MMU as well.

If that's the requirement then shouldn't we be adjusting ppc64_rma_size?
Otherwise aren't other uses of ppc64_rma_size going to run into similar
problems.

Or does the RMA only apply for RTAS calls when using radix?

cheers

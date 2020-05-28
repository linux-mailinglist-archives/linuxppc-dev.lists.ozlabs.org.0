Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DFF1E6228
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 15:26:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XpQ44SrszDqPG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 23:26:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XpMX22YMzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:24:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TuSZ0xgX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49XpMW4LDgz9sRY;
 Thu, 28 May 2020 23:24:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590672279;
 bh=VKVDfa2X863vPRw5hAs7Yw+qYWIyIvLSR/9FUguLunk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TuSZ0xgXLU6Oq+Qu5TlKhGeOYnooWDW6xQBYST3VRNDGhAJc83fFEOyFIEphz+Y0E
 rSUT3ZjCadWzrI40kkoCx2o6E4nv8YQIsgze5AMqPyShn6FUxGtZuouFAZVP3mDKk5
 AhU8jIanBx3NwUX/ID6Qx9Oj2IncROR8yzttWR5razwTMnUb1AfmsokxB6uoCj0IVG
 b5YSptSwe34gQQhOOgPCXorfFpnyYXDdgEYAO1RKiXZIUOPQC78Z5PRB6CRX1/HENh
 v9I5rjSBPugifqzsY4GmYgq9n3NINfar7FdX1cndqoyG2FFbWPPuwb8wYN8H89DiWl
 g9mMlTzNoc9Vw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of
 passthrough IO adapters
In-Reply-To: <44126659-0490-4466-7f08-1726a7f0ce6e@kaod.org>
References: <20200429075122.1216388-1-clg@kaod.org>
 <20200429075122.1216388-3-clg@kaod.org>
 <44126659-0490-4466-7f08-1726a7f0ce6e@kaod.org>
Date: Thu, 28 May 2020 23:25:03 +1000
Message-ID: <874ks0jiog.fsf@mpe.ellerman.id.au>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> On 4/29/20 9:51 AM, C=C3=A9dric Le Goater wrote:
>> When a passthrough IO adapter is removed from a pseries machine using
>> hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
>> expects the guest OS to have cleared all page table entries related to
>> the adapter. If some are still present, the RTAS call which isolates
>> the PCI slot returns error 9001 "valid outstanding translations" and
>> the removal of the IO adapter fails.
>>=20
>> INTx interrupt numbers need special care because Linux maps the
>> interrupts automatically in the Linux interrupt number space if they
>> are presented in the device tree node describing the IO adapter. These
>> interrupts are not un-mapped automatically and in case of an hot-plug
>> adapter, the PCI hot-plug layer needs to handle the cleanup to make
>> sure that all the page table entries of the XIVE ESB pages are
>> cleared.
>
> It seems this patch needs more digging to make sure we are handling
> the IRQ unmapping in the correct PCI handler. Could you please keep
> it back for the moment ?=20

Yep no worries.

cheers

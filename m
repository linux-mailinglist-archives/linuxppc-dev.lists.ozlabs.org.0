Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B828D71D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 01:45:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9sbc43rkzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 10:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9sY30fFlzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 10:42:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=c89tubCZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9sY21xJrz9sSs;
 Wed, 14 Oct 2020 10:42:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602632566;
 bh=+8RyoDLMFzreOntocD8MmB6tkfPzeL+BTWjzBX1T9v4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=c89tubCZfxUFVdVaNfg1zCZGZni9WmGy0pGadJpxfmztYJy7XSY296aMWhD1XdDMl
 FW32VW5JzIJqKVchFmF7seTXxF40q+xP/tNLk5HUBNIrLBoBgSOsWNScMjPF7ns7tT
 28K9LlRgf0Q56x0AAr64Ifhaxe4/6UsN9/dL0TMCihMJjDVlM2W/Wgdv97qyl0gFC6
 ek5mOnPZKRThm0MPt3qldw8zZNC9KRD0TPI9Acj5kiYR6ynnX2u9nfZTMsAfVOImvh
 zBeXZdphTxNmpeX8V/U2P+pCrn0l6+yWhB5ksnKAeoXc/ldZkkKh+fddRiTopE4gTC
 Le6/LRva41uZQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
In-Reply-To: <90922c43c670e4b55e6cf421be19146333e2ae7b.camel@redhat.com>
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
 <90922c43c670e4b55e6cf421be19146333e2ae7b.camel@redhat.com>
Date: Wed, 14 Oct 2020 10:42:45 +1100
Message-ID: <87tuuxzo96.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@redhat.com> writes:
> On Wed, 2020-09-23 at 09:06 +0200, C=C3=A9dric Le Goater wrote:
>> On 9/23/20 2:33 AM, Qian Cai wrote:
>> > On Fri, 2020-08-07 at 12:18 +0200, C=C3=A9dric Le Goater wrote:
>> > > When a passthrough IO adapter is removed from a pseries machine using
>> > > hash MMU and the XIVE interrupt mode, the POWER hypervisor expects t=
he
>> > > guest OS to clear all page table entries related to the adapter. If
>> > > some are still present, the RTAS call which isolates the PCI slot
>> > > returns error 9001 "valid outstanding translations" and the removal =
of
>> > > the IO adapter fails. This is because when the PHBs are scanned, Lin=
ux
>> > > maps automatically the INTx interrupts in the Linux interrupt number
>> > > space but these are never removed.
>> > >=20
>> > > To solve this problem, we introduce a PPC platform specific
>> > > pcibios_remove_bus() routine which clears all interrupt mappings when
>> > > the bus is removed. This also clears the associated page table entri=
es
>> > > of the ESB pages when using XIVE.
>> > >=20
>> > > For this purpose, we record the logical interrupt numbers of the
>> > > mapped interrupt under the PHB structure and let pcibios_remove_bus()
>> > > do the clean up.
>> > >=20
>> > > Since some PCI adapters, like GPUs, use the "interrupt-map" property
>> > > to describe interrupt mappings other than the legacy INTx interrupts,
>> > > we can not restrict the size of the mapping array to PCI_NUM_INTX. T=
he
>> > > number of interrupt mappings is computed from the "interrupt-map"
>> > > property and the mapping array is allocated accordingly.
>> > >=20
>> > > Cc: "Oliver O'Halloran" <oohall@gmail.com>
>> > > Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
>> > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> >=20
>> > Some syscall fuzzing will trigger this on POWER9 NV where the traces p=
ointed
>> > to
>> > this patch.
>> >=20
>> > .config: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.conf=
ig
>>=20
>> OK. The patch is missing a NULL assignement after kfree() and that
>> might be the issue.=20
>>=20
>> I did try PHB removal under PowerNV, so I would like to understand=20
>> how we managed to remove twice the PCI bus and possibly reproduce.=20
>> Any chance we could grab what the syscall fuzzer (syzkaller) did ?=20
>
> Any update on this? Maybe Michael or Stephen could drop this for now, so =
our
> fuzzing could continue to find something else new?

Someone send me a revert?

cheers

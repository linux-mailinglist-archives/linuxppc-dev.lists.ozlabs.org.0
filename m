Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD013D41D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:09:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yv0x2dR6zDqVp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ytz30QNXzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 17:07:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aVDmr4x6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47ytz16HSKz9sNx;
 Thu, 16 Jan 2020 17:07:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579154877;
 bh=7qp+3xHzwZikpTOq+mwvFSkSot/c7e+e+U5k6P8rwqw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aVDmr4x6tkyotYKohS2ReBQjtzsMt2uvVIs8msUiqB7vrkD19ExZOdZFpo1Rflp8N
 wJSjqasCZMLdoEbfrs6X1oiFBAwk8BWCulcyownl0LanGmdoJsk4Mcqey3HnZrfx8m
 FMU0JySma6O7DjmmHnZZA5oYIxYLVigN2i0ZPdw3u/Hn+HbQEcb25+bHXMKz7+M8Kg
 +7EBQsg1jMs8U68aBxQPgpKJhrBoG2fmmfASXsUbIn2AiedbyNC3BOj3bZlAQLTlxJ
 JjDAWeX7Da63HfvBDeEYCvBFjP1xpA4lBNagBq6Ccch4HWcvdrofsVYSFFhYIN+4AV
 DNBRn72DXZE3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kurz <groug@kaod.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: discard ESB load value when interrupt is
 invalid
In-Reply-To: <20200114085707.56cb6ab2@bahia.lan>
References: <20200113130118.27969-1-clg@kaod.org>
 <76f76082-81ee-4957-c45b-151f0cd6e6b6@kaod.org>
 <87r202alge.fsf@mpe.ellerman.id.au>
 <5918d64a-8cac-c475-1bda-c0b37d49b47c@kaod.org>
 <20200114085707.56cb6ab2@bahia.lan>
Date: Thu, 16 Jan 2020 16:08:04 +1000
Message-ID: <87zheo7x2z.fsf@mpe.ellerman.id.au>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kurz <groug@kaod.org> writes:
> On Tue, 14 Jan 2020 08:44:54 +0100
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 1/14/20 2:14 AM, Michael Ellerman wrote:
>> > C=C3=A9dric Le Goater <clg@kaod.org> writes:
>> >> On 1/13/20 2:01 PM, C=C3=A9dric Le Goater wrote:
>> >>> From: Frederic Barrat <fbarrat@linux.ibm.com>
>> >>>
>> >>> A load on an ESB page returning all 1's means that the underlying
>> >>> device has invalidated the access to the PQ state of the interrupt
>> >>> through mmio. It may happen, for example when querying a PHB interru=
pt
>> >>> while the PHB is in an error state.
>> >>>
>> >>> In that case, we should consider the interrupt to be invalid when
>> >>> checking its state in the irq_get_irqchip_state() handler.
>> >>
>> >>
>> >> and we need also these tags :
>> >>
>> >> Fixes: da15c03b047d ("powerpc/xive: Implement get_irqchip_state metho=
d for XIVE to fix shutdown race")
>> >> Cc: stable@vger.kernel.org # v5.3+
>> >=20
>> > I added those, although it's v5.4+, as the offending commit was first
>> > included in v5.4-rc1.
>>=20
>> Ah yes. I mistook the merge tag of the branch used for the PR (v5.3-rc2)
>>=20
>
> You might want to use 'git tag --contains':
>
> [greg@bahia kernel-linus]$ git tag --contains da15c03b047d
> for-linus
> kvm-5.4-2
> next-20191118
> next-20191126
> tags/kvm-5.4-1
> tags/kvm-5.4-2
> v5.4
> v5.4-rc1

Or:

  $ git describe --match "v[0-9]*" --contains da15c03b047d
  v5.4-rc1~99^2~134^2~17

cheers

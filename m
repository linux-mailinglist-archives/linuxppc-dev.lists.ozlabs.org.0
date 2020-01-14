Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798A139ED9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 02:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xXdd22fdzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 12:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xXXs2XYTzDqNP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 12:14:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iiEg66QF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xXXs0VLLz9s29;
 Tue, 14 Jan 2020 12:14:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578964445;
 bh=5WG/hTgko72eJb6ASFMHgV3Z1SBkyLvrrVTGzmn5hO0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iiEg66QFo8Hf2feigqNc0bYtnRksK0+jNNzpr/xvPsYEOmOdXLH6FheBvl68A8AOj
 aOzYmanBp5glgJwHJIHhs0bUlwpWnqj8yk82bJGAVUrxu7NKfQR6ODqX0tAYD2cq00
 UDd8uh34XRVF4FVDqx260iXpVph8rYZ7/cZO17onoO3LOkSJwuy/tqAy2UgTrg41a8
 SY8wBO+SIeTbNxxEyDDBbxulb5XiC+Bjs+A8cxH2LJMCa4gjdlL+XrG073q+r4Jqes
 pbKB2TWd8h7/e3KNWK/3htCBun+3dAJLK4MNc/Lnjc6BAnWOweWCUJbiCi33xgW8Nl
 tQcIw4QN6vgsw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: discard ESB load value when interrupt is
 invalid
In-Reply-To: <76f76082-81ee-4957-c45b-151f0cd6e6b6@kaod.org>
References: <20200113130118.27969-1-clg@kaod.org>
 <76f76082-81ee-4957-c45b-151f0cd6e6b6@kaod.org>
Date: Tue, 14 Jan 2020 11:14:09 +1000
Message-ID: <87r202alge.fsf@mpe.ellerman.id.au>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> On 1/13/20 2:01 PM, C=C3=A9dric Le Goater wrote:
>> From: Frederic Barrat <fbarrat@linux.ibm.com>
>>=20
>> A load on an ESB page returning all 1's means that the underlying
>> device has invalidated the access to the PQ state of the interrupt
>> through mmio. It may happen, for example when querying a PHB interrupt
>> while the PHB is in an error state.
>>=20
>> In that case, we should consider the interrupt to be invalid when
>> checking its state in the irq_get_irqchip_state() handler.
>
>
> and we need also these tags :
>
> Fixes: da15c03b047d ("powerpc/xive: Implement get_irqchip_state method fo=
r XIVE to fix shutdown race")
> Cc: stable@vger.kernel.org # v5.3+

I added those, although it's v5.4+, as the offending commit was first
included in v5.4-rc1.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A143A375503
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 15:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbZYK4bnvz3bTP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 23:43:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XFMVVAI3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XFMVVAI3; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbZXq5Cx8z2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 23:43:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FbZXf5l85z9sW4;
 Thu,  6 May 2021 23:43:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620308595;
 bh=Lw/D96fhOtgNxgz0JM0qlpti1j2019x8fmayev0jvJk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XFMVVAI31LtODRi2pRyNyxlQEViG8JGbJt4DnYi5zSBNmg/LbRw4d7ebS42h3FaXm
 86h27rf2o2ARQl+2j89Ac3EXzZ6/Lc92PIDSSqtCqF/my0RDFW5KzQhk/laUJ0RB3x
 fFeD827idy7WTW3AnQoauclxhb1r4rCzyxEABmGSn5wQwGjd7J9K5EArOo/ibwKqK+
 fuJYR9YX6hX8i0k+ng6vLrR/PaegSUykaXpMg+slm7IBSoTNpaTYz7T0dSmBK987/c
 XOeTa1je9q7CMDny79hz98g4PETEynYBismkRdM4yoFqsx2+ycO+JHZGnBg+wk+rcY
 pbB/qwmePEULA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin
 <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU
 notifier callbacks
In-Reply-To: <9e0a256b-fb5a-4468-ed21-68d524d6ea56@redhat.com>
References: <20210505121509.1470207-1-npiggin@gmail.com>
 <9e0a256b-fb5a-4468-ed21-68d524d6ea56@redhat.com>
Date: Thu, 06 May 2021 23:43:10 +1000
Message-ID: <87pmy47zbl.fsf@mpe.ellerman.id.au>
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
Cc: Sean Christopherson <seanjc@google.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, kvm@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paolo Bonzini <pbonzini@redhat.com> writes:
> On 05/05/21 14:15, Nicholas Piggin wrote:
>> Commit b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier
>> callbacks") causes unmap_gfn_range and age_gfn callbacks to only work
>> on the first gfn in the range. It also makes the aging callbacks call
>> into both radix and hash aging functions for radix guests. Fix this.
>> 
>> Add warnings for the single-gfn calls that have been converted to range
>> callbacks, in case they ever receieve ranges greater than 1.
>> 
>> Fixes: b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callbacks")
>> Reported-by: Bharata B Rao <bharata@linux.ibm.com>
>> Tested-by: Bharata B Rao <bharata@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
> Sorry for the breakage.  I queued this patch.

Thanks. Are you planning to send it to Linus before rc1?

If not I can pick it up as I already have some things in my next and am
intending to send a pull request anyway.

cheers

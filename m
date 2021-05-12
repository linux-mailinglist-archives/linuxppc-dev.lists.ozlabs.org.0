Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42D37B473
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 05:20:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg0Rh6VrXz30Bc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 13:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JKjxrgHj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JKjxrgHj; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg0RC6nLjz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:20:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg0R41KWyz9sSs;
 Wed, 12 May 2021 13:20:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620789616;
 bh=B7bwN8TGq/XZZxAawjw/TbSLhlFTW9dhi19LbHpXU+I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JKjxrgHjtGz8SZ8PBhyqW7xbbXsyEQYnLz0GshsaBHyP0OESW3EzsnTzoZfzvT/NG
 quJ37NmTwLbKzIO0VDVtvSbky+i44eNlIq0Fmsk87gduhFreQjvUOAFk+/qSSKTiMM
 B4b6CcSx13IoZXyp8IwI/ZHRdaTt6i46S/qFF5oSNYAk9sVkWRCfNJ5shupPG2B7sR
 3+bA4VB6uqgLzPJcgO7okXeOmoWwhMZE/kFRbXmTt5FT4kR/9JNDkai78WZ/pO0FMt
 6LrSK0YL4SmA8CrMWLSCwWjRIWYk68YJK3NknUyTNfCThEeLg2KIr45e2Lfd0f5gYi
 wiLHK2jSmU1Mg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix kvm_unmap_gfn_range_hv() for
 Hash MMU
In-Reply-To: <YJqzJyBvU0A8VG9p@google.com>
References: <20210511105459.800788-1-mpe@ellerman.id.au>
 <YJqzJyBvU0A8VG9p@google.com>
Date: Wed, 12 May 2021 13:20:15 +1000
Message-ID: <87lf8ky6xc.fsf@mpe.ellerman.id.au>
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
Cc: kvm-ppc@vger.kernel.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:
> On Tue, May 11, 2021, Michael Ellerman wrote:
>> Commit 32b48bf8514c ("KVM: PPC: Book3S HV: Fix conversion to gfn-based
>> MMU notifier callbacks") fixed kvm_unmap_gfn_range_hv() by adding a for
>> loop over each gfn in the range.
>> 
>> But for the Hash MMU it repeatedly calls kvm_unmap_rmapp() with the
>> first gfn of the range, rather than iterating through the range.
>> 
>> This exhibits as strange guest behaviour, sometimes crashing in firmare,
>> or booting and then guest userspace crashing unexpectedly.
>> 
>> Fix it by passing the iterator, gfn, to kvm_unmap_rmapp().
>> 
>> Fixes: 32b48bf8514c ("KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU notifier callbacks")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> I plan to take this via the powerpc fixes branch.
>
> FWIW,
>
> Reviewed-by: Sean Christopherson <seanjc@google.com>

Thanks.

cheers

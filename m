Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF968ADAA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 01:47:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8W1l44bfz3c8T
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 11:47:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JhhDnLKV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8W0n0f0Pz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 11:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JhhDnLKV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8W0k6xFTz4xG5;
	Sun,  5 Feb 2023 11:46:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675557975;
	bh=tWd2oYs3tgpsmxYhQeNi8EKfkgW7lsYebdbamIWZmac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JhhDnLKVxNhgOzVNbYHPXACaRKUJ39/VvL7PF/2m2Z0VmB12QQ/mb4hVsBfbsxDZq
	 5/YddJEuSWbLp7c9iu8N+/MTkg9VuJrFSN+L5LzhbEDO3RJkuOH329zwLga7oz42Xp
	 kR0LwkzmD+RrbWSn4UafXrGItLrOEkZtO4wA9jy85RFotMy9WXotJ1DnRzR1rMd/7j
	 kOMY2E3aUSaNWneTpEm1bBwM80+ETSb+Z00JUMzxMxlTLZG+NAPEfFIHuEI7VLKvOb
	 iiHE2eDiKsneWen7lz4Am/LIUPKPFRzIrGtkyLm88TCDlzmN2TVLAvhWSVLwW8gMW/
	 Pe4QAnuairozg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/2] powerpc: Fix livepatch module re-patching issue
In-Reply-To: <20230204172357.mbudvbtv7tc7vhf3@treble>
References: <cover.1674617130.git.jpoimboe@kernel.org>
 <20230204172357.mbudvbtv7tc7vhf3@treble>
Date: Sun, 05 Feb 2023 11:46:12 +1100
Message-ID: <87357ley7f.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Josh Poimboeuf <jpoimboe@kernel.org> writes:
> On Tue, Jan 24, 2023 at 07:38:03PM -0800, Josh Poimboeuf wrote:
>> Fix a livepatch bug seen when reloading a patched module.
>> 
>> This is the powerpc counterpart to Song Liu's fix for a similar issue on
>> x86:
>> 
>>   https://lkml.kernel.org/lkml/20230121004945.697003-2-song@kernel.org
>> 
>> Josh Poimboeuf (2):
>>   powerpc/module_64: Improve restore_r2() return semantics
>>   powerpc/module_64: Fix "expected nop" error on module re-patching
>> 
>>  arch/powerpc/kernel/module_64.c | 29 ++++++++++++++++++-----------
>>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> Hi Michael,
>
> Ping?  Any objections to this?
>
> The x86 counterpart to this is queued for 6.3, it would be nice if this
> also landed.  We could take it through the livepatch tree if needed.

It's in my next since about a week. Sorry I forgot to send the
"accepted" emails (which I still don't have automated :/ ).

337251c7114e1 ("powerpc/module_64: Fix "expected nop" error on module re-patching")

cheers

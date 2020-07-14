Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B902821E7E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:08:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5VSD0cSyzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5VQQ28gVzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:06:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BNT5ATKK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5VQP4n85z9sQt;
 Tue, 14 Jul 2020 16:06:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594706797;
 bh=tY7n/UdK8tlbvEHfcHoZLk3bmHxUK6IFDEldxaGgfL4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BNT5ATKKyJLLeTZd8sYH7BxrwHh8t+/mNRJlwtxkBBO3Ilke6pKUEfTi7Me73YdWo
 WkLFmWfjJNnY8++5m0sMkzhg2sD0x4ibjRKBOu5NQouHO8IeQckcidvOR/Puj8THEo
 REj1zkzprifSNEBG5nIx4o/de0jf80Jiaz0mIk6w4eEtzu4QFzbcmjmRI0ZCrqUMRu
 +MRyNmJRtoDJIZ/L2az5INeGVDYPSnDTzp4SY7PyyR3c4oj/tV9qF5GhPKHt/zMGr7
 B+ygiLW4XGoalbjmX39Nj/iz05bK1LETs6zy+XjkVAVBkQmM4EsomOf9fWnTDE49Dv
 vSzzT7TM9R5ug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] powerpc/perf: Use SIER_USER_MASK while updating
 SPRN_SIER for EBB events
In-Reply-To: <8C50DF8B-1CBB-4365-B068-C8DA5B7D1148@linux.vnet.ibm.com>
References: <1584533181-4331-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87r1xod3c3.fsf@mpe.ellerman.id.au>
 <8C50DF8B-1CBB-4365-B068-C8DA5B7D1148@linux.vnet.ibm.com>
Date: Tue, 14 Jul 2020 16:08:58 +1000
Message-ID: <87ft9uvdad.fsf@mpe.ellerman.id.au>
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On 19-Mar-2020, at 4:22 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> 
>> Hi Athira,
>> 
>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>> Sampled Instruction Event Register (SIER), is a PMU register,
>>                                                               ^
>>                                                               that
>>> captures architecture state for a given sample. And sier_user_mask
>>           ^                                          ^
>>           don't think we need "architecture"         SIER_USER_MASK
>> 
>>> defined in commit 330a1eb7775b ("powerpc/perf: Core EBB support for 64-bit
>>> book3s") defines the architected bits that needs to be saved from the SPR.
>> 
>> Not quite, it defines the bits that are visible to userspace.
>> 
>> And I think it's true that for EBB events the bits we need/want to save
>> are only the user visible bits.
>> 
>>> Currently all of the bits from SIER are saved for EBB events. Patch fixes
>>> this by ANDing the "sier_user_mask" to data from SIER in ebb_switch_out().
>>> This will force save only architected bits from the SIER.
>> 
>> s/architected/user visible/
>> 
>> 
>> But, why does it matter? The kernel saves the user visible bits, as well
>> as the kernel-only bits into the thread struct. And then later the
>> kernel restores that value into the hardware before returning to
>> userspace.
>> 
>> But the hardware enforces the visibility of the bits, so userspace can't
>> observe any bits that it shouldn't.
>> 
>> Or is there some other mechanism whereby userspace can see those bits? ;)
>> 
>> If there was, what would the security implications of that be?
>
> Hi Michael,
>
> Thanks for your comments. 
>
> In ebb_switch_in, we set PMCC bit [MMCR0 44:45 ] to 10 which means
> SIER ( Group B ) register is readable in problem state. Hence the
> intention of the patch was to make sure we are not exposing the bits
> which the userspace shouldn't be reading.
>
> But following your comment about "hardware enforcing the visibility of
> bits", I did try an "ebb" experiment which showed that reading
> SPRN_SIER didn't expose any bits other than the user visible bits.
> Sorry for the confusion here.

That's OK. Thanks for following my trail of clues :)

> In that case, Can we drop the existing definition of SIER_USER_MASK if
> it is no more needed ?

I think it is still needed, and I think this change to use it is good, because
SIER is visible via ptrace.

What we need to do, is look at what information in SIER we are currently
exposing to userspace via ptrace, and what the security implications (if
any) of that are.

cheers

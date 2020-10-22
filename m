Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED532956F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 05:51:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGthm3Jz3zDqNv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 14:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGtg56Z3GzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 14:50:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qdjdbLEa; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGtg535WZz9sSn;
 Thu, 22 Oct 2020 14:50:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603338625;
 bh=lsZwz7oexS7NI4f864MVbdAVW0JuASw1nHlNuPx4uAg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qdjdbLEaL72KVFXT165gLGpe8irNx1qUB1USTObEALsj2YyfRG6JSchdSicODH9d0
 CtgqXK6aPDzX3pMruhfLex8z9SvlA2Ed8upsXz+gx9j9wb88nkgxX528lAoYRjotUj
 0JguvgJl+uhdoJs/gTGh9M7JCXROKo+n/fxgtbFVuLUNwNs3/DKrO7mXh54lq4bxHa
 Hts0Kb7ZUQEFt3nGsS6anFZJbAgdru9ZpH9PA27A61EibTnZl/ugbsflgrsNa92iPl
 L3o9xLqbzT88SqPMZWOjeFS+4EIeYbVEDhA35tE1/8vrWsq4OS1vhblcUPXsNXVfGT
 azphV5kCMgfJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4] powerpc/pseries: Avoid using addr_to_pfn in real mode
In-Reply-To: <566dfec7-4574-b518-f55b-5d34ca3bed08@linux.ibm.com>
References: <20200724063946.21378-1-ganeshgr@linux.ibm.com>
 <566dfec7-4574-b518-f55b-5d34ca3bed08@linux.ibm.com>
Date: Thu, 22 Oct 2020 14:50:22 +1100
Message-ID: <87imb2yl4x.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.vnet.ibm.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:
> On 7/24/20 12:09 PM, Ganesh Goudar wrote:
>
>> When an UE or memory error exception is encountered the MCE handler
>> tries to find the pfn using addr_to_pfn() which takes effective
>> address as an argument, later pfn is used to poison the page where
>> memory error occurred, recent rework in this area made addr_to_pfn
>> to run in real mode, which can be fatal as it may try to access
>> memory outside RMO region.
>>
>> Have two helper functions to separate things to be done in real mode
>> and virtual mode without changing any functionality. This also fixes
>> the following error as the use of addr_to_pfn is now moved to virtual
>> mode.
>>
>> Without this change following kernel crash is seen on hitting UE.
...
>>   
>
> We need this fix as well to fix pseries mce handling, Any comments on this patch.

Looks OK. I'll pick it up.

cheers

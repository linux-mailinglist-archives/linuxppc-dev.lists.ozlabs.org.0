Return-Path: <linuxppc-dev+bounces-11247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2AB33C7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 12:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9RdN4qgCz3cgh;
	Mon, 25 Aug 2025 20:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756117240;
	cv=none; b=egvMQdFs8rFSgXEVUHkhcprSx5BPt29BctpoBK/BAM4bwwtcuYgwS4A3A2jOxh3V3LRyPzz183wN7s61QdGHeyBzaJp4+OL+ArtFSIgLbeIqpfWS7kTQ8oof4ReWqAKRwW5HKV+76hNO1RLUNNYFvWGHRJw3vXMmd4oj6vw/+ilSDRZtIjpLXxzDC/srkHg2uPYq0BV+WOE8auKWCIfV6B2cX87hruXaNIeeAwcvtVtllnuRWywW4GFZ+prDN+2qxRmzLadCjq3DMzs4VR1xytz9lB75uhzNFUuxYolLreqXrElPSrYln+tvnRhJ+gqYNnCQk2C2fauC/nMn6EqLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756117240; c=relaxed/relaxed;
	bh=jB0WKMT7crKcaopJPS36QIRBLD9yrujCjLgtznKE5t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A96ZiixVkst+wScvROGWJQnUY3wgOIq/rLXDkj1sxSg0xig1DofOdE/gXkgi+16YyQc09XT98j2FbVb6sfKrQx1/LDwoMsMA4wYcq80Ni7FjfvBpto6/WqBDZjFv6BADJLrNsGzlU5ioVG6TF042GKrFzH4heTqN1WRAvHK/XgqJvRmVjMfIUJP+Iny7fmiUPrjAfSne0kTlXvbiIc8SlZvKr6NL3eLD51PJ83VnXHrTtRspSu2K20QoUWxnNzOsA7ubYzUoQV9WnrO3sZ8sCuLf/VNPLFQ4canHgFvbcGePqek7uxe5RVZrAX2xFQMvM2P2VzvBLpRGO0/wW6pL+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9RdN0dR9z3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 20:20:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9R2y0dHvz9sSc;
	Mon, 25 Aug 2025 11:54:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cK2CLYDxHx9V; Mon, 25 Aug 2025 11:54:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9R2x72D0z9sSb;
	Mon, 25 Aug 2025 11:54:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D93348B764;
	Mon, 25 Aug 2025 11:54:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EqBXMUSyP-Tb; Mon, 25 Aug 2025 11:54:17 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B97568B763;
	Mon, 25 Aug 2025 11:54:17 +0200 (CEST)
Message-ID: <7b7cccf2-5899-4334-9aa0-e83f0772d484@csgroup.eu>
Date: Mon, 25 Aug 2025 11:54:17 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ozlabs patchwork notification not working anymore
To: Jeremy Kerr <jk@ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
References: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
 <20250729183222.15adbb95@canb.auug.org.au>
 <cd2ee23092e3749f707b0f730af741a94f0986f0.camel@ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cd2ee23092e3749f707b0f730af741a94f0986f0.camel@ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jeremy,

Le 10/08/2025 à 05:12, Jeremy Kerr a écrit :
> Hi Christophe,
> 
> I've (finally!) had some time to take a look at this. Looks like
> timezone behaviour had changed, which affected notification expiry.
> 
> It should be fixed now - I'm seeing test notifications myself. Let
> me know how go.

I still don't receive anything it seems. I have modified the status of 
several patches over the last two weeks and haven't received any 
notification from patchwork.

Christophe

> 
> Cheers,
> 
> 
> Jeremy
> 
> On Tue, 2025-07-29 at 18:32 +1000, Stephen Rothwell wrote:
>> Hi Christophe,
>>
>> On Tue, 29 Jul 2025 07:41:40 +0000 LEROY Christophe
>> <christophe.leroy2@cs-soprasteria.com> wrote:
>>>
>>> If I remember correctly you maintain the Ozlabs patchwork aren't
>>> you ?
>>
>> Actually Jeremy Kerr (cc'd) actually manages patchwork on
>> patchwork.ozlabs.org (I just admin the server it runs on).
>>
>>> For more than one year now, patchwork for linuxppc-dev hasn't sent
>>> notifications about patches status changes. Last notification I
>>> received
>>> was 11 June 2024.
>>>
>>> Is there a reason for that change ? I recently got questions from
>>> people
>>> asking me why they didn't get notified when I started looking at
>>> their
>>> patches.
>>>
>>> Is it possible to restore previous behaviour ?
>>
> 



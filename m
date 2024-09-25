Return-Path: <linuxppc-dev+bounces-1591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03467986681
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 20:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDQjh6HjSz2yMv;
	Thu, 26 Sep 2024 04:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727290120;
	cv=none; b=iVEHz5PxFSsQl8zmShGBT+Hl0Fwyn+ULZn7Tgc0VCvWN5Gr/alHvSkPgDpSnAVQNKw6mqaqvTRdKAWm3kQx8d5nNT8igBrymbbifCDJWdYM5+Nkp4tn4O/tUtsVBgkQXJoGf/eGfsbf2NQJikGS6LHNMfeAde8Qye+sUwdXT8spCUW2Spe1vz2Vdifxvd0L+Q7LQIJr4ux4LDMhgAY+DO4uIfhiORsOJ2igzfTWitE5GxYavlnGu0h1Agbqgho27ku3V7VxtreHg+WvnzheypJ4WUBf23adCyAKsmaQ2EhwIY/wH1TrPgTRThSGkbqjNO4FAPXjYYQZGy1B709m89A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727290120; c=relaxed/relaxed;
	bh=WQ0E+4vjp55E/rKV3FsTL+YnQkHx3KNv6g0qFo1J0MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UKqI0yxobiTi6z4nLyR90IAXb/FbX9dS9KSWHCr8JySzZKpir7q3HywZReTQMOMZ2rIPINXrHfgZPmaAfXxqScKuDrfIz9DitqrCs0+opynyT9Of7d1fdXcRImohyqRRvxgeRy0fB7HX4YI4qNKASYoMRMFI1zwwjHWOe0S2vqOH8eX2F+IKxlBxHD4tODKEHHVI7dpwvfeYczrdegxyV+ZCjk90TQ3RmaRwkePNJWYQ3fBRWcnuW5PJ3yEFyA+LqchTG/WZ8sQf8/Hvo9Fh8mfKU16iWcj+FblolbLh3dvYsQAate0AntEPH+Y0aauvvXLSrx3e5UejNmN/lVInpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDQjh3CRDz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 04:48:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XDQjW6T7Vz9sSV;
	Wed, 25 Sep 2024 20:48:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUB0zJ0ELVIX; Wed, 25 Sep 2024 20:48:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XDQjW5K1kz9sST;
	Wed, 25 Sep 2024 20:48:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 793BE8B76E;
	Wed, 25 Sep 2024 20:48:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hYTA82qmgKG1; Wed, 25 Sep 2024 20:48:31 +0200 (CEST)
Received: from [192.168.232.90] (PO27091.IDSI0.si.c-s.fr [192.168.232.90])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A4178B763;
	Wed, 25 Sep 2024 20:48:31 +0200 (CEST)
Message-ID: <e52a4a07-de2d-4f8f-bc03-3a441152797d@csgroup.eu>
Date: Wed, 25 Sep 2024 20:48:31 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: allow r30 in vDSO code generation of
 getrandom
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
References: <20240925175021.1526936-2-Jason@zx2c4.com>
 <ZvRYs-WYz2qHZjhy@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZvRYs-WYz2qHZjhy@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 25/09/2024 à 20:38, Jason A. Donenfeld a écrit :
> On Wed, Sep 25, 2024 at 07:50:22PM +0200, Jason A. Donenfeld wrote:
>> For gettimeofday, -ffixed-r30 was passed to work around a bug in Go
>> code, where the vDSO trampoline forgot to save and restore this register
>> across function calls. But Go requires a different trampoline for every
>> call, and there's no reason that new Go code needs to be broken and add
>> more bugs.  So remove -ffixed-r30 for getrandom.
> 
> Strangely, I am _unable to_ make the Go code not crash with this patch
> applied. I'm not quite sure what I'm doing wrong yet, or if this points
> to another issue.

Do you mean that without this patch the Go code works and with this 
patch it crashes ? That's strange taken into account that the chacha 
function plays up with r30 regardless of this patch.

Christophe


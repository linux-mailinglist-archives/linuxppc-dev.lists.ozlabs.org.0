Return-Path: <linuxppc-dev+bounces-6923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA54A5D313
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 00:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC8qs1ssPz306d;
	Wed, 12 Mar 2025 10:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741735209;
	cv=none; b=SB/vw/UOCH2xRQ9VqaLxkgWn/NYBXJzXnFY2ih77XbsT1UIibrl900eI3W9Zrn8UIqFrDsjhCy0rT9azDJ+zfyBivioEp0OQdyCVzinyMpP4eZZbOV9vK1/HyObEqlQi2EQvjZJLVENNjPq0VGbLFiG8SZmcVQX8hjwgpG/zz5QLC4A+MGcqNbIvqeqZ/fn+vmvTqKx85lB1P078V0TRA6mO55TMXhOvtosNczDvrQWMiAwxFPfpN9GK8mZTuLX7srMhhU1p1+KClcVyTu++fNDB4k/fAR8MM5T9wtCR0AB3fWbBXytcFD8PbbuxpS/uD/r8nOWHBTBgnP1gd1aLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741735209; c=relaxed/relaxed;
	bh=jXgXVZFE10TTyhs/na5As4nkqL+s9+7iFz/4QW4r/JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P1s8mRA7KpncbEA68aCnhW9bCFjVNphL2ZFdVWF8GngY9dSBcPdEirVnqvNeafoZ8MCfea9GhfCaIdzXSO71/Vj7QGnexp0KggHyX3X2zQmssUonzB0lkAu4uDNhf6Wyhfg56Ik9O3Ngbsirzl7V9uIV7viKzWQs4xpVyR8CpR1HgJ7dHh2TfEqbLENAOOkodx1K1KqEKEcecOhzfGG6Cdmk7KRjeiQCSaVNi8vWv5jM0NesrAvIDDaMvdZuvGoK5a0KWTQ5KiIZG3D5AyCqFJkOgRK+lL86SpYWv18kfhuhbCHSR1kCqvZ2igKC2wG1HDfwm2zLp3nU5eDqONtOuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC8qr0vHKz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 10:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZC8B51Q6yz9sgG;
	Tue, 11 Mar 2025 23:50:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkhevmocnkFM; Tue, 11 Mar 2025 23:50:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZC8B50bc1z9sVp;
	Tue, 11 Mar 2025 23:50:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED0958B768;
	Tue, 11 Mar 2025 23:50:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qokX83PjF9Q0; Tue, 11 Mar 2025 23:50:52 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8814A8B763;
	Tue, 11 Mar 2025 23:50:52 +0100 (CET)
Message-ID: <5ab103b4-70f0-454e-bca6-0bfc66d143f5@csgroup.eu>
Date: Tue, 11 Mar 2025 23:50:51 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250307] Build Failure
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 09/03/2025 à 13:38, Venkat Rao Bagalkote a écrit :
> Greetings!!,
> 
> I see linux-next-20250307 fails to build on IBM Power9 and Power10 servers.
> 
> 
> Errors:
> 
> In file included from ^[[01m^[[K<command-line>^[[m^[[K:
> ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K ^[[01;31m^[[Kfatal 
> error: ^[[m^[[Kuuid/uuid.h: No such file or directory
>     11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
>        |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K

This is unreadable. Please avoid fancy colors that add escapes to logs. 
You can unset LANG environment var before building in order to get 
pastable stuff.

By the way I don't think it is a kernel issue because nowhere in the 
kernel you have uuid/uuid.h

But can you provide your .config (the actual one, not an old one from 
kernel 6.0.0-rc3 like last time) and tell which version of GCC you are 
using.

Thanks
Christophe


Return-Path: <linuxppc-dev+bounces-9291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF6AD5875
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 16:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHSW03KYFz2yMt;
	Thu, 12 Jun 2025 00:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749651644;
	cv=none; b=Lk15My2oIaQ0sysUzkdiqDmTkA7CsKNxwU6837t8wIXwgiiuu0JdyFG0UmSgrxFMdx71HH1rZtWUkfSLtmc1DRZm9LJ4wg3IabN07m/WkCgZOnyyD88nVs6sCqT1/KZzCi63KhCQJSlnic+sSO+ProEh8oihq2f6KW/pn2Q5DcbXHVIWrlphafe215D6r+MRp8/MOsNyQaKjW4PHdkpDCLaSNsB99CvCsoDeAwjjj4bm55H3a8VoeQuCYN7Adm7fUaXZkwGt1JdwkY42K+22IAbEHBxDMo9r38HUvCF9HhjhTKU2KnQAr744SfpGxZjC2ma8Av+ImVgyimoSZfXI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749651644; c=relaxed/relaxed;
	bh=xB4Jy2z6GpyxYitEW5pjAO4Aqx+/1Gn94QkD0E9DZxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/eKb+rLfXBNNB3gGRZsevx2+qrh1yDcXXMrcloohEaNfAYVcp/zoTCGCuy3z1dffpXuviw4GPFN3f8K+cROA18opkfZ7zqybumA7kCbFutQD2gCELgY1GVD7/CCTrbRCl60ZpC2dG/gwCzQQFGWpFyDK+dpFSL/k2q2GXS9C20e4KNXIDYL2j7ZUmANvezTQHsUriuhMFYNYH/pODO5JL65j3piwNifdleyf3u9yBh7wW3XbtgsxdlNMBssWHPeRgIPHutqGgYjDmiO83L7nAFagljuEbUc73FbsXtUbLZFxkJVNbMNBJErSz16W9v31Vjvg464on7Pe4Y0+PBSaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHSVz0wswz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 00:20:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHRnp6q9mz9t1J;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiP35XkF9PLz; Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHRnp65M1z9sqT;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBBD18B77A;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0Cm2GCpeF4lX; Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A32698B769;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Message-ID: <051e9722-44ad-4547-af5d-3e42c8cfe8d9@csgroup.eu>
Date: Wed, 11 Jun 2025 15:48:30 +0200
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
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
To: David Laight <david.laight.linux@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Mark Brown <broonie@kernel.org>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
 <20250610205358.07b1cc05@pumpkin>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250610205358.07b1cc05@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/06/2025 à 21:53, David Laight a écrit :
> On Sat,  7 Jun 2025 13:37:42 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> With user access protection (Called SMAP on x86 or KUAP on powerpc)
>> each and every call to get_user() or put_user() performs heavy
>> operations to unlock and lock kernel access to userspace.
>>
>> To avoid that, perform user accesses by blocks using
>> user_access_begin/user_access_end() and unsafe_get_user()/
>> unsafe_put_user() and alike.
> 
> Did you consider using masked_user_access_begin() ?
> It removes a conditional branch and lfence as well.

Thanks, was not aware of that new function, allthought I remember some 
discussion about masked user access.

Looks like this is specific to x86 at the time being. I would have 
expected that to be transparent to the consumer. Allthought looking at 
strncpy_from_user() I understand the benefit of keeping it separate.

However is it worth the effort and the ugliness of having to do (copied 
from fs/select.c):

		if (can_do_masked_user_access())
			from = masked_user_access_begin(from);
		else if (!user_read_access_begin(from, sizeof(*from)))
			return -EFAULT;

In addition I would expect a masked_user_read_access_begin() and a 
masked_write_access_begin(). It looks odd (and would be wrong on 
powerpc) to not be able to differentiate between read and write in the 
begin yet using user_read_access_end() at the end, ref get_sigset_argpack()

Christophe


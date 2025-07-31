Return-Path: <linuxppc-dev+bounces-10488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D223CB174DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 18:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btDpG3J45z2yLB;
	Fri,  1 Aug 2025 02:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753978838;
	cv=none; b=mvCfM8p0kSaHKWBLyRX+6BkMnROGMkOj8fu4vz9C8m0I0Ot55i8CQGtRFzfojlBSwdNnAAay/lJXFBllLIqZF541WRtC5XuEICWTdQ8xnBR6CIOYJ8lvxvZ4p8b6HiOobGJTD5Km+SprlWKQvyWY3WRIHzk+hL07QvRYSGUoQFdxkrKrduCNWUEr8XRmBmh8KR5NiBd88lHztRgy2fcnPpmrCaoN6qAWlSJyh+xd/SH2NbbwLF/3HAVG2HKBg8uHB4KHOEsSBDiolfb21IQFzABfVeWaEcLyDsQr3y4pAIePnDkcblMJ6Wq8iqy/mglp+B4vAnFpX+hg0R9LCAaCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753978838; c=relaxed/relaxed;
	bh=n5gzy/i7y+NhxG/nH1DY2FIWbRTWfgXNmJsCr7TOROU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FQlNpfW/9z9JTqZrK64SaWl/gCRKC0/S+X5lTqF5EijN8jZPEIKFz6syQvzLBOmPanbDCTRbDVxRHup2fsfrvPCY5K+EskRIHL88GpRSHiUEYadlsWzgzWiylMa3fFPj177Rh8LvuUf1M95RyQxsXW70vi44FZvSfbGIlrzAQWhk3dMNQfkLXrBramms4uYmfZESnhW0HkXH8GZUll3qvISRCgc/tEqTIyH0soHDacOJcJaJXU3fEIw11nwZb/JkfkLTRwD51yZ3Cp03QhsLviL0gtw6yMTyfrhgbKmI4yAF6cW2Yz2R90TlT6BZs3D9HXMRbs8DSSU3EqS0D0x6Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btDpF3xB6z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 02:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4btBbW4VT3z9v8v;
	Thu, 31 Jul 2025 16:41:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AjqPM4-m4E9; Thu, 31 Jul 2025 16:41:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4btBbW3qXxz9v8b;
	Thu, 31 Jul 2025 16:41:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EA788B76E;
	Thu, 31 Jul 2025 16:41:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id W1biCCLjoL8I; Thu, 31 Jul 2025 16:41:11 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 251058B763;
	Thu, 31 Jul 2025 16:41:11 +0200 (CEST)
Message-ID: <3ac7427b-4f17-480e-99ae-f00e5c00e678@csgroup.eu>
Date: Thu, 31 Jul 2025 16:41:10 +0200
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
Subject: Re: [PATCH 07/33] tty: vt: use _IO() to define ioctl numbers
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-8-jirislaby@kernel.org>
 <97ec2636-915a-498c-903b-d66957420d21@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <97ec2636-915a-498c-903b-d66957420d21@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 31/07/2025 à 16:35, Christophe Leroy a écrit :
> Hi Jiri,
> 
> Le 11/06/2025 à 12:02, Jiri Slaby (SUSE) a écrit :
>> _IO*() is the proper way of defining ioctl numbers. All these vt numbers
>> were synthetically built up the same way the _IO() macro does.
>>
>> So instead of implicit hex numbers, use _IO() properly.
>>
>> To not change the pre-existing numbers, use only _IO() (and not _IOR()
>> or _IOW()). The latter would change the numbers indeed.
> 
> On powerpc your assumption is wrong, because _IOC_NONE is not 0:
> 
> $ git grep _IOC_NONE arch/powerpc/
> arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE 1U
> 
> Therefore the value changes even with _IO(), leading to failure of Xorg 
> as reported by Christian.
> 

And is likely an issue on the 4 following architectures:

$ git grep _IOC_NONE arch/ | grep 1U
arch/alpha/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
arch/mips/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
arch/sparc/include/uapi/asm/ioctl.h:#define _IOC_NONE        1U


Christophe



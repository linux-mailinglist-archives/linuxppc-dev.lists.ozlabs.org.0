Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7314F085
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 17:16:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488Mmk4kRGzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 03:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=pGR3WMix; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488Ml46ZsGzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2020 03:15:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 488Mkw26tmz9vBmL;
 Fri, 31 Jan 2020 17:15:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pGR3WMix; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WdDgEsSDAfbI; Fri, 31 Jan 2020 17:15:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 488Mkw10dPz9vBmJ;
 Fri, 31 Jan 2020 17:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580487320; bh=o5yWGjXEXWXnjLbutHUQSZ+G5ebY4nbrRZo8BmI5TZc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pGR3WMixkkpS91gWzrasTrWX98G3LrXQa6v5NyT59rI0vfjifEhWnAUX/caZAB9TZ
 yHdYn12Fdl4/hf0LpABTzyaGcxj9QbMhaQV2kh4LKV9cqMfJOrCAyFrA0LXr/xndfS
 KpddG7pYFUmX5Oz937DzgbEVVnQAdbvSCNx9xyCw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ADB908B8B9;
 Fri, 31 Jan 2020 17:15:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SmoWZXSwTTAa; Fri, 31 Jan 2020 17:15:21 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30D9C8B8B4;
 Fri, 31 Jan 2020 17:15:21 +0100 (CET)
Subject: Re: [PATCH] powerpc/32s: Don't flush all TLBs when flushing one page
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <e31c57eb5308a5a73a5c8232454c0dd9f65f6175.1580485014.git.christophe.leroy@c-s.fr>
 <20200131155150.GD22482@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <27cef66b-df5b-0baa-abac-5532e58bd055@c-s.fr>
Date: Fri, 31 Jan 2020 17:15:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131155150.GD22482@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/01/2020 à 16:51, Segher Boessenkool a écrit :
> On Fri, Jan 31, 2020 at 03:37:34PM +0000, Christophe Leroy wrote:
>> When the range is a single page, do a page flush instead.
> 
>> +	start &= PAGE_MASK;
>> +	end = (end - 1) | ~PAGE_MASK;
>>   	if (!Hash) {
>> -		_tlbia();
>> +		if (end - start == PAGE_SIZE)
>> +			_tlbie(start);
>> +		else
>> +			_tlbia();
>>   		return;
>>   	}
> 
> For just one page, you get  end - start == 0  actually?
> 
> 

Oops, good catch.

Indeed you don't get PAGE_SIZE but (PAGE_SIZE - 1) for just one page.

Christophe

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBE62FD3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 07:06:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jVfL6zY2zDqTW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 15:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ZpzLMaKe"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jVcL1JZyzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 15:04:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45jVcC5PPgz9txvr;
 Tue,  9 Jul 2019 07:04:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZpzLMaKe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NtE2ogjVIdW2; Tue,  9 Jul 2019 07:04:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45jVcC4Fgfz9txvj;
 Tue,  9 Jul 2019 07:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562648683; bh=InD1pggxj7L0oiLqVKw9lp4Lo1SOo1AoAub535aBZZM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZpzLMaKeSsTH4l510UePhhSoJco41Adi8YKLtLj6kN1YJ3QaPifONfn9FoZgvJA5n
 nbn8J/K4v7W00iUT46j4RlPBFpK0PxwkA6vDPCtndy5SRTJj3OszjRUYDSJIOpVNZA
 S+XYnOoBUltwCHlbP6pHRMdQW0VRN4BCE1F1j9FY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 60CFC8B7C1;
 Tue,  9 Jul 2019 07:04:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LtvkpDjRKwoA; Tue,  9 Jul 2019 07:04:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 984448B756;
 Tue,  9 Jul 2019 07:04:43 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
To: Nathan Chancellor <natechancellor@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
 <45hnfp6SlLz9sP0@ozlabs.org> <20190708191416.GA21442@archlinux-threadripper>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
Date: Tue, 9 Jul 2019 07:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708191416.GA21442@archlinux-threadripper>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/07/2019 à 21:14, Nathan Chancellor a écrit :
> On Mon, Jul 08, 2019 at 11:19:30AM +1000, Michael Ellerman wrote:
>> On Fri, 2019-05-10 at 09:24:48 UTC, Christophe Leroy wrote:
>>> Cache instructions (dcbz, dcbi, dcbf and dcbst) take two registers
>>> that are summed to obtain the target address. Using 'Z' constraint
>>> and '%y0' argument gives GCC the opportunity to use both registers
>>> instead of only one with the second being forced to 0.
>>>
>>> Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> Applied to powerpc next, thanks.
>>
>> https://git.kernel.org/powerpc/c/6c5875843b87c3adea2beade9d1b8b3d4523900a
>>
>> cheers
> 
> This patch causes a regression with clang:

Is that a Clang bug ?

Do you have a disassembly of the code both with and without this patch 
in order to compare ?

Segher, any idea ?

Christophe

> 
> https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/213944668
> 
> I've attached my local bisect/build log.
> 
> Cheers,
> Nathan
> 

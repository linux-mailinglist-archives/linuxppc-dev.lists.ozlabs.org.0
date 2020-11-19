Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F82B950A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 15:46:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcMv30fdCzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 01:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcMrG6fpgzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 01:43:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CcMqy57v7z9v4Wj;
 Thu, 19 Nov 2020 15:43:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3JMG2h16lAjA; Thu, 19 Nov 2020 15:43:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CcMqy22Vsz9v4Wh;
 Thu, 19 Nov 2020 15:43:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC4B48B78A;
 Thu, 19 Nov 2020 15:43:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7u0m1dLxfBpG; Thu, 19 Nov 2020 15:43:43 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 53F2E8B80B;
 Thu, 19 Nov 2020 15:43:43 +0100 (CET)
Subject: Re: CONFIG_PPC_VAS depends on 64k pages...?
To: Will Springer <skirmisher@protonmail.com>, linuxppc-dev@lists.ozlabs.org, 
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>
References: <7171078.EvYhyI6sBW@sheen>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
Date: Thu, 19 Nov 2020 15:43:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <7171078.EvYhyI6sBW@sheen>
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
Cc: daniel@octaforge.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 19/11/2020 à 11:58, Will Springer a écrit :
> I learned about the POWER9 gzip accelerator a few months ago when the
> support hit upstream Linux 5.8. However, for some reason the Kconfig
> dictates that VAS depends on a 64k page size, which is problematic as I
> run Void Linux, which uses a 4k-page kernel.
> 
> Some early poking by others indicated there wasn't an obvious page size
> dependency in the code, and suggested I try modifying the config to switch
> it on. I did so, but was stopped by a minor complaint of an "unexpected DT
> configuration" by the VAS code. I wasn't equipped to figure out exactly what
> this meant, even after finding the offending condition, so after writing a
> very drawn-out forum post asking for help, I dropped the subject.
> 
> Fast forward to today, when I was reminded of the whole thing again, and
> decided to debug a bit further. Apparently the VAS platform device
> (derived from the DT node) has 5 resources on my 4k kernel, instead of 4
> (which evidently works for others who have had success on 64k kernels). I
> have no idea what this means in practice (I don't know how to introspect
> it), but after making a tiny patch[1], everything came up smoothly and I
> was doing blazing-fast gzip (de)compression in no time.
> 
> Everything seems to work fine on 4k pages. So, what's up? Are there
> pitfalls lurking around that I've yet to stumble over? More reasonably,
> I'm curious as to why the feature supposedly depends on 64k pages, or if
> there's anything else I should be concerned about.
> 

Maybe ask Sukadev who did the implementation and is maintaining it ?

> I do have to say I'm quite satisfied with the results of the NX
> accelerator, though. Being able to shuffle data to a RaptorCS box over gigE
> and get compressed data back faster than most software gzip could ever
> hope to achieve is no small feat, let alone the instantaneous results locally.
> :)
> 
> Cheers,
> Will Springer [she/her]
> 
> [1]: https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs/linux5.9/patches/ppc-vas-on-4k.patch
> 


Christophe

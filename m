Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4783A34D4D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 18:23:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8HvR22YGz30gW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 03:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1;
 helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 16012 seconds by postgrey-1.36 at boromir;
 Tue, 30 Mar 2021 03:23:30 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Hv65Fyvz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 03:23:30 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F8Htw1RXSz1s4S5;
 Mon, 29 Mar 2021 18:23:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F8Htv2V9Sz1r1ML;
 Mon, 29 Mar 2021 18:23:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ZnAOXTvq7O_p; Mon, 29 Mar 2021 18:23:18 +0200 (CEST)
X-Auth-Info: 4GrFOpZRc3XuCoFm2LDiIda4BXPKLS72OgKMe8M/+rRepJz40Kg1NyDeFM0wnV0Q
Received: from igel.home (ppp-46-244-184-171.dynamic.mnet-online.de
 [46.244.184.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 29 Mar 2021 18:23:18 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 1AE942C322E; Mon, 29 Mar 2021 18:23:18 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <87y2e6fu7v.fsf__9754.75274478725$1616992871$gmane$org@mpe.ellerman.id.au>
 <87v99aj7tr.fsf__47134.2879392736$1617031867$gmane$org@igel.home>
X-Yow: Hmmm...  a PINHEAD, during an EARTHQUAKE, encounters an ALL-MIDGET
 FIDDLE ORCHESTRA...  ha..  ha..
Date: Mon, 29 Mar 2021 18:23:18 +0200
In-Reply-To: <87v99aj7tr.fsf__47134.2879392736$1617031867$gmane$org@igel.home>
 (Andreas Schwab's message of "Mon, 29 Mar 2021 17:30:40 +0200")
Message-ID: <87r1jyj5e1.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mär 29 2021, Andreas Schwab wrote:

> On Mär 29 2021, Michael Ellerman wrote:
>
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> There is no need for this to be in asm, use the new intrrupt entry wrapper.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>> Hopefully this works on a real G5 now, but I couldn't reproduce the
>>> problem with QEMU.
>>
>> It still prevents my G5 from booting.
>
> I see differing failures.  What's common is that there is a pause of
> about 60 seconds before the crash occurs.  It looks like the crash
> occurs in power4_idle_nap+0x30/0x34.  Unfortuately, the BootX console is
> too small to see enough.

I was now able to see the messages on the VGA console, and the problem
is actually that the cpus are starting to stall.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86C42D93C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 14:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVT9y3Wmtz3bvH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:24:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=lwXB7fCc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=85.214.62.61; helo=phobos.denx.de; envelope-from=agust@denx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=lwXB7fCc; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVT9F3hTZz2xfJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 23:24:15 +1100 (AEDT)
Received: from crub (pd95f1d7c.dip0.t-ipconnect.de [217.95.29.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DD87A8362B;
 Thu, 14 Oct 2021 14:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634214250;
 bh=QmU2rqEKQ3dXNDZ9x0ZGC5r318El4iF000T+HRihIwI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lwXB7fCcUaPIpC2i0tAyoiToGS1EzjVqtf2ujo0P15lDRdJX8N1wWLvaMiQ4YnrPR
 INGS33DU99OFU+t4h55LOstPHmIkyKQ4WHdTcWQVkYcvmPvjacuZIJ4oWoNcEmbQ1P
 M21hO5M925xsZLiP/KJIndGs6F/doozWP0/x39INafJVxlz/o+GlXEgG8G5mlpzVYM
 Fg5FBLRTrS3te/N/8r6vz27eDimbiKS9wMN5gPuDi3hCjp93pO2YJ9dg0VrGm5WDLg
 nV4GUKw0WZ8HXPvTQdUNjTniP4GWx4X8cXR5/wihocG9fZlluI0xZBKGb5ItgWuuz+
 AkDvumkP4JR2w==
Date: Thu, 14 Oct 2021 14:24:09 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20211014142409.2b329ff1@crub>
In-Reply-To: <CAK8P3a0yKvZW2-XFJtPORpa=FhG+UJgk=m0O1GiC_yLw+1Pfvw@mail.gmail.com>
References: <20211008164728.30e3d3a3@canb.auug.org.au>
 <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
 <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
 <20211014001232.3becbe99@crub>
 <CAK8P3a0yKvZW2-XFJtPORpa=FhG+UJgk=m0O1GiC_yLw+1Pfvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Oct 2021 10:44:46 +0200
Arnd Bergmann arnd@arndb.de wrote:

>On Thu, Oct 14, 2021 at 12:12 AM Anatolij Gustschin <agust@denx.de> wrote:
>> On Tue, 12 Oct 2021 16:39:56 +0200
>> Arnd Bergmann arnd@arndb.de wrote:
>> ...  
>> >Grant Likely was the original maintainer for MPC52xx until 2011,
>> >Anatolij Gustschin is still listed as maintainer since then but hasn't
>> >been active in it for a while either. Anatolij can probably best judge
>> >which of these boards are still in going to be used with future kernels,
>> >but I suspect once you start removing bits from 52xx, the newer
>> >but less common 512x platform can go away as well.  
>>
>> many of these boards are still used, i.e. o2d*, digsy_mtc, tqm5200.  
>
>Just for clarification, I assume when you say "still used" that implies
>getting updated to new kernels rather than just running the old BSPs,
>right?

yes, at least some of them. I used v5.4 kernel on digsy_mtc and
tqm5200 last year, and v5.10 kernel is also known to work.

>What are the typical distro release cycles for those machines
>you list: do you move from one LTS kernel to the next each year,
>or are they getting more sporadic over time?

these machines are in embedded systems and do not get regular
distro updates, therefore more sporadic over time.

>Do you expect the machines with the lowest memory such as the
>32MB digsy to stop getting kernel updates before the others?

No. There are also digsy variants with 256MiB DRAM.

Thanks,

Anatolij

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228757581
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 02:27:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z11H0HfTzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 10:26:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=telegraphics.com.au
 (client-ip=98.124.60.144; helo=kvm5.telegraphics.com.au;
 envelope-from=fthain@telegraphics.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Z0zc0xzGzDqKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:25:31 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 453FC29B40;
 Wed, 26 Jun 2019 20:25:21 -0400 (EDT)
Date: Thu, 27 Jun 2019 10:25:19 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: Bisected regression in v5.1 on PowerBook G3 (Wallstreet)
In-Reply-To: <03df9f3c-003a-b4ae-6f76-ba8a20742b25@c-s.fr>
Message-ID: <alpine.LNX.2.21.1906271019060.21@nippy.intranet>
References: <alpine.LNX.2.21.1906261134540.121@nippy.intranet>
 <03df9f3c-003a-b4ae-6f76-ba8a20742b25@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linuxppc-dev@lists.ozlabs.org, Stan <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jun 2019, Christophe Leroy wrote:

> Hi Finn,
> 
> On 06/26/2019 02:06 AM, Finn Thain wrote:
> > Hi Christophe,
> > 
> > I received a report of a regression between v5.0 and v5.1 which causes 
> > the current release to crash during boot with a machine check 
> > exception. Please see console log below.
> > 
> > Stan (whom I've Cc'd) tells me that this happens on every attempt to 
> > boot. I asked him to try 'git bisect'. The results are given below. 
> > Can you see anything in commit 93c4a162b014 that might explain this?
> 
> Might be a false positive. That commit has a problem, but that problem 
> is fixed by 4622a2d43101 ("powerpc/6xx: fix setup and use of 
> SPRN_SPRG_PGDIR for hash32")
> 
> I would bet your problem is related to commit f7354ccac844 ("powerpc/32: 
> Remove CURRENT_THREAD_INFO and rename TI_CPU"). That problem is fixed by 
> commit 397d2300b08c ("powerpc/32s: fix flush_hash_pages() on SMP") 
> upstream, and in linux 5.1.4 by commit fda49aec2515 on 
> stable/linux-5.1.y
> 

I see. I've just discovered that this issue has already been covered on 
this list. I should have done a bit more research.

> Can you test ?
> 

Stan did some more tests and confirmed that the problem has been fixed in 
397d2300b08c and stable/linux-5.1.y.

Thanks.

-- 

> Thanks
> Christophe
> 

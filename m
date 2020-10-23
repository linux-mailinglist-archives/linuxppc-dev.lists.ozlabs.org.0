Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E4296DB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 13:30:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHhq01gg8zDqlD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 22:30:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hUUB8LRr; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHhjd3PkPzDqwP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 22:25:25 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7521F20874;
 Fri, 23 Oct 2020 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603452320;
 bh=80IGgVr3jLT0tbKyUqY9AiiK9kcb+f4SmS4LteQxqm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUUB8LRrYirMa7dtXS99Rfw/OcLZjncqFjJU853emGSXkp21c3O94EkA3aY/IDq4T
 oQcoVwm2lzKE2+mou3F94TBpdoMDQFhh2aJfUdKjnesllLLdWgmKfx40YI66uhZr6+
 K6Ge3tlkjn7ZZS9Nhkv+CJC1yQjQ3nR7lndklDCk=
Date: Fri, 23 Oct 2020 12:25:15 +0100
From: Will Deacon <will@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v8 2/8] powerpc/vdso: Remove __kernel_datapage_offset and
 simplify __get_datapage()
Message-ID: <20201023112514.GE20933@willie-the-truck>
References: <87wo34tbas.fsf@mpe.ellerman.id.au>
 <2f9b7d02-9e2f-4724-2608-c5573f6507a2@csgroup.eu>
 <6862421a-5a14-2e38-b825-e39e6ad3d51d@csgroup.eu>
 <87imd5h5kb.fsf@mpe.ellerman.id.au>
 <CAJwJo6ZANqYkSHbQ+3b+Fi_VT80MtrzEV5yreQAWx-L8j8x2zA@mail.gmail.com>
 <87a6yf34aj.fsf@mpe.ellerman.id.au>
 <20200921112638.GC2139@willie-the-truck>
 <ad72ffd3-a552-cc98-7545-d30285fd5219@csgroup.eu>
 <542145eb-7d90-0444-867e-c9cbb6bdd8e3@gmail.com>
 <ba9861da-2f5b-a649-5626-af00af634546@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba9861da-2f5b-a649-5626-af00af634546@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: nathanl@linux.ibm.com, linux-arch <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Dmitry Safonov <0x7f454c46@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 23, 2020 at 01:22:04PM +0200, Christophe Leroy wrote:
> Hi Dmitry,
> 
> Le 28/09/2020 à 17:08, Dmitry Safonov a écrit :
> > On 9/27/20 8:43 AM, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 21/09/2020 à 13:26, Will Deacon a écrit :
> > > > On Fri, Aug 28, 2020 at 12:14:28PM +1000, Michael Ellerman wrote:
> > > > > Dmitry Safonov <0x7f454c46@gmail.com> writes:
> > [..]
> > > > > > I'll cook a patch for vm_special_mapping if you don't mind :-)
> > > > > 
> > > > > That would be great, thanks!
> > > > 
> > > > I lost track of this one. Is there a patch kicking around to resolve
> > > > this,
> > > > or is the segfault expected behaviour?
> > > > 
> > > 
> > > IIUC dmitry said he will cook a patch. I have not seen any patch yet.
> > 
> > Yes, sorry about the delay - I was a bit busy with xfrm patches.
> > 
> > I'll send patches for .close() this week, working on them now.
> 
> I haven't seen the patches, did you sent them out finally ?

I think it's this series:

https://lore.kernel.org/r/20201013013416.390574-1-dima@arista.com

but they look really invasive to me, so I may cook a small hack for arm64
in the meantine / for stable.

Will

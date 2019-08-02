Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39C7FD42
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 17:15:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460W2741T4zDr4N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 01:15:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Vy42ft7zDrBx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2019 01:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 460Vy34sLqz8sfp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2019 01:12:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 460Vy32p9hz9sML; Sat,  3 Aug 2019 01:12:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.15; helo=mta-05-3.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 460Vy25RXbz9sBF
 for <linuxppc-dev@ozlabs.org>; Sat,  3 Aug 2019 01:12:08 +1000 (AEST)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 1F68E6006D;
 Fri,  2 Aug 2019 11:12:05 -0400 (EDT)
Received: from APP-05 (unknown [10.20.147.155])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id F0B8560065;
 Fri,  2 Aug 2019 15:12:04 +0000 (UTC)
Date: Fri, 2 Aug 2019 10:12:04 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Message-ID: <850780620.61430.1564758724962@privateemail.com>
In-Reply-To: <877e7vlruk.fsf@concordia.ellerman.id.au>
References: <20190802042233.20835-1-cmr@informatik.wtf>
 <20190802042233.20835-4-cmr@informatik.wtf>
 <877e7vlruk.fsf@concordia.ellerman.id.au>
Subject: Re: [PATCH v2 3/3] powerpc/spinlocks: Fix oops in shared-processor
 spinlocks
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: ajd@linux.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On August 2, 2019 at 6:38 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
> 
> "Christopher M. Riedl" <cmr@informatik.wtf> writes:
> > diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> > index 0a8270183770..6aed8a83b180 100644
> > --- a/arch/powerpc/include/asm/spinlock.h
> > +++ b/arch/powerpc/include/asm/spinlock.h
> > @@ -124,6 +122,22 @@ static inline bool is_shared_processor(void)
> >  #endif
> >  }
> >  
> > +static inline void spin_yield(arch_spinlock_t *lock)
> > +{
> > +	if (is_shared_processor())
> > +		splpar_spin_yield(lock);
> > +	else
> > +		barrier();
> > +}
> ...
> >  static inline void arch_spin_lock(arch_spinlock_t *lock)
> >  {
> >  	while (1) {
> > @@ -132,7 +146,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
> >  		do {
> >  			HMT_low();
> >  			if (is_shared_processor())
> > -				__spin_yield(lock);
> > +				spin_yield(lock);
> 
> This leaves us with a double test of is_shared_processor() doesn't it?

Yep, and that's no good. Hmm, executing the barrier() in the non-shared-processor
case probably hurts performance here?

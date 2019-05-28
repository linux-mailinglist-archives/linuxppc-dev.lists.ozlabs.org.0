Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A092CAA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 17:50:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CywS4XN0zDqQx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 01:50:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rjwysocki.net
 (client-ip=79.96.170.134; helo=cloudserver094114.home.pl;
 envelope-from=rjw@rjwysocki.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cyv55dvRzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 01:49:04 +1000 (AEST)
Received: from 79.184.255.225.ipv4.supernova.orange.pl (79.184.255.225) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.213)
 id f088da01f68d15dd; Tue, 28 May 2019 17:48:59 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/power: Expose pfn_is_nosave prototype
Date: Tue, 28 May 2019 17:48:58 +0200
Message-ID: <7467366.tOSDWnDKPa@kreacher>
In-Reply-To: <875zpvqsy9.fsf@concordia.ellerman.id.au>
References: <20190523114736.30268-1-malat@debian.org>
 <1929721.iDiXxTFbjN@kreacher> <875zpvqsy9.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Len Brown <len.brown@intel.com>, linux-s390@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, linux-pm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday, May 28, 2019 3:16:30 AM CEST Michael Ellerman wrote:
> "Rafael J. Wysocki" <rjw@rjwysocki.net> writes:
> > On Friday, May 24, 2019 12:44:18 PM CEST Mathieu Malaterre wrote:
> >> The declaration for pfn_is_nosave is only available in
> >> kernel/power/power.h. Since this function can be override in arch,
> >> expose it globally. Having a prototype will make sure to avoid warning
> >> (sometime treated as error with W=1) such as:
> >> 
> >>   arch/powerpc/kernel/suspend.c:18:5: error: no previous prototype for 'pfn_is_nosave' [-Werror=missing-prototypes]
> >> 
> >> This moves the declaration into a globally visible header file and add
> >> missing include to avoid a warning on powerpc. Also remove the
> >> duplicated prototypes since not required anymore.
> >> 
> >> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> >> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> >> ---
> >> v2: As suggestion by christophe remove duplicates prototypes
> >> 
> >>  arch/powerpc/kernel/suspend.c | 1 +
> >>  arch/s390/kernel/entry.h      | 1 -
> >>  include/linux/suspend.h       | 1 +
> >>  kernel/power/power.h          | 2 --
> >>  4 files changed, 2 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/kernel/power/power.h b/kernel/power/power.h
> >> index 9e58bdc8a562..44bee462ff57 100644
> >> --- a/kernel/power/power.h
> >> +++ b/kernel/power/power.h
> >> @@ -75,8 +75,6 @@ static inline void hibernate_reserved_size_init(void) {}
> >>  static inline void hibernate_image_size_init(void) {}
> >>  #endif /* !CONFIG_HIBERNATION */
> >>  
> >> -extern int pfn_is_nosave(unsigned long);
> >> -
> >>  #define power_attr(_name) \
> >>  static struct kobj_attribute _name##_attr = {	\
> >>  	.attr	= {				\
> >> 
> >
> > With an ACK from the powerpc maintainers, I could apply this one.
> 
> Sent.

Thanks!




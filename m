Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C2146DEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 17:12:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483S393rFtzDqby
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 03:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483S1V42jhzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 03:10:54 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5ECD2AD7B;
 Thu, 23 Jan 2020 16:10:50 +0000 (UTC)
Date: Thu, 23 Jan 2020 17:10:47 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc: drmem: avoid NULL pointer dereference when
 drmem is unavailable
Message-ID: <20200123161047.GQ4113@kitsune.suse.cz>
References: <20200116102758.GC25138@fm.suse.cz> <87o8uudv51.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8uudv51.fsf@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, Libor Pechacek <lpechacek@suse.cz>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 23, 2020 at 09:56:10AM -0600, Nathan Lynch wrote:
> Hello and thanks for the patch.
> 
> Libor Pechacek <lpechacek@suse.cz> writes:
> > In KVM guests drmem structure is only zero initialized. Trying to
> > manipulate DLPAR parameters results in a crash in this environment.
> 
> I think this statement needs qualification. Unless I'm mistaken, this
> happens only when you boot a guest without any hotpluggable memory
> configured, and then try to add or remove memory.
> 
> 
> > diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> > index 3d76e1c388c2..28c3d936fdf3 100644
> > --- a/arch/powerpc/include/asm/drmem.h
> > +++ b/arch/powerpc/include/asm/drmem.h
> > @@ -27,12 +27,12 @@ struct drmem_lmb_info {
> >  extern struct drmem_lmb_info *drmem_info;
> >  
> >  #define for_each_drmem_lmb_in_range(lmb, start, end)		\
> > -	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
> > +	for ((lmb) = (start); (lmb) < (end); (lmb)++)
> >  
> >  #define for_each_drmem_lmb(lmb)					\
> >  	for_each_drmem_lmb_in_range((lmb),			\
> >  		&drmem_info->lmbs[0],				\
> > -		&drmem_info->lmbs[drmem_info->n_lmbs - 1])
> > +		&drmem_info->lmbs[drmem_info->n_lmbs])
> >  
> >  /*
> >   * The of_drconf_cell_v1 struct defines the layout of the LMB data
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > index c126b94d1943..4ea6af002e27 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -236,9 +236,9 @@ static int get_lmb_range(u32 drc_index, int n_lmbs,
> >  	if (!start)
> >  		return -EINVAL;
> >  
> > -	end = &start[n_lmbs - 1];
> > +	end = &start[n_lmbs];
> >  
> > -	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs - 1];
> > +	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs];
> >  	if (end > last_lmb)
> >  		return -EINVAL;
> 
> Is this not undefined behavior? I'd rather do this in a way that does
> not involve forming out-of-bounds pointers. Even if it's safe, naming
> that pointer "last_lmb" now actively hinders understanding of the code;
> it should be named "limit" or something.

Indeed, the name might be misleading now.

However, the loop differes from anything else we have in the kernel.

The standard explicitly allows the pointer to point just after the last
element to allow expressing the iteration limit without danger of
overflow.

Thanks

Michal

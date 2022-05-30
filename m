Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A75388F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 00:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBqqN48Pnz3bcB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:30:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=evP/CaZS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=evP/CaZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=evP/CaZS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=evP/CaZS;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBkTm3b9Kz2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 04:29:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653935382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ALrzFnb0YEuDamJlOSrZjOy/DY+2J0hn9MNRn5A9C4=;
	b=evP/CaZSx5h3qClziv1mdzlf1RuwfeCv9z0Pc1DZ9iggYkq7cgRkTLffnWFdW2p4v64ZEL
	aJGJzv+LxylwnATRnTBC88Wi27sj9+6yu6BSRZcgicozvw3QYT7yE4TLDL8kE2q7qM9QYi
	Rf+7Ys7gPQ319wEmdRBNXEWx9OcI77I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653935382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ALrzFnb0YEuDamJlOSrZjOy/DY+2J0hn9MNRn5A9C4=;
	b=evP/CaZSx5h3qClziv1mdzlf1RuwfeCv9z0Pc1DZ9iggYkq7cgRkTLffnWFdW2p4v64ZEL
	aJGJzv+LxylwnATRnTBC88Wi27sj9+6yu6BSRZcgicozvw3QYT7yE4TLDL8kE2q7qM9QYi
	Rf+7Ys7gPQ319wEmdRBNXEWx9OcI77I=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-yQxoEMOSMta465rsfe2gzA-1; Mon, 30 May 2022 14:29:37 -0400
X-MC-Unique: yQxoEMOSMta465rsfe2gzA-1
Received: by mail-il1-f200.google.com with SMTP id c1-20020a928e01000000b002d1b20aa761so8770537ild.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 11:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ALrzFnb0YEuDamJlOSrZjOy/DY+2J0hn9MNRn5A9C4=;
        b=izct+NSlEX0pb+n/LIKeVpHRzGQ3OLABQsv6Ndt3k1dCk7j+KF77VkfTBgNmclkwaF
         4H1EQfHywMPR4y0jzXZ5otGy4PhmlV3RFVzdncYIXtX5KHYcYzO0CmC3r7RnoTFoopCv
         AMDLvV/gQEkmI+gyfybF8rf3pPEp0CqlvlCViJ/Jb+KWxDNw0qgkpP8VNUKO9LMfxD2c
         ydhw6dHk9sfK5D0y8EO6CRVQXhSnZ3je+Br8i0+W4zs0NET4tG/h84AVfRvxk7GENXFC
         ApOeqFHXAIy3wyY8A8UJ69BeueypfzWWdmR+6s2ij/OKt2Ulo7ZM9lm/CoOPk4nB+sh5
         U84Q==
X-Gm-Message-State: AOAM531lwjarDsTF8uVoJXZ5eiEq7DQiD1Wx30loufq2AcZvFxuGt4Fz
	GGm4NozxULTveMy+V+O32llWdF1NcEauR1WYRZrsuuuXhp6lUY0Anvb2etix/lXT8S9vfE3gCA0
	1k6HSgOlKlM2F8yFbxzqOblqpgQ==
X-Received: by 2002:a92:d785:0:b0:2d1:7ce6:b834 with SMTP id d5-20020a92d785000000b002d17ce6b834mr25171889iln.207.1653935377089;
        Mon, 30 May 2022 11:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3wrc9ZuPCRdn+Dbnr8a7+sDY/SXALiOk3qZ3Cm9Rs8SSVa+bj9UHR0EABkWjwoIvWxsPXBw==
X-Received: by 2002:a92:d785:0:b0:2d1:7ce6:b834 with SMTP id d5-20020a92d785000000b002d17ce6b834mr25171841iln.207.1653935376794;
        Mon, 30 May 2022 11:29:36 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id cn9-20020a0566383a0900b003313b7a5731sm183095jab.178.2022.05.30.11.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:29:36 -0700 (PDT)
Date: Mon, 30 May 2022 14:29:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpUNC6iGrZRlWMyA@xz-m1.local>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
 <YpToVpjXmdFqGOpY@xz-m1.local>
 <YpTqNKMTt8PoA41n@xz-m1.local>
 <YpT443jVZtM6p9OD@osiris>
MIME-Version: 1.0
In-Reply-To: <YpT443jVZtM6p9OD@osiris>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 31 May 2022 08:25:41 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.o
 rg>, Andrea Arcangeli <aarcange@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Brian Cain <bcain@quicinc.com>, Michal Simek 
 <monstr@monstr.eu>, Christian Borntraeger <borntraege

r@linux.ibm.com>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 30, 2022 at 07:03:31PM +0200, Heiko Carstens wrote:
> On Mon, May 30, 2022 at 12:00:52PM -0400, Peter Xu wrote:
> > On Mon, May 30, 2022 at 11:52:54AM -0400, Peter Xu wrote:
> > > On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
> > > > > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > > > > index 4608cc962ecf..e1d40ca341b7 100644
> > > > > --- a/arch/s390/mm/fault.c
> > > > > +++ b/arch/s390/mm/fault.c
> > > > > @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> > > > >   	/* The fault is fully completed (including releasing mmap lock) */
> > > > >   	if (fault & VM_FAULT_COMPLETED) {
> > > > > -		/*
> > > > > -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> > > > > -		 * only conditionally take the lock when CONFIG_PGSTE set.
> > > > > -		 */
> > > > > -		mmap_read_lock(mm);
> > > > > -		goto out_gmap;
> > > > > +		if (gmap) {
> > > > > +			mmap_read_lock(mm);
> > > > > +			goto out_gmap;
> > > > > +		}
> 			fault = 0;  <----
> > > > > +		goto out;
> > 
> > Hmm, right after I replied I found "goto out" could be problematic, since
> > all s390 callers of do_exception() will assume it an error condition (side
> > note: "goto out_gmap" contains one step to clear "fault" to 0).  I'll
> > replace this with "return 0" instead if it looks good to both of you.
> > 
> > I'll wait for a confirmation before reposting.  Thanks,
> 
> Right, that was stupid. Thanks for double checking!
> 
> However could you please add "fault = 0" just in front of the goto out
> like above? I'd like to avoid having returns and gotos mixed.

Sure thing.

-- 
Peter Xu


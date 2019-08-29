Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED75A155B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 12:04:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jyr40QSczDr15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 20:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jynt69hGzDrRP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 20:02:09 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A15BDB654;
 Thu, 29 Aug 2019 10:02:05 +0000 (UTC)
Date: Thu, 29 Aug 2019 12:01:45 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 3/4] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20190829120145.5201174f@naga>
In-Reply-To: <20190829064624.GA28508@infradead.org>
References: <cover.1567007242.git.msuchanek@suse.de>
 <0ad51b41aebf65b3f3fcb9922f0f00b47932725d.1567007242.git.msuchanek@suse.de>
 <20190829064624.GA28508@infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Michael Neuling <mikey@neuling.org>, Allison Randal <allison@lohutok.net>,
 Arnd Bergmann <arnd@arndb.de>, Nicolai Stange <nstange@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <christian@brauner.io>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Aug 2019 23:46:24 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Aug 28, 2019 at 06:43:50PM +0200, Michal Suchanek wrote:
> > +ifdef CONFIG_COMPAT
> > +obj-y				+= sys_ppc32.o ptrace32.o signal_32.o
> > +endif  
> 
> This should be:
> 
> obj-$(CONFIG_COMPAT)		+= sys_ppc32.o ptrace32.o signal_32.o

Yes, looks better.
> 
> >  /* This value is used to mark exception frames on the stack. */
> >  exception_marker:
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index 60436432399f..73d0f53ffc1a 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -277,7 +277,7 @@ static void do_signal(struct task_struct *tsk)
> >  
> >  	rseq_signal_deliver(&ksig, tsk->thread.regs);
> >  
> > -	if (is32) {
> > +	if ((IS_ENABLED(CONFIG_PPC32) || IS_ENABLED(CONFIG_COMPAT)) && is32) {  
> 
> I think we should fix the is_32bit_task definitions instead so that
> callers don't need this mess.  

Yes, that makes sense.

Thanks

Michal

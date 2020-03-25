Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369F1926F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 12:17:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQZP0zFVzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 22:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.48.29; helo=11.mo1.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1798 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Mar 2020 22:13:49 AEDT
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nQV52jhTzDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 22:13:46 +1100 (AEDT)
Received: from player159.ha.ovh.net (unknown [10.108.35.122])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 398121B5E53
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 11:34:19 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 2E76410C032CE;
 Wed, 25 Mar 2020 10:34:13 +0000 (UTC)
Date: Wed, 25 Mar 2020 11:34:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/prom_init: Include the termination message in
 ibm,os-term RTAS call
Message-ID: <20200325113412.1fed2d82@bahia.lan>
In-Reply-To: <87zhc4wxy9.fsf@mpe.ellerman.id.au>
References: <20200324201211.1055236-1-farosas@linux.ibm.com>
 <87zhc4wxy9.fsf@mpe.ellerman.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3723069520371227057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehfedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehqvghmuhdrohhrghdpohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxram@us.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Mar 2020 21:06:22 +1100
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Fabiano Rosas <farosas@linux.ibm.com> writes:
> 
> > QEMU can now print the ibm,os-term message[1], so let's include it in
> > the RTAS call. E.g.:
> >
> >   qemu-system-ppc64: OS terminated: Switch to secure mode failed.
> >
> > 1- https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a4c3791ae0
> >
> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >  arch/powerpc/kernel/prom_init.c | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> I have this queued:
>   https://patchwork.ozlabs.org/patch/1253390/
> 
> Which I think does the same thing?
> 

Alexey's patch also sets os_term_args.nret as indicated in PAPR.
Even if QEMU's handler for "ibm,os-term" doesn't seem to have
a use for nret, I think it's better to stick to the spec.

Cheers,

--
Greg

> cheers
> 
> > diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> > index 577345382b23..d543fb6d29c5 100644
> > --- a/arch/powerpc/kernel/prom_init.c
> > +++ b/arch/powerpc/kernel/prom_init.c
> > @@ -1773,6 +1773,9 @@ static void __init prom_rtas_os_term(char *str)
> >  	if (token == 0)
> >  		prom_panic("Could not get token for ibm,os-term\n");
> >  	os_term_args.token = cpu_to_be32(token);
> > +	os_term_args.nargs = cpu_to_be32(1);
> > +	os_term_args.args[0] = cpu_to_be32(__pa(str));
> > +
> >  	prom_rtas_hcall((uint64_t)&os_term_args);
> >  }
> >  #endif /* CONFIG_PPC_SVM */
> > -- 
> > 2.23.0


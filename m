Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5A30AD67
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 18:07:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTvX50RFTzDrcY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:07:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.142; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=obUC0PXt; dkim-atps=neutral
X-Greylist: delayed 643 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Feb 2021 04:06:04 AEDT
Received: from mx01.puc.rediris.es (outbound3mad.lav.puc.rediris.es
 [130.206.19.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTvV46GSpzDr37
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 04:06:04 +1100 (AEDT)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx01.puc.rediris.es  with ESMTP id 111GslsD020546-111GslsF020546
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 1 Feb 2021 17:54:51 +0100
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id 76F53C198DD;
 Mon,  1 Feb 2021 17:54:47 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id 3E003C198FD;
 Mon,  1 Feb 2021 17:54:47 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LUN52aY3j52m; Mon,  1 Feb 2021 17:54:47 +0100 (CET)
Received: from lt-gp.iram.es (150.148.223.87.dynamic.jazztel.es
 [87.223.148.150])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id DF8F9C198DD;
 Mon,  1 Feb 2021 17:54:45 +0100 (CET)
Date: Mon, 1 Feb 2021 17:54:40 +0100
From: Gabriel Paubert <paubert@iram.es>
To: "Christopher M. Riedl" <cmr@codefail.de>
Subject: Re: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Message-ID: <20210201165440.GA8929@lt-gp.iram.es>
References: <6a6ce1a53fcf4669a9848114d3460fef@AcuMS.aculab.com>
 <C8YBET4IGYGF.3QYANVRRHMV0R@geist>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C8YBET4IGYGF.3QYANVRRHMV0R@geist>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=wnB4FYtg2ofDcmCKB7DjkrZl5i0BtFcc1/fSXfFGh4Q=;
 b=obUC0PXt/VNJD0wcEXYPQzlZhgBgwH1OUmtsfXKtBvcuRHBtrMuWBkMW9/NJLbvVRveH/UlqNkzi
 43uxdMcYRT3YZp600NMrPBC6Yy0hDmoRCjlhnnBVi5bjckpqu3yZCEedhu5SpgrGJ4dy63ZHf2nr
 CZIHM6DjSfPVAN63qQOD1hi/G6bDRV5HgaPVUymd6il/VsyeqZ6Vv42M7uRf0nh+RclwDG5Gzy/c
 jx9CbuYDpk7gwnyt7m7OQPiTgCPNIyPS3ONOv5HMySVrHSbMMaHXHwcf/PWVwPkPQIpJvVPQjdac
 pw9pEMb6jM9OVfP15tGCZYaVcXoZuqeuPEgFXg==
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 01, 2021 at 09:55:44AM -0600, Christopher M. Riedl wrote:
> On Thu Jan 28, 2021 at 4:38 AM CST, David Laight wrote:
> > From: Christopher M. Riedl
> > > Sent: 28 January 2021 04:04
> > > 
> > > Reuse the "safe" implementation from signal.c except for calling
> > > unsafe_copy_from_user() to copy into a local buffer.
> > > 
> > > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > > ---
> > >  arch/powerpc/kernel/signal.h | 33 +++++++++++++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > > 
> > > diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> > > index 2559a681536e..c18402d625f1 100644
> > > --- a/arch/powerpc/kernel/signal.h
> > > +++ b/arch/powerpc/kernel/signal.h
> > > @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
> > >  				&buf[i], label);\
> > >  } while (0)
> > > 
> > > +#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
> > > +	struct task_struct *__t = task;					\
> > > +	u64 __user *__f = (u64 __user *)from;				\
> > > +	u64 buf[ELF_NFPREG];						\
> >
> > How big is that buffer?
> > Isn't is likely to be reasonably large compared to a reasonable
> > kernel stack frame.
> > Especially since this isn't even a leaf function.
> >
> 
> I think Christophe answered this - I don't really have an opinion either
> way. What would be a 'reasonable' kernel stack frame for reference?

See include/linux/poll.h, where the limit is of the order of 800 bytes
and the number of entries in an on stack array is chosen at compile time
(different between 32 and 64 bit for example).

The values are used in do_sys_poll, which, with almost 1000 bytes of
stack footprint, appears close to the top of "make checkstack". In
addition do_sys_poll has to call the ->poll function of every file
descriptor in its table, so it is not a tail function.

This 264 bytes array looks reasonable, but please use 'make checkstack'
to verify that the function's total stack usage stays within reason.

	Gabriel

> 
> > > +	int i;								\
> > > +									\
> > > +	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	\
> >
> > That really ought to be sizeof(buf).
> >
> 
> Agreed, I will fix this. Thanks!
> 
> > David
> >
> >
> > > +				label);					\
> > > +	for (i = 0; i < ELF_NFPREG - 1; i++)				\
> > > +		__t->thread.TS_FPR(i) = buf[i];				\
> > > +	__t->thread.fp_state.fpscr = buf[i];				\
> > > +} while (0)
> > > +
> > > +#define unsafe_copy_vsx_from_user(task, from, label)	do {		\
> > > +	struct task_struct *__t = task;					\
> > > +	u64 __user *__f = (u64 __user *)from;				\
> > > +	u64 buf[ELF_NVSRHALFREG];					\
> > > +	int i;								\
> > > +									\
> > > +	unsafe_copy_from_user(buf, __f,					\
> > > +				ELF_NVSRHALFREG * sizeof(double),	\
> > > +				label);					\
> > > +	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
> > > +		__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];	\
> > > +} while (0)
> > > +
> > > +
> > >  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > >  #define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
> > >  	struct task_struct *__t = task;					\
> > > @@ -80,6 +107,10 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
> > >  	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
> > >  			    ELF_NFPREG * sizeof(double), label)
> > > 
> > > +#define unsafe_copy_fpr_from_user(task, from, label)			\
> > > +	unsafe_copy_from_user((task)->thread.fp_state.fpr, from,	\
> > > +			    ELF_NFPREG * sizeof(double), label)
> > > +
> > >  static inline unsigned long
> > >  copy_fpr_to_user(void __user *to, struct task_struct *task)
> > >  {
> > > @@ -115,6 +146,8 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
> > >  #else
> > >  #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
> > > 
> > > +#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
> > > +
> > >  static inline unsigned long
> > >  copy_fpr_to_user(void __user *to, struct task_struct *task)
> > >  {
> > > --
> > > 2.26.1
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> > MK1 1PT, UK
> > Registration No: 1397386 (Wales)
> 
 


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEC33D65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 05:06:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HxfL3vDwzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 13:06:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hxcq39BhzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 13:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45Hxcq2P4fz8vsm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 13:05:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45Hxcq25Q1z9s3l; Tue,  4 Jun 2019 13:05:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=198.54.127.52; helo=new-02-3.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from NEW-02-3.privateemail.com (new-02-3.privateemail.com
 [198.54.127.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45Hxcp2MCDz9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue,  4 Jun 2019 13:05:29 +1000 (AEST)
Received: from MTA-06-1.privateemail.com (unknown [10.20.147.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id 38F3260277;
 Tue,  4 Jun 2019 03:05:25 +0000 (UTC)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 22A236003D;
 Mon,  3 Jun 2019 23:05:25 -0400 (EDT)
Received: from APP-01 (unknown [10.20.147.151])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id E75D560039;
 Tue,  4 Jun 2019 03:05:24 +0000 (UTC)
Date: Mon, 3 Jun 2019 23:05:24 -0400 (EDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
Message-ID: <1146575236.484635.1559617524880@privateemail.com>
In-Reply-To: <81549d40-e477-6552-9a12-7200933279af@linux.ibm.com>
References: <20190524123816.1773-1-cmr@informatik.wtf>
 <81549d40-e477-6552-9a12-7200933279af@linux.ibm.com>
Subject: Re: [RFC PATCH v2] powerpc/xmon: restrict when kernel is locked down
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev57
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
Cc: mjg59@google.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On June 3, 2019 at 1:36 AM Andrew Donnellan <ajd@linux.ibm.com> wrote:
> 
> 
> On 24/5/19 10:38 pm, Christopher M. Riedl wrote:
> > Xmon should be either fully or partially disabled depending on the
> > kernel lockdown state.
> > 
> > Put xmon into read-only mode for lockdown=integrity and completely
> > disable xmon when lockdown=confidentiality. Xmon checks the lockdown
> > state and takes appropriate action:
> > 
> >   (1) during xmon_setup to prevent early xmon'ing
> > 
> >   (2) when triggered via sysrq
> > 
> >   (3) when toggled via debugfs
> > 
> >   (4) when triggered via a previously enabled breakpoint
> > 
> > The following lockdown state transitions are handled:
> > 
> >   (1) lockdown=none -> lockdown=integrity
> >       clear all breakpoints, set xmon read-only mode
> > 
> >   (2) lockdown=none -> lockdown=confidentiality
> >       clear all breakpoints, prevent re-entry into xmon
> > 
> >   (3) lockdown=integrity -> lockdown=confidentiality
> >       prevent re-entry into xmon
> > 
> > Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> > 
> > Applies on top of this series:
> > 	https://patchwork.kernel.org/cover/10884631/
> > 
> > I've done some limited testing of the scenarios mentioned in the commit
> > message on a single CPU QEMU config.
> > 
> > v1->v2:
> > 	Fix subject line
> > 	Submit to linuxppc-dev and kernel-hardening
> > 
> >   arch/powerpc/xmon/xmon.c | 56 +++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 55 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 3e7be19aa208..8c4a5a0c28f0 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -191,6 +191,9 @@ static void dump_tlb_44x(void);
> >   static void dump_tlb_book3e(void);
> >   #endif
> >   
> > +static void clear_all_bpt(void);
> > +static void xmon_init(int);
> > +
> >   #ifdef CONFIG_PPC64
> >   #define REG		"%.16lx"
> >   #else
> > @@ -291,6 +294,39 @@ Commands:\n\
> >     zh	halt\n"
> >   ;
> >   
> > +#ifdef CONFIG_LOCK_DOWN_KERNEL
> > +static bool xmon_check_lockdown(void)
> > +{
> > +	static bool lockdown = false;
> > +
> > +	if (!lockdown) {
> > +		lockdown = kernel_is_locked_down("Using xmon",
> > +						 LOCKDOWN_CONFIDENTIALITY);
> > +		if (lockdown) {
> > +			printf("xmon: Disabled by strict kernel lockdown\n");
> > +			xmon_on = 0;
> > +			xmon_init(0);
> > +		}
> > +	}
> > +
> > +	if (!xmon_is_ro) {
> > +		xmon_is_ro = kernel_is_locked_down("Using xmon write-access",
> > +						   LOCKDOWN_INTEGRITY);
> > +		if (xmon_is_ro) {
> > +			printf("xmon: Read-only due to kernel lockdown\n");
> > +			clear_all_bpt();
> 
> Remind me again why we need to clear breakpoints in integrity mode?
> 
> 
> Andrew
> 

I interpreted "integrity" mode as meaning that any changes made by xmon should
be reversed. This also covers the case when a user creates some breakpoint(s)
in xmon, exits xmon, and then elevates the lockdown state. Upon hitting the
first breakpoint and (re-)entering xmon, xmon will clear all breakpoints.

Xmon can only take action in response to dynamic lockdown level changes when
xmon is invoked in some manner - if there is a better way I am all ears :)

> 
> > +		}
> > +	}
> > +
> > +	return lockdown;
> > +}
> > +#else
> > +inline static bool xmon_check_lockdown(void)
> > +{
> > +	return false;
> > +}
> > +#endif /* CONFIG_LOCK_DOWN_KERNEL */
> > +
> >   static struct pt_regs *xmon_regs;
> >   
> >   static inline void sync(void)
> > @@ -708,6 +744,9 @@ static int xmon_bpt(struct pt_regs *regs)
> >   	struct bpt *bp;
> >   	unsigned long offset;
> >   
> > +	if (xmon_check_lockdown())
> > +		return 0;
> > +
> >   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
> >   		return 0;
> >   
> > @@ -739,6 +778,9 @@ static int xmon_sstep(struct pt_regs *regs)
> >   
> >   static int xmon_break_match(struct pt_regs *regs)
> >   {
> > +	if (xmon_check_lockdown())
> > +		return 0;
> > +
> >   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
> >   		return 0;
> >   	if (dabr.enabled == 0)
> > @@ -749,6 +791,9 @@ static int xmon_break_match(struct pt_regs *regs)
> >   
> >   static int xmon_iabr_match(struct pt_regs *regs)
> >   {
> > +	if (xmon_check_lockdown())
> > +		return 0;
> > +
> >   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
> >   		return 0;
> >   	if (iabr == NULL)
> > @@ -3742,6 +3787,9 @@ static void xmon_init(int enable)
> >   #ifdef CONFIG_MAGIC_SYSRQ
> >   static void sysrq_handle_xmon(int key)
> >   {
> > +	if (xmon_check_lockdown())
> > +		return;
> > +
> >   	/* ensure xmon is enabled */
> >   	xmon_init(1);
> >   	debugger(get_irq_regs());
> > @@ -3763,7 +3811,6 @@ static int __init setup_xmon_sysrq(void)
> >   device_initcall(setup_xmon_sysrq);
> >   #endif /* CONFIG_MAGIC_SYSRQ */
> >   
> > -#ifdef CONFIG_DEBUG_FS
> >   static void clear_all_bpt(void)
> >   {
> >   	int i;
> > @@ -3785,8 +3832,12 @@ static void clear_all_bpt(void)
> >   	printf("xmon: All breakpoints cleared\n");
> >   }
> >   
> > +#ifdef CONFIG_DEBUG_FS
> >   static int xmon_dbgfs_set(void *data, u64 val)
> >   {
> > +	if (xmon_check_lockdown())
> > +		return 0;
> > +
> >   	xmon_on = !!val;
> >   	xmon_init(xmon_on);
> >   
> > @@ -3845,6 +3896,9 @@ early_param("xmon", early_parse_xmon);
> >   
> >   void __init xmon_setup(void)
> >   {
> > +	if (xmon_check_lockdown())
> > +		return;
> > +
> >   	if (xmon_on)
> >   		xmon_init(1);
> >   	if (xmon_early)
> > 
> 
> -- 
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
>

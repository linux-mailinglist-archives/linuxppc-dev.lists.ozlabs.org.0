Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F7914ADE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 15:23:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yNjk3tpGzDqL8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 23:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yNfl6rz1zDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 23:21:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44yNfk5fCPz8t4f
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 23:21:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44yNfj3xptz9sBb; Mon,  6 May 2019 23:21:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=198.54.122.46; helo=new-02-2.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from NEW-02-2.privateemail.com (new-02-2.privateemail.com
 [198.54.122.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44yNff4rsKz9s7T
 for <linuxppc-dev@ozlabs.org>; Mon,  6 May 2019 23:21:13 +1000 (AEST)
Received: from MTA-10.privateemail.com (unknown [10.20.147.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id 8C314608E8;
 Mon,  6 May 2019 13:21:09 +0000 (UTC)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 763B26004E;
 Mon,  6 May 2019 09:21:09 -0400 (EDT)
Received: from APP-01 (unknown [10.20.147.151])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 53AB860038;
 Mon,  6 May 2019 13:21:09 +0000 (UTC)
Date: Mon, 6 May 2019 09:21:09 -0400 (EDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@ozlabs.org
Message-ID: <1109071681.181819.1557148869293@privateemail.com>
In-Reply-To: <271ab704-e3d2-f04c-4758-2b08c1b3909c@linux.ibm.com>
References: <20190505221048.28212-1-cmr@informatik.wtf>
 <271ab704-e3d2-f04c-4758-2b08c1b3909c@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64s: support nospectre_v2 cmdline option
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev55
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On May 5, 2019 at 9:32 PM Andrew Donnellan <ajd@linux.ibm.com> wrote:
> 
> 
> On 6/5/19 8:10 am, Christopher M. Riedl wrote:
> > Add support for disabling the kernel implemented spectre v2 mitigation
> > (count cache flush on context switch) via the nospectre_v2 cmdline
> > option.
> > 
> > Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> > 
> >   arch/powerpc/kernel/security.c | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> > index b33bafb8fcea..f7c34745cd0f 100644
> > --- a/arch/powerpc/kernel/security.c
> > +++ b/arch/powerpc/kernel/security.c
> > @@ -28,7 +28,7 @@ static enum count_cache_flush_type count_cache_flush_type = COUNT_CACHE_FLUSH_NO
> >   bool barrier_nospec_enabled;
> >   static bool no_nospec;
> >   static bool btb_flush_enabled;
> > -#ifdef CONFIG_PPC_FSL_BOOK3E
> > +#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
> >   static bool no_spectrev2;
> >   #endif
> >   
> > @@ -106,7 +106,7 @@ static __init int barrier_nospec_debugfs_init(void)
> >   device_initcall(barrier_nospec_debugfs_init);
> >   #endif /* CONFIG_DEBUG_FS */
> >   
> > -#ifdef CONFIG_PPC_FSL_BOOK3E
> > +#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
> >   static int __init handle_nospectre_v2(char *p)
> >   {
> >   	no_spectrev2 = true;
> > @@ -114,6 +114,9 @@ static int __init handle_nospectre_v2(char *p)
> >   	return 0;
> >   }
> >   early_param("nospectre_v2", handle_nospectre_v2);
> > +#endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
> > +
> > +#ifdef CONFIG_PPC_FSL_BOOK3E
> >   void setup_spectre_v2(void)
> >   {
> >   	if (no_spectrev2)
> > @@ -391,6 +394,13 @@ static void toggle_count_cache_flush(bool enable)
> >   
> >   void setup_count_cache_flush(void)
> >   {
> > +	if (no_spectrev2) {
> > +		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
> > +		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> > +			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
> 
> If one of those ftrs is set, what's the impact of not calling 
> toggle_count_cache_flush()?
> 

The patchsite/callsite (kernel/entry_64.S:597) for flush_count_cache
inside _switch remains a nop.

Disassembly of vmlinux after build:
c00000000000e260:       00 00 23 f8     std     r1,0(r3)
c00000000000e264:       00 00 00 60     nop
c00000000000e268:       00 60 c0 3c     lis     r6,24576

Disassembly (xmon) after boot/during runtime in qemu:
c00000000000e260  f8230000	std     r1,0(r3)
c00000000000e264  4bffdb7d	bl      c00000000000bde0	# flush_count_cache+0x0/0x2420
c00000000000e268  3cc06000	lis     r6,24576

Disassembly (xmon) after boot/during runtime in qemu w/ nospectre_v2:
c00000000000e260  f8230000	std     r1,0(r3)
c00000000000e264  60000000	nop
c00000000000e268  3cc06000	lis     r6,24576

toggle_count_cache_flush() well uhh "toggles" the patchsite to either
contain a branch to the flush procedure or a nop.

> > +		return;
> > +	}
> > +
> >   	toggle_count_cache_flush(true);
> >   }
> >   
> > 
> 
> -- 
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
>

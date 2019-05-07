Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246615765
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 03:45:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yj915H62zDqMV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 11:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yj7b5hLLzDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 11:43:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44yj7b0JWhz8t62
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 11:43:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44yj7Z6sThz9sB3; Tue,  7 May 2019 11:43:54 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 44yj7Y6thRz9s9N
 for <linuxppc-dev@ozlabs.org>; Tue,  7 May 2019 11:43:52 +1000 (AEST)
Received: from MTA-08-1.privateemail.com (unknown [10.20.147.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id 238A4613DB;
 Tue,  7 May 2019 01:43:49 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 0BDCF60044;
 Mon,  6 May 2019 21:43:49 -0400 (EDT)
Received: from APP-02 (unknown [10.20.147.152])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id E161C6003E;
 Tue,  7 May 2019 01:43:48 +0000 (UTC)
Date: Mon, 6 May 2019 21:43:48 -0400 (EDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@ozlabs.org
Message-ID: <1539804230.234837.1557193428894@privateemail.com>
In-Reply-To: <87sgtrvypy.fsf@concordia.ellerman.id.au>
References: <20190505221048.28212-1-cmr@informatik.wtf>
 <271ab704-e3d2-f04c-4758-2b08c1b3909c@linux.ibm.com>
 <1109071681.181819.1557148869293@privateemail.com>
 <87sgtrvypy.fsf@concordia.ellerman.id.au>
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


> On May 6, 2019 at 9:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
> 
> Christopher M Riedl <cmr@informatik.wtf> writes:
> >> On May 5, 2019 at 9:32 PM Andrew Donnellan <ajd@linux.ibm.com> wrote:
> >> On 6/5/19 8:10 am, Christopher M. Riedl wrote:
> >> > Add support for disabling the kernel implemented spectre v2 mitigation
> >> > (count cache flush on context switch) via the nospectre_v2 cmdline
> >> > option.
> >> > 
> >> > Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> >> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> >> >
> >> > diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> >> > index b33bafb8fcea..f7c34745cd0f 100644
> >> > --- a/arch/powerpc/kernel/security.c
> >> > +++ b/arch/powerpc/kernel/security.c
> >> > @@ -391,6 +394,13 @@ static void toggle_count_cache_flush(bool enable)
> >> >   
> >> >   void setup_count_cache_flush(void)
> >> >   {
> >> > +	if (no_spectrev2) {
> >> > +		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
> >> > +		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> >> > +			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
> >> 
> >> If one of those ftrs is set, what's the impact of not calling 
> >> toggle_count_cache_flush()?
> >> 
> >
> > The patchsite/callsite (kernel/entry_64.S:597) for flush_count_cache
> > inside _switch remains a nop.
> >
> > Disassembly of vmlinux after build:
> > c00000000000e260:       00 00 23 f8     std     r1,0(r3)
> > c00000000000e264:       00 00 00 60     nop
> > c00000000000e268:       00 60 c0 3c     lis     r6,24576
> >
> > Disassembly (xmon) after boot/during runtime in qemu:
> > c00000000000e260  f8230000	std     r1,0(r3)
> > c00000000000e264  4bffdb7d	bl      c00000000000bde0	# flush_count_cache+0x0/0x2420
> > c00000000000e268  3cc06000	lis     r6,24576
> >
> > Disassembly (xmon) after boot/during runtime in qemu w/ nospectre_v2:
> > c00000000000e260  f8230000	std     r1,0(r3)
> > c00000000000e264  60000000	nop
> > c00000000000e268  3cc06000	lis     r6,24576
> 
> Yes you're right, in this case the initial state is deactivated.
> 
> > toggle_count_cache_flush() well uhh "toggles" the patchsite to either
> > contain a branch to the flush procedure or a nop.
> 
> Sort of. It doesn't actually know the initial state, so calling it at
> boot with false will still nop out the nops.
> 
> I think I'd probably prefer it if we still call
> toggle_count_cache_flush(false) when no_spectrev2 is true. The main
> reason being that it means we'll print to dmesg, but it would also avoid
> problems if we ever change the initial state of the count cache flush.
> 
> cheers

Sounds good, I will add this to the next version. Thanks!

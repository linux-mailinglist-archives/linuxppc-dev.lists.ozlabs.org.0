Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A4212A95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 18:57:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yPRN6bBzzDqvn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 02:57:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yPPM4XrCzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 02:56:07 +1000 (AEST)
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A88D12084C;
 Thu,  2 Jul 2020 16:56:01 +0000 (UTC)
Date: Thu, 2 Jul 2020 17:55:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Young <dyoung@redhat.com>
Subject: Re: [PATCH v6 1/2] crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS'
 to vmcoreinfo
Message-ID: <20200702165558.GH22241@gaia>
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
 <1589395957-24628-2-git-send-email-bhsharma@redhat.com>
 <20200702110003.GC22241@gaia>
 <20200702120855.GD21026@dhcp-128-65.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702120855.GD21026@dhcp-128-65.nay.redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Bhupesh Sharma <bhsharma@redhat.com>, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Boris Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, bhupesh.linux@gmail.com,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Dave Anderson <anderson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 08:08:55PM +0800, Dave Young wrote:
> Hi Catalin,
> On 07/02/20 at 12:00pm, Catalin Marinas wrote:
> > On Thu, May 14, 2020 at 12:22:36AM +0530, Bhupesh Sharma wrote:
> > > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > > index 9f1557b98468..18175687133a 100644
> > > --- a/kernel/crash_core.c
> > > +++ b/kernel/crash_core.c
> > > @@ -413,6 +413,7 @@ static int __init crash_save_vmcoreinfo_init(void)
> > >  	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
> > >  	VMCOREINFO_STRUCT_SIZE(mem_section);
> > >  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
> > > +	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
> > >  #endif
> > >  	VMCOREINFO_STRUCT_SIZE(page);
> > >  	VMCOREINFO_STRUCT_SIZE(pglist_data);
> > 
> > I can queue this patch via the arm64 tree (together with the second one)
> > but I'd like an ack from the kernel/crash_core.c maintainers. They don't
> > seem to have been cc'ed either (only the kexec list).
> 
> For the VMCOREINFO part, I'm fine with the changes, but since I do not
> understand the arm64 pieces so I would like to leave to arm64 people to
> review.  If arm64 bits are good enough, feel free to add:
> 
> Acked-by: Dave Young <dyoung@redhat.com>

Thanks.

-- 
Catalin

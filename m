Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132710211A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 10:49:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HLdk3QRxzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 20:49:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=qais.yousef@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47HLbf3L1BzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 20:47:56 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EED2A1FB;
 Tue, 19 Nov 2019 01:47:51 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D0833F52E;
 Tue, 19 Nov 2019 01:47:50 -0800 (PST)
Date: Tue, 19 Nov 2019 09:47:47 +0000
From: Qais Yousef <qais.yousef@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 03/12] powerpc: Replace cpu_up/down with
 device_online/offline
Message-ID: <20191119094747.4asxwnmyrjy5d5io@e107158-lin.cambridge.arm.com>
References: <20191030153837.18107-1-qais.yousef@arm.com>
 <20191030153837.18107-4-qais.yousef@arm.com>
 <87h830d5n8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h830d5n8.fsf@mpe.ellerman.id.au>
User-Agent: NeoMutt/20171215
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ram Pai <linuxram@us.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/19/19 12:19, Michael Ellerman wrote:
> Qais Yousef <qais.yousef@arm.com> writes:
> > The core device API performs extra housekeeping bits that are missing
> > from directly calling cpu_up/down.
> >
> > See commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and
> > serialization during LPM") for an example description of what might go
> > wrong.
> >
> > This also prepares to make cpu_up/down a private interface for anything
> > but the cpu subsystem.
> >
> > Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> > CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > CC: Paul Mackerras <paulus@samba.org>
> > CC: Michael Ellerman <mpe@ellerman.id.au>
> > CC: Enrico Weigelt <info@metux.net>
> > CC: Ram Pai <linuxram@us.ibm.com>
> > CC: Nicholas Piggin <npiggin@gmail.com>
> > CC: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> > CC: Christophe Leroy <christophe.leroy@c-s.fr>
> > CC: Thomas Gleixner <tglx@linutronix.de>
> > CC: linuxppc-dev@lists.ozlabs.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  arch/powerpc/kernel/machine_kexec_64.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> My initial though is "what about kdump", but that function is not called
> during kdump, so there should be no issue with the extra locking leading
> to deadlocks in a crash.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks.

> 
> I assume you haven't actually tested it?

Only compile tested it I'm afraid. Would appreciate if you can give it a spin.
Otherwise I'd be happy to try it out on qemu.

Cheers

--
Qais Yousef

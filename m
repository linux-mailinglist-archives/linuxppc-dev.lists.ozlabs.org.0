Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26B3338A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:24:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwRVF35W8z3cc3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:24:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=QkmtQd5S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=QkmtQd5S; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwRTr1WG7z30RR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 20:24:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4DwRTq4sC5z9sVS; Wed, 10 Mar 2021 20:23:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1615368239; bh=vNOp55tbHRtcADIHuk6QWWg+Ff4RMtHkJEVvcbKDyTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QkmtQd5SXcntQkKro2P9fzExrRBNHQguaXPp4IkcmaH0niCbBMBvY3YZbP8yWbgVH
 iLW4MSJq4J+d/8+qbsQJL4SLx9TsJiVMpjL+WUJuZmPF9B+rQGdnlSNpX2MM8Qpz9t
 nn9B5z7YuA1otYonIQm5unW32o7JXI39fhSei0NUYhaOjbg9Y9i+2tw/R9m74CwG+k
 DhqvruDo+WEOkXFiHyVfehxI+RYbaxyvVBnCmEf1ENZSEIlUvlF6W6bhSo8briV41J
 Ow/2pVHL+v6vLMXJ954BzfK2Twxzs9O4g5OIHGXkqTHMBrER7mn3izQKiKzc4e/xcr
 rrT/HyMqkUEIA==
Date: Wed, 10 Mar 2021 20:23:54 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Do not expose HFSCR sanitisation to
 nested hypervisor
Message-ID: <20210310092354.GA30597@blackberry>
References: <20210305231055.2913892-1-farosas@linux.ibm.com>
 <1615191200.1pjltfhe7o.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615191200.1pjltfhe7o.astroid@bobo.none>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 08, 2021 at 06:18:47PM +1000, Nicholas Piggin wrote:
> Excerpts from Fabiano Rosas's message of March 6, 2021 9:10 am:
> > As one of the arguments of the H_ENTER_NESTED hypercall, the nested
> > hypervisor (L1) prepares a structure containing the values of various
> > hypervisor-privileged registers with which it wants the nested guest
> > (L2) to run. Since the nested HV runs in supervisor mode it needs the
> > host to write to these registers.
> > 
> > To stop a nested HV manipulating this mechanism and using a nested
> > guest as a proxy to access a facility that has been made unavailable
> > to it, we have a routine that sanitises the values of the HV registers
> > before copying them into the nested guest's vcpu struct.
> > 
> > However, when coming out of the guest the values are copied as they
> > were back into L1 memory, which means that any sanitisation we did
> > during guest entry will be exposed to L1 after H_ENTER_NESTED returns.
> > 
> > This is not a problem by itself, but in the case of the Hypervisor
> > Facility Status and Control Register (HFSCR), we use the intersection
> > between L2 hfscr bits and L1 hfscr bits. That means that L1 could use
> > this to indirectly read the (hv-privileged) value from its vcpu
> > struct.
> > 
> > This patch fixes this by making sure that L1 only gets back the bits
> > that are necessary for regular functioning.
> 
> The general idea of restricting exposure of HV privileged bits, but
> for the case of HFSCR a guest can probe the HFCR anyway by testing which 
> facilities are available (and presumably an HV may need some way to know
> what features are available for it to advertise to its own guests), so
> is this necessary? Perhaps a comment would be sufficient.

I would see it a bit differently.  From L1's point of view, L0 is the
hardware.  The situation we have now is akin to writing a value to the
real HFSCR, then reading HFSCR and finding that some of the facility
enable bits have magically got set to zero.  That's not the way real
hardware works, so L0 shouldn't behave that way either, or at least
not without some strong justification.

Paul.

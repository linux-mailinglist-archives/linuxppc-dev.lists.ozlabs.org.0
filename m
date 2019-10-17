Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B7DA381
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 04:13:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tt4Z1JfCzDr0V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 13:13:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tt2n50zMzDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 13:12:01 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9H2BZ2C002864;
 Wed, 16 Oct 2019 21:11:36 -0500
Message-ID: <7c14378a1fae17bf106040b5f38e3956a745c2c1.camel@kernel.crashing.org>
Subject: Re: Linux PowerPC, PPC4xx
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Carlo Pisani <carlojpisani@gmail.com>, paulus@samba.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 alistair@popple.id.au, mporter@kernel.crashing.org,
 sfr@canb.auug.org.au, michael@ellerman.id.au,
 david@gibson.dropbear.id.au, agust@denx.de, scottwood@freescale.com,
 patchwork.ozlabs@gmail.com
Date: Thu, 17 Oct 2019 13:11:35 +1100
In-Reply-To: <CA+QBN9Cxgwhga4dArM8MiHMYjT_Ab1YBVNnL6vAPf-euH03erw@mail.gmail.com>
References: <CA+QBN9Cxgwhga4dArM8MiHMYjT_Ab1YBVNnL6vAPf-euH03erw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-10-16 at 15:19 +0200, Carlo Pisani wrote:
> hi
> I am a student, I represent a group of friends running a couple of
> opensource projects(1), and we are lost with this(2) problem.
> 
> I wrote here(2) a couple of years ago, we are still working with
> kernel
> 4.11.0 and there is broken support for initializing the PCI.
> 
> The PCI initialization of the PPC405GP seems wrong and every
> kernel >= 2.6.26 is not able to correctly address the PDC20265
> 
> an interesting note is:
> kernel 2.6.26 can be compiled with arch=ppc and arch=powerpc
> 
> when compiled with arch=ppc the promise PDC20265 chip is correctly
> managed; while when compiled with arch=powerpc the PDC20265 is not
> correctly managed
> 
> any idea? advice? help? suggestion?
> a good place to discuss it?

On powermac we have a quirk to force these controllers into native
mode. You can try that.

Look for pmac_pci_fixup_pciata(). You could copy that to
powerpc/pci_32.c along with

DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, pmac_pci_fixup_pciata);

(maybe rename pmac to ppc) and remove the line that checks for
machine_is(powermac)

Cheers,
Ben.


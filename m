Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4711686E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 09:41:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wc9M3FsLzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 19:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wc6R2N40zDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 19:38:38 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xB98c8a0027516;
 Mon, 9 Dec 2019 02:38:08 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xB98c6QK027514;
 Mon, 9 Dec 2019 02:38:06 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 9 Dec 2019 02:38:06 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH V2 00/13] powerpc/vas: Page fault handling for user space
 NX requests
Message-ID: <20191209083806.GA3152@gate.crashing.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <8ba807dd-9d5a-e42a-60e8-f9ad648026bf@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba807dd-9d5a-e42a-60e8-f9ad648026bf@c-s.fr>
User-Agent: Mutt/1.4.2.3i
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com, hch@infradead.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Dec 09, 2019 at 06:37:09AM +0100, Christophe Leroy wrote:
> What do you mean by NX ?

It is the Power9 "Nest Accelerator".  The patch series should ideally
mention that right at the start, yeah.

> Up to now, NX has been standing for No-eXecute. That's a bit in segment 
> registers on book3s/32 to forbid executing code.

That bit is called just N fwiw (and not really specific to 32-bit -- on
64-bit implementations it was part of segment table entries, and of SLB
entries on newer machines).


Segher

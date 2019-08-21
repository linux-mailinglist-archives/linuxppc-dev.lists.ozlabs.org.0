Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C196E7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 02:44:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cpp26cn4zDr7m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 10:44:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cpm43w87zDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 10:42:44 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7L0gRWO003493;
 Tue, 20 Aug 2019 19:42:29 -0500
Message-ID: <c7f0f066ff9718bdce5f94b222526de4bc5372c2.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 05/12] powerpc/mm: rework io-workaround invocation.
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Christoph Hellwig <hch@lst.de>, Christophe Leroy <christophe.leroy@c-s.fr>
Date: Wed, 21 Aug 2019 10:42:27 +1000
In-Reply-To: <20190820222828.GC18433@lst.de>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
 <5fa3ef069fbd0f152512afaae19e7a60161454cf.1566309262.git.christophe.leroy@c-s.fr>
 <20190820222828.GC18433@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-21 at 00:28 +0200, Christoph Hellwig wrote:
> On Tue, Aug 20, 2019 at 02:07:13PM +0000, Christophe Leroy wrote:
> > ppc_md.ioremap() is only used for I/O workaround on CELL platform,
> > so indirect function call can be avoided.
> > 
> > This patch reworks the io-workaround and ioremap() functions to
> > use the global 'io_workaround_inited' flag for the activation
> > of io-workaround.
> > 
> > When CONFIG_PPC_IO_WORKAROUNDS or CONFIG_PPC_INDIRECT_MMIO are not
> > selected, the I/O workaround ioremap() voids and the global flag is
> > not used.
> 
> Note that CONFIG_PPC_IO_WORKAROUNDS is only selected by a specific cell
> config,  and CONFIG_PPC_INDIRECT_MMIO is always selected by cell, so
> I think we can make CONFIG_PPC_IO_WORKAROUNDS depend on
> CONFIG_PPC_INDIRECT_MMIO

Or we can deprecate that old platform... not sure anybody uses it
anymore (if anybody ever did).

Cheers,
ben.



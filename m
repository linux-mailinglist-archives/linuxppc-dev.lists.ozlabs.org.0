Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1D7454D2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZDw0pfNz3dBh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8M1wbRz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ8K5xWTz4wxv;
	Mon,  3 Jul 2023 15:23:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
In-Reply-To: <20230505171816.3175865-1-robh@kernel.org>
References: <20230505171816.3175865-1-robh@kernel.org>
Subject: Re: [PATCH] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is not present
Message-Id: <168836167601.46386.17041701491443802315.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 05 May 2023 12:18:17 -0500, Rob Herring wrote:
> Commit e4ab08be5b49 ("powerpc/isa-bridge: Remove open coded "ranges"
> parsing") broke PASemi Nemo board booting. The issue is the ISA I/O
> range was not getting mapped as the logic to handle no "ranges" was
> inverted. If phb_io_base_phys is non-zero, then the ISA range defaults
> to the first 64K of the PCI I/O space. phb_io_base_phys should only be 0
> when looking for a non-PCI ISA region.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is not present
      https://git.kernel.org/powerpc/c/79de36042eecb684e0f748d17ba52f365fde0d65

cheers

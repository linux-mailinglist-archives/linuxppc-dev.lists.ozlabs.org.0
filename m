Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B477D5708B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 19:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhVr14BrHz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhVqf00vjz3c1h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 03:14:37 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26BHCQwP008080;
	Mon, 11 Jul 2022 12:12:27 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26BHCQ80008079;
	Mon, 11 Jul 2022 12:12:26 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 11 Jul 2022 12:12:26 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 4/5] powerpc/44x: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
Message-ID: <20220711171226.GG25951@gate.crashing.org>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu> <b0d982e223314ed82ab959f5d4ad2c4c00bedb99.1657549153.git.christophe.leroy@csgroup.eu> <CAK8P3a33jf5CUpyzWmRHpoUDMWB7TqSw5afUW=rcmMVSK8BvRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a33jf5CUpyzWmRHpoUDMWB7TqSw5afUW=rcmMVSK8BvRA@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 11, 2022 at 05:05:04PM +0200, Arnd Bergmann wrote:
> Is there any value in building for -mcpu=440 or -mcpu=464 when targeting a 476?

The original 440 had a very short pipeline.  Later IBM 4xx have a longer
pipeline.  Getting this right (with -mtune=, or just with -mcpu=) is
important for performance.  So, no?

> Maybe add another !PPC_47x dependency for the first two. Ideally we would also
> enforce that 440/464 based boards cannot be selected together with 476, though
> I guess that is a separate issue.
> 
> Is there a practical difference between 440 and 464 when building kernels?
> gcc seems to treat them the same way, so maybe one option for both is enough
> here.

-mcpu= is used as the default for -mtune=, so that is always a
consideration.  PPC464 is treated the same as PPC440 in binutils as
well, so I don't think there is any issue there.


Segher

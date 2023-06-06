Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C847372497D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 18:47:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbGcC4NMVz3fDZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 02:47:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbGbj2lDHz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 02:47:12 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 356GgvdA031913;
	Tue, 6 Jun 2023 11:42:57 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 356GguQ2031912;
	Tue, 6 Jun 2023 11:42:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 6 Jun 2023 11:42:56 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Umesh Kalappa <umesh.kalappa0@gmail.com>
Subject: Re: Passing the complex args in the GPR's
Message-ID: <20230606164256.GQ19790@gate.crashing.org>
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com> <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com> <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Andrew Pinski <pinskia@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Jun 06, 2023 at 08:35:22PM +0530, Umesh Kalappa wrote:
> Hi Adnrew,
> Thank you for the quick response and for PPC64 too ,we do have
> mismatches in ABI b/w complex operations like
> https://godbolt.org/z/bjsYovx4c .
> 
> Any reason why GCC chose to use GPR 's here ?

What did you expect, what happened instead?  Why did you expect that,
and why then is it an error what did happen?

You used -O0.  As long as the code works, all is fine.  But unoptimised
code frequently is hard to read, please use -O2 instead?

As Andrew says, why did you use -m32 for GCC but -m64 for LLVM?  It is
hard to compare those at all!  32-bit PowerPC Linux ABI (based on 32-bit
PowerPC ELF ABI from 1995, BE version) vs. 64-bit ELFv2 ABI from 2015
(LE version).


Segher

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A35763FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 17:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkvhY54N3z3ch4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 01:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lkvh84Jc9z3c1c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 01:01:28 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26FEvHIb021914;
	Fri, 15 Jul 2022 09:57:17 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26FEvHJA021913;
	Fri, 15 Jul 2022 09:57:17 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Jul 2022 09:57:17 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: add documentation for HWCAPs
Message-ID: <20220715145717.GZ25951@gate.crashing.org>
References: <20220715012636.165948-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715012636.165948-1-npiggin@gmail.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org, libc-alpha@sourceware.org, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 15, 2022 at 11:26:36AM +1000, Nicholas Piggin wrote:
> Take the arm64 HWCAP documentation file and adjust it for powerpc.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

> +2. Facilities
> +-------------
> +
> +The Power ISA uses the term "facility" to describe a class of instructions,
> +registers, interrupts, etc. The presence or absence of a facility indicates
> +whether this class is available to be used, but the specifics depend on the
> +ISA version. For example, if the VSX facility is available, the VSX
> +instructions that can be used differ between the v3.0B and v3.1B ISA
> +versions.

The term "facility" is never defined in the architecture documents, so
the common language meaning applies, which google says is "a place,
amenity, or piece of equipment provided for a particular purpose", which
fits your explanation well.

> +3. Categories
> +-------------
> +
> +The Power ISA before v3.0 uses the term "category" to describe certain
> +classes of instructions and operating modes which may be optional or
> +mutually exclusive, the exact meaning of the HWCAP flag may depend on
> +context, e.g., the presence of the BOOKE feature implies that the server
> +category is not implemented.

Since ISA 3.0 the preface says
  The resulting architecture included [...] and optional application-
  specific facilities (categories) as extensions to a pervasive base
  architecture.
which fits your explanation.

Thanks for improving the documentation!


Segher

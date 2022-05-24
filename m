Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF06532FBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 19:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L71kM1QMGz3bv3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 03:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L71jv5VWrz2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 03:42:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24OHcFD0025599;
 Tue, 24 May 2022 12:38:15 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 24OHcEu5025598;
 Tue, 24 May 2022 12:38:14 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 24 May 2022 12:38:14 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH Linux] powerpc: add documentation for HWCAPs
Message-ID: <20220524173814.GH25951@gate.crashing.org>
References: <20220524093828.505575-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524093828.505575-1-npiggin@gmail.com>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org,
 Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, May 24, 2022 at 07:38:28PM +1000, Nicholas Piggin wrote:
> Thanks for all the comments and corrections. It should be nearing the
> point where it is useful now. Yes I do think it would be useful to align
> this more with OpenPOWER docs (and possibly eventually move it into the
> ABI, given that's the allocator of these numbers) but that's not
> done yet.

The auxiliary vector is a Linux/glibc thing, it should not be described
in more generic ABI documents.  It is fine where you have it now afaics.

> +Where software relies on a feature described by a HWCAP, it should check the
> +relevant HWCAP flag to verify that the feature is present before attempting to
> +make use of the feature.
> +
> +Features should not be probed through other means. When a feature is not
> +available, attempting to use it may result in unpredictable behaviour, and
> +may not be guaranteed to result in any reliable indication that the feature
> +is unavailable.

Traditionally VMX was tested for by simply executing an instruction and
catching SIGILL.  This is portable even.  This has worked fine for over
two decades, it's a bit weird to declare this a forbidden practice
now :-)

It certainly isn't recommended for more complex and/or newer things.

> +verstions.

(typo.  spellcheck maybe?)


Segher

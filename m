Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E33F77BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 16:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvpnP2RfSz2xy4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 00:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gvpmw0rZHz2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 00:50:22 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17PElF3t003965;
 Wed, 25 Aug 2021 09:47:15 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17PElDpJ003962;
 Wed, 25 Aug 2021 09:47:13 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 25 Aug 2021 09:47:13 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Ganesh <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
Message-ID: <20210825144713.GQ1583@gate.crashing.org>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <87eeajcpmq.fsf@mpe.ellerman.id.au> <20210824212420.GL1583@gate.crashing.org>
 <92790955-ce8d-1826-2317-c889038545fc@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92790955-ce8d-1826-2317-c889038545fc@linux.ibm.com>
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 25, 2021 at 05:06:29PM +0530, Ganesh wrote:
> 
> On 8/25/21 2:54 AM, Segher Boessenkool wrote:
> >On Tue, Aug 24, 2021 at 04:39:57PM +1000, Michael Ellerman wrote:
> >>>+		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
> >>>+			mce_err.u.ra_error_type =
> >>>+			 MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
> >>That name is ridiculously long, but I guess that's not your fault :)
> >>We can fix it up in a later patch.
> >It also has surprisingly little information content for the 47 chars
> >length it has :-)  What does this even mean?!
> 
> It means control memory access error/real address error is detected during 
> page
> table walk.

This isn't obvious from the name.  The name contains some words your
explanation does not, as well: LOAD, STORE, FOREIGN.  Most importantly,
the name is just a jumble of words, with no apparent connection between
them.

I didn't ask for an explanation, sorry if you misunderstood.  I was just
exploring the many ways this name is baffling :-)


Segher

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3081D9B39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 17:30:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RKbG6xgzzDr0p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 01:30:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49RKY8107RzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:28:59 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 04JFSunG017874;
 Tue, 19 May 2020 10:28:56 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 04JFStx3017873;
 Tue, 19 May 2020 10:28:55 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 19 May 2020 10:28:55 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Paul A. Clarke" <pc@us.ibm.com>
Subject: Re: [PATCH v2 6/7] powerpc/dt_cpu_ftrs: Add MMA feature
Message-ID: <20200519152855.GN31009@gate.crashing.org>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-7-alistair@popple.id.au>
 <20200519144922.GA24922@oc3272150783.ibm.com>
 <20200519150556.GM31009@gate.crashing.org>
 <20200519152240.GB24922@oc3272150783.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519152240.GB24922@oc3272150783.ibm.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 10:22:40AM -0500, Paul A. Clarke wrote:
> On Tue, May 19, 2020 at 10:05:56AM -0500, Segher Boessenkool wrote:
> > On Tue, May 19, 2020 at 09:49:22AM -0500, Paul A. Clarke wrote:
> > > On Tue, May 19, 2020 at 10:31:56AM +1000, Alistair Popple wrote:
> > > > Matrix multiple accumulate (MMA) is a new feature added to ISAv3.1 and
> > > 
> > > nit: "Matrix-Multiply Accelerator".
> > 
> > "Matrix-Multiply Assist" in fact :-)
> 
> Not according to the ISA (p. 1129).

There is one mistake in the 3.1 ABI yes, in the description for the PCR
bit of this same name.  Everything else calls this "assist", like all
similar things are called as well (whereas an "accelerator" is an
external device).


Segher

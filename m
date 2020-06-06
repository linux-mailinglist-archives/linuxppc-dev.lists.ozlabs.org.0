Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 274CB1F0817
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 20:12:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fSKQ2rRZzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 04:12:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49fSGg0wnpzDqvg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jun 2020 04:10:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 056I9CBj006803;
 Sat, 6 Jun 2020 13:09:12 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 056I9AdG006802;
 Sat, 6 Jun 2020 13:09:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 6 Jun 2020 13:09:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v10 6/6] powerpc/papr_scm: Implement support for
 PAPR_PDSM_HEALTH
Message-ID: <20200606180910.GW31009@gate.crashing.org>
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-7-vaibhav@linux.ibm.com>
 <20200605183655.GP1505637@iweiny-DESK2.sc.intel.com>
 <87wo4kfk58.fsf@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wo4kfk58.fsf@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 06, 2020 at 06:04:11PM +0530, Vaibhav Jain wrote:
> >> +	/* update health struct with various flags derived from health bitmap */
> >> +	health = (struct nd_papr_pdsm_health) {
> >> +		.dimm_unarmed = p->health_bitmap & PAPR_PMEM_UNARMED_MASK,
> >> +		.dimm_bad_shutdown = p->health_bitmap & PAPR_PMEM_BAD_SHUTDOWN_MASK,
> >> +		.dimm_bad_restore = p->health_bitmap & PAPR_PMEM_BAD_RESTORE_MASK,
> >> +		.dimm_encrypted = p->health_bitmap & PAPR_PMEM_ENCRYPTED,
> >> +		.dimm_locked = p->health_bitmap & PAPR_PMEM_SCRUBBED_AND_LOCKED,
> >> +		.dimm_scrubbed = p->health_bitmap & PAPR_PMEM_SCRUBBED_AND_LOCKED,
> >
> > Are you sure these work?  These are not assignments to a bool so I don't think
> > gcc will do what you want here.
> Yeah, somehow this slipped by and didnt show up in my tests. I checked
> the assembly dump and seems GCC was silently skipping initializing these
> fields without making any noise.

It's not "skipping" that, it initialises the field to 0, just like your
code said it should :-)

If you think GCC should warn for this, please open a PR?  It is *normal*
for bit-fields to be truncated from what is assigned to it, but maybe we
could warn for it in the 1-bit case (we currently don't seem to, even
when the bit-field type is _Bool).

Thanks,


Segher

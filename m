Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BBC5341C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:53:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7cbC4b74z3bkC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 02:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L7cZp5484z2yph
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 02:53:22 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24PGpCBP019535;
 Wed, 25 May 2022 11:51:12 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 24PGpBfh019533;
 Wed, 25 May 2022 11:51:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 25 May 2022 11:51:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Message-ID: <20220525165111.GP25951@gate.crashing.org>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 Paul Mackerras <paulus@samba.org>, jpoimboe@redhat.com,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, mbenes@suse.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 25, 2022 at 03:44:04PM +0530, Sathvika Vasireddy wrote:
> On 24/05/22 18:47, Christophe Leroy wrote:
> >This draft series adds PPC32 support to Sathvika's series.
> >Verified on pmac32 on QEMU.
> >
> >It should in principle also work for PPC64 BE but for the time being
> >something goes wrong. In the beginning I had a segfaut hence the first
> >patch. But I still get no mcount section in the files.
> Since PPC64 BE uses older elfv1 ABI, it prepends a dot to symbols.
> And so, the relocation records in case of PPC64BE point to "._mcount",
> rather than just "_mcount". We should be looking for "._mcount" to be
> able to generate mcount_loc section in the files.

The dotted symbol is on the actual function.  The "normal" symbol is on
the "official procedure descriptor" (opd), which is what you get if you
(in C) take the address of a function.  A procedure descriptor holds one
or two more pointers, the GOT and environment pointers.  We don't use
the environment one, but the GOT pointer is necessary everywhere :-)


Segher

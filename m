Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9F19C2E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 15:42:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tPPg2ZR0zDr5T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 00:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.57.200; helo=7.mo3.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4201 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 00:37:58 AEDT
Received: from 7.mo3.mail-out.ovh.net (7.mo3.mail-out.ovh.net [46.105.57.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tPJk6fPQzDrPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 00:37:54 +1100 (AEDT)
Received: from player697.ha.ovh.net (unknown [10.110.208.43])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 8A14D24B25E
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 13:10:55 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id AEBE3110DE660;
 Thu,  2 Apr 2020 11:10:14 +0000 (UTC)
Date: Thu, 2 Apr 2020 13:10:12 +0200
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 00/25] Add support for OpenCAPI Persistent Memory
 devices
Message-ID: <20200402131012.579c7bf7@bahia.lan>
In-Reply-To: <87bloatd6e.fsf@mpe.ellerman.id.au>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <CAPcyv4iJYZBVhV1NW7EB6-EwETiUAy6r1iiE+F+HvFXfGZt9Aw@mail.gmail.com>
 <2d6901d60877$16aa7a90$43ff6fb0$@d-silva.org>
 <87imiituxm.fsf@mpe.ellerman.id.au>
 <CAOSf1CHdpFyT_6zetKM6eHDK3AT8-UNTzjdd2y+QqYT2AO9VDw@mail.gmail.com>
 <87bloatd6e.fsf@mpe.ellerman.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14428970257110833585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhthhhusgdrihhonecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, "Aneesh
 Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Alastair D'Silva <alastair@d-silva.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 02 Apr 2020 21:06:01 +1100
Michael Ellerman <mpe@ellerman.id.au> wrote:

> "Oliver O'Halloran" <oohall@gmail.com> writes:
> > On Thu, Apr 2, 2020 at 2:42 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> "Alastair D'Silva" <alastair@d-silva.org> writes:
> >> >> -----Original Message-----
> >> >> From: Dan Williams <dan.j.williams@intel.com>
> >> >>
> >> >> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org>
> >> >> wrote:
> >> >> >
> >> >> > *snip*
> >> >> Are OPAL calls similar to ACPI DSMs? I.e. methods for the OS to invoke
> >> >> platform firmware services? What's Skiboot?
> >> >
> >> > Yes, OPAL is the interface to firmware for POWER. Skiboot is the open-source (and only) implementation of OPAL.
> >>
> >>   https://github.com/open-power/skiboot
> >>
> >> In particular the tokens for calls are defined here:
> >>
> >>   https://github.com/open-power/skiboot/blob/master/include/opal-api.h#L220
> >>
> >> And you can grep for the token to find the implementation:
> >>
> >>   https://github.com/open-power/skiboot/blob/master/hw/npu2-opencapi.c#L2328
> >
> > I'm not sure I'd encourage anyone to read npu2-opencapi.c. I find it
> > hard enough to follow even with access to the workbooks.
> 
> Compared to certain firmwares that run on certain other platforms it's
> actually pretty readable code ;)
> 

Forth rocks ! ;-)

> > There's an OPAL call API reference here:
> > http://open-power.github.io/skiboot/doc/opal-api/index.html
> 
> Even better.
> 
> cheers


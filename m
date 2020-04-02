Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5536D19BF14
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 12:07:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tJfD2l0tzDrSM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:07:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tJc56ltrzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 21:05:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BIAYcmrK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tJc24ckyz9sR4;
 Thu,  2 Apr 2020 21:05:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585821957;
 bh=VWV5VVYaAJNLZ0qhNZ2vXZ3ZVuH1QjojCUmH4J7cvRM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BIAYcmrKq1LF5D5nT2gJkPD5FXCcgc658kciTx3sX+axQbjk3V2h07eqg6P3sQFtw
 WZH2du4hEAjbq6MucoA118QF1GDycOJONVlClQKdeEOwTgpwMgzHQgHoLHHY/99h8q
 NZF0h2aW+zXmsTl1aZpEs8j7uHhm8YSAZfyiNiNehPYenQ7tc3BaEQkDi/60Fu+agl
 yFbkROHRPHEafu2+ycumDNj9Sn85R4SRDp0JrhXlvEzFZRjbsIjGWgCOkWGnS8Dgxv
 KCEXJZ95U3du4XOtVJMWjWbxkddWIX/CG9xoI/0/E4gWVMxEhV/VNg7slBH7PHXuHY
 fzkz6rZ7j6Jgw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v4 00/25] Add support for OpenCAPI Persistent Memory
 devices
In-Reply-To: <CAOSf1CHdpFyT_6zetKM6eHDK3AT8-UNTzjdd2y+QqYT2AO9VDw@mail.gmail.com>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <CAPcyv4iJYZBVhV1NW7EB6-EwETiUAy6r1iiE+F+HvFXfGZt9Aw@mail.gmail.com>
 <2d6901d60877$16aa7a90$43ff6fb0$@d-silva.org>
 <87imiituxm.fsf@mpe.ellerman.id.au>
 <CAOSf1CHdpFyT_6zetKM6eHDK3AT8-UNTzjdd2y+QqYT2AO9VDw@mail.gmail.com>
Date: Thu, 02 Apr 2020 21:06:01 +1100
Message-ID: <87bloatd6e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Alastair D'Silva <alastair@d-silva.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Thu, Apr 2, 2020 at 2:42 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> "Alastair D'Silva" <alastair@d-silva.org> writes:
>> >> -----Original Message-----
>> >> From: Dan Williams <dan.j.williams@intel.com>
>> >>
>> >> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org>
>> >> wrote:
>> >> >
>> >> > *snip*
>> >> Are OPAL calls similar to ACPI DSMs? I.e. methods for the OS to invoke
>> >> platform firmware services? What's Skiboot?
>> >
>> > Yes, OPAL is the interface to firmware for POWER. Skiboot is the open-source (and only) implementation of OPAL.
>>
>>   https://github.com/open-power/skiboot
>>
>> In particular the tokens for calls are defined here:
>>
>>   https://github.com/open-power/skiboot/blob/master/include/opal-api.h#L220
>>
>> And you can grep for the token to find the implementation:
>>
>>   https://github.com/open-power/skiboot/blob/master/hw/npu2-opencapi.c#L2328
>
> I'm not sure I'd encourage anyone to read npu2-opencapi.c. I find it
> hard enough to follow even with access to the workbooks.

Compared to certain firmwares that run on certain other platforms it's
actually pretty readable code ;)

> There's an OPAL call API reference here:
> http://open-power.github.io/skiboot/doc/opal-api/index.html

Even better.

cheers

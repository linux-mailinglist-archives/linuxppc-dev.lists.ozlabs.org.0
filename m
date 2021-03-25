Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89120349ABA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 20:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5wqs3fLRz3byR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:57:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=jltPN19e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.92; helo=alln-iport-5.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=jltPN19e; dkim-atps=neutral
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5wqQ3dwZz3bVc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 06:57:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1794; q=dns/txt; s=iport;
 t=1616702226; x=1617911826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pu2I9fiU+I/A1fLeU7DBkeJ7rBv/7jFx5HzFlCmOGBA=;
 b=jltPN19elXn857gaCpW9vlEcyWWjbVCv9Zh6dcT9bBu9ywTejjGjIs7r
 0PoyVk4QTWzhOkGqanQxLxgjy0O8Ykyunh6lXntNYGOjVv1X0R87UJ1Dk
 DWZlblr3tCZk6cCyCtbFB8X5OEm3mkEyQB7tXpvgbtKyvJaRBg5URsmBp 4=;
X-IPAS-Result: =?us-ascii?q?A0AjAACo6lxgmIoNJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUCBPgQBAQELAYN2ATmWPAOQB4pbgXwLAQEBDQEBNAQBAYRQAoF8AiU2B?=
 =?us-ascii?q?w4CAwEBAQMCAwEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUBAgM6PxALGC48G?=
 =?us-ascii?q?wYsgleDCKspdYE0iRaBRBQOgRcBjUImHIFJQoQuPoQxhWMiBIJGF3mBCGcVB?=
 =?us-ascii?q?GI1kCxRjQuKQ5BIgRSDEIEimEiCaTEQgziKbZYbuBACBAYFAhaBWgExgVszG?=
 =?us-ascii?q?ggbFTuCak8ZDY44jk8hA2cCBgoBAQMJhSqCQwEB?=
IronPort-HdrOrdr: A9a23:EyzLJ6OQ0cmmLsBcT5r155DYdL4zR+YMi2QD/UoZc3NoW+afkN
 2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQWOghrLEKhO5ZbvqgeLJwTQ7ehYvJ
 0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1IztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPa
 GR7MZGuDasEE5/Bq+GL0IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZ8/7G
 6AqADi/6Olqf3+8APEznTe9Y4+oqqH9vJzQOqRl8MSNjLgziGvaYgJYcz6gBkF5Mey9V0tjN
 7A5y0FAv02wXbQcmapyCGdvTXd7A==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,278,1610409600"; d="scan'208";a="686872034"
Received: from alln-core-5.cisco.com ([173.36.13.138])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 25 Mar 2021 19:56:56 +0000
Received: from zorba ([10.24.0.17])
 by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PJurCb006095
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Mar 2021 19:56:55 GMT
Date: Thu, 25 Mar 2021 12:56:53 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210325195653.GL109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.0.17, [10.24.0.17]
X-Outbound-Node: alln-core-5.cisco.com
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
Cc: Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 24, 2021 at 05:59:59PM +0100, Christophe Leroy wrote:
> > I think my changes maintain most of this due to the override of
> > CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in powerpc is
> > an example of why these changes were created in the first place.
> 
> "inflexibility in powerpc" : Can you elaborate ?
 
the prom environment.

> > 
> > For example , say the default command line is "root=/dev/issblk0" from iss476
> > platform. And the bootloader adds "root=/dev/sda1"
> > 
> > The result is <prepend><bootloader><append>.
> 
> 
> I'm still having hard time understanding the benefit of having both <prepend> and <append>.
> Could you please provide a complete exemple from real life, ie what exactly
> the problem is and what it solves ?
 
Say the boot loader of an old product is released with a command line of
"root=/dev/sda" and per the needs of the company or product the boot loader can
not be upgraded to change this command line. To change this behavior you would
need append or EXTEND.

Below I detail an example of PREPEND due to your list question.

> > 
> > Then you have,
> > 
> > root=/dev/issblk0 root=/dev/sda1
> > 
> > and the bootloader has precedent over the default command line. So root= in the
> > above cases is defined by the bootloader.

A person could input a command line into a boot loader, and it would override
the PREPEND values.

Can you imagine you have a default command line which makes root=/dev/issblk0 ,
but that doesn't work for you testing purpose. So you input into the boot loader
root=/dev/sda1 , since you have the default input in the bootloader OVERRIDEABLE
you can do this without re-compiling and just input the single root= command
into the bootloader.

Daniel

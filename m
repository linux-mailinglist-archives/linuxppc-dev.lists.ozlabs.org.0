Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534BC35915E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 03:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGgQl1XGvz3bwD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:24:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=SNxcqYFd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.93; helo=alln-iport-6.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=SNxcqYFd; dkim-atps=neutral
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGgQG6pz3z301J
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 11:24:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1925; q=dns/txt; s=iport;
 t=1617931447; x=1619141047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WkzLqPqjAxF6Ch0t2FT084suyCe7GM/KMpezthHSR4s=;
 b=SNxcqYFdpHVXyIhEgk/QNXhAZt3Kb+NSgxqMG7RyojQFlXPbmCm2Tsdj
 /pT7shWCNeB3yfTpw3RoHrFvg7hPepelLMkn6KC/rD5B+gqq6xROSKJsT
 yGLUKTnJvlLvecMQtyv9AGRbXBp1XPP6Pmicj6USs4ZLVIQt0QUpMPQWD c=;
X-IPAS-Result: =?us-ascii?q?A0ABAAAUrG9gmIENJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE+BQEBAQELAYN3ATmNF4k1kA2KXIF8CwEBAQ0BATQEAQGEU?=
 =?us-ascii?q?AKBdwIlNAkOAgMBAQEDAgMBAQEBAQUBAQECAQYEFAEBAQEBAQEBaIVdhkUBA?=
 =?us-ascii?q?gM6OgUQCxIGLjwNDgaDBIMIqjx1gTSBAYgUgUQigRcBjUwnHIFJQoETgyI+i?=
 =?us-ascii?q?jkEgkeCNaAbikiRYYMVgSabRzIQpGEtszuEVgIEBgUCFoFUOIFbMxoIGxWDJ?=
 =?us-ascii?q?U8ZDo44jlAhA2cCBgoBAQMJjDRdAQE?=
IronPort-HdrOrdr: A9a23:QdBVtK4Vqwy1Ov3XkQPXwHXXdLJzesId70hD6mlaQ3VuHfCwvc
 aogfgdyFvYiCwJXmshhNCHP8C7MBbh3LRy5pQcOqrnYRn+tAKTXeNfxKbr3jGIIUfD38FH06
 MIScVDIf32SWN3lMPrpDS/euxQpOWv1ICNqaPgw2x2TQdsApsQjDtRLgqACEV5SE1nKPMCda
 a03cZMqzq+dXl/VK3SbUUtZOTNq8bGk5jre3c9ZyIP0hWEjj+j9dfBfSSw4xF2aV9y6IZn13
 TZmArk4ajmlPe3xnbnpgnuxqUTvsf9wd1eA8HJsOwpE3HHjwalY5kJYczkgAwI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,208,1613433600"; d="scan'208";a="717254170"
Received: from alln-core-9.cisco.com ([173.36.13.129])
 by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 09 Apr 2021 01:23:53 +0000
Received: from zorba ([10.24.9.242])
 by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 1391Nnm8027721
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Apr 2021 01:23:51 GMT
Date: Thu, 8 Apr 2021 18:23:49 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
Message-ID: <20210409012349.GG3981976@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
 <20210408190408.GA1724284@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408190408.GA1724284@robh.at.kernel.org>
X-Outbound-SMTP-Client: 10.24.9.242, [10.24.9.242]
X-Outbound-Node: alln-core-9.cisco.com
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
Cc: linux-arch@vger.kernel.org, arnd@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 nios2 <ley.foon.tan@intel.com>, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 02:04:08PM -0500, Rob Herring wrote:
> On Tue, Apr 06, 2021 at 10:38:36AM -0700, Daniel Walker wrote:
> > On Fri, Apr 02, 2021 at 03:18:21PM +0000, Christophe Leroy wrote:
> > > -config CMDLINE_BOOL
> > > -	bool "Built-in kernel command line"
> > > -	help
> > > -	  For most systems, it is firmware or second stage bootloader that
> > > -	  by default specifies the kernel command line options.  However,
> > > -	  it might be necessary or advantageous to either override the
> > > -	  default kernel command line or add a few extra options to it.
> > > -	  For such cases, this option allows you to hardcode your own
> > > -	  command line options directly into the kernel.  For that, you
> > > -	  should choose 'Y' here, and fill in the extra boot arguments
> > > -	  in CONFIG_CMDLINE.
> > > -
> > > -	  The built-in options will be concatenated to the default command
> > > -	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
> > > -	  command line will be ignored and replaced by the built-in string.
> > > -
> > > -	  Most MIPS systems will normally expect 'N' here and rely upon
> > > -	  the command line from the firmware or the second-stage bootloader.
> > > -
> > 
> > 
> > See how you complained that I have CMDLINE_BOOL in my changed, and you think it
> > shouldn't exist.
> > 
> > Yet here mips has it, and you just deleted it with no feature parity in your
> > changes for this.
> 
> AFAICT, CMDLINE_BOOL equates to a non-empty or empty CONFIG_CMDLINE. You 
> seem to need it just because you have CMDLINE_PREPEND and 
> CMDLINE_APPEND. If that's not it, what feature is missing? CMDLINE_BOOL 
> is not a feature, but an implementation detail.

Not true.

It makes it easier to turn it all off inside the Kconfig , so it's for usability
and multiple architecture have it even with just CMDLINE as I was commenting
here.

Daniel

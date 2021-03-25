Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9A349ACC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 21:04:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5wzs5j07z3bwn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 07:04:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=ZZgTJSHV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.72; helo=rcdn-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=ZZgTJSHV; dkim-atps=neutral
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5wzR6PpCz3bcN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 07:04:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3186; q=dns/txt; s=iport;
 t=1616702644; x=1617912244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BEUcHvcrI68gqzYOcJB+2Eo5dzEnIS+cOJz0im7Ye0s=;
 b=ZZgTJSHVAEC67SN90+G70RIRbSPGcG+2uWPBTc20R9dxGpZ2gtROcUB3
 GV7GaAKoz4Z5p2SrAWX+ErVMQ3okewsKFHcBVHPjBk5IE+ZGwXVMalnDu
 xb0213ojD0fCA+xJ7F4QWp0Nxe6fzlv2/N9qjZjk/G5WWTTsjc3gM4tsn I=;
X-IronPort-AV: E=Sophos;i="5.81,278,1610409600"; d="scan'208";a="867855113"
Received: from alln-core-4.cisco.com ([173.36.13.137])
 by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 25 Mar 2021 20:04:00 +0000
Received: from zorba ([10.24.0.17])
 by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PK3w7e004051
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Mar 2021 20:03:59 GMT
Date: Thu, 25 Mar 2021 13:03:57 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 4/7] CMDLINE: powerpc: convert to generic builtin
 command line
Message-ID: <20210325200357.GN109100@zorba>
References: <20210309000247.2989531-5-danielwa@cisco.com>
 <c5c8b57e-7954-ec02-188a-7f85cb0af731@csgroup.eu>
 <20210309214051.GS109100@zorba>
 <9c5b8e33-026e-c9d6-c267-a5dd4a2b999c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c5b8e33-026e-c9d6-c267-a5dd4a2b999c@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.0.17, [10.24.0.17]
X-Outbound-Node: alln-core-4.cisco.com
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
Cc: Rob Herring <robh@kernel.org>, Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <rbilovol@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 24, 2021 at 04:31:35PM +0100, Christophe Leroy wrote:
> 
> 
> Le 09/03/2021 à 22:40, Daniel Walker a écrit :
> > On Tue, Mar 09, 2021 at 08:56:47AM +0100, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 09/03/2021 à 01:02, Daniel Walker a écrit :
> > > > This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE
> > > > option.
> > > > 
> > > > Cc: xe-linux-external@cisco.com
> > > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > > Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> > > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > > ---
> > > >    arch/powerpc/Kconfig            | 37 +--------------------------------
> > > >    arch/powerpc/kernel/prom.c      |  1 +
> > > >    arch/powerpc/kernel/prom_init.c | 35 ++++++++++++++++++-------------
> > > >    3 files changed, 23 insertions(+), 50 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > > index 107bb4319e0e..276b06d5c961 100644
> > > > --- a/arch/powerpc/Kconfig
> > > > +++ b/arch/powerpc/Kconfig
> > > > @@ -167,6 +167,7 @@ config PPC
> > > >    	select EDAC_SUPPORT
> > > >    	select GENERIC_ATOMIC64			if PPC32
> > > >    	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
> > > > +	select GENERIC_CMDLINE
> > > >    	select GENERIC_CMOS_UPDATE
> > > >    	select GENERIC_CPU_AUTOPROBE
> > > >    	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
> > > > @@ -906,42 +907,6 @@ config PPC_DENORMALISATION
> > > >    	  Add support for handling denormalisation of single precision
> > > >    	  values.  Useful for bare metal only.  If unsure say Y here.
> > > > -config CMDLINE
> > > > -	string "Initial kernel command string"
> > > > -	default ""
> > > > -	help
> > > > -	  On some platforms, there is currently no way for the boot loader to
> > > > -	  pass arguments to the kernel. For these platforms, you can supply
> > > > -	  some command-line options at build time by entering them here.  In
> > > > -	  most cases you will need to specify the root device here.
> > > > -
> > > > -choice
> > > > -	prompt "Kernel command line type" if CMDLINE != ""
> > > > -	default CMDLINE_FROM_BOOTLOADER
> > > > -
> > > > -config CMDLINE_FROM_BOOTLOADER
> > > > -	bool "Use bootloader kernel arguments if available"
> > > > -	help
> > > > -	  Uses the command-line options passed by the boot loader. If
> > > > -	  the boot loader doesn't provide any, the default kernel command
> > > > -	  string provided in CMDLINE will be used.
> 
> I can't see how the above is supported in the generic builtin.
> 
> Taking into account that it is the default on powerpc, I'm having hardtime with that.

Hmm, so this ignores the built in changes. You just don't enable it, or you
don't add PREPEND or APPEND.

> Any feedback on the proposed changes I made on the 13th ? I know it is
> partly buggy but that was more for the principle. I can make clean working
> patch if it helps.


The reason I added it into the function parameters is because I can get free
type checking on the functions. If you use macro's then you don't know if the
function is compatible.

Daniel

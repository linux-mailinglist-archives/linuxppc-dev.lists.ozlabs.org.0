Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C23330EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 22:30:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw7fN4xfnz3cZF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 08:30:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=l6Pe5NJC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.73; helo=rcdn-iport-2.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=l6Pe5NJC; dkim-atps=neutral
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw7dr6Yl1z30HT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 08:29:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2621; q=dns/txt; s=iport;
 t=1615325393; x=1616534993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P29McQ6d/QFxrQq1EYKN884pwFzgqSORJbOcG1OnGCA=;
 b=l6Pe5NJC0EM+wArX2XuF3SCAWSS1pvYGiO+o6/EwFlQ+NkBd8NrQdmfv
 1Mx6J3gki7mHBW2rHjzR3hnpIVi1kq3cc3lmYWds10UDPUov4QPu4YlZ9
 JFoQ3DxBUvQNJYeAHItVw3Z66owqmOQw4qN0hXQy2ksZvR2PG0vEC3XkO w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BqAAC/50dg/40NJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTsHAQELAQGBdDWBTAE5jRaJPI9zilaBfAsBAQENAQE0BAE?=
 =?us-ascii?q?BgRSDNAMCAoF+AiU0CQ4CAwEBCwEBBQEBAQIBBgRxhW5DAQwBCAGFawEFMgF?=
 =?us-ascii?q?GEAsYLjwbBoYLrGd0gTSJEYFFFA6BFwGNQiYcgUlChCw+ihAiBIJGgRBLPXx?=
 =?us-ascii?q?XkSqMcJpwgRSDCYEfmnsxEKNitx8CBAYFAhaBVDqBVzMaCBsVgyVPGQ2OKxa?=
 =?us-ascii?q?ORyADZwIGAQkBAQMJhiCEEIM4AQE?=
X-IronPort-AV: E=Sophos;i="5.81,236,1610409600"; d="scan'208";a="874107942"
Received: from alln-core-8.cisco.com ([173.36.13.141])
 by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 09 Mar 2021 21:29:47 +0000
Received: from zorba ([10.24.4.5])
 by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 129LTj55006364
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 9 Mar 2021 21:29:46 GMT
Date: Tue, 9 Mar 2021 13:29:44 -0800
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210309212944.GR109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.4.5, [10.24.4.5]
X-Outbound-Node: alln-core-8.cisco.com
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

On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
> 
> 
> Le 09/03/2021 à 01:02, Daniel Walker a écrit :
> > This is a scripted mass convert of the config files to use
> > the new generic cmdline. There is a bit of a trim effect here.
> > It would seems that some of the config haven't been trimmed in
> > a while.
> 
> If you do that in a separate patch, you loose bisectability.
> 
> I think it would have been better to do things in a different way, more or less like I did in my series:
> 1/ Provide GENERIC cmdline at the same functionnality level as what is
> spread in the different architectures
> 2/ Convert architectures to the generic with least churn.
> 3/ Add new features to the generic

You have to have the churn eventually, no matter how you do it. The only way you
don't have churn is if you never upgrade the feature set.


> > 
> > The bash script used to convert is as follows,
> > 
> > if [[ -z "$1" || -z "$2" ]]; then
> >          echo "Two arguments are needed."
> >          exit 1
> > fi
> > mkdir $1
> > cp $2 $1/.config
> > sed -i 's/CONFIG_CMDLINE=/CONFIG_CMDLINE_BOOL=y\nCONFIG_CMDLINE_PREPEND=/g' $1/.config
> 
> This is not correct.
> 
> By default, on powerpc the provided command line is used only if the bootloader doesn't provide one.
> 
> Otherwise:
> - the builtin command line is appended to the one provided by the bootloader
> if CONFIG_CMDLINE_EXTEND is selected
> - the builtin command line replaces to the one provided by the bootloader if
> CONFIG_CMDLINE_FORCE is selected

I think my changes maintain most of this due to the override of
CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in powerpc is
an example of why these changes were created in the first place.

For example , say the default command line is "root=/dev/issblk0" from iss476
platform. And the bootloader adds "root=/dev/sda1"

The result is <prepend><bootloader><append>.

Then you have,

root=/dev/issblk0 root=/dev/sda1

and the bootloader has precedent over the default command line. So root= in the
above cases is defined by the bootloader.

The only issue would be if a person wants to override the default command line
with an unrelated bootloader command line. I don't know how many people do this,
but I doubt it's many. Can you think of any use cases like this?

I would imagine there are many more people who have to entirely duplicate the
default command line in the boot loader when they really just want to change a
single part of it like the root= device or console device or speed.

Daniel

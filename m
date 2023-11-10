Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64B7E77A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 03:41:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=IYkK6Zug;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNP7145Rz3d95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 13:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=IYkK6Zug;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRNNH3VKRz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 13:40:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0EAF4B81E01;
	Fri, 10 Nov 2023 02:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA8EC433C7;
	Fri, 10 Nov 2023 02:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1699584025;
	bh=oK/F0THfOnSL0dIVkI2dvSL2cmYdL74DCbYIUCPytVY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IYkK6ZugBoRE3kStmDD3GmhR9zqm8yZ3vHUbGYoOCSlruwYI7ljkYjxSGlsrcD8QQ
	 +HhHewygGeQvmOhB2RmnhHG//frOWRgIX3mOclFbvf9K+eDmzSdmzcGHyzLZWfRmXI
	 9GwjAQNlb6HVnqzAiwtQmJ6R3vAhvrJJdXMqjVAg=
Date: Thu, 9 Nov 2023 18:40:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Subject: Re: [PATCH 0/8] generic command line v6
Message-Id: <20231109184024.80bfe8119da8c99b4737f31d@linux-foundation.org>
In-Reply-To: <ZU2T3VPYosP+ZR1b@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
	<20231109175142.49428d5f51325680764663bf@linux-foundation.org>
	<ZU2T3VPYosP+ZR1b@goliath>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Rob Herring <robh@kernel.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Anderson <sean.anderson@seco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Pratyush Brahma <quic_pbrahma@quicinc.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Nov 2023 02:22:27 +0000 "Daniel Walker (danielwa)" <danielwa@cisco.com> wrote:

> On Thu, Nov 09, 2023 at 05:51:42PM -0800, Andrew Morton wrote:
> > On Thu,  9 Nov 2023 17:38:04 -0800 Daniel Walker <danielwa@cisco.com> wrote:
> > 
> > > This release is an up-rev of the v5 patches. No additional features have
> > > been added. Some changes were mode to function names and some changes to
> > > Kconfig dependencies. Also updated the config conversion for mips.
> > > 
> > > There are a number of people who have expressed interest in these
> > > patches either by asking for them to be merge or testing them. If
> > > people are so inclined please continue to request them to be merge
> > > or to ask the status of the next release. It's helpful to motivate me to
> > > release them again and for the maintainers to see the interest
> > > generated.
> > > 
> > > These patches have been used by Cisco Systems, Inc. on millions of
> > > released products to great effect. Hopefully they can be used by the
> > > entire Linux eco system.
> > > 
> > 
> > fyi, none of the above is suitable for a [0/N] changelog - it's all
> > transitory stuff which tells readers nothing much about what the
> > patchset does.
>  
> I did not think about it this way. It's because I've submitted this so many
> times. I guess I assume everyone knows what it is.

This is all on the path to the mainline git history.  Think about how
we want it presented to future readers.  10 years from now nobody will
remember the v5 series email spray.

> 
> > In [1/8] I see "Even with mips and powerpc enhancement the needs of
> > Cisco are not met on these platforms" and "This unified implementation
> > offers the same functionality needed by Cisco on all platform which we
> > enable it on".
> > 
> > Well OK, what are these needs?   What functionality changes does this
> > patchset offer which Cisco finds useful?  IOW, what were the
> > requirements?  What's wrong with the old code and how does this
> > patchset fix/enhance that?
> 
> The limitation is that you can't append and prepend to the command line at the
> same time in any of the architectures. Having access to both allows OEMs to deal
> with broken bootloaders which can't easily be upgraded.

I would never ever have guessed that from the emails I received!

> Others have responded
> that they also use these patches for this same reason.

Citing this info in the [0/N] would be useful.

> In 2/8 and 3/8 I modify the insert-sys-cert tool to allow modification of the
> command line append and prepend after the build. This allow for an SDK
> provided with a binary kernel and for the command line append/prepend to still
> be modified identically to how that's done with certificates.

And this.

> Making all this generic means each platform has a unified set of command line
> services. Cisco uses x86/arm32/arm64/mips/powerpc , and it's nice to have all
> the same features across platforms.

Sounds good.

> > 
> > I see the patchset updates nothing under Documentation/.  Should it do
> > so?  Could it do so?
> 
> The only documentation is Kconfig descriptions and commit messages. I suppose it
> could have something under Documentation/. The only part which could use more
> documentation are the changes in 2/8 and 3/8. That feature is maybe confusing
> and has limitations which are maybe not clear. Although the same limitation exist for
> inserting certificates.

Perhaps the new functionality could be described in
Documentation/admin-guide/kernel-parameters.rst

> > 
> > I don't know what is the expected merge patch for this work.  I can
> > grab them if no other maintainer is in the firing line.
> 
> merge patch ?

"path", sorry.

> Do you mean merge description ? I think your the maintainer in the
> firing line for this one.

OK.  

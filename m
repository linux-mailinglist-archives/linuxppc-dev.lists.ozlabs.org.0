Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B962D76B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 10:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCZrB480mz3fK9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 20:49:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sjDtqHkF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kees@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sjDtqHkF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCLq76cy2z3f3C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 11:47:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21FECB81F6C;
	Thu, 17 Nov 2022 00:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8FBC433C1;
	Thu, 17 Nov 2022 00:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668646047;
	bh=guj/solGyKYsGM3X50ye22aBLwCmKYGrl61AHGGkEhE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=sjDtqHkF0xLcJiWNqyyDHGsDobgvPbfsokLdvow1ubzRNPmvBoIvJzHi8Yvqb4Pia
	 HGnNQCiHG1RVXNT6hd1LZczDgT6F6qeXv8kJeuvGJn8/+br1/937HnYvk/G8IGtl+Q
	 ZFQtIA7mOoXoRnyX6MG86ilsJRRpQYAqs3JYwVGnUz8zmv/S71R/vUNqVudKP5d8I/
	 ngbo5GGVXMVg4tvgdFr9Scm7j09sy5k6AryrwAM5JfM8N31vtbPnEIZ3gh0dJd/VXg
	 XOgCVYXFpotxvKQyMUSDn+SRaAJK+w/ApIZQhMRnYYGss7TFYZd8CE/hTnB50vXpx1
	 xZriYx3JI13JA==
Date: Wed, 16 Nov 2022 16:47:27 -0800
From: Kees Cook <kees@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Kees Cook <keescook@chromium.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/3=5D_treewide=3A_use_ge?= =?US-ASCII?Q?t=5Frandom=5Fu32=5Fbetween=28=29_when_possible?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y3WDyl8ArQgeEoUU@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com> <20221114164558.1180362-4-Jason@zx2c4.com> <202211161436.A45AD719A@keescook> <Y3V4g8eorwiU++Y3@zx2c4.com> <Y3V6QtYMayODVDOk@zx2c4.com> <202211161628.164F47F@keescook> <Y3WDyl8ArQgeEoUU@zx2c4.com>
Message-ID: <0EE39896-C7B6-4CB6-87D5-22AA787740A9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Nov 2022 20:44:04 +1100
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, ydroneaud@opteya.com, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kerne
 l@vger.kernel.org, =?ISO-8859-1?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On November 16, 2022 4:43:54 PM PST, "Jason A=2E Donenfeld" <Jason@zx2c4=2E=
com> wrote:
>On Wed, Nov 16, 2022 at 04:31:18PM -0800, Kees Cook wrote:
>> On Thu, Nov 17, 2022 at 01:03:14AM +0100, Jason A=2E Donenfeld wrote:
>> > On Thu, Nov 17, 2022 at 12:55:47AM +0100, Jason A=2E Donenfeld wrote:
>> > > 2) What to call it:
>> > >    - between I still like, because it mirrors "I'm thinking of a nu=
mber
>> > >      between 1 and 10 and=2E=2E=2E" that everybody knows,
>> > >    - inclusive I guess works, but it's not a preposition,
>> > >    - bikeshed color #3?
>> >=20
>> > - between
>> > - ranged
>> > - spanning
>> >=20
>> > https://www=2Ethefreedictionary=2Ecom/List-of-prepositions=2Ehtm
>> > - amid
>> >=20
>> > Sigh, names=2E
>>=20
>> I think "inclusive" is best=2E
>
>I find it not very descriptive of what the function does=2E Is there one
>you like second best? Or are you convinced they're all much much much
>worse than "inclusive" that they shouldn't be considered?

Right, I don't think any are sufficiently descriptive=2E "Incluisve" with =
two arguments seems unambiguous and complete to me=2E :)


--=20
Kees Cook

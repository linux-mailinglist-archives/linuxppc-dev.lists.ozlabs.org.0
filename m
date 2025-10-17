Return-Path: <linuxppc-dev+bounces-12979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C983FBE6EC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 09:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnxDd4Gzrz2yMh;
	Fri, 17 Oct 2025 18:25:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760685921;
	cv=none; b=dBsDRHdRy/fKwv/9xBhHxBJSOZ1cJfvBTx0Y7Q/aqrKObcRCMC2dvGf/Gajt90qdA4Sw6SAI3ALgE4WtvdxhBQKHeebBrjKLhv0gC7n/PV2Yz81IMXCH/fuMa7Do7Kx5lZZAY5Hh4gzXvKVVQlro4oYWTTX5niV6Y0LStLB1qW7jegm0uAyt1e7TysflnLrRcb5Yw8XYU6VHQONZG5KuSmfLwRv2yXqn3w6PuFzC9qxZkbq9VbHMgRlZ6C7Yd8bIfjilA+bSg/NJ/xGI5bcYd5lHw1sAATm20we/+TTFLn/ElDkm2dtaHPIO+oriaCHejiiQLngE+MKPbV3qULy9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760685921; c=relaxed/relaxed;
	bh=r1okF/r1G2Aq/NygvlPws9Vet4d9RoZqKUMQ4Fcy+LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgaZPkgMwF0Ffm1qFP98RQuEvt3+b5fym323ldq59zarw34N/IPAGEAXjm7DfOJhnk60pm7Fjy20MG2B/9uuZSPDEgq8Aq7IsYLe6re6Rczd3rnbyoNSw5cQ86tzTAeLUT7GEvTYaFTxXsUgIVxojukrDsVqUZxHvt5bq9YlOIES4Ij8F50PbB1B6U1RimOL33gWdsfQUS5/TTbkPsvmTAMe7AE8kruWTAY3k9zVNe68aXCwAf6VeV1Zyj2WyuTksxosqlQh/fX/fen8jrB1Z0kBOQpkZz2LHM7hHuG9+0lCz08qcEFxxsDSE19ffqVvoEpRHAB8ZWZaRjBkEBo0zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bfkBtycp; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bfkBtycp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnxDc55WMz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 18:25:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 152A560223;
	Fri, 17 Oct 2025 07:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E14C4CEF9;
	Fri, 17 Oct 2025 07:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760685917;
	bh=22K/HNC17+AdCshY6tozqt4gBMDZnC30mupe9USAYQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfkBtycp+//lFf0d7xJxk1eV3PBv7U1NJ1XUQEWjZ8b1xNauWJVt7AQHleAr2ugkZ
	 k1eKJb8lGjyCAWPOz49IUgjDCzEwC73bksuXw8UUzOEhIYex6S0IataE/LY7GYT9T/
	 Xl4pLm6vhT9IE2ost8ZneYBiqK1Ijrytq6Oviwc4=
Date: Fri, 17 Oct 2025 09:25:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	debian-powerpc <debian-powerpc@lists.debian.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-stable <stable@vger.kernel.org>
Subject: Re: Kernel failing to build on 32-bit powerpc
Message-ID: <2025101758-appendage-postal-6d5e@gregkh>
References: <eb8a89e43f01a920244bde9252cbe4f5c0e2d75a.camel@physik.fu-berlin.de>
 <bd6fbf70-bf31-4b95-86db-68c0626a3338@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd6fbf70-bf31-4b95-86db-68c0626a3338@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17, 2025 at 08:49:06AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 16/10/2025 à 21:03, John Paul Adrian Glaubitz a écrit :
> > Hi,
> > 
> > could someone investigate the following build failure on powerpc [1], please?
> > 
> > In file included from /build/reproducible-path/linux-6.16.12/kernel/sched/build_policy.c:64:
> > /build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c: In function ‘is_bpf_migration_disabled’:
> > /build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c:893:14: error: ‘const struct task_struct’ has no member named ‘migration_disabled’
> >    893 |         if (p->migration_disabled == 1)
> >        |              ^~
> > /build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c:896:25: error: ‘const struct task_struct’ has no member named ‘migration_disabled’
> >    896 |                 return p->migration_disabled;
> >        |                         ^~
> > 
> 
> I guess 6.16.12 is missing commit cac5cefbade9 ("sched/smp: Make SMP
> unconditional")

6.16 is now end-of-life, so not much we can do there, sorry.

greg k-h


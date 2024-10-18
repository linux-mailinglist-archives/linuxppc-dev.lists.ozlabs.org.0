Return-Path: <linuxppc-dev+bounces-2374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 427709A42B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 17:42:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVTVV65Csz3blF;
	Sat, 19 Oct 2024 02:42:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729266162;
	cv=none; b=ft2VlXbppWXJ+HFMLEdC5XP6SXN6dfOOdjRo+X0iCXIMVFNdwMkjIra9vLDjBwXSkQixXAQZgvUNP4dOwry15BTqowd7ui65UcooZavz34Bk/wZ6jQqVvtaBJVFNpNGFlhy4l/UbZ37DpGBeAFV58zwY2a32y0uWzJT4BtXgIr1nOkCZ8fcIjqNEKsU0BMzTLZmd3jAKFxnsfMUjkT2Ptu6rWjxIzduGb44vGWWaUqVgmsGISHqRQQZt4y2gjgNaaccH94Lm73PefOUjLwwD6gn3WGrvSvS8yXObhmHCzuAKrBXNkPGV762K8SJ4R/tmbwV7we2EJvt9/0FDkFnKug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729266162; c=relaxed/relaxed;
	bh=PNHbKgQoTdI2HvVwv1DgCkNig4pcKJSmLd5MwaR3TnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WndtITRtVjkpe/BuoHeOtm1F5Dc9Md+obha1Q8wuGhT6C5eczZkInkjnyCxcZ6CpG52NX529XAF4cnuaWRIfmWbhcpd7wkT0vGKq9NA6F+R+FfzTqn5HyCvOt4WIJJ/BLLkdVX1A8TC/OsHI8NTNsQzKzBAVjNaDwryy3bF4QsDyokg20Lig5C56ev8SGfXCZZJfeSAMzViGSpTWy9PAs4GZXG57epg70+JQIxWYd+SspMNSch5dSieh8YXPeN0OTuDnOsmpvlv/gLy6tnLUgybtFclGUnNkpkjO6JOHh0n+hTlkj6CwVspWK2safs4qvlVZHFU6zQXM6EpIiR+KuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVTVR1jtkz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 02:42:38 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49IFck73006368;
	Fri, 18 Oct 2024 10:38:46 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 49IFchtv006361;
	Fri, 18 Oct 2024 10:38:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 18 Oct 2024 10:38:43 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, arnd@arndb.de,
        chentao@kylinos.cn, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.com
Subject: Re: [PATCH][next] powerpc/spufs: Replace snprintf() with the safer scnprintf() variant
Message-ID: <20241018153843.GJ29862@gate.crashing.org>
References: <ZxIcI0QRFGZLCNRl@mail.google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxIcI0QRFGZLCNRl@mail.google.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 18, 2024 at 09:28:19PM +1300, Paulo Miguel Almeida wrote:
> The C99 standard specifies that {v}snprintf() returns the length of the
> data that *would have been* written if there were enough space.

Not including the trailing zero byte, and it can also return negative if
there was an encoding error.  Yes.

Not that this matters at all for your patch, so why mention it?


Segher


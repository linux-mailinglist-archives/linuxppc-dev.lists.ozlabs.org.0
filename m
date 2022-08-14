Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDA591ED2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 08:58:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M57YW00FKz3c78
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 16:58:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FBQm4XOF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M57Xw0rJ6z2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 16:58:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FBQm4XOF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M57Xp2CvXz4x1V;
	Sun, 14 Aug 2022 16:58:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660460299;
	bh=sjM3KeJV4CuvwOwgnQ1pfbnXFj+g/VYTEIPKGdDvRaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FBQm4XOFExIEMd6+VdgE7l6J3fg+CdG4B5iTQGnLYEXqL1rTG8v/R1Mmg9smz9wxX
	 9jGzoapFZh5iILpPCYFl9HYa+60Kr5PhwxDe072zf+LAexo6RiGQXQsCM6eVEVBfrL
	 E8rM/E0+8FwAkrG5KeYgvmkLepz4wHaZ4HqBDKuymUKnBrbfqh/mGANQfsdk5ZMZya
	 NdsvppSLRvcjvLCUMUcZjpZr7Q4Usucpy9M8X2IdoSDOdRCA3qbBiw9HLhKAWwMkLm
	 8mux9nLSiGAKkrrg21dPclvKwTBDjnWWYV/e5kcsDKTStkPFru88eag1QtD4smopFs
	 hG5LWZYEkaRcg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-2 tag
In-Reply-To: <CAHk-=wiLWWteYdVgXuLv9TA3aGsUaKV8gS3WxBo+NHHn5ZHkPw@mail.gmail.com>
References: <87czd3d8ra.fsf@mpe.ellerman.id.au>
 <CAHk-=wiLWWteYdVgXuLv9TA3aGsUaKV8gS3WxBo+NHHn5ZHkPw@mail.gmail.com>
Date: Sun, 14 Aug 2022 16:58:17 +1000
Message-ID: <87zgg7b9bq.fsf@mpe.ellerman.id.au>
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
Cc: ndesaulniers@google.com, linux-kernel@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Sat, Aug 13, 2022 at 4:27 PM <mpe@ellerman.id.au> wrote:
>> [..]
>
> Btw, could you please fix whatever your email setup is, so that you
> have a proper name?
>
> Seeing that 'mpe' as a source in my inbox just makes me think it's
> spam and not real mail.
>
> My search for "git pull" will find it, so it's not a huge problem in
> practice, it's more of a "what is that garbage in my inbox - ooh, it's
> Michael Ellerman's badly configured email again"

OK.

cheers

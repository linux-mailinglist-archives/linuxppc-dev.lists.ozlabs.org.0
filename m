Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5336D2B72B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 00:54:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbN7x0B1jzDqH5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 10:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbN1j6ycFzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 10:48:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X0uDEdFR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbN1j4GPLz9sPB;
 Wed, 18 Nov 2020 10:48:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605656921;
 bh=fEjz5+ECM3NqIzdqNElQ+//tKFuS35GsQ/buYOjPLls=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X0uDEdFRObVJJ54zcMpTUtqlKdcaPC2hCj2Qd0czFF2R73iOZbIxvQEjeT1Zjk3cj
 zx0+gjfeyfAxQ4e2sJfv8UFkS7DGaX2kLKANEeMkk2fNOeNNU01jeyoBujKhuvP14t
 cMylf+vn5wpD4pWUOzKED4i5lN9cw2nKpTmNww0bDVOqMEqXfYzoGrCMTb/xdVZb6c
 hTJs7PyEJUjg6spdU0/f21LjXZySAdxhEgowfxnQOngKOCG3UPzFoSu759HYdvR/an
 MdnvrmqHdXFm2U0ZSfHsn4ybZOVoqB+R/xLJourOR4B3jsgipe0i7Q+kbqsdvUbWlM
 pCKB2CI4c6LmA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/3] Revert "lib: Revert use of fallthrough pseudo-keyword
 in lib/"
In-Reply-To: <20201117221629.GA4679@embeddedor>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-3-ndesaulniers@google.com>
 <20201117030214.GB1340689@ubuntu-m3-large-x86>
 <CAKwvOdk_sphJGQarEWJLzGZWkdzO9dqmcRmys3Retw3vn2Fwag@mail.gmail.com>
 <20201117221629.GA4679@embeddedor>
Date: Wed, 18 Nov 2020 10:48:40 +1100
Message-ID: <87ima335pj.fsf@mpe.ellerman.id.au>
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gustavo A. R. Silva" <gustavoars@kernel.org> writes:
> On Tue, Nov 17, 2020 at 11:10:26AM -0800, Nick Desaulniers wrote:
>> On Mon, Nov 16, 2020 at 7:02 PM Nathan Chancellor
>> <natechancellor@gmail.com> wrote:
>> >
>> > On Sun, Nov 15, 2020 at 08:35:31PM -0800, Nick Desaulniers wrote:
>> > > This reverts commit 6a9dc5fd6170 ("lib: Revert use of fallthrough
>> > > pseudo-keyword in lib/")
>> 
>> Gustavo, whose tree did 6a9dc5fd6170 and df561f6688fe go up to
>
> Mine.
>
>> mainline in?  I'm not sure whether you or MPE (ppc) or someone else
>> should pick it this series?
>
> I'm happy to take this series in my tree.  I'm planing to send a
> pull-request for -rc5 with more related changes. So, I can include
> this in the same PR.

I doesn't really seem like rc5 material to me, but that's up to you.

I'd rather not take it in my tree because there's a lot of changes in
lib/ and that's not my area. I'm happy for the two powerpc patches to go
via your tree.

cheers

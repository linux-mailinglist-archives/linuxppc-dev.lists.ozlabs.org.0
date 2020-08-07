Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3C23E610
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 04:50:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN8wv3xP5zDqw2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:50:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN8tD3wQYzDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 12:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dhSh9I1r; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BN8tB6BBWz9sSG;
 Fri,  7 Aug 2020 12:48:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596768484;
 bh=QRFFwrvNL4FQDFGUBy0JNMwo3nFLA/HqutlnKQMVW/o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dhSh9I1ri2FonyuPHS/F8UsbU8YslpXWUgV+59aSU8izqPVZFcVvvnqQn2xdP2TOY
 /RNDUiRCh7JFN5Ycv2Vx9h9uIEFeiNelm5CPpExh8U3MorVo6DwOAHE5df+cpiAa0M
 D6QK6DJxooFTd+QQiyNGHp35grROU/viuDczCAGWbt4VaLN50ua6psx3Fb835VATuX
 jRnDln6aEFGMumoNnnPqIOjZI8HnuVBT0Hnp+ia1iWj8j5jXQvTnecpxJmQAmbMmJ8
 UAoVjxITQZEF6QXJvoXvado7Os8gzW5Lfk0cnHoOubk/C835T30YoX5ikWeBGiMYNF
 LjFr4F0o7llPQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal: Move and simplify get_clean_sp()
In-Reply-To: <20200806092547.GA2544@infradead.org>
References: <04169f40c09682ce5747518268ca84285bc17fbc.1596703345.git.christophe.leroy@csgroup.eu>
 <20200806092547.GA2544@infradead.org>
Date: Fri, 07 Aug 2020 12:48:01 +1000
Message-ID: <87k0ybxjby.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@infradead.org> writes:
> On Thu, Aug 06, 2020 at 08:50:20AM +0000, Christophe Leroy wrote:
>> get_clean_sp() is only used in kernel/signal.c . Move it there.
>> 
>> And GCC is smart enough to reduce the function when on PPC32, no
>> need of a special PPC32 simple version.
>
> What about just open coding it in the only caller, which would seem even
> cleaner?

+1

cheers

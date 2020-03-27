Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C551953FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 10:28:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pc451t4pzDr5Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 20:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pc2C4S48zDr76
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 20:27:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=huhR/BkR; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48pc2B40kGz9sSQ; Fri, 27 Mar 2020 20:27:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48pc2B1ftsz9sSM;
 Fri, 27 Mar 2020 20:27:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585301234;
 bh=dlb0m7Fk8meHSxCl+WTdj4NeABKcGtWscGx3Qwjlkvk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=huhR/BkRCYXnIk2Auzeki/5Lr5oIo9BLvVGcNyElT8hYJcxPFnhnR/spbTxDWnxfz
 Q6PYR7nEOIqimcJ45Hxfw4d5MIj/0e2kO926K0B169ZD7aCOEUIZ2jtzpglw0VuukT
 fhb0Z7cI4ePY89e4a6ATVLCfdSt2ztUw6OC0hnaZ7p8JRN5hvH1l/HSZBJ8ai39Z24
 2lZrd778Ec+HWuHtQ+CGab/fcEuAtBl7MguqaunTEzpoEUfMBcj3vZ9Myn0kNpW+jA
 XBiNQwqDGi4BQwlCu7WlpfmYXZl8cRLPxnIgCRwetF0HT37YkZfxgYOYP/xE0qP1Nt
 WZm1a4eYq+4bA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alan Modra <amodra@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/vmlinux.lds: Discard .interp section
In-Reply-To: <20200227062750.GD32593@bubble.grove.modra.org>
References: <20200227045933.22967-1-mpe@ellerman.id.au>
 <20200227045933.22967-2-mpe@ellerman.id.au>
 <20200227062750.GD32593@bubble.grove.modra.org>
Date: Fri, 27 Mar 2020 20:27:19 +1100
Message-ID: <875zeqw3k8.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alan Modra <amodra@gmail.com> writes:
> On Thu, Feb 27, 2020 at 03:59:33PM +1100, Michael Ellerman wrote:
>> The .interp section specifies which "interpreter", ie. dynamic loader,
>> the kernel requests. But that doesn't make any sense, the kernel is
>> not a regular binary that is run with an interpreter.
>> 
>> The content seems to be some default value, this file doesn't even
>> exist on my system:
>>   00000000  2f 75 73 72 2f 6c 69 62  2f 6c 64 2e 73 6f 2e 31  |/usr/lib/ld.so.1|
>> 
>> So the section serves no useful purpose and consumes a small amount of
>> space.
>> 
>> Also Alan Modra says we "likely could discard" it, so do so.
>
> Yes, but you ought to check with the mimimum required binutils.  It is
> quite possible that an older linker will blow up.

OK, I guess I'll have to test.

> If the minimum required binutils is at least binutils-2.26 then
> passing --no-dynamic-linker to ld is a more elegant solution.

The current minimum is 2.21, though there's talk of increasing it to
2.23.

cheers

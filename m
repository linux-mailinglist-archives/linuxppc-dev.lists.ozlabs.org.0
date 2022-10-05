Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B29555F5333
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 13:14:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjBmb5DwPz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 22:14:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQR5HYB7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjBlc4c6gz2xrr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 22:13:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQR5HYB7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjBlR6ZKrz4xGd;
	Wed,  5 Oct 2022 22:13:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664968420;
	bh=9HmsuI6bN6wZ0OmFrg/5trofe++PshYJIEAHR8fCgZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oQR5HYB7QRlnc4kszi7gr/iQtJdEgryI8YUjeBqWlCZBpOvcMVvmCc+rfYL7dGWkj
	 dfR3MT2InRSmaLFJHvABjeSJqqrJgyaHOYTtUyi9EZoDN6b/k2MTKXWST46yHtdaSN
	 E8V0GCbPZ+DvQtaiyvvUaNFSUYGkLOLptHXvTBN39HN3wQ2iiHxWLN/BcpGjmRFja6
	 JvoFE1GhsAuH/wzYVfCSYOxo7f9H+ve2OmXAuSFFJxUxDuRSRBEljXzTMlory3KmKc
	 Gqzln2dVT42SqEfcmUtjMATNh5ySD9N9H6XFUqlQcf32Fb3A4I8GwZ7Q9SBHxpziZX
	 IlK/ThR/PX6lQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [Bug report] BUG: Kernel NULL pointer dereference at
 0x00000069, filemap_release_folio+0x88/0xb0
In-Reply-To: <Yzc8hJL6cqxXCKaJ@casper.infradead.org>
References: <20220927011720.7jmugevxc7ax26qw@zlang-mailbox>
 <YzYN4JqbKdxLd6oA@casper.infradead.org>
 <87wn9lei2x.fsf@mpe.ellerman.id.au>
 <Yzc8hJL6cqxXCKaJ@casper.infradead.org>
Date: Wed, 05 Oct 2022 22:13:35 +1100
Message-ID: <87bkqqplpc.fsf@mpe.ellerman.id.au>
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
Cc: linux-mm@kvack.org, linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Zorro Lang <zlang@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matthew Wilcox <willy@infradead.org> writes:
> On Fri, Sep 30, 2022 at 12:01:26PM +1000, Michael Ellerman wrote:
>> Matthew Wilcox <willy@infradead.org> writes:
>> >> [ 4681.238745] Instruction dump: 
>> >> [ 4681.238749] fbc1fff0 f821ffc1 7c7d1b78 7c9c2378 ebc30028 7fdff378 48000018 60000000  
>> >> [ 4681.238765] 60000000 ebff0008 7c3ef840 41820048 <815f0060> e93f0000 5529077c 7d295378  
>> >
>> > Running that through scripts/decodecode (with some minor hacks .. how
>> > do PPC people do this properly?)
>> 
>> We've just always used our own scripts. Mine is here: https://github.com/mpe/misc-scripts/blob/master/ppc/ppc-disasm
>> 
>> I've added an issue to our tracker for us to get scripts/decodecode
>> working on our oopses (eventually).
>
> Would you be open to changing your oops printer to do
> s/Instruction dump/Code/ ?  That would make it work without any other
> changes.

Yeah, we're the only arch that uses "Instruction dump".
For userspace instructions we already print "code".

I'll send a patch switching to "Code:".

cheers

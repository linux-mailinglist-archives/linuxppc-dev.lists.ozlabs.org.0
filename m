Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A597887603
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 01:19:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TVio18lC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1fvq14fLz3vg5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 11:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TVio18lC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1fv50cwfz3d2m
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 11:18:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711153137;
	bh=eNSZ3J4h9JLdPBKY4LazE6G9kzUQQlpJcfX+tZUCkaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TVio18lCfxydqx3yzcNv2bxclUkvz2zxdnrNks8sBmuS1vLyQbjFpTb8RD2Zvuvmy
	 VbwsQzY/Y3qjMUJ1LOKJGNIffIwJScZ0mMudGFP/o0AKMYke7YbYsh9GFDXfISMCM8
	 DLDnGWFKQ9rQ03k6yscoCM74459SzQrbcuG4IvVDWMGNwo2ELh7+SxZmjwSY/wUBcu
	 th+iW6lhKnQLegxNyN/lIUuNl1l0Rv9RxSsHmxPBtQlcmBJqY0i8cUhiel3Lvwvt4y
	 SnnqGwgvrK0RDR9nOJ6Js9q26sazD9zIqaX2jt6ADesvZrzkIeH4BI/ZXof1bPSNkf
	 KIvHphQKRLLYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V1fv36YRbz4wcq;
	Sat, 23 Mar 2024 11:18:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: Cannot load wireguard module
In-Reply-To: <Zf1sjAgBYCnJ7JEp@gondor.apana.org.au>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse> <87r0g7zrl2.fsf@mail.lhotse>
 <20240318170855.GK20665@kitsune.suse.cz>
 <20240319124742.GM20665@kitsune.suse.cz> <87le6dyt1f.fsf@mail.lhotse>
 <Zf1sjAgBYCnJ7JEp@gondor.apana.org.au>
Date: Sat, 23 Mar 2024 11:18:54 +1100
Message-ID: <8734shkdg1.fsf@mail.lhotse>
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
Cc: "Jason A.
 Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org, dtsen@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herbert Xu <herbert@gondor.apana.org.au> writes:
> On Wed, Mar 20, 2024 at 11:41:32PM +1100, Michael Ellerman wrote:
>>
>> This diff fixes it for me:
>
> Yes I think this is the correct fix.

Thanks, I'll send a proper patch next week.

cheers

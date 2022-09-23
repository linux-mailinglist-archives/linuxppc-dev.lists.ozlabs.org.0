Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF215E74E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:33:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkQW51Mbz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:33:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D94BPdt0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkPy17Y7z3c21
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:32:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D94BPdt0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYkPx0grJz4xFt;
	Fri, 23 Sep 2022 17:32:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663918357;
	bh=vAg13kkUAwcmuwZlIOVDfKNPCd4HvOHVCmBHDv87MLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D94BPdt0akJMcJ9h4Qjd+33YPq6C/frOXX4pCNsXs2Ado9C3AzLEDtXiRyXuTTmuw
	 lrJrbf/d+S9Gp3+4jE5FnqT/JJ9A3BijF7JOmCt67XkDf3Oj4YUecInhmGStyreFvr
	 BT6CZ0+xm5b+N8o7uU2dH86sqq0wmTPU0mbfJjcEWp+QyTTqw/7hapzjwlAcpq9Xbq
	 56LCqpFw0wsfEQ8LuAsEzONcqN5uuCT4BX3OHGCOhB2YY2HwjGfgX26R/ScjAZ2VeV
	 tOGDkCogadjlaoE0Z6HmfQEYemeF6kroyxKT7BJRbHjOzkueARWE0XhPGR4D2p8YWe
	 FAkzb18VspUkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 1/7] powerpc: use 16-bit immediate for
 STACK_FRAME_REGS_MARKER
In-Reply-To: <59dafd7a-c281-c1a3-668c-079e919a6605@csgroup.eu>
References: <20220919140149.4018927-1-npiggin@gmail.com>
 <20220919140149.4018927-2-npiggin@gmail.com>
 <59dafd7a-c281-c1a3-668c-079e919a6605@csgroup.eu>
Date: Fri, 23 Sep 2022 17:32:36 +1000
Message-ID: <87tu4yzgtn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/09/2022 =C3=A0 16:01, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Using a 16-bit constant for this marker allows it to be loaded with
>> a single 'li' instruction. On 64-bit this avoids a TOC entry and a
>> TOC load that depends on the r2 value that has just been loaded from
>> the PACA.
>>=20
>> XXX: this probably should be 64-bit change and use 2 instruction
>> sequence that 32-bit uses, to avoid false positives.
>
> Yes would probably be safer ? It is only one instruction more, would=20
> likely be unnoticeable.

Yeah "regshere" has definitely saved me some time over the years
starting at memory dumps.

I'd settle for 0xffffffff + "regs".

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5B4C3BEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 03:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z516qjHz3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 13:50:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YQRyLj7o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywg6h6Dz3bPD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YQRyLj7o; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K4Ywd1cHDz4xZq;
 Fri, 25 Feb 2022 13:42:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1645756978;
 bh=uy/+QxmmrhMRi+F2ioRtaNXPlP5t3+IxpHUFAACQloo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YQRyLj7oyDLvap2U8mAluCdHr657d10dlyGR+HL1+sdgSRLj4sUDSEhuwzwyz+sC2
 cffFVCyT8f7bewB6UnbBVkvCkoZIiUiXnE5mg/0PJiTz6BKj0ox29Kf4sjsrJefvB6
 9gM5KtQRlbVioiucM3xjQ+A6dwTcyMNRjIqkq3PfAawxtJMASuODmewXD2LWLJ7j2d
 H1UwTXxq+81TB7lyOm8iLe8zre2oveH2Bki5dzNM1LPdtanXfO4VjjRuVdvOnDaOqO
 fVEC2A7nrPXbRxwx0YQYThN/6WBrMn4s2JC8e67OqBQYAXv6hxuVyQOopjYL393ZlU
 rx7zjexbhcynA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Steven Rostedt <rostedt@goodmis.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 02/13] tracing: Fix selftest config check for
 function graph start up test
In-Reply-To: <20220224095316.67729e2b@gandalf.local.home>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <bdc7e594e13b0891c1d61bc8d56c94b1890eaed7.1640017960.git.christophe.leroy@csgroup.eu>
 <74775d33-2e54-96ab-4546-57eb2c9e50e0@csgroup.eu>
 <20220224095316.67729e2b@gandalf.local.home>
Date: Fri, 25 Feb 2022 13:42:54 +1100
Message-ID: <87wnhjoedt.fsf@mpe.ellerman.id.au>
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt <rostedt@goodmis.org> writes:
> On Thu, 24 Feb 2022 13:43:02 +0000
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>
>> Hi Michael,
>>=20
>> Le 20/12/2021 =C3=A0 17:38, Christophe Leroy a =C3=A9crit=C2=A0:
>> > CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is required to test
>> > direct tramp.
>> >=20
>> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>=20=20
>>=20
>> You didn't apply this patch when you merged the series. Without it I get=
=20
>> the following :
>
> Maybe they wanted my acked-by.

Yeah, I didn't want to take it via my tree without an ack. I meant to
reply to the patch saying that but ...

> But I'm working on a series to send to Linus. I can pick this patch up, as
> it touches just my code.

Thanks.

cheers

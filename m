Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5E6B21B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 11:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXQjL0YZDz3cMh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 21:41:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ABfIku5n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXQhN1hL9z3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 21:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ABfIku5n;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXQhJ1rbwz4xDl;
	Thu,  9 Mar 2023 21:41:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678358467;
	bh=JOranWlQUxdKWTryAeghnE9mf9wFbHpxiW71/MODDJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ABfIku5n1XU2ta3bxpnxk/d2MB/7uffzEEyB001lSwDlIqtEpJOTGaf6xqpVDYEiW
	 fK9JBxp4QBohdDgueJUUYU8t1P8cGbCX++DHsg+98Gg8Xvrbvz9Aiz7IaHaGa7bNpw
	 yIEzSCDZeI68oRzAsvwxByjZ7R3TmicCenr4LXbDKi6QRWyVltPsYIYkzwI97AUHkO
	 VUoI/4EKxsDzGm7TJBgxqMnu5vXB+XhbvCZwN969uonrzayZjGFo2UhKayv+lrjYaY
	 pnEHs97IvZo9R9YtTAKpLUz1vz7/H90lWNwRSXhBUG1qgy6HlBsx3wGNJgIgrz2oxv
	 bWnYPIQss+3Lw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Paul Gortmaker
 <paul.gortmaker@windriver.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
In-Reply-To: <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
 <ZAFHnaSN6F5ZYTO5@windriver.com>
 <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
Date: Thu, 09 Mar 2023 21:41:01 +1100
Message-ID: <87edpy1a2q.fsf@mpe.ellerman.id.au>
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Leo Li <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Fri, Mar 3, 2023, at 02:04, Paul Gortmaker wrote:
>> 01/03/2023 (Wed 14:23) Christophe Leroy wrote:
>>> Le 28/02/2023 ?? 18:51, Arnd Bergmann a ??crit??:
>>> Hope it clarifies how those reference boards are used.
>>
>> It was really useful input and gave an insight into how things get used.
>>
>> But let me put a slightly different slant on things.  If there is no
>> maintainer for the platform/architecture/CPU, then where is the
>> obligation for mainline to keep it up to date just for your company to
>> use the code/BSP as a reference?
>>
>> Do they continue to do this for one more year, or three or ...  ???
>> Does someone list themselves in MAINTAINERS for arch/powerpc/83xx ?
> ...
>>
>> If you see change 0123abcdef breaks boot on your platform, you have a
>> legit voice to gripe about it right then and there.  Don't wait!!!
>
> I think the answer here is that Christophe is already the only person
> that does this, so he is the de-facto maintainer for ppc32 regardless
> of whether he wants himself listed in the file or not:

Yes he is the de-facto 32-bit maintainer :)

He's listed as a reviewer on the converged 64-bit/32-bit maintainers
entry which is meant to reflect that:

LINUX FOR POWERPC (32-BIT AND 64-BIT)
M:	Michael Ellerman <mpe@ellerman.id.au>
R:	Nicholas Piggin <npiggin@gmail.com>
R:	Christophe Leroy <christophe.leroy@csgroup.eu>
L:	linuxppc-dev@lists.ozlabs.org

But we could add a separate 32-bit entry if people think that would make
things clearer.

Although I don't think we could run separate trees for 64-bit and
32-bit, there'd be too many conflicts, so in that way I think one entry
makes sense.

cheers

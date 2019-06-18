Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3DF498BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:06:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Scyp3cMvzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:06:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Scv03FCQzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:02:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="jN8u+t5m"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45Scty2wxwz9sBr;
 Tue, 18 Jun 2019 16:02:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560837770;
 bh=1ua8AxnSFGbmeRZ2O1z1wWr64nG/aauwxkcL742kDIY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jN8u+t5m4SKIu2gD0YZGvesqfBmLrEZzWGyMHgUn2HXPgyoyjyQyCTgUDa2QJ/g7n
 3o6Q7T4cUpV2BgJVRv+Fq/kp9exSjfiWlatMa4hae0heekBMiwD7g8wQe9tkbS7dFz
 6/Yxq30lUp0zrfiUkj00QG3ZMa/Ek6H33lBj17BpHd6idGBdlPoHMTMOdmQliUDLZK
 9KN/XbfAcqEgYImEkOJwJoOb23iqasQXg56ZK5Rn0x29GphCm36D7sGXERRriKWGvy
 LvtMhq43jkoDakvs/uilAdeGSpAa5C4xiY/B4aI5jqf63t812J8VQi9T6tHdahKEbA
 OuOrRMtqvfkTQ==
Received: by neuling.org (Postfix, from userid 1000)
 id 4D0E92A2538; Tue, 18 Jun 2019 16:02:50 +1000 (AEST)
Message-ID: <5f09710b3df41a873d05389fab31e9b716211d3c.camel@neuling.org>
Subject: Re: [PATCH 1/5] Powerpc/hw-breakpoint: Replace stale do_dabr() with
 do_break()
From: Michael Neuling <mikey@neuling.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Date: Tue, 18 Jun 2019 16:02:50 +1000
In-Reply-To: <20190618042732.5582-2-ravi.bangoria@linux.ibm.com>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-2-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Subject: Powerpc/hw-breakpoint: Replace stale do_dabr() with do_break()

Can you add the word "comment" to this subject. Currently it implies there =
are
code changes here.

Mikey


On Tue, 2019-06-18 at 09:57 +0530, Ravi Bangoria wrote:
> do_dabr() was renamed with do_break() long ago. But I still see
> some comments mentioning do_dabr(). Replace it.
>=20
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/kernel/hw_breakpoint.c | 2 +-
>  arch/powerpc/kernel/ptrace.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> b/arch/powerpc/kernel/hw_breakpoint.c
> index a293a53b4365..1908e4fcc132 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -232,7 +232,7 @@ int hw_breakpoint_handler(struct die_args *args)
>  	 * Return early after invoking user-callback function without restoring
>  	 * DABR if the breakpoint is from ptrace which always operates in
>  	 * one-shot mode. The ptrace-ed process will receive the SIGTRAP signal
> -	 * generated in do_dabr().
> +	 * generated in do_break().
>  	 */
>  	if (bp->overflow_handler =3D=3D ptrace_triggered) {
>  		perf_bp_event(bp, regs);
> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index 684b0b315c32..44b823e5e8c8 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c
> @@ -2373,7 +2373,7 @@ void ptrace_triggered(struct perf_event *bp,
>  	/*
>  	 * Disable the breakpoint request here since ptrace has defined a
>  	 * one-shot behaviour for breakpoint exceptions in PPC64.
> -	 * The SIGTRAP signal is generated automatically for us in do_dabr().
> +	 * The SIGTRAP signal is generated automatically for us in do_break().
>  	 * We don't have to do anything about that here
>  	 */
>  	attr =3D bp->attr;


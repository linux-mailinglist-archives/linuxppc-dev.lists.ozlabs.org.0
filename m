Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33CF169C49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 03:17:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qm0m2kZjzDqFL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 13:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QlyH4LwbzDqDZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 13:15:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=dmEZRWbe; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48QlyG0dVfz9sNg;
 Mon, 24 Feb 2020 13:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1582510502;
 bh=T10jB91g27CIda1DuAyao920kpjeZyWKNketNp+UJeI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=dmEZRWbeumV2C1GARdwbs2sht9CYu40Ktuuh3vhIbZyTTCvxo0lOOZmlzHljCwKeM
 87EK1xzoF8Y/Be60JflnKkvZk+KlbTEiQsx18N9/FWiibbbqUeO6L3PfXqNkHiBlEK
 XK+Hn8hFqEbbX0WOSL7v+tMPRG9NySbT0AUCdek2Bpiof/dx1ShSnUa0T7nXgJ4Fn7
 yRlfNhMXtJRiSuFVz8OmG0tbliSktD6TtSxH4MiFN8YdRKv1SUgChZVlqhwBpkPVQp
 jbCAGolpm4PhDI6rlKeFhd+3+Sfv3KVIohaig28oEVnBs6yxGYxJx3eM8RPoXwlNXQ
 3iEqX4BR21ySA==
Received: by neuling.org (Postfix, from userid 1000)
 id 0C9B12C026F; Mon, 24 Feb 2020 13:15:02 +1100 (AEDT)
Message-ID: <7b86733f81c7e15d81ab14b98c8998011ed54880.camel@neuling.org>
Subject: Re: [RFC PATCH v2 00/12] Reduce ifdef mess in ptrace
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Mon, 24 Feb 2020 13:15:01 +1100
In-Reply-To: <f62b0f67-c418-3734-0b07-65aea7537a78@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <f62b0f67-c418-3734-0b07-65aea7537a78@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe,

> Le 28/06/2019 =C3=A0 17:47, Christophe Leroy a =C3=A9crit :
> > The purpose of this series is to reduce the amount of #ifdefs
> > in ptrace.c
> >=20
>=20
> Any feedback on this series which aims at fixing the issue you opened at=
=20
> https://github.com/linuxppc/issues/issues/128 ?

Yeah, sorry my bad. You did all the hard work and I ignored it.

I like the approach and is a long the lines I was thinking. Putting it in a
ptrace subdir, splitting out adv_debug_regs, TM, SPE, Alitivec, VSX.
ppc_gethwdinfo() looks a lot nicer now too (that was some of the worst of i=
t).

I've not gone through it with a fine tooth comb though. There is (rightly) =
a lot
of code moved around which could have introduced some issues.

It applies on v5.2 but are you planning on updating it to a newer base?

Mikey

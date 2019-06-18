Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B7C498D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:20:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SdH453xqzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SdCX0yyhzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:17:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="eEMk/1Wu"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45SdCW5P9Fz9sNT;
 Tue, 18 Jun 2019 16:17:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560838631;
 bh=hjnDP1X53F9+JxiYVHuk5dMlaqbiLqfcJICtYM3IoQk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eEMk/1WuABimOGZcS3sBsCcicLTRiiwgpGP2oCzD0Iqnfv5MXEuAmg2CGUI+xR9SK
 5RGCb6hp9lCTRWcsF1ewHedu+gMsw8IEuLI82yZuqr9cewGo531bzjwALU/kWXcDsj
 GUyM3wfEMgQBo52csiOpeDNtsOr619ngd0oxTtiH4iD3Irsj25a6Ltqav1kkf0qd9E
 bprS72JfhXeVAw82GPHp6Y//lIajLSzDVd7ihoKquwyJwdPJQtyaYGfQ+Ecf53uOec
 38YFv1EFzx1fwsxZ3lsTHSttwY1lJO6M7s7QJEGBZx8m91ocFVR6eLl9L/2aXgp6p7
 CQ9TWY94XD/4w==
Received: by neuling.org (Postfix, from userid 1000)
 id A1CED2A2538; Tue, 18 Jun 2019 16:17:11 +1000 (AEST)
Message-ID: <85d5494d2a5d4a887e739c379105436e498217a8.camel@neuling.org>
Subject: Re: [PATCH 0/5] Powerpc/hw-breakpoint: Fixes plus Code refactor
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Ravi Bangoria
 <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Date: Tue, 18 Jun 2019 16:17:11 +1000
In-Reply-To: <2344165b-b55b-d1b9-fd96-e057500e8c74@c-s.fr>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <2344165b-b55b-d1b9-fd96-e057500e8c74@c-s.fr>
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

On Tue, 2019-06-18 at 08:01 +0200, Christophe Leroy wrote:
>=20
> Le 18/06/2019 =C3=A0 06:27, Ravi Bangoria a =C3=A9crit :
> > patch 1-3: Code refactor
> > patch 4: Speedup disabling breakpoint
> > patch 5: Fix length calculation for unaligned targets
>=20
> While you are playing with hw breakpoints, did you have a look at=20
> https://github.com/linuxppc/issues/issues/38 ?

Agreed and also:=20

https://github.com/linuxppc/issues/issues/170

https://github.com/linuxppc/issues/issues/128=20

Mikey

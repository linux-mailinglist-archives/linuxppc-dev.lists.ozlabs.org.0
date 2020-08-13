Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2A2431C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 02:36:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRngQ28bdzDqDG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 10:36:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRnd847RhzDqDG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 10:34:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=HhOcR7YS; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4BRnd82mCPz9sTM;
 Thu, 13 Aug 2020 10:34:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1597278860;
 bh=Gw7VVsJ2d97hEoQT2/IrMtb083WBl7oscdtuTTaF/kw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HhOcR7YSOYndHQKTIVpjvtXaYdBhd4HrOj5+BqmLxLxH0uLtk4uDrSEv4mxCOuqRY
 8P+Hy6Ppm7lDP1o6bMqH9P3P2215wQe2A+FnWwCPMNFtsR9yUzRpMGblaW0f7xoWTV
 zjtUlgQF5unu+PUx4Ya+CYNW/bW9JhmOIncVTOLprMxmTDG+R6NhgKVi6qf5rIcKbA
 znfs6AYrc38KcoeRarFOHkCuCzIETiWH/x9WflCHSHHE+pmbfJ04JtwIWLj8eT+RwO
 saFPHE9a//E1+mawizPtYCY0T4QpVZmZemgkY9gtzUpOvCKnXVSLUnipM/D6Wyk2iD
 zAVheDPyWeWXw==
Received: by neuling.org (Postfix, from userid 1000)
 id 2E2812C0D9B; Thu, 13 Aug 2020 10:34:20 +1000 (AEST)
Message-ID: <b6126dbf973fc8b45b150936e7a72e230ca4eac5.camel@neuling.org>
Subject: Re: [PATCH] powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4
 cores
From: Michael Neuling <mikey@neuling.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 13 Aug 2020 10:34:20 +1000
In-Reply-To: <87sgd3zyt6.fsf@mpe.ellerman.id.au>
References: <20200803035600.1820371-1-mikey@neuling.org>
 <87sgd3zyt6.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
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
Cc: grimm@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-08-03 at 22:41 +1000, Michael Ellerman wrote:
> Michael Neuling <mikey@neuling.org> writes:
> > On POWER10 bit 12 in the PVR indicates if the core is SMT4 or
> > SMT8. Bit 12 is set for SMT4.
> >=20
> > Without this patch, /proc/cpuinfo on a SMT4 DD1 POWER10 looks like
> > this:
> >     cpu             : POWER10, altivec supported
> >     revision        : 17.0 (pvr 0080 1100)
> >=20
> > Signed-off-by: Michael Neuling <mikey@neuling.org>
> > ---
> >  arch/powerpc/kernel/setup-common.c | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> This should have a Fixes: pointing at something so it gets backported.

Yes it should.

Mikey


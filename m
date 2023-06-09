Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C557B72AF9E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 00:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdtcz4H4rz3dyp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 08:57:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=npo+qrCH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=2001:470:683e::1; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=npo+qrCH;
	dkim-atps=neutral
X-Greylist: delayed 352 seconds by postgrey-1.36 at boromir; Fri, 09 Jun 2023 23:11:19 AEST
Received: from xry111.site (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd1gC164pz3f0G
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 23:11:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1686315913;
	bh=hT63nSeqfXe+w/wcTH/EVqDDlEdDBDYjRZhYbxbpM9E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=npo+qrCHsIrTavth6RFp9whOgzBlVXmzRzYXUH+dxBlx16fsDq62B5M0BsrtN4VtJ
	 1fdfpCWNVPfQBRPxlsk/T5jnywsDDxzlQF9T3tubgjW3v4DrYce6kTsX/rRJiWMx5i
	 hBEItCRBrPuBf/r8DMY+d6WFyBryIiRnxabHdAlU=
Received: from [192.168.124.11] (unknown [113.140.11.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 48AE16638D;
	Fri,  9 Jun 2023 09:05:09 -0400 (EDT)
Message-ID: <5de9d69817138f2ccae0867b5ccb602dcfa007a3.camel@xry111.site>
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Arnd Bergmann <arnd@arndb.de>
Date: Fri, 09 Jun 2023 21:05:07 +0800
In-Reply-To: <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
	 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
	 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
	 <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
	 <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 11 Jun 2023 08:56:39 +1000
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, llvm@lists.linux.dev, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-06-09 at 14:50 +0800, Tiezhu Yang wrote:

/* snip */

> > > > In musl, the documentation states that at least gcc-3.4 or
> > > > clang-3.2 are required, which probably predate the
> > > > __SIZEOF_LONG__ macro.

Indeed, I've digged some history and __SIZEOF_LONG__ was added into GCC-
4.3 (in 2008).  And I didn't realize the bitsperlong.h in tools
directory is a copy from uapi.

> > > > On the other hand, musl was only
> > > > released in 2011, and building musl itself explicitly
> > > > does not require kernel uapi headers, so this may not
> > > > be too critical.

> Only arm64, riscv and loongarch belong to the newer architectures
> which are related with this change, I am not sure it is necessary
> to "unify" uapi bitsperlong.h for them.

At least it will stop the engineers working on "the next architecture"
from adding an unneeded bitsperlong.h :).


--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

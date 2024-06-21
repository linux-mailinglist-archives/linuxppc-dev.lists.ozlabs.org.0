Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFC912003
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 11:04:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=Qu47D8D8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5BHz0rzcz30VF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 19:04:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=Qu47D8D8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5BHG300tz30VF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 19:03:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e2hpe1iGw8BtPBrOiCtpgk5Mrgh2fKvph5/Cmhjmvig=; t=1718960635; x=1719565435; 
	b=Qu47D8D8ETI8kUgSyfBYgrPj/d2enTx6rNDRZyLCnk3vR5h9yFpPqyisvU11iIMmMhU8tyOEAeE
	D5KgTfiSfuHCq+7nsrHP1/k1Fhp2HTLAkr0ot5CDwvepz09dtuL2VNtOVR2PJf10qRZnccBul4K/v
	F8hc+6nUYElXWxVSs7VPTehU1jokIxHFxjdkKg7MLIVx+6OgpG72cYKV3O4burNZ4TSaQpXJG2303
	zo/WGbRlxV159nFzRhzDs1zg8lI7JonsKGogclVNhtD3P7M1mpRTQ8ZGJ9cWTPSSXdxfbbDDK+tUN
	fbMVQMWbxmCi7zqETVLBS5LmRwywQOTvxAqw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sKaBO-00000002A8I-1bJM; Fri, 21 Jun 2024 11:03:46 +0200
Received: from p5b13a475.dip0.t-ipconnect.de ([91.19.164.117] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sKaBO-00000001fU8-2TCt; Fri, 21 Jun 2024 11:03:46 +0200
Message-ID: <a623c1979ac494d01977abe6dfc22e8381dc6e4f.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 07/15] parisc: use generic sys_fanotify_mark
 implementation
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, Arnd
 Bergmann <arnd@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-kernel@vger.kernel.org
Date: Fri, 21 Jun 2024 11:03:45 +0200
In-Reply-To: <ba14c4fb-e6a7-46b3-a030-081482264a99@app.fastmail.com>
References: <20240620162316.3674955-1-arnd@kernel.org>
	 <20240620162316.3674955-8-arnd@kernel.org>
	 <e80809ba-ee81-47a5-9b08-54b11f118a78@gmx.de>
	 <1537113c4396cd043a08a72bdca80cccfa2d54d9.camel@physik.fu-berlin.de>
	 <ba14c4fb-e6a7-46b3-a030-081482264a99@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.117
X-ZEDAT-Hint: PO
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, guoren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S .
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-21 at 10:56 +0200, Arnd Bergmann wrote:
> The patches are all independent of one another, except for a couple
> of context changes where multiple patches touch the same lines.

OK.

> Feel free to pick up the sh patch directly, I'll just merge whatever
> is left in the end. I mainly want to ensure we can get all the bugfixes
> done for v6.10 so I can build my longer cleanup series on top of it
> for 6.11.

This series is still for 6.10?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

Return-Path: <linuxppc-dev+bounces-4036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F279EE36D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 10:50:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y87526LqNz2ykt;
	Thu, 12 Dec 2024 20:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733997046;
	cv=none; b=c3nKmrgwo7gaLHHMAnd9jHkTtNTEk8YIrBT/qxNbaA+ay03foqBEfSlyTb3nVry6syTkZJZsAfUvwdj44j30kQm0ImwC/8ltU1EHfapN4PV4SQsB8GQN/IX1j9yykB1BxtDTojecj/sOlb22Xol/3sJDEZEhqwF8JKbTo3BUkThSSzdcbi1nwFuaj60DzyPSoNNhqQkdS9dGvMk5h9Z+MYollxrBk89kI8uriDXhC+mL+iaVMXRX0ps5egKBy4uZJLsenk0j0RVHxSq9EmSAlBygtazFQU5rxMG02+v5M9s7HpZhnycjyC8Tf2CbJJcYtjdFyH7fm3QpPz7KfqtWig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733997046; c=relaxed/relaxed;
	bh=5ZVXOHLNU1IgwdHLS4CkFOVVZZV6/GwfnLa6e8IEb7Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QnrIJZB5cPfMYtYy44DeYbuOgOtCzm23F146HpxNjzqcKH2BnkS4Ac5yXAOrp3/a3mwZxQXhG9V1Q6SOzzZYXjVf8AIvbmgfzmwYkr861DzPiZtyPUaiZgx7wTtfwcMKP6LmwTb5SSgFelxJauO98xx7mXGGXg1uMxuQQ5uYTvh2SOaVf61N1pRg3dvDdNUCt9K1G0BpIts8RfPi/TI0L2WEwuvaKIHpCqG9ivhasBsX65DrJhGsFOjlmrNQlIxitb6GxJn25u9izzth/IjbwJ+RX7sFHevm4xst5CVw3rZRvr/xJMbwPQ0qP8Hknhhawc29z4zJl3JcN4mBp1QvXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=WtKqXiZa; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=WtKqXiZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y874y3PQzz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 20:50:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5ZVXOHLNU1IgwdHLS4CkFOVVZZV6/GwfnLa6e8IEb7Q=; t=1733997042; x=1734601842; 
	b=WtKqXiZaGz7YRgk6elj7aL9Oupn4Uk1i2dFfcildcXYTtSPo6px4ml+/UzLLB+KZS/9OTvdI/6V
	E4nzvLotfbDq8opqxYW4bBfXRbkIhnvPXYY/AX80qfPE/w+hNmcjH/ocXJ97dqwFXMIBlBw3NxM0F
	a4Lt7oy7T1XL0vJ1X6ZdnV98gOm8wmtbh37UmumCnBHVIHngmd6TyFEW2ioOyVn/YtIRBCQQiTIMH
	k5Wqu8OGYzpkmezHbmtBlyTJjI4fkTHFIUWz+gvI739SNnQfo+cPof5d5IpcR4o1v5J7izQu58OVA
	skWAjon4r+yeBhLv8HV00bk7i01eoB6oxIWg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tLfq4-00000001o86-4B5W; Thu, 12 Dec 2024 10:50:33 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tLfq4-000000007H2-3DHh; Thu, 12 Dec 2024 10:50:32 +0100
Message-ID: <7a08b24bd66dd006be84334788ea224b30012a55.camel@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: arnd@arndb.de, geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Date: Thu, 12 Dec 2024 10:50:32 +0100
In-Reply-To: <a981939be1ad279ef11014d93446762cdaa93823.camel@physik.fu-berlin.de>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
		 <20241121083846.3648473-1-glaubitz@physik.fu-berlin.de>
		 <87sere7jyc.fsf@mpe.ellerman.id.au>
	 <a981939be1ad279ef11014d93446762cdaa93823.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.146.116
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

On Tue, 2024-11-26 at 14:27 +0100, John Paul Adrian Glaubitz wrote:
> > > Have you asked among the Amiga community whether they plan on discard=
ing
> > > your hardware? I think it's always ill-fated to ask for popularity of
> > > hardware on just the LKML. Most users are not on the LKML.
> >=20
> > I haven't because I don't really know anything about the Amiga
> > community, who they are, where they hang out, etc.
> >=20
> > Please cross post this to any Amiga folks you know, or tell me where I
> > should post it.
>=20
> I will.

I have started reaching out to the Amiga communities now. I didn't have tim=
e for
that before, but I am now on vacation and can therefore take care of this.

Please give them some time to respond. I will reach out to more communities
along the way.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


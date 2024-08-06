Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C21ED9499C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 23:00:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=TCEaXtkm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdm195HYHz3d89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 07:00:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=TCEaXtkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 225 seconds by postgrey-1.37 at boromir; Wed, 07 Aug 2024 07:00:06 AEST
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdm0Q4p1mz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 07:00:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T6JDY419PHDJASBPSckHBD2b4/Q/ZvCRIhoaRrLYSNM=; t=1722978006; x=1723582806; 
	b=TCEaXtkmkiOzPeZ+gH0aTx/Ky8n5aWhpJIYtlKDqd8dK1mfJ5qU//28bk/ATF92e6PTEWfRrINS
	ZFxQsy/abMufgyxan+ys/Jr8o3rrN5R86QBFA8fUC1ycb/EEz0lKasbufpk2CNIE/bz8xelZ1uCnX
	riSFKjb762J3OC4qsdQ6dq/P3WIQh1HJFSqkdyi+0xSqMPzyCH1KSg/uoJb9Idm9tkvmXmWGsCiKF
	nBD9ZVKDiKg7q79tiUeA0Yf71jKtv8LRk/kvSOMKfnyNbdS9ITfJsVm2W6EqBAFUx/J3uTN5D6yD6
	dOeQihcD/W3Dr74TeAJGKX826tdJtqn3BqRg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sbRE5-000000033cn-0E4R; Tue, 06 Aug 2024 22:56:13 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sbRE4-0000000149I-3Wlk; Tue, 06 Aug 2024 22:56:12 +0200
Message-ID: <7c3b1a46a379a3eaeff8d06944f0daf280cf5b58.camel@physik.fu-berlin.de>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Romain Dolbeau <romain@dolbeau.org>
Date: Tue, 06 Aug 2024 22:56:12 +0200
In-Reply-To: <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
References: 	<CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
	 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
	 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
	 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
	 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
	 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
	 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
	 <87eexbk3gw.fsf@linux.ibm.com>
	 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
	 <87mubxl82x.fsf@igel.home>
	 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
	 <87immlkytp.fsf@igel.home>
	 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
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
Cc: Andreas Schwab <schwab@linux-m68k.org>, PowerPC List Debian <debian-powerpc@lists.debian.org>, linuxppc-dev@lists.ozlabs.org, jjhdiederen <jjhdiederen@zonnet.nl>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, 2019-12-13 at 08:47 +0100, Romain Dolbeau wrote:
> Le jeu. 12 d=C3=A9c. 2019 =C3=A0 22:40, Andreas Schwab <schwab@linux-m68k=
.org> a =C3=A9crit :
> > I'm using 4K pages, in case that matters
>=20
> Yes it does matter, as it seems to be the difference between "working"
> and "not working" :-)
> Thank you for the config & pointing out the culprit!
>=20
> With your config, my machine boots (though it's missing some features
> as the config seems quite tuned).
>=20
> Moving from 64k pages to 4k pages on 'my' config (essentially,
> Debian's 5.3 with default values for changes since), my machine boots
> as well & everything seems to work fine.

Just as a heads-up: Starting with kernel 6.10, Debian has now separate kern=
el
packages for 4k and 64k page support for both ppc64 and ppc64el [1].

So, anyone who has run into this issue in the past has a chance to try agai=
n
with kernel 6.10.

Thanks,
Adrian

> [1] https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/chang=
elog?ref_type=3Dheads

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

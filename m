Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D96101309EE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2020 21:45:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rVyK3wLgzDqCs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 07:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=bertrand.dekoninck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZZ0jLEs"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rMRd0BY9zDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 02:06:31 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id d73so12511615wmd.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2020 07:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7wWNQDKWPaUR3cc4EkJBbn0nXh00OM+tS1Hj/Bki0mc=;
 b=nZZ0jLEsLRr9ZmSgmqOmdWyb/cG9bgnGqoBrVFCikrevfl9cNVeJ8Pwa0q/QwsWiTP
 HiDqdv7Dpcf+DVA7tpea0iqbdLMNIhVyz8wi2yWK+2cO+8g0DUbmxW3kw9IARxO8BCmF
 ceUy+G9bBsp3NdC6jYuYilmKo2asGPn4jT1qhXCKWz+AqOkfQRzGuLEyD2X4ceKZydLf
 vIQJ3vtQThXM0DAmIGFHmfRJunllJ1llOHPd1FaT2u+sK/f31l2LIbZRlzV/oSpY7e0L
 QeTrngPMdmI0bDk8f85uKM5mh9oseRRXw42qzjvCaW3lUfg1PUdJA0517qyJel1yFuuA
 2NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7wWNQDKWPaUR3cc4EkJBbn0nXh00OM+tS1Hj/Bki0mc=;
 b=flQ3x6CDkhrkKokzgxEm41b+ZgZg6FFk+33oVWRnTNdHVYaUNDmSKheWac1WpkI+bx
 IRVpm6o+6Vlu7h1TuMp5mc6GNhBAIsVe6tWCRn3TiYwCh1WjYOBTrHJoMl9xT41ZvTFN
 Wh4vOjK18/16h8r+5a2wdWO7eypl6GZFTEAD9HiYOCpqZ9rVfN4x0npus6qpCpm0QFMl
 LHVVJBB1YpwFqy1/fXmafcHvq1WswrlTVRdp8s4W2yJ0PiKY1MM1BEOn+7tlVJ+jv5fZ
 BYaU3ohOwnHTuj2YWBRgqfT7liGuctO+dmrbteaVrAwhUqnTu91raxW+j+74HxCW2cxZ
 nmLg==
X-Gm-Message-State: APjAAAUQKMDvB4LpQn8zNVkcHSIJT9NaIxGm0Ld9ugIj6wv4qb1k+6xo
 CURPITbXyb0pyzRjmzty39s=
X-Google-Smtp-Source: APXvYqxv1BkX64XoRPa9KD67oRmV5L+HTL6WIRTF/PBDjbt7ayA2H7RAskrgGQNURIvR4+FUDFOUvA==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr31681091wmb.42.1578236781968; 
 Sun, 05 Jan 2020 07:06:21 -0800 (PST)
Received: from ?IPv6:2a01:e35:2428:560:9ff:d80c:ce58:e03e?
 ([2a01:e35:2428:560:9ff:d80c:ce58:e03e])
 by smtp.gmail.com with ESMTPSA id z123sm19870495wme.18.2020.01.05.07.06.21
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 05 Jan 2020 07:06:21 -0800 (PST)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
From: Bertrand Dekoninck <bertrand.dekoninck@gmail.com>
In-Reply-To: <20191214103213.309bfbbb1f9c50fe47e733d9@zonnet.nl>
Date: Sun, 5 Jan 2020 16:06:19 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <B661D5F4-575C-4E64-BC68-537223FFB5B6@gmail.com>
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
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
 <20191214103213.309bfbbb1f9c50fe47e733d9@zonnet.nl>
To: Jeroen Diederen <jjhdiederen@zonnet.nl>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Mon, 06 Jan 2020 07:43:42 +1100
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
Cc: Romain Dolbeau <romain@dolbeau.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Le 14 d=E9c. 2019 =E0 10:32, Jeroen Diederen <jjhdiederen@zonnet.nl> a =
=E9crit :
>=20
> on my iMac iSight:
>=20
>=20
> grep CONFIG_PPC.*PAGE config-5.3.0-3-powerpc64=20
> # CONFIG_PPC_4K_PAGES is not set
> CONFIG_PPC_64K_PAGES=3Dy
> CONFIG_PPC_PAGE_SHIFT=3D16
> # CONFIG_PPC_SUBPAGE_PROT is not set
>=20
> I can't give you info about the G5 PowerMac 7,3 as it is not my =
machine.

I can now test on powermac 7,3 (with an ATI card)
How can I build a deb package of this kernel ? Or is there a package to =
download somewhere ?
Bertrand=

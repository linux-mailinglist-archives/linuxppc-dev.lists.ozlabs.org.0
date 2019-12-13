Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9C11DEE1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 08:49:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z2rD3V2QzDr4h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 18:49:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.44; helo=mail-wm1-f44.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z2pH0J68zDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 18:48:04 +1100 (AEDT)
Received: by mail-wm1-f44.google.com with SMTP id p9so5214471wmc.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 23:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+ayxr0lOza+uYjY31HOngilfBPcaq2kPB0ceYtxeR/Y=;
 b=YSnwTzdFQRv6VD0CDZoFNIKxDdNU7V3S6QLe0xKviQQfzMujbymmqxfb3Lx/DM0SiG
 Pu5fo8IWDFD6mIqslkwJ/G30I0t6sGMshOxeDwzTHG8PxU3zrGetFVZvflKDrGp6+Rpa
 zDiWNbGYzZSUEDN0sKQVhiNlEGzeAOM7o1A6Fg0dXEw8nZnp7uzGx/3xWkLdF26JaD2S
 ejvEmfZoBGGr6+nU0uhGlW/2rsW/fhkaaWBAJcrzM2UjQeeFT1bQfDC2Cbb0Fr6hHGQx
 PQGV6V9uzaOwA1fTGxOe8Vfacn/WeVyY5XpjDfDUIc7oxWZJlpeYK+xODuqv2tWaZTle
 VuBA==
X-Gm-Message-State: APjAAAUWEEDqY0dn2UJ7rzgPfjkF2IUEJYyeOc7WRkRmrPq/HVr5Gz6K
 X7bOOTj4P0GArlKQvhX/1XbvxSPJZeJWZg17Xq3z4w==
X-Google-Smtp-Source: APXvYqwnLeAV/nWNDNx7DvQzT7KFIZv7WFv3Usz53j5GBa2rixyAbY3PXfOrePPTCjsVbS3EsC1ZcYVTycvCafDvW+E=
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr11371699wmj.106.1576223280225; 
 Thu, 12 Dec 2019 23:48:00 -0800 (PST)
MIME-Version: 1.0
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
In-Reply-To: <87immlkytp.fsf@igel.home>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Fri, 13 Dec 2019 08:47:49 +0100
Message-ID: <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
Subject: PPC64: G5 & 4k/64k page size (was: Re: Call for report - G5/PPC970
 status)
To: linuxppc-dev@lists.ozlabs.org, 
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 jjhdiederen <jjhdiederen@zonnet.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le jeu. 12 d=C3=A9c. 2019 =C3=A0 22:40, Andreas Schwab <schwab@linux-m68k.o=
rg> a =C3=A9crit :
> I'm using 4K pages, in case that matters

Yes it does matter, as it seems to be the difference between "working"
and "not working" :-)
Thank you for the config & pointing out the culprit!

With your config, my machine boots (though it's missing some features
as the config seems quite tuned).

Moving from 64k pages to 4k pages on 'my' config (essentially,
Debian's 5.3 with default values for changes since), my machine boots
as well & everything seems to work fine.

So question to Aneesh - did you try 64k pages on your G5, or only 4k?
In the second case, could you try with 64k to see if you can reproduce
the crash?

To Jeroen - is your iMac booting with 4k or 64k pages? Same question
for the crashing G5, though I assume the answer is going to be 64k
there.

Thanks & cordially,

--=20
Romain Dolbeau

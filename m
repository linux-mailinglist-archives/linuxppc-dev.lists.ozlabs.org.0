Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7882131786
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 19:32:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s3yx1NRZzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 05:32:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s3wK58Z0zDq6B
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 05:30:24 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id p17so16355217wma.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2020 10:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g/RartWOl0059XZqhmJOiYt+dbyuAnAwhtlap3FKPto=;
 b=QQZNeSUsSOT4PH69Gm+mYcLiXihnJP/3aIF4rP5GH38ZJeYosxwbO/aGYDQaoN7kTn
 uCStEtFZmsgFhEaCxy+X4Xb2rWfTLtDphgD+x9p6+SS4wkVZz97riMt3y/8qwDcyI2YI
 fVRLpeiRrHCq9v+RxqsOGQ/ntWvTJlgBXh31/zxtanLNbL3qqbdhAwYfGDGrgSgPf3s8
 Ue1Z9VnJWz97qeCcRradWRYv5nEaCmde86EIhaFwVAYOqFTg7m1ZCRJH9ti/lxHdtCMU
 I7fJNVYQ/AKxblWAqFEIuchHB1gVBclQdXZer0bQtNlEZzlIVi8xVRVVQTdJ9/TlusG6
 8vfQ==
X-Gm-Message-State: APjAAAU7rVrdo4octYWgUoU4N7ODwGPROMw+vF4tFZH9AO8h9ijSfbW+
 ymJjqIlBPDatWYKkdTOJhrsvNN8wguAnKOO4sU4=
X-Google-Smtp-Source: APXvYqxY1V+lkPFFro+8jvQrah2cT1oFYclC9mt44LvPrSmfKh3qD0LeuXdbF6TJDO4CbwBFK77RQql5nkTc8uH/g5M=
X-Received: by 2002:a7b:c775:: with SMTP id x21mr35974536wmk.59.1578335421857; 
 Mon, 06 Jan 2020 10:30:21 -0800 (PST)
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
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
 <20191214103213.309bfbbb1f9c50fe47e733d9@zonnet.nl>
 <B661D5F4-575C-4E64-BC68-537223FFB5B6@gmail.com>
In-Reply-To: <B661D5F4-575C-4E64-BC68-537223FFB5B6@gmail.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Mon, 6 Jan 2020 19:30:10 +0100
Message-ID: <CADuzgbpiN-=VgmZCHOyXFDEuj2L+aVzJGfibkvgfnPD_atNZMw@mail.gmail.com>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
To: Bertrand Dekoninck <bertrand.dekoninck@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jeroen Diederen <jjhdiederen@zonnet.nl>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le dim. 5 janv. 2020 =C3=A0 16:06, Bertrand Dekoninck
<bertrand.dekoninck@gmail.com> a =C3=A9crit :
> I can now test on powermac 7,3 (with an ATI card)
> How can I build a deb package of this kernel ? Or is there a package to d=
ownload somewhere ?

I usually cross-compile on x86-64 from upstream sources. On a Debian
Buster with the powerpc tools installed,
it's just:

#####
make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu- oldconfig && nice
-19 make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu- -j56
bindeb-pkg
#####

(alter the -j56 for your own build system). For the dependency, as far
as I remember I only needed "gcc-powerpc64-linux-gnu" and
dependencies. My '.config' is Debian's 5.3 plus default values for
changes - with the exception of 4 KiB pages.

I've also uploaded the working kernel with 4 KiB pages DEB here:
<http://dl.free.fr/otB1KMEMR>, as it might be easier for a quick test.

Cordially,

--=20
Romain Dolbeau

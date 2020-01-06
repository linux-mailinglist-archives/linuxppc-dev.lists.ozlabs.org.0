Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E6913186C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 20:13:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s4tQ5DCkzDqDx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 06:13:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s4rN4BZxzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 06:12:01 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id d16so50948143wre.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2020 11:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZoPfe1P6lSeMrhGTugYHJnXak3lCaehfKQYVUQ225Dg=;
 b=qRJ8FC8Odaw5tRli3qOBwwr97bs5rML5sJeq3hEigXZsbpvt2Gs4A0z2MXwonuATTS
 hGuBjaI7uza6JIvwUuY5ZjeQFXGJTDWN8XDtj87B1u1YOGlPyjJiWRCxpnlcVrBwBq0w
 MmLxp1Snt5eTdBcK+sgMItOMuHh9w9yWpmnQLhXiCGfqg2fvFvK4uBEKiwvojpft2B1A
 UpAkmfI3iDLdQCogOzpheCPZn8r0ILUIOTxcSrFs31U2HwEql0SayzDqIlZdeCKf0y77
 bwLk73WyHsSIieFmiOWm3xiGRlLW2UX7kP+RfdA8ztoswUe35Rdk2rDEvMJfbtT2AdP9
 sM1Q==
X-Gm-Message-State: APjAAAUblFtaaHKSwH2Mou9ZOKkcu20rJW+A07JAipS7R7eFRIfbQs2n
 BsHZl4keo0/4OOoOVTi5/tjAyBwWh3YUqAuppDcmfZ9v
X-Google-Smtp-Source: APXvYqw/xcqT2Ck6RFo8Yf5MVEzoCRBnXV9GYS3rtMJT63yWTAcFFLjqvRCOMtC9MjAbX6Hr2P/KJuxh2uQn05YRWrQ=
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr104372063wrw.311.1578337918735; 
 Mon, 06 Jan 2020 11:11:58 -0800 (PST)
MIME-Version: 1.0
References: <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
 <87mubxl82x.fsf@igel.home>
 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
 <87immlkytp.fsf@igel.home>
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
 <87lfr62tbf.fsf@linux.ibm.com>
 <CADuzgbq3V0F=vob-tB=rroBaLwNR4viS2-=39TRBMyQwdj+xuw@mail.gmail.com>
 <874kx81xxt.fsf@linux.ibm.com>
 <CADuzgbqtn7knixB+tO3m-r0m7fDDQXVA=z2EtGxsfQ_GjD0h7Q@mail.gmail.com>
 <20200106185437.z2aiq3v4zxqmy2x4@csclub.uwaterloo.ca>
In-Reply-To: <20200106185437.z2aiq3v4zxqmy2x4@csclub.uwaterloo.ca>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Mon, 6 Jan 2020 20:11:47 +0100
Message-ID: <CADuzgbrw911a45Ep14vVO9WLBryp+DLTX5d5q3_ENDUrpGrpXQ@mail.gmail.com>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
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
 jjhdiederen <jjhdiederen@zonnet.nl>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le lun. 6 janv. 2020 =C3=A0 19:54, Lennart Sorensen
<lsorense@csclub.uwaterloo.ca> a =C3=A9crit :
> Is it possible this has to do with nouveau and not supporting 64K page
> size on older nvidia chips?

Interesting idea (and I have a 6600 aka NV43 in there, indeed) but I
don't think so, as
a) 'nouveau' works in 4.19 with 64 KiB pages
b) using "module_blacklist=3Dnouveau" doesn't help, I just tried
c) my original 'bisect' was probably using 'nouveau' when the kernel
was booting, so at least some 5.x w/o the offending commit and 64 KiB
pages is fine
d) to my untrained eye, the crash happens _before_ nouveau is loaded
(it seems to me I'm still on the OpenFirmware framebuffer, font change
occurs later).

Unfortunately I don't have a PCIe OpenFirmware ATI card to test the
theory further.
(... well I _do_ have a Sun XVR-300 ... technically it fits the bill ... )

Cordially,

--=20
Romain Dolbeau

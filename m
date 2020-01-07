Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6B132E8E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 19:36:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sh0g6crkzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 05:36:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sgyk1KRBzDqJT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 05:34:37 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id c9so543884wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 10:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8TA0V4Dca+gPuRlZOy6BfS0JhdBbxKB77ud06+vEv1g=;
 b=JhVqO6ZE+xDurfb75Ozv3FPZ/kvwTLE23UYzTRAdgx1Cb+4cYIBy8A8pMtJr9Qa8vJ
 pt0CJxGmrDdfKP4Dix1lq62u5cG5ajF7p1d8aClwCEmOrAZYhuXyNHjdvxuMlIBbDBMY
 eIqw5wl4DB7uatVS/46+rnyD77rzLjAxCnxosOMIFLDROftQGCqZ3dvdttk+3FU7cdJT
 PmId10UddtkFDx0bab8AXzMrSj0RFBezHbw6r2vCKsnLH7guKE2fjlGlwg9DcMd8c75z
 fVTBAu9E+Ifn2WWKAR3RW0ycl4BzNuTZx05Delpw/FY1My3Pud17+ZnoMNMj1JQVNu10
 NfRg==
X-Gm-Message-State: APjAAAXbCOgTIpCPreuketFDJQBKqsrirh/KWxCcSWfIkB1rG/xH35XV
 P2BkFklkmOwBAhCyLpJ9LX68srttyejt+mIYjB4=
X-Google-Smtp-Source: APXvYqwH0ZzYWIYtj7UrX9+lnsGIA+1X401Xc311caiVJjpyomhFN1bGygg9RgmkFqv2I61D/V7VrLCH8akkjez4API=
X-Received: by 2002:a05:6000:1047:: with SMTP id
 c7mr405581wrx.341.1578422074120; 
 Tue, 07 Jan 2020 10:34:34 -0800 (PST)
MIME-Version: 1.0
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
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
 <CADuzgbpiN-=VgmZCHOyXFDEuj2L+aVzJGfibkvgfnPD_atNZMw@mail.gmail.com>
 <709f10b0-6b7f-8de2-3fac-1f4f6350afaf@gmail.com>
 <CADuzgboKYD2CeXODpEH5Vboov4gr0fPG8ZmCTaqWw-3ve53MiQ@mail.gmail.com>
 <113ee36c-684f-9201-aea8-8cd437b6d009@gmail.com>
In-Reply-To: <113ee36c-684f-9201-aea8-8cd437b6d009@gmail.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Tue, 7 Jan 2020 19:34:22 +0100
Message-ID: <CADuzgboztYeRbruGmQDuTScaLAZp2ozoy-KARtNq1ViyTm86jw@mail.gmail.com>
Subject: Patch for '5.3.7 64-bits kernel doesn't boot on G5 Quad' found (was:
 Re: PPC64: G5 & 4k/64k page size)
To: Bertrand <bertrand.dekoninck@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000008cbb2059b9107d4"
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

--00000000000008cbb2059b9107d4
Content-Type: text/plain; charset="UTF-8"

Hello all,

Great news: Aneesh sent me a patch that solves the problem on my G5 Quad :-)

I don't know whether he considers it a 'workaround' or if it's the
'proper' patch for upstream, so beware. It's a one-liner so I attach
it to this message: those affected can test it as well to confirm if
that indeed solves the problem for them as well.

If it is the 'proper' patch, I expect it should get into upstream
pretty quickly. Then Debian should be able to trivially backport it to
their PPC64 kernel, and the G5 will still be a great machine in 2020!

Thanks everyone for your help in tracking down the bug & to Aneesh for
finding a fix :-)

Cordially,

-- 
Romain Dolbeau

--00000000000008cbb2059b9107d4
Content-Type: text/x-patch; charset="US-ASCII"; name="g5.patch"
Content-Disposition: attachment; filename="g5.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k547ltic0>
X-Attachment-Id: f_k547ltic0

ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvbW11LWhhc2gu
aCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvbW11LWhhc2guaAppbmRleCAx
NWI3NTAwNWJjMzQuLjUxNmRiOGEyZTZjYSAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9tbXUtaGFzaC5oCisrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ib29rM3MvNjQvbW11LWhhc2guaApAQCAtNjAxLDcgKzYwMSw3IEBAIGV4dGVybiB2b2lkIHNs
Yl9zZXRfc2l6ZSh1MTYgc2l6ZSk7CiAgKi8KICNkZWZpbmUgTUFYX1VTRVJfQ09OVEVYVAkoKEFT
TV9DT05TVCgxKSA8PCBDT05URVhUX0JJVFMpIC0gMikKICNkZWZpbmUgTUlOX1VTRVJfQ09OVEVY
VAkoTUFYX0tFUk5FTF9DVFhfQ05UICsgTUFYX1ZNQUxMT0NfQ1RYX0NOVCArIFwKLQkJCQkgTUFY
X0lPX0NUWF9DTlQgKyBNQVhfVk1FTU1BUF9DVFhfQ05UKQorCQkJCSBNQVhfSU9fQ1RYX0NOVCAr
IE1BWF9WTUVNTUFQX0NUWF9DTlQgKyAxKQogLyoKICAqIEZvciBwbGF0Zm9ybXMgdGhhdCBzdXBw
b3J0IG9uIDY1Yml0IFZBIHdlIGxpbWl0IHRoZSBjb250ZXh0IGJpdHMKICAqLwo=
--00000000000008cbb2059b9107d4--

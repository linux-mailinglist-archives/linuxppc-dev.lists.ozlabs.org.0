Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D7B13081C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2020 14:06:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rJn23NckzDqCG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 00:06:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.53; helo=mail-wr1-f53.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rJjV2N2bzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 00:03:24 +1100 (AEDT)
Received: by mail-wr1-f53.google.com with SMTP id c14so46677797wrn.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2020 05:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1fLYOEO/tr0IETZ8oWwkKu5Gb5YKQ7VJXAAU2pL9QtY=;
 b=Y7P3OvNbu3KU4ijH3J9QznStXFkFz2pvMj21psVevoz0I/WyhlDQq8nbN30IfL+rVg
 avqOca6JHsITuShJpUbaKasE7SdwMb9f5o1ESu1NaRmMhsMm2nt7wTQ/g9eBztiDDAI7
 ZyN3K6ri0zIbPb5yN5QpecyC+gmRpsU76xDR3xHIM9hvys/6DRSoc2bj64dBMvR2aNfa
 qLh/1NJjl3ra45ZoMyyQ1OAhU4+/DtubGxUMbVmg/OnZDuBeALRsFAKC8/iEJqHuq9iC
 WHlTvcCPpS+I+fiJlN3BLSFF7eS8+9nCJqEvJcZ6/ryzyz9/OtLsH9jvpFV1yvvbeghi
 Cj4A==
X-Gm-Message-State: APjAAAXxQviSgmCfj1+NldrpTz/Up58M2W+Tlff8yV6HJr4/GKIfohHR
 vfWO3Wccxyapv5TiX9H7GxvxXa/5W0evIRsTXwg=
X-Google-Smtp-Source: APXvYqzJHdfg/8eELrn7tL8U+WfCS+6JQqwbqevOxhJZeTug3iW5MPb5zhqzojBXyOcn1Qi1qvcFsebDarsZ7I2yBX4=
X-Received: by 2002:a05:6000:1047:: with SMTP id
 c7mr101318463wrx.341.1578229401639; 
 Sun, 05 Jan 2020 05:03:21 -0800 (PST)
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
 <87lfr62tbf.fsf@linux.ibm.com>
In-Reply-To: <87lfr62tbf.fsf@linux.ibm.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Sun, 5 Jan 2020 14:03:10 +0100
Message-ID: <CADuzgbq3V0F=vob-tB=rroBaLwNR4viS2-=39TRBMyQwdj+xuw@mail.gmail.com>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: jjhdiederen <jjhdiederen@zonnet.nl>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le sam. 21 d=C3=A9c. 2019 =C3=A0 05:31, Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> a =C3=A9crit :
> I don't have direct access to this system, I have asked if we can get a r=
un
> with 64K.

OK, thanks! Do you know which model it is? It seems to be working on
some systems,
but we don't have enough samples to figure out why at this time, I think.

> Meanwhile is there a way to find out what caused MachineCheck? more
> details on this? I was checking the manual and I don't see any
> restrictions w.r.t effective address. We now have very high EA with 64K
> page size.

Sorry, no idea, completely out of my depth here. I can try some kernel
(build, runtime) options and/or patch, but someone will have to tell
me what to try,
as I have no ideas.

Cordially & Happy New Year!

--=20
Romain Dolbeau

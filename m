Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B492511A501
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 08:22:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XpK60jWCzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 18:22:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XpH33FbHzDqjv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 18:20:15 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id n9so5834555wmd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 23:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0IGEKOX80mWd/tAnrQpu7UJ2fkPQRSvZdDK4BowFsHo=;
 b=nDNaN0TSsFxskZDcVXx4DtJiHphzPjbK+u8gsU/TLJrMW/3uflW5UuZ6vaBHOpnDT2
 fM2NV/0nPMgO5m/jIdOofh4G4Ek/WVX5qP+psjDCDb2+piB/SCz8vYabSGSVKE+xT33F
 a0Ya21CBLcmHtpMM9I7OLiyav3ND1Lvn0pq2QCBqVO81RHqiSHGeNfHvjOmBcVN5pf80
 PlRE85i1ZnB/HuLpZo99+CsTWxjSHGDlmIqMkXQZGAeO6N6B7k9eeY0tMLrK9ZuDOxC5
 Eooroh3bCZ3uhpb5TDSz3qJACmw3uIB7yCFKxWkE5q80G53mb/kCMGcA41bZtau7qZxK
 FFsg==
X-Gm-Message-State: APjAAAWvUIy8ZUgQqmeL5+iL3N/A4KuFVy5e3wE9oME2x09D+7H66LUe
 0/98GY8Kqo87XET/UFgU2aYeG3h5DJEyn2pIMOQ=
X-Google-Smtp-Source: APXvYqypUTpXiAsTO/PelgqAnB9ENCDtpdO4/KQu3kTfjaWkGDOSHTCXu3hXohQ6KqGvFTF7tAUJ2ZFGFTMTvlbaU14=
X-Received: by 2002:a05:600c:2318:: with SMTP id
 24mr1760131wmo.48.1576048811398; 
 Tue, 10 Dec 2019 23:20:11 -0800 (PST)
MIME-Version: 1.0
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
 <87eexbk3gw.fsf@linux.ibm.com>
In-Reply-To: <87eexbk3gw.fsf@linux.ibm.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Wed, 11 Dec 2019 08:19:59 +0100
Message-ID: <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
Subject: Call for report - G5/PPC970 status (was: Re: Found the commit for:
 5.3.7 64-bits kernel doesn't boot on G5 Quad [regression])
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
Cc: PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le mer. 11 d=C3=A9c. 2019 =C3=A0 03:20, Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> a =C3=A9crit :
> The PowerMac system we have internally was not able to recreate this.

To narrow down the issue - is that a PCI/PCI-X (7,3 [1]) or PCIe G5 (11,2 [=
1]) ?
Single, dual or quad ?

Same question to anyone else with a G5 / PPC970 - what is it and does
it boot recent PPC64 Linux kernel ?

Christian from the original report has a quad, like me (so powermac11,2).

There was also a report of a powermac7.3 working in the original discussion=
,
single or dual unspecified.

So this might be a Quad thing, or a more general 11,2 thing...

> At this point, I am not sure what would cause the Machine check with
> that patch series because we have not changed the VA bits in that patch.

Any test I could run that would help you tracking the bug ?

Cordially,

Romain

[1] <https://en.wikipedia.org/wiki/Power_Mac_G5#Product_revision_history>


--
Romain Dolbeau

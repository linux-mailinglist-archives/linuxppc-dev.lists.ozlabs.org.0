Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF811D527
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 19:20:01 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yhsp5DWJzDr72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 05:19:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yhjd29JMzDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 05:12:52 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id a5so3421793wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 10:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Jviass20nuXMf4NGwWwzyAHAY+Qd7WTSki9zGwwuvA=;
 b=PYAp8gHl0Bz0vIOKkcdngANVe/UpILsPK1h0tP18RItv+pYXYmbWAx7cKN5/I2LvaB
 aqhtypokbo/ATEEWJcbYxrsvx6XbVwsOcqWcWV78H5esfH2k8YGX+Sy19VaaCRE/wE1Q
 n4K49iv6twoVZIdEM+GD7CDa/dx7DHgQ0uPZpneUSuFCRZNpaYjcHmQBhpH8o9N/ylft
 gYgfLnjNZ0aYqOYX/SZ/Qf0eEVlnwK8ZPKKXXTQPk43Nv24+47qrQ0/HSx0+UuFZs0gk
 GYKAjVze1jv1ipntg3tWsedxRV9+S9kCHNs2R6kKwBjm/AA6EnYMISKZ3Ja9CNQ0IVdp
 6d2Q==
X-Gm-Message-State: APjAAAUnWB6cbBSiyiKvRuswgAMPiRxqGmuYFiv76E3heN+AvlwVdotH
 5V4ruWwuVIpKpweHJHlFupR1KY86lLYym/hhV3Q=
X-Google-Smtp-Source: APXvYqxIQKUJs24lDXCYMND6/qBalybpjk8dc3plJVu692Su3l7Ivm23i+yu/SwXL783BiQmVKOTGaQu5kDZkx6L1yE=
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr8041224wmd.102.1576174366253; 
 Thu, 12 Dec 2019 10:12:46 -0800 (PST)
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
 <716dc1da300bb8e9132b4ff44c02110f@zonnet.nl>
 <CADuzgbpvGsYZcrYNsdXYqkRSCMqtnq9KFzQ2tLn8aiaNb5T=ZQ@mail.gmail.com>
 <9a548855-a273-8fee-4cf2-d5c4b66fd867@physik.fu-berlin.de>
In-Reply-To: <9a548855-a273-8fee-4cf2-d5c4b66fd867@physik.fu-berlin.de>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Thu, 12 Dec 2019 19:12:34 +0100
Message-ID: <CADuzgbrBdWGU0VFUvSFsypXi3+vr8fKsyzayqMGt5=b5u6FP6g@mail.gmail.com>
Subject: Re: Call for report - G5/PPC970 status
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, jjhdiederen <jjhdiederen@zonnet.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le jeu. 12 d=C3=A9c. 2019 =C3=A0 09:08, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> a =C3=A9crit :
> I suggest booting the machine with a netconsole to get a dump of the cras=
h
> over the network, see [1].

I added netconsole (not as a module, directly in the kernel), but I
get nothing on my receiver 'nc'.
I don't see the network interface identified anywhere prior to the
crash, which could explains it
(I might also have misconfigured the command-line...). The crash is
probably too early.

I also tried compiling w/o SMP to see if that changed anything, but
the kernel won't compile:
first the ppc_watchdog seems to rely on a SMP symbol, and once I
disabled it, the MM subsystem was missing some 'numa' symbols.

Cordially,

--=20
Romain Dolbeau

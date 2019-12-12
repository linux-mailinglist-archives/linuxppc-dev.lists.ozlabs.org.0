Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370C11C6C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 09:02:49 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YR9f4zfRzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 19:02:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YR761XlkzDqwH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 19:00:33 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id b11so1234464wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 00:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ViygpI3sZEeIFawFAMzJBuuwFC97dUQTttbjEwZbCFc=;
 b=AuhNm27HM4Cwm0GArkX+wRTk+M9TmEPfyUS3USE4h+SDLsFbbeVw2N4p2musrCIy2+
 Ft6kGeAXMWzDeD1ZiecWNOrQkDmvYPJp1931MKRqL2rpfvOxK0fSRA8U1iXW6UZYw/ZV
 Nb7nINV0ioZADbSLKr9C0K2QHRPLrxWQguIGjW383U/rS7w6sBnH9EfziohJ/pltpTWH
 VaBO6SA6K3vAU5w/iOZRpbM65ZGD3zQZJ6tj3ScRaJnm/7ib0k34SML5otarXYjOTNFN
 dns2G9tuWvJfIdFOTG9/xN4Il1ZFmDHetzuxEWXJX80gGFBVC0a7YZR8Qn/NMTKgg46W
 8SmQ==
X-Gm-Message-State: APjAAAUnYqdVyDz4sJCoBW/caeNgGh2EXpAHErxQXeE+igAjA2Y0TGr0
 IYGKvkLgDvcazQBpGklv34i1Jg8nkMRI5Ch525A=
X-Google-Smtp-Source: APXvYqxABXxEus0Dw4a5xsLEtkLJHOj+oqr7zgTEdsQd14b8fFF7T2vbAA2QpYtFXhTezkHmYySS2i3eRTHkG2gbYoo=
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr4819582wmd.102.1576137628801; 
 Thu, 12 Dec 2019 00:00:28 -0800 (PST)
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
In-Reply-To: <716dc1da300bb8e9132b4ff44c02110f@zonnet.nl>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Thu, 12 Dec 2019 09:00:17 +0100
Message-ID: <CADuzgbpvGsYZcrYNsdXYqkRSCMqtnq9KFzQ2tLn8aiaNb5T=ZQ@mail.gmail.com>
Subject: Re: Call for report - G5/PPC970 status
To: jjhdiederen <jjhdiederen@zonnet.nl>
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
 linuxppc-dev@lists.ozlabs.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le jeu. 12 d=C3=A9c. 2019 =C3=A0 08:32, jjhdiederen <jjhdiederen@zonnet.nl>=
 a =C3=A9crit :
> PowerMac 7,3 G5 2.5 DP PCI-X Mid-2004 is affected with this bug. The
> machine freezes at boot due to the new ppc64 kernel.

Thanks for the reports!

So it's not all G5, but it's across generations - the iMac is PCIe.
Perhaps multiprocessors?

Could you share the screen/log of the crash?

For my G5 with 5.5rc1 I have one, but the photo is terrible:
<http://www.dolbeau.name/dolbeau/files/Photo0031.jpg>
Timestamps overlap, as after the 'crash' (backtrace) there was
more messages from the (S)ATA subsystem.

Cordially,

--=20
Romain Dolbeau

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C811D620
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 19:45:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YjRL087gzDr2K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 05:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YjP550TGzDr1x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 05:43:37 +1100 (AEDT)
Received: by mail-wr1-f42.google.com with SMTP id d16so3846815wre.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 10:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a+mv3jMicl1jse7K+JqsfDkyITYDweKoxsau7sJfMOo=;
 b=B0j2ApHKz75VOKYQa5CfFJJlfHMWzachSrTA021m1BPOdL8gFlO3CW8LHyNTHSShd3
 TJBL0ZC3TEkUfJPFkkUmA7fwK7Mc0TBVVZX9yIFEqHIdBBLkPTAX4UItTAlOianQkH2Y
 Jurg1NIdCLiMWcf/Yn8L5oD1js8BZYeelfLo2d7upeuwmYt8cwwD3nCkOlkulqAbj0R9
 JZA0xPULQQbsTrGPBdNjhlvZPTcRRy43kNVAG9VPivDzToYM6KVQvhNEGtIxMOUIBXVl
 G2DWcA5MNUAreDHRwFbledIYLyCUCZN0iMM+hisQn74aIylmWuhNid0uiiw/POAn1nQm
 wiTA==
X-Gm-Message-State: APjAAAVMCcgowbjCj6KduDpjEOLe3xd0dPctN6ZDS5FtFCAc1Z6KZEu/
 zE9w46sZNvdIacqSzytsRaru0hkkUCgx4oW3op/gTVWV
X-Google-Smtp-Source: APXvYqwble4PHYCoIm9MJyEsDPapeRE30lq8kPw2AerlfYWf5WuMZVZmK/3hC1QoawLOz/sttkx4EhjPy1+HWaWNKMI=
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr7865384wrw.311.1576176211346; 
 Thu, 12 Dec 2019 10:43:31 -0800 (PST)
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
In-Reply-To: <87mubxl82x.fsf@igel.home>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Thu, 12 Dec 2019 19:43:20 +0100
Message-ID: <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
Subject: Re: Call for report - G5/PPC970 status
To: Andreas Schwab <schwab@linux-m68k.org>
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

Le jeu. 12 d=C3=A9c. 2019 =C3=A0 19:20, Andreas Schwab <schwab@linux-m68k.o=
rg> a =C3=A9crit :
> My PowerMac7,3 (DP 2.0GHz) can boot 5.5-rc1 without issues.

This is weird, as except for the frequency it should be the same
system as Jeroen's crashing G5!

Can you share your kernel config, compiler version, and other details?
Perhaps even the binary...

Thanks & cordially,

--=20
Romain Dolbeau

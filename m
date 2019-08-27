Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 438679E458
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 11:33:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HkFq1D4gzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 19:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WJ2iFn7a"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HkCg3HDPzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 19:31:42 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id k3so12336881pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=5MtLSAT1Tzreq71yap21NOgQKtdyfFLfctGgPcM22Ac=;
 b=WJ2iFn7a4d3B1jfWkj5NB6w9UELUqGuxBy8jHmT3dPX0RHhuG/77r0Yc/jV6YAT5ko
 ktemwF5n8CFmGSN/rGtJuEnXtS3sAeh/cM8ggJt+1dCwapM9BsAlBF46X1pmZ0hOjK87
 4pQEIXdmYheYx1tELuDdQqOhLpTslNKH8dMG7ySRIv5lB0yhlt63dj8nrvc3pzyHg7pN
 OTr3btE5/znCf4SXO09lXXdwtmOrfw5R8MRROnwK6VqVc3r03aMSmkE/9g1kxIpZoJq/
 yIVZ2V6erW8n8hN2n8D4PfCCKLZrn7Fg9UpqWFm1R2680PBFtdV+Y+6TrTevUOTWOITC
 L/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=5MtLSAT1Tzreq71yap21NOgQKtdyfFLfctGgPcM22Ac=;
 b=J+rdrLujEwR+bJznLAQ3AEZUSvRnr326Nw7n3RczsoVzHM5sXH4QdL5Rjp01EX8YKj
 0LtZdsfaCUByy5JFHTsngOleP4OKprTl0tbj5PWqooZQVuSGnhfcBWlfEXU3ds9gaPXK
 sR9rdT1fKn0hAbZyZfVJ8nBwgEW6Rn4Ca0Us5S0ixoYD/XFxuElid5vf6k/7V+xQIi7V
 8b1iHtXn0ZVNdPEkFW8VNRDNcAkcey3OAO7oU8M34cepXhX0P8yyjVLRvDRcu77p1B5k
 Lx/27XSMUTGxSnlTlr3WbAheP+22R1mAMxfHqNTD9Bk+FIgdPwVMwaCVE1HMOvQqII+J
 ni/g==
X-Gm-Message-State: APjAAAXDJb/oKvXAk9OOr+h235axrIwUAEThJVnNFBK3sdM99AMXlEQC
 1TMPRusLtOuuz63kUiSqxHg=
X-Google-Smtp-Source: APXvYqzbH2MqlG3cteW7VGmAj5Ut/iP40M4geGhNHMTdbaRYpe3f/DbZvtF5+JKagO3P/GiOz/y7Bw==
X-Received: by 2002:aa7:8a04:: with SMTP id m4mr24834217pfa.65.1566898299133; 
 Tue, 27 Aug 2019 02:31:39 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id l7sm9826287pff.35.2019.08.27.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 02:31:38 -0700 (PDT)
Date: Tue, 27 Aug 2019 19:31:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 0/3] New idle device-tree format and support for versioned
 stop state
To: devicetree@vger.kernel.org, Abhishek Goel <huntbag@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, paulus@samba.org
References: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
In-Reply-To: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566894003.kb57vy8ri2.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, daniel.lezcano@linaro.org,
 rjw@rjwysocki.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Abhishek Goel's on August 23, 2019 5:09 pm:
> Background
> ------------------
>=20
> Previously if a older kernel runs on a newer firmware, it may enable
> all available states irrespective of its capability of handling it.
> Consider a case that some stop state has a bug, we end up disabling all
> the stop states. This patch introduces selective control to solve this
> problem.
>=20
> Previous version of these patches can be found at:
> https://lkml.org/lkml/2018/10/11/544
> These patch however also had patches for support of opal save-restore
> which now I am decoupling and will take them seperately.
> I have posted the corresponding skiboot patches for this kernel patchset
> here : https://patchwork.ozlabs.org/cover/1144587/
>=20
> What's new?
> --------------------
>=20
> Add stop states under ibm,idle-states in addition to the current array
> based device tree properties.
>=20
> New device tree format adds a compatible flag which has version
> corresponding to every state, so that only kernel which has the capabilit=
y
> to handle the version of stop state will enable it. Drawback of the array
> based dt node is that versioning of idle states is not possible.
>=20
> Older kernel will still see stop0 and stop0_lite in older format and we
> will deprecate it after some time.
>=20
> Consider a case that stop4 has a bug. We take the following steps to
> mitigate the problem.
>=20
> 1) Change compatible string for stop4 in OPAL to "stop4,v2" from
> "stop4,v1", i.e. basicallly bump up the previous version and ship the
> new firmware.
>=20
> 2) The kernel will ignore stop4 as it won't be able to recognize this
> new version. Kernel will also ignore all the deeper states because its
> possible that a cpu have requested for a deeper state but was never able
> to enter into it. But we will still have shallower states that are there
> before stop 4. This, thus prevents from completely disabling stop states.
>=20
> Linux kernel can now look at the version string and decide if it has the
> ability to handle that idle state. Henceforth, if kernel does not know
> about a version, it will skip that state and all the deeper state.
>=20
> Once when the workaround are implemented into the kernel, we can bump up
> the known version in kernel for that state, so that support can be
> enabled once again in kernel.
>=20
> New Device-tree :
>=20
> Final output
>        power-mgt {
>             ...
>          ibm,enabled-stop-levels =3D <0xec000000>;
>          ibm,cpu-idle-state-psscr-mask =3D <0x0 0x3003ff 0x0 0x3003ff>;
>          ibm,cpu-idle-state-latencies-ns =3D <0x3e8 0x7d0>;
>          ibm,cpu-idle-state-psscr =3D <0x0 0x330 0x0 0x300330>;
>          ibm,cpu-idle-state-flags =3D <0x100000 0x101000>;
>          ibm,cpu-idle-state-residency-ns =3D <0x2710 0x4e20>;
>          ibm,idle-states {
>                      stop4 {
>                          flags =3D <0x207000>;
>                          compatible =3D "stop4,v1",
>                          psscr-mask =3D <0x0 0x3003ff>;
>                          latency-ns =3D <0x186a0>;
>                          residency-ns =3D <0x989680>;
>                          psscr =3D <0x0 0x300374>;
> 			 ...
>                   };
>                     ...
>                     stop11 {
>                          ...
>                          compatible =3D "stop11,v1",
>                          ...
>                   };
>              };

I'm not sure about this. I think the real problem we have is that the
OPAL stop API is not actually implementation independent. Because we
*can* selectively disable stop states in the firmware if there is a
hardware/firmware problem with them.

So we need a way to rev ISA/Book4/OPAL stuff so the kernel won't try
to use it if it's incapable.

We have that today in dt-cpu-ftrs. POWER9 advertises the "idle-stop"
feature. An incompatible implementation could advertise idle-stop-v4.

That won't allow individual states to remain back compatible, but if=20
there is a new implementation which changes any behaviour it needs to be=20
incopmatible, even if Linux happens to not rely on said behaviour yet. =20
So I don't think we can keep any of them (except stop0 lite) compatible,=20
so I don't see a real downside (we'll have to discuss this offline).

Thanks,
Nick
=

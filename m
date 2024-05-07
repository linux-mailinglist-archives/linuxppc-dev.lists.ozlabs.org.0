Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B18BDA0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 06:08:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ci07VNGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYPsQ4gmlz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 14:08:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ci07VNGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYPrh72Fhz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 14:08:04 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2a2da57ab3aso2085458a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 21:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715054882; x=1715659682; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8roWS+q9ljvtBS0JKC7xbUiCmEhIcKhzMHcrhEm9Nos=;
        b=ci07VNGOcfTDVorVBSLtY209hCAnP5haGd5qIlourAL+WbDHvgFkCTVnGb93TyvE8H
         KehocHfZzVDKqrAePDA1L81IQvr+knoP4xWxO0JKQy0hYOBv5a6pAc9S120vntqV6t3V
         tB/PuP1PdGEHtsOOZaoZKrkRmvR39r+5lmJzIK7vJrJmxmQd1fp77s5zEmkQfebuyfKX
         ccUGk5TMfrRyOXLkWv/bSRS8H2R2+jpEusqZfCWqyu4oNfqa+WuGos3jby+Tl4Ksjkaf
         ilfjjP9WZxklavUfq6BcdlCmjRn/x4AJyP/aOPI1xPxKtUBOCY5OAl46TkpK+RgT8IZP
         polQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715054882; x=1715659682;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8roWS+q9ljvtBS0JKC7xbUiCmEhIcKhzMHcrhEm9Nos=;
        b=OLCz3eoVok0C0fGjBJ9/P6s3qyZhUKh8iLfvzyTzGYzPVEiZhSq8qDDcCzlPPVWxRX
         eBotjRlE+ij52PCMGESKj5yHstO13bPK3X7jveiOQsU8Hd9s8IiYIypptRkyVU7RNWzJ
         tmpiz+sxrUQkGLtyOzED7t/NULSVy2zFhRSdcRJHA+3szxuJHQPjrpqoD822r9q0ZyH0
         A0L10MsYJos/sM/zGPc0C/Bl1mpoN61JVVJHUVtXb88sBvhETGSSmWtdb/98AsSYwLs/
         FL41o6ZW7h26MH7zRLXhX5lXO/Qwka5KIRsnwkrMc27rk2vjCFGPKS2m93hWQ2I6hJyJ
         jwRg==
X-Forwarded-Encrypted: i=1; AJvYcCWW7v7t5iBBYh+DUWbFSz1YcAUW5Ui+v/MKW3ejIpLv1zjQep2kZn70y+sk2eM3b2/FZJfze7GObKU5N0VeiPFZLVt1014+S7b8ZKTEIQ==
X-Gm-Message-State: AOJu0YwdGgGxiH600hn6/GvC2kMaWuqjwiz1pf3W4pUzwjNklUAlfFot
	xFXDZR/MgiYNNRiXLD9DH9orLH1vaCi/bdU/lLZJssu0EBhLKMpZ
X-Google-Smtp-Source: AGHT+IHIHMa1Ll9G/eID7YmLtNoFyqT8YXrPKhHPZ74WPRdXykl0qss1zUJNo7yWAHVJLHnKwPouBg==
X-Received: by 2002:a17:90a:d50f:b0:2b4:329e:e363 with SMTP id t15-20020a17090ad50f00b002b4329ee363mr8797538pju.1.1715054882153;
        Mon, 06 May 2024 21:08:02 -0700 (PDT)
Received: from localhost (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id sp7-20020a17090b52c700b002b4fd3f390bsm3973720pjb.53.2024.05.06.21.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 21:08:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 14:07:57 +1000
Message-Id: <D1347PSKXAVS.2EMGLUQSZN8W4@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 03/31] powerpc: Mark known failing
 tests as kfail
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-4-npiggin@gmail.com>
 <f2411fc8-5f90-4577-9599-f43bb8694cd0@redhat.com>
In-Reply-To: <f2411fc8-5f90-4577-9599-f43bb8694cd0@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 6, 2024 at 5:37 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > Mark the failing h_cede_tm and spapr_vpa tests as kfail.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/spapr_vpa.c | 3 ++-
> >   powerpc/tm.c        | 3 ++-
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/powerpc/spapr_vpa.c b/powerpc/spapr_vpa.c
> > index c2075e157..46fa0485c 100644
> > --- a/powerpc/spapr_vpa.c
> > +++ b/powerpc/spapr_vpa.c
> > @@ -150,7 +150,8 @@ static void test_vpa(void)
> >   		report_fail("Could not deregister after registration");
> >  =20
> >   	disp_count1 =3D be32_to_cpu(vpa->vp_dispatch_count);
> > -	report(disp_count1 % 2 =3D=3D 1, "Dispatch count is odd after deregis=
ter");
> > +	/* TCG known fail, could be wrong test, must verify against PowerVM *=
/
> > +	report_kfail(true, disp_count1 % 2 =3D=3D 1, "Dispatch count is odd a=
fter deregister");
>
> Using "true" as first argument looks rather pointless - then you could al=
so=20
> simply delete the test completely if it can never be tested reliably.
>
> Thus could you please introduce a helper function is_tcg() that could be=
=20
> used to check whether we run under TCG (and not KVM)? I think you could=
=20
> check for "linux,kvm" in the "compatible" property in /hypervisor in the=
=20
> device tree to see whether we're running in KVM mode or in TCG mode.

This I added in patch 30.

The reason for the suboptimal patch ordering was just me being lazy and
avoiding rebasing annoyance. I'd written a bunch of failing test cases
for QEMU work, but hadn't done the kvm/tcg test yet. It had a few
conflicts so I put it at the end... can rebase if you'd really prefer.

>
> >   	report_prefix_pop();
> >   }
> > diff --git a/powerpc/tm.c b/powerpc/tm.c
> > index 6b1ceeb6e..d9e7f455d 100644
> > --- a/powerpc/tm.c
> > +++ b/powerpc/tm.c
> > @@ -133,7 +133,8 @@ int main(int argc, char **argv)
> >   		report_skip("TM is not available");
> >   		goto done;
> >   	}
> > -	report(cpus_with_tm =3D=3D nr_cpus,
> > +	/* KVM does not report TM in secondary threads in POWER9 */
> > +	report_kfail(true, cpus_with_tm =3D=3D nr_cpus,
> >   	       "TM available in all 'ibm,pa-features' properties");
>
> Could you check the PVR for POWER9 here instead of using "true" as first=
=20
> parameter?

Also covered in patch 30.

Thanks,
Nick

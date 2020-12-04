Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF362CE59B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 03:19:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnGcF16FRzDrPT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 13:19:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bd67G5cf; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnGZj50lczDrHY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 13:18:04 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id f17so2598431pge.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 18:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Fd2ivA1JfGBE/YYaFxTeQJoY+3hIQ82HTGN9ThwBn8w=;
 b=bd67G5cfWvkCpWSjpFtI1+6l2zRYD23xLf/mhlvIDACjrdi9nyf9dA0r6nvvREyg08
 f3/zsofCKY9aHt8SOxoMx94nNle0IBiOTvBwYKGdD9BVOEcCdLCVu0I6aOeaq7weUEWd
 EEIsrpT29dZ7HUU6IaIcUu+7qyqHljF6kf1ZearRQIWy4NWCn0VtkvVswIJqSbx1kOPr
 WLin59SvycwQtsrRgOoTfDikupSHB/+1QbEuAminucunl/PpeQO2nhXPBX/ZUzrub1eG
 EpYVkC2O08NhLbUm2XXwT50LKLrJr4vr8BkrzMgNmwHT5STBd5lQTFYdQbdw0F0SfX1w
 5njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Fd2ivA1JfGBE/YYaFxTeQJoY+3hIQ82HTGN9ThwBn8w=;
 b=bYzfazSqvmKcVkDYz42FrwQKmSBMoCoBdwZ6VPZXlOugmr3eTghSXJbT+YQ53Qfygi
 2tvVmKMRsJwiafRUz4prc5J7hG3A3xNikP1twWqSYbRPMybr97pt0Zhz8y/QJvJqJd2+
 R2Vga+L46baBlvJeu4xxgLb6aIS5uuCkMS2jAGVoQ9lu7/RbfBWVLVr0wBWPae+Vmjqd
 FJnsBNqzvigiyIui1ZC+HjVaGOFC3cgJune3x7reYCInRhuO3waefWtlHSM7jEhdaUP5
 YbujIDlTQKypqx0EMbmw7mm9mDuzNbZ3X43DItXvfy3puFJsRDJDH7wPyo2sCsAX2H8C
 kyJw==
X-Gm-Message-State: AOAM532apj0uKYVDDpw3/Ixm9ZipFcvLDfhDeQOCfaMGpv1siKTulEgb
 DE6p5ZVi2Z2aCWkZmgjszpH1Xw==
X-Google-Smtp-Source: ABdhPJyNuKKB+iExcQqlDxHUMCskHI2/BePAL+9W0Ez0GHtzU2CIr3B8j01gRJIOeumT/wnwKHF+4w==
X-Received: by 2002:a63:f64c:: with SMTP id u12mr5577532pgj.325.1607048281788; 
 Thu, 03 Dec 2020 18:18:01 -0800 (PST)
Received: from ?IPv6:2600:1010:b052:49bb:5861:3d22:1fe4:dfb5?
 ([2600:1010:b052:49bb:5861:3d22:1fe4:dfb5])
 by smtp.gmail.com with ESMTPSA id v17sm2249260pga.58.2020.12.03.18.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 18:18:01 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [MOCKUP] x86/mm: Lightweight lazy mm refcounting
Date: Thu, 3 Dec 2020 18:17:59 -0800
Message-Id: <3B47C470-2900-4A53-9F8E-CB3A003FA361@amacapital.net>
References: <1607033145.hcppy9ndl4.astroid@bobo.none>
In-Reply-To: <1607033145.hcppy9ndl4.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: iPhone Mail (18B121)
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
Cc: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux-MM <linux-mm@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Rik van Riel <riel@surriel.com>,
 LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Dec 3, 2020, at 2:13 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> =EF=BB=BFExcerpts from Peter Zijlstra's message of December 3, 2020 6:44 p=
m:
>>> On Wed, Dec 02, 2020 at 09:25:51PM -0800, Andy Lutomirski wrote:
>>>=20
>>> power: same as ARM, except that the loop may be rather larger since
>>> the systems are bigger.  But I imagine it's still faster than Nick's
>>> approach -- a cmpxchg to a remote cacheline should still be faster than
>>> an IPI shootdown.=20
>>=20
>> While a single atomic might be cheaper than an IPI, the comparison
>> doesn't work out nicely. You do the xchg() on every unlazy, while the
>> IPI would be once per process exit.
>>=20
>> So over the life of the process, it might do very many unlazies, adding
>> up to a total cost far in excess of what the single IPI would've been.
>=20
> Yeah this is the concern, I looked at things that add cost to the
> idle switch code and it gets hard to justify the scalability improvement
> when you slow these fundmaental things down even a bit.

v2 fixes this and is generally much nicer. I=E2=80=99ll send it out in a cou=
ple hours.

>=20
> I still think working on the assumption that IPIs =3D scary expensive=20
> might not be correct. An IPI itself is, but you only issue them when=20
> you've left a lazy mm on another CPU which just isn't that often.
>=20
> Thanks,
> Nick

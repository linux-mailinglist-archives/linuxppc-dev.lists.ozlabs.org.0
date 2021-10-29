Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58343F410
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgNtr201sz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 11:42:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gEs+5yM5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gEs+5yM5; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgNt725m7z2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 11:42:05 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id p20so2340859pfo.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 17:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=K6kU0GjDcKiuShx41YZe5aVBEt3L41NJ6Vfe9OxBZcc=;
 b=gEs+5yM5+ExyB/ZvQPfOTv1mExt2oKG38oqKWyw4R347wqAvxrneIpb/W5u3OhoQ7A
 HP6Y7J1iOVpOtV7CZ17TZNzHvGS1KxhJii9q9OZezJWcC4XhPgnt3bYD8+wAyDeDTiGD
 HzwAP6+MvbVuCIxZLMRGJpQm/744otTh1P/BZeYtpdkH0b1QcpElwARjoX1lEnIJmM0l
 6Af/VTEX07A9BotApa3f8BcNTBCv23a8VZq/ibkbWIo6l4BTy+gZGDlHTWw3m3Tc0HSP
 kcfNiui/wFu28YfDV5hE3sFESM8Q+G2pjMhuXa9hZL5VP9y2W9JoMd2OuDTJNyeLSE8W
 jQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=K6kU0GjDcKiuShx41YZe5aVBEt3L41NJ6Vfe9OxBZcc=;
 b=BBqt/1C/1hxrMjw9YzAAb9qbcrMfVX+q0veeXV+GRkk2hPIFgGdCA5sMBrbjXDP+ct
 uQO2MwBv67BjROhVO4gjX+9//5Ri7Z2/tjFtTjxHgsPpuABRSxAKrQUF4QFRiGWJ44NW
 ZRTfSXwwM+QjSqu3DEhXNvGZWcW9l6muq9OeNCiwqrxAjLTb78NVuEv3mr/yR/y89k59
 RiE7r9RIW8KxlsjdqPgD0xHxMF/yEfRtrs7caaYwrrTBRZTiwN0ul/Tv0JV/p5SoLCA8
 uhphu++8rhGk42ckbWNQF9vF5e2StHd/UsV5zd0aHxPBG4nbMBkFQa8XTIcwqQydFPDC
 tgeA==
X-Gm-Message-State: AOAM532ZY9youCe/acM0YjzdyU+sjTmiQQL3RrXRQbOtjfkcaCH3w8tq
 8093hEJq2B8GPXtudqngWqA=
X-Google-Smtp-Source: ABdhPJznrZ3/DpvWJLlb1xeW+dlgjksPyLCrfdBFoSp/Ve8lN6fFbbeykiH2QRRKw3Y2QKPPHeNSYg==
X-Received: by 2002:a05:6a00:15d3:b0:47c:1c91:93d with SMTP id
 o19-20020a056a0015d300b0047c1c91093dmr7627634pfu.80.1635468122469; 
 Thu, 28 Oct 2021 17:42:02 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id p9sm4509225pfn.7.2021.10.28.17.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:42:02 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:41:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <87b1404f-7805-da29-4899-6ab9459e5364@physik.fu-berlin.de>
 <9ed788c0-b99b-f327-0814-a2d92db6bd8b@physik.fu-berlin.de>
In-Reply-To: <9ed788c0-b99b-f327-0814-a2d92db6bd8b@physik.fu-berlin.de>
MIME-Version: 1.0
Message-Id: <1635467831.en5s268a3l.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from John Paul Adrian Glaubitz's message of October 29, 2021 12:05=
 am:
> Hi Michael!
>=20
> On 10/28/21 13:20, John Paul Adrian Glaubitz wrote:
>> It seems I also can no longer reproduce the issue, even when building th=
e most problematic
>> packages and I think we should consider it fixed for now. I will keep mo=
nitoring the server,
>> of course, and will let you know in case the problem shows again.
>=20
> The host machine is stuck again but I'm not 100% sure what triggered the =
problem:
>=20
> [194817.984249] watchdog: BUG: soft lockup - CPU#80 stuck for 246s! [CPU =
2/KVM:1836]
> [194818.012248] watchdog: BUG: soft lockup - CPU#152 stuck for 246s! [CPU=
 3/KVM:1837]
> [194825.960164] watchdog: BUG: soft lockup - CPU#24 stuck for 246s! [khug=
epaged:318]
> [194841.983991] watchdog: BUG: soft lockup - CPU#80 stuck for 268s! [CPU =
2/KVM:1836]
> [194842.011991] watchdog: BUG: soft lockup - CPU#152 stuck for 268s! [CPU=
 3/KVM:1837]
> [194849.959906] watchdog: BUG: soft lockup - CPU#24 stuck for 269s! [khug=
epaged:318]
> [194865.983733] watchdog: BUG: soft lockup - CPU#80 stuck for 291s! [CPU =
2/KVM:1836]
> [194866.011733] watchdog: BUG: soft lockup - CPU#152 stuck for 291s! [CPU=
 3/KVM:1837]
> [194873.959648] watchdog: BUG: soft lockup - CPU#24 stuck for 291s! [khug=
epaged:318]
> [194889.983475] watchdog: BUG: soft lockup - CPU#80 stuck for 313s! [CPU =
2/KVM:1836]
> [194890.011475] watchdog: BUG: soft lockup - CPU#152 stuck for 313s! [CPU=
 3/KVM:1837]
> [194897.959390] watchdog: BUG: soft lockup - CPU#24 stuck for 313s! [khug=
epaged:318]
> [194913.983218] watchdog: BUG: soft lockup - CPU#80 stuck for 335s! [CPU =
2/KVM:1836]
> [194914.011217] watchdog: BUG: soft lockup - CPU#152 stuck for 335s! [CPU=
 3/KVM:1837]
> [194921.959133] watchdog: BUG: soft lockup - CPU#24 stuck for 336s! [khug=
epaged:318]

Soft lockup should mean it's taking timer interrupts still, just not=20
scheduling. Do you have the hard lockup detector enabled as well? Is
there anything stuck spinning on another CPU?

Do you have the full dmesg / kernel log for this boot?

Could you try a sysrq+w to get a trace of blocked tasks?

Are you able to shut down the guests and exit qemu normally?

Thanks,
Nick


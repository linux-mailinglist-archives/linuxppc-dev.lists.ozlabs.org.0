Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1495ED439
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 07:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MclN25gNQz3bWm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=owmaWL8J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=owmaWL8J;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MclMP6MFHz2xkV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 15:25:52 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id l12so13122480ljg.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 22:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IPCLwIQ+UERHPm9w4nQGFYrwmlLzJ4AJ3JlVNkOLjfk=;
        b=owmaWL8J0DjnByEMa+cLbTORIRrq8yp3lKV8crjvgMM/NkKnWeQIxzmI5VTzceEs3i
         S3i46YmZL6hhUlOZgye5isjPYmsTL9s7ZQbh4KxfmQHhPEMfq8R8W01RbLcG9+VJVBK9
         8fBxKiJNmH3HTgTCP9QbaG5As7Xex+3GS9vMzEkw0RXkyxtNit3zG4NH6cmFKNhRPLcJ
         1wpCfkC3/obFIyVNyGRuEV+B6a4cqc/MfTeighQRcl1evlTq2RPNa22Fpm7esVybK8t9
         XiN03BRQL3c+PNAEazrBabL0xPu6A+N1Pr1UnZe63PhoxCuf5jkappeLkxgBidmJu+mi
         rgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IPCLwIQ+UERHPm9w4nQGFYrwmlLzJ4AJ3JlVNkOLjfk=;
        b=5Capdf1rFhH96L2Ptj8kGZBxK9K4o+YYwzAlXVykPgZ+aEoEdwp0AifgquMfgSHVil
         dR9rwgAzhLSEBzyut0F8Y6XQV1PJa4FLvadyNar2vWt3TzplwOSxd4Ll6rVsakIT8JT/
         Q7VUBjViBiEHMZslMMvE4yYINV/r7wYeFY1KPATOv+0Smz5NGaWQcaSbpwEHOmtOFlu6
         LHvP8qVPK1esqNOAMksKUitlOLZLy98RvfHdMVn/g4g9jklshrbFNFjMY8lSv5NwXZgi
         YLWDj8nKaocLFAsEeoKOsfnY6E2P7zGuoJFXdz7J/ywIw5bPsTR7qkq9C4LjRPFFtSq9
         6Ykg==
X-Gm-Message-State: ACrzQf139W0/SHD/QO99GPCwCiQCJ+GKyqRNVXWJ7LxK9WvWo5NCmmP0
	Azu1G21LW08Z7xMRzxLQpy3hxxxM0ENigpNWMW7F3g==
X-Google-Smtp-Source: AMsMyM7wMhHzCDPMFbCTrNC4bpJlQfmpId5OarS9R/571Zfneoaf+BQ5BEj/3dPyNZFm2pWs5O4V9tiCRmerzE31Li4=
X-Received: by 2002:a2e:3909:0:b0:26c:2ea4:1a79 with SMTP id
 g9-20020a2e3909000000b0026c2ea41a79mr10902755lja.401.1664342747490; Tue, 27
 Sep 2022 22:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
In-Reply-To: <20220910075316.no72fdyqjvunomwm@google.com>
From: Fangrui Song <maskray@google.com>
Date: Tue, 27 Sep 2022 22:25:35 -0700
Message-ID: <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-08-30, Fangrui Song wrote:
> >The actual intention is that no dynamic relocation exists. However, some
> >GNU ld ports produce unneeded R_*_NONE. (If a port is not care enough to
> >determine the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> >relocations. E.g. powerpc64le ld as of 2.38 has the issue with
> >defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So just
> >ignore them.
> >
> >With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> >bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> >not called "absolute relocations". (The patch is motivated by the arm64
> >port missing R_AARCH64_RELATIVE.)
> >
> >While here, replace "egrep" with "grep" as "egrep" is deprecated in GNU
> >grep 3.7.
> >
> >Signed-off-by: Fangrui Song <maskray@google.com>
> >---
> >[...]
> >
>
> Ping.

Ping^2 :)

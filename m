Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C187F31D200
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 22:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgDTh5pY1z30Jv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 08:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20150623.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=wYjqab4z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=gimpelevich.san-francisco.ca.us
 (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=daniel@gimpelevich.san-francisco.ca.us; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gimpelevich-san-francisco-ca-us.20150623.gappssmtp.com
 header.i=@gimpelevich-san-francisco-ca-us.20150623.gappssmtp.com
 header.a=rsa-sha256 header.s=20150623 header.b=wYjqab4z; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgDTD46P7z30Hy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 08:22:35 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id t11so7082480pgu.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 13:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gimpelevich-san-francisco-ca-us.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:in-reply-to:references:date
 :mime-version:content-transfer-encoding;
 bh=jaSQPIArooOmOh1NjkVrVfJQ89EqRvkI0359nRutXv4=;
 b=wYjqab4zwpFSBl7MN0fvi0pc/uOQVyYlEmcVoccc8ME7573HvwcVA04uVzAeQ6RI7F
 dmtLneYUq3stkkCiih2y0Fj1J0B3rQyUHQpuFrW/JWC/hqYwTuJxlwuJVr6HqGewVMeg
 NyiUYMYNhywr8fl1r0Zm5kk5a4Be7BqtIUNgP87h5ihJKyb73W++wYg+zWoO7gdGBn0j
 bldsYGcfM8Le1GJqyuAMB+EysFrPEwQ1VzYwM6S+mfRw90ARrnNROJI0ZXeT1mGiRblx
 3mZxjyQUnhaMe/HyE58T7mBF0NwN38CZzu8p0RnsD4wkh6oUQRYi+poo4IgpjwkyQbei
 5pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:in-reply-to
 :references:date:mime-version:content-transfer-encoding;
 bh=jaSQPIArooOmOh1NjkVrVfJQ89EqRvkI0359nRutXv4=;
 b=tlx1091xKNLDzejNrdXhvKjYx+IXI5e5n+k3mKdkxNDL6PRtM/VeSoMnfLDGFkIoRa
 LnzYT6ZAN8NfD+fagnRBXBujqAQ3qwLLdMth8Qa3a+Yvg3Y4+7kkhepq7IoWNGnqJ495
 wai6VZe+VgTS2H0FfiHTr96HlWH6vZZczTB8X/bK3MFeSFHp9s+xitkr2u84sUtUyBjF
 HVD+oxA6LObCRqQX2CG0opZ90IeViSNwy+MjIXfgS+PFc3G677hJmsbOAv3o4qNZuUiz
 KoGk6VWTzUABcSB+GCR+AIaMPt4qPHR2/gMdD87ecCiVNKvhyFG9N7G8At1fGCcVdOGP
 yJkg==
X-Gm-Message-State: AOAM533icWcR3gWZyXXLfpd/ayBM0cakCPk4n+7s+rGFcnEZ6iO89doN
 KvVqdHIBqcCH5hJQNhapbN6ymQ==
X-Google-Smtp-Source: ABdhPJwjWcun9DmBgXoxCpYswxoygWwO660hz1l3ojEXGPDha454r1PDh1I/nufSz82GV13WdgYZ3g==
X-Received: by 2002:a65:6207:: with SMTP id d7mr21629630pgv.92.1613510551328; 
 Tue, 16 Feb 2021 13:22:31 -0800 (PST)
Received: from [192.168.72.184] (157-131-244-194.fiber.dynamic.sonic.net.
 [157.131.244.194])
 by smtp.gmail.com with ESMTPSA id b18sm23024720pfi.173.2021.02.16.13.22.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Feb 2021 13:22:30 -0800 (PST)
Message-ID: <1613510437.3853.20.camel@chimera>
Subject: Re: [PATCH 1/4] add generic builtin command line
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210216184247.Horde.If3nEUb5zLh4eU_4qXZCAw1@messagerie.c-s.fr>
References: <20190319232448.45964-2-danielwa@cisco.com>
 <20190320155319.2cd3c0f73ef3cdefb65d5d1e@linux-foundation.org>
 <20190320232328.3bijcxek2yg43a25@zorba>
 <20190320201433.6c5c4782f4432d280c0e8361@linux-foundation.org>
 <20190321151308.yt6uc3mxgppm5zko@zorba>
 <20190321151519.1f4479d92228c8a8738e02cf@linux-foundation.org>
 <1613417521.3853.5.camel@chimera>
 <20210216184247.Horde.If3nEUb5zLh4eU_4qXZCAw1@messagerie.c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2021 13:20:37 -0800
Mime-Version: 1.0
X-Mailer: Evolution 3.10.4-0ubuntu2 
Content-Transfer-Encoding: 7bit
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, xe-linux-external@cisco.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Maksym Kokhan <maksym.kokhan@globallogic.com>,
 Daniel Walker <dwalker@fifo99.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-02-16 at 18:42 +0100, Christophe Leroy wrote:
> I'd suggest also to find the good arguments to convince us that this  
> series has a real added value, not just "cisco use it in its kernels  
> so it is good".

Well, IIRC, this series was endorsed by the device tree maintainers as
the preferred alternative to this:

https://lore.kernel.org/linux-devicetree/1565020400-25679-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us/T/#u

The now-defunct patchwork.linux-mips.org link in that thread pointed to:

https://lore.kernel.org/linux-mips/1510796793.16864.25.camel@chimera/T/#u

When running modern kernels from ancient vendor bootloaders, it is
sometimes necessary to pick and choose bits and pieces of the info they
pass without taking it verbatim.


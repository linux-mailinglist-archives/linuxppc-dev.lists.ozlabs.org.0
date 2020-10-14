Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9C28E915
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 01:03:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBSck69Z8zDqPM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 10:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TCnK8mL9; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBSZV19lJzDqHS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:01:04 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id r4so1778445ioh.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 16:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikC4LAwwb2/OL3dDYceqRFTwnIoFZSQn/I33psN0qjs=;
 b=TCnK8mL9NI6hpr3zEveS0JTuNaHtXCx/qfHBGzgIQgrYKIyFfbL469h0Y911PX4qYA
 HA3PFnu9h7bUViHMzKVqrdtDhIfan/01bAJrm+iH8HVsCMbrGoUBCi+EwDuHU09Bq9xD
 0zniDvdoMkczvwrfTymICG2b2JPXMk43+A7TFV6EwFWXjhcXv0Zr0g7isA+HBzM1ygDz
 HielqMai2yM1V5M7vYrESoEcbxMQbPPGpBkxbresU1sEHhWVlG/vNZSnpIukEp2FJExo
 3VAds5Vc5Pir8QMG6owXKfyujHcVGoAHhUjdCq3iSTks6Ul93abkR08dX/ws2fLr75Qd
 P1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikC4LAwwb2/OL3dDYceqRFTwnIoFZSQn/I33psN0qjs=;
 b=t6Ojw1O4zW1qYDbLYiBZ6LUsvEaw3j75CyBMc9BRRWz92jiRgxWCRKK55GrIboC6Ec
 Zzw8o2zgxVQDuwu22vdDD4YscGYcQKesEWRBIGPJFIsH8k5+paEJHSGcize0HPWbAjWN
 WtOuZZT6I3n49qThOlq735Gmfjv3uUBV8oKa9/84BiTK9Ok3i9+RlSCXgcRlPGtEki1z
 kqK4d6CVrcF2lm2iiRi8ssU7RbaMjCdvBqCUAajThhUyjaKxugNl0mThVZj0bZZVNS8S
 OotAmj/xNVpOtsqyY4zePiMgZZsgzTMXnGeUFtEBqEJATRcEVFpS5ax4PODS7RAL94QZ
 jpgQ==
X-Gm-Message-State: AOAM533CtseRujgTtUM9Q3wAZKmrd7Go7u+JIjSQ6VIfpWmhn7a9pBVA
 0H7V2L7bulrgqJRyMIAnF6odrqor9tfZawu4hwE=
X-Google-Smtp-Source: ABdhPJzGna7kT8ytBKEMRmafA605hdoj/96Adf60Do8VLRmdj9ntw6bzrJXYjfcdcZHwC8be0AHpI8yUwC0EME90ntk=
X-Received: by 2002:a5d:80cc:: with SMTP id h12mr1218936ior.73.1602716460855; 
 Wed, 14 Oct 2020 16:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201014182811.12027-1-cai@lca.pw>
In-Reply-To: <20201014182811.12027-1-cai@lca.pw>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 15 Oct 2020 10:00:49 +1100
Message-ID: <CAOSf1CFT_Y67Q8caH2uFOYtwpRgFozh30ZWWZzzR-x18LBsG8g@mail.gmail.com>
Subject: Re: [PATCH -next] Revert "powerpc/pci: unmap legacy INTx interrupts
 when a PHB is removed"
To: Qian Cai <cai@lca.pw>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 5:28 AM Qian Cai <cai@lca.pw> wrote:
>
> This reverts commit 3a3181e16fbde752007759f8759d25e0ff1fc425 which
> causes memory corruptions on POWER9 NV.

I was going to post this along with a fix for Cedric's original bug,
but I can do that separately so:

Acked-by: Oliver O'Halloran <oohall@gmail.com>

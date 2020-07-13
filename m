Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26EE21D26F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 11:04:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4yPg6wZhzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:04:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=drRS87Al; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4yMj3zjWzDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 19:02:25 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id q74so12663203iod.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Yclj+juePTLzwqAJx3P4X4Xd1M0Nmdyaq4btKWDxq4=;
 b=drRS87AlUMPwTo11ZkwEO7Bm9ESjBOxt6rRH4A/FOE2aHltiwN3YsoJjKX/cpKOay2
 cQUy2NwNwOeeAhaY4qdZc4O6y0hETwVZa3c60tqw52EHViL5EY4USzmFSvtuAjBwdKbe
 Qy5Ykv+yrh86d6GxGniNShi+W28BfQBvBm4UzN47LCfX+qjUuBWwrqzv5FQhP6NyM7qa
 xuHgt+JS656zivOmQLtScIf6H/bdgtC/u1dXVCw28OGJuDcOemeJYAK1hnkQFW06x/Zy
 9KCpcN251aG8A0sTRUAZK+J9JXr8cXO+GjC4XPtkVPfITG979wL4xKAtMPn8Wpe0znGK
 5wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Yclj+juePTLzwqAJx3P4X4Xd1M0Nmdyaq4btKWDxq4=;
 b=Z4cfGOm7drUKYeNuUx+HhmKQesgGp7mWiUIEEJD8aK9lZZxX8kd66ZxPU3uhwjwXQg
 F0MVWwoSShDkdsrGqdrA8pQQjCQ0rzFc52vBLOOvA7F8MHbABAZJrVm+n5Vfy+HzsJoE
 t1/6v7FSI988nbInJOIPIcv0p3wL2o+rt6N2H3tcWCfqGqYXcb3VV+nRFdaPXO685bnD
 gr0o5bSorI9s5fdCiQsURFT5l93EnNrVwJ0BJ1GHcfeA7N3foP1uJVz+vNWsYn1SW0bO
 XXLJLMTWTgRaPBA/PpurUM7thvDWrFQ/MCV5SNltOgZGdQQp9Z7FlH3TgWCsDMF6VoVD
 g/Sw==
X-Gm-Message-State: AOAM531kGGbFLSPMItzUAHmND3Dy0tawluHewyXDyia4uWrg+R2/uCJt
 vIOkT4xUqHp9n917e7e/uAGlKbPQLO0Rfsi1dac=
X-Google-Smtp-Source: ABdhPJz+ZfdhMJG50PIwvWzr0uoaLQXbv+uZ1zcqPfhz5XlyGzJjG1KPyQVhAE+RhZ1ai66nX7q9G7dTtQwWNYXmVGg=
X-Received: by 2002:a5d:8853:: with SMTP id t19mr30887984ios.73.1594630941685; 
 Mon, 13 Jul 2020 02:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-4-oohall@gmail.com>
 <7853bbc2-715b-110a-2d96-8d32e6141261@ozlabs.ru>
In-Reply-To: <7853bbc2-715b-110a-2d96-8d32e6141261@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 13 Jul 2020 19:02:10 +1000
Message-ID: <CAOSf1CE_3K7zRRv0CWm6Gx36p6E7azyov2gk4QnUcrTWC8B0Tw@mail.gmail.com>
Subject: Re: [PATCH 03/14] powerpc/eeh: Move vf_index out of pci_dn and into
 eeh_dev
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 6:56 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 06/07/2020 11:36, Oliver O'Halloran wrote:
> > Drivers that do not support the PCI error handling callbacks are handled by
> > tearing down the device and re-probing them. If the device to be removed is
> > a virtual function we need to know the index of the index of the VF so that
>
> Too many indexes in "the index of the index of "?

I'll index you!

(yes)

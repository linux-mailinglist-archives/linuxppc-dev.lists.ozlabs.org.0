Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EBF23B2B9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 04:22:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLJRm1glPzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:22:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UXiEzQvs; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLJN80nDyzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 12:19:03 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id m20so19189875eds.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 19:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5rMhJiGJ4oqwqKT7lSy/Wp5dj03yRRhS4nWyuw27o/4=;
 b=UXiEzQvsGhP1uzm2u3AHqXvbmeahwdWYfo+oQuWd4H2b9k8DilAIFjkZwAwF/aPakI
 1R9Z4I0HpIhA0qvU+ElBim2UOnG9XxZD7A+l5kWRTcx6cjrPMg+iHDnOadEdIO7YF0AE
 Zx8Q31+kl2aE4rCZ4ixPvWjQRXthjuGjcPnog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5rMhJiGJ4oqwqKT7lSy/Wp5dj03yRRhS4nWyuw27o/4=;
 b=oIvvTOJk4JrUNlesKSxM/jHOZuEVs7ZBNezbWyoPZhYMEAYP8KSB/P9CGWzHF2WdbA
 KdQfHxe/llBIjS3Xr07WFAAyWiiEQtYxoMB4wLfN9G7ObULsaoSRjtP2bLuxDI7VDirU
 G42X8X7HBoa7+WaIrNWtlAOwFANM5YBXMxru+9GJGMLcsPjb55pwFdbPS2VgJAXSc19k
 AKHRXJ3v4r4Z/g2zzA89q85DPkS6sQXXoXhpgq7b1/aUJAXOT9qLaEgacs0pXv2SfNWM
 oxJP3pDNCG19rt6STCZgvucoI5cy6MU+v6IIpvWbWaDswF7PYyCaInSg9v1wBulQL+36
 7r3Q==
X-Gm-Message-State: AOAM530wSxEbAlwn9SVNzgTF1UoNViwiUhiR+fq+Q/hdTsKwpgXYYcIC
 iLXoogHyET5pNjk68YRVM+588A3rQsh/XqNDeVsYXNqxdjs=
X-Google-Smtp-Source: ABdhPJz2+6LdkK5LwQuGtRYlwzb/3ZNX+Ls+3HiwAIHze45c9MG4c1QN+f9WQNnaAeiwgHsbhHxjWF32ObzSKr+6zk0=
X-Received: by 2002:a50:d78f:: with SMTP id w15mr18133334edi.260.1596507540992; 
 Mon, 03 Aug 2020 19:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-5-oohall@gmail.com>
In-Reply-To: <20200804005410.146094-5-oohall@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Aug 2020 02:18:49 +0000
Message-ID: <CACPK8XfM8qSJompV1m7XNiwUbbQyij8tRvJ9xnTopXqT8CAufg@mail.gmail.com>
Subject: Re: [PATCH 4/6] powerpc/powernv: Fix spurious kerneldoc warnings in
 opal-prd.c
To: "Oliver O'Halloran" <oohall@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Aug 2020 at 01:03, Oliver O'Halloran <oohall@gmail.com> wrote:
>
> Comments opening with /** are parsed by kerneldoc and this causes the
> following warning to be printed:
>
>         arch/powerpc/platforms/powernv/opal-prd.c:31: warning: cannot understand
>         function prototype: 'struct opal_prd_msg_queue_item '
>
> opal_prd_mesg_queue_item is an internal data structure so there's no real
> need for it to be documented at all. Fix up the comment to squash the
> warning.
>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674A2BE17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:04:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CgGZ3sZJzDqBX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E6877+Jc"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CgDj2DpPzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:03:17 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id f22so14592652iol.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 21:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o052PLy5+jryQg46d2fbx6XYBDxkm6L+0+tnFzhs2lI=;
 b=E6877+JcIDoerQPNYZs3oRQP+ZqftOJF+6LGuar9bSsvhdRWagsh+xosSe3+MDL//L
 PkMxVRALCgiSwhD8bM51hfxGxPukONbEh/YecQNtaNDMXSptiBM7k0TriyJtsFIVt/5t
 GWflLXRCk3a13I0maBp51UjtuR1mBNmgFOij/HQyvf1ALLgPWBacsfPOIcdhyYegXZRR
 MPpCYage5vIlmDpZb1oXpfNHnaIo0fr9/D7eR1fk4K1KC98qjDKkAYkfHYKU6YqV/S4v
 gG1yP+VuDBz3JY53MKDIOmsNUvgnzapXIq2L2rARqdOtwaiZP9svkJp8iHJrJSyW0gIi
 7P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o052PLy5+jryQg46d2fbx6XYBDxkm6L+0+tnFzhs2lI=;
 b=qt+EhhFLTFDatKYCnhmKowLfyMfAqsb/o/+uUcTKLq/nbjnE4Wrqe3DMrZ5MrZYeTY
 b6biANVBj0qkRYPFhZSuHeexygkKXYJdEEVONJ7Jkt65w6FmzE41S5CvQ1XwS42L2WfQ
 0jw9F7cdEv+ppdcjoVyBX+UL20Je2OsmTXjdR0nmAXNt+USrKM2Wd/25rY5vGbeIXAe7
 Cw0ntvRPxFAvjSGPyB5wvidYg1keAS6iRMkVtIafJJV1HDDnzHBR6RA9Bjv3meIL4pe2
 nhfnhWQNA2HSbbApqSHo0Umcdxx8fmBCf0fJVe5fvLBRcoJHh+7OZ7ejxIQaum8W5098
 Lblg==
X-Gm-Message-State: APjAAAUkZme55R0kQg19IlyR4C9x8crjhjbcTOH+QwWQ8Tkm5E9EyzcT
 UxvyvXWmBBJtZCuYKFLtUvWkZVZPPdDcCBMKOHk=
X-Google-Smtp-Source: APXvYqw5u+2ugdUy1BIW6EoimbFV9ujAhUTbbaw02FLu1Sedl9K3O11QPviqWtHOFERzlT5Q4V7UKfcHdwTcSbRGBdw=
X-Received: by 2002:a5d:9b04:: with SMTP id y4mr26135303ion.195.1559016194109; 
 Mon, 27 May 2019 21:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190528032925.8836-1-stewart@linux.ibm.com>
In-Reply-To: <20190528032925.8836-1-stewart@linux.ibm.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 28 May 2019 14:03:03 +1000
Message-ID: <CAOSf1CHj0p8vgc710hFyT771T52zc0mm3UDu=MV1x39m1Ux3cg@mail.gmail.com>
Subject: Re: [TRIVIAL] [PATCH] powerpc/powernv-eeh: Consisely desribe what
 this file does
To: Stewart Smith <stewart@linux.ibm.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 1:29 PM Stewart Smith <stewart@linux.ibm.com> wrote:
>
> If the previous comment made sense, continue debugging or call your
> doctor immediately.
>
> Signed-off-by: Stewart Smith <stewart@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index f38078976c5d..bea6708be065 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -1,7 +1,5 @@
>  /*
> - * The file intends to implement the platform dependent EEH operations on
> - * powernv platform. Actually, the powernv was created in order to fully
> - * hypervisor support.
> + * PowerNV Platform dependent EEH operations
>   *
>   * Copyright Benjamin Herrenschmidt & Gavin Shan, IBM Corporation 2013.

Stewart, Thanks for fixing it up. Since you're at it, Please replace
the maintainer to yourself.

>   *
> --
> 2.21.0
>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCA80921C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 21:15:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmQWR4d57z3dBj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 07:15:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmQVz1K3Yz3cVN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 07:15:21 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d9d0d0e083so913764a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 12:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701980117; x=1702584917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytNDdKy1mnEm3e+yRbuE/HnHivt5uF3IXJRUZqNhUno=;
        b=pnCQ/Qq7+hvYAcOlSEbYyKjaCNI2AiAnkSvZNzhlPFeXzqLkSuUQ47LLbRumwjpKxV
         shmPsEAs9pUUhlVLuEVaLuKogiGLuHh7Z5JgOEwvBvCki0gg/l5CAWZzy1AtFutqe3C4
         Swia/3ujDEAVIlomPSed22KllZ7QGKvuobjQJjPmo7CWhE8BLBFjfZAyAbFGJAE609Hx
         s4VRqSgfNa9lmzSmaKBSuEVR8jToY/bDbGNrucQdUlkRNkO9SbjBu4oKCX7z9NoGvRBU
         dCttwr13tc+2j8LfiNpZMq7egpAofJfKkg1PRx0E0DE1oyZIjmoUe2SEX/0fQUlKE/sq
         ttjw==
X-Gm-Message-State: AOJu0Yx4H6pPVnIcc7QcqxhSrhcKT9YQZCH4xfu6XhXmClpEFpbyA2lc
	lwAuAu3tuz9Uv7wXeR7VyA==
X-Google-Smtp-Source: AGHT+IFFpMDZK/yIr6hZpE4r1FjYZtPYedvtJwcGCyDCOPoNAYk8TdQZMuSyWAZEu2Vjduf1L9uMfA==
X-Received: by 2002:a05:6830:124e:b0:6d9:d144:c9a9 with SMTP id s14-20020a056830124e00b006d9d144c9a9mr2599082otp.22.1701980117581;
        Thu, 07 Dec 2023 12:15:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l16-20020a9d7350000000b006d9d3d0e145sm84403otk.10.2023.12.07.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:15:16 -0800 (PST)
Received: (nullmailer pid 3350191 invoked by uid 1000);
	Thu, 07 Dec 2023 20:15:16 -0000
Date: Thu, 7 Dec 2023 14:15:16 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 3/4] powerpc/machdep: Define 'compatibles' property in
 ppc_md and use it
Message-ID: <20231207201516.GA3348285-robh@kernel.org>
References: <e6cf01d41502b15e688b6f5aa5c3b68c62b8ac64.1701878821.git.christophe.leroy@csgroup.eu>
 <9da79892e7ff433095a7bf42e86aef02ab86b5c1.1701878821.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da79892e7ff433095a7bf42e86aef02ab86b5c1.1701878821.git.christophe.leroy@csgroup.eu>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 06, 2023 at 05:13:34PM +0100, Christophe Leroy wrote:
> Most probe functions that do not use the 'compatible' string do
> nothing else than checking whether the machine is compatible with
> one of the strings in a NULL terminated table of strings.
> 
> Define that table of strings in ppc_md structure and check it directly
> from probe_machine() instead of using ppc_md.probe() for that.
> 
> Keep checking in ppc_md.probe() only for more complex probing.
> 
> All .compatible could be replaced with a single element NULL
> terminated list but that's not worth the churn. Can be do incrementaly
> in follow-up patches.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/machdep.h            |  1 +
>  arch/powerpc/kernel/setup-common.c            |  2 ++
>  arch/powerpc/platforms/40x/ppc40x_simple.c    |  9 +++------
>  arch/powerpc/platforms/512x/mpc512x_generic.c |  4 +---
>  arch/powerpc/platforms/52xx/lite5200.c        | 10 +---------
>  arch/powerpc/platforms/52xx/mpc5200_simple.c  | 10 +---------
>  arch/powerpc/platforms/83xx/mpc830x_rdb.c     | 10 +---------
>  arch/powerpc/platforms/83xx/mpc831x_rdb.c     | 10 +---------
>  arch/powerpc/platforms/83xx/mpc837x_rdb.c     | 10 +---------
>  arch/powerpc/platforms/85xx/corenet_generic.c |  2 +-
>  arch/powerpc/platforms/85xx/tqm85xx.c         | 10 +---------
>  11 files changed, 14 insertions(+), 64 deletions(-)

> -/*
> - * Called very early, MMU is off, device-tree isn't unflattened
> - */

Certainly an out of date comment as the unflattened API was being 
called.

Reviewed-by: Rob Herring <robh@kernel.org>

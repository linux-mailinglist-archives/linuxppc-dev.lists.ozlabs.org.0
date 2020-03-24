Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97C19038F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 03:28:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mZtH5JWNzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 13:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ueg72aOi; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mZrg4cdSzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:26:59 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id g15so6235380ilj.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V9AiNe/pPmynkyaXxdTC0lZxGJp+g0RHI8wCVZYqI3w=;
 b=ueg72aOiFzN7SyiiA1fNZmTpXaSga+kSY9hWnsZdk3FuQoqPXynye71O/FGnQT6fB5
 Bq+QXzFKkyRni+cIAgsIuqXS5oMBq07mpG2RWAOmwMLbrKfH8ZIKcGZV3837xkZc4IHU
 XwFl/75z4SzMHTxafsfgl7lsgIIx5wBe+FoY4fy1iuEok4DoABU2dDqPjff1vzhFP9jr
 XJnkOaETUzBiEeFbph/GOqspL45v7AY14inhxOWjIogAuFbb/yWBWRkLXJhcNFjDt6CY
 tcfxTgqGGVmCgIQbvERmjgCy7c7f1I3XNUgwgCh+4exUBVsCicrcbL+MdW0Klmq/DWay
 jl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V9AiNe/pPmynkyaXxdTC0lZxGJp+g0RHI8wCVZYqI3w=;
 b=gkkQXXwxc42Oh5alTLGhT5flFG7jH0g9qFEe9rs8T/pF7ySJ9zpxoK3EtN397uFa+O
 BVPsIFIh0Qm0pwBeuB26kkuU2YlW0mBbhhag2ruTJxGjtJ97MiNx5u1XW3atdvmyxzqW
 39lrriMYfHjxZmowurq2Uefk43URPPsoHnE/S0ZLmqwRmfZMS/furKHMUds64/vFyUNF
 vZI6nHif6VLr5XhuIEYE1bzOX+8PezmIxhivZRgyorRqzY8Izz1qMVO5URsygJS5TqB4
 3gMa4UQtH90tGk3V+d9uNQD2EQ0p4iLxUheIwb7pjSk5ydqvN6olHImWaN4feGerB/Jo
 /DPA==
X-Gm-Message-State: ANhLgQ2RUEuOcnvKtM3ERKEtgUuvJuRC7PzUc5cOu8qsMVPWvWE4BYLN
 vnDUj0VQ2/E5kwRyfKc+41miTk5Yao0RHYIe6qE=
X-Google-Smtp-Source: ADFU+vvDOHjxzazuRiyJQgLoOkyPWx8dL+6SYXUeNBYvAKcOm7YoHi5muvaGoBmgWXNTlqOeW4hIaEN6cONRGO0k/+g=
X-Received: by 2002:a92:8993:: with SMTP id w19mr12878452ilk.192.1585016816115; 
 Mon, 23 Mar 2020 19:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
 <396db62b-5342-a1b3-eade-a219afd98fc7@kaod.org>
 <bd846a9c-0e21-1d97-0b03-e01c35ff01ae@kaod.org>
In-Reply-To: <bd846a9c-0e21-1d97-0b03-e01c35ff01ae@kaod.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 24 Mar 2020 13:26:45 +1100
Message-ID: <CAOSf1CFyERZE_am5uXVY2Y65=Vkm=afd39a_2RysKR6nkqvV0A@mail.gmail.com>
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michael Neuling <mikey@neuling.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Frederic Barrat <frederic.barrat@fr.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 8:28 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 3/23/20 10:06 AM, C=C3=A9dric Le Goater wrote:
> > On 3/19/20 7:14 AM, Haren Myneni wrote:
> >>
> >> Alloc IRQ and get trigger port address for each VAS instance. Kernel
> >> register this IRQ per VAS instance and sets this port for each send
> >> window. NX interrupts the kernel when it sees page fault.
> >
> > I don't understand why this is not done by the OPAL driver for each VAS
> > of the system. Is the VAS unit very different from OpenCAPI regarding
> > the fault ?
>
> I checked the previous patchsets and I see that v3 was more like I expect=
ed
> it: one interrupt for faults allocated by the skiboot driver and exposed
> in the DT.
>
> What made you change your mind ?

From init_vas_inst() in arch/powerpc/platforms/powernv/vas.c:

        if (pdev->num_resources !=3D 4) {
                pr_err("Unexpected DT configuration for [%s, %d]\n",
                                pdev->name, vasid);
                return -ENODEV;
        }

This code should never have been written, but here we are. Due to the
above adding an interrupt in the DT makes the driver unable to bind on
older kernels. In an older version of the patches (don't think it was
posted) Haren was using a non-standard interrupt property and we could
work around the problem by going back to that.

However, we already have the OPAL calls for allocating / freeing
hardware interrupt numbers so why not do that? If we ever want to take
advantage of the job completion interrupts we'd want to have the
ability to allocate them since the completion interrupts are
per-window rather than per-VAS.

> This version is hijacking the lowlevel routines of the XIVE irqchip which
> is not the best approach. OCXL is doing that because it needs to allocate
> interrupts for the user space processes using the AFU and we should rewor=
k
> that part.

What'd you have in mind for the reworking the oxcl interrupt
allocation? I didn't find it that objectionable since it's more or
less the same as what happens when allocating IPIs.

> However, the translation fault interrupt is allocated by skiboot.
>
> Sorry for the noise, I would like to understand more how this works. I al=
so
> have passthrough in mind.
>
> C.

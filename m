Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E322554A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 03:18:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B93l44ZDKzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 11:18:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G8RNdA0B; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B93hZ35MQzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 11:16:14 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id e64so15891558iof.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 18:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=au9WXwX08BBTh5LKHhan7lypdLsLLcyPE8UGYw51Kno=;
 b=G8RNdA0B7utkyEKmfbJVIg9ZjTO8HRme5UU5biS9ZC8rzpkXftoN0iM6hWZ/0cOZiH
 tFNgkq4QzWcuyYsBqzEjcBlYzAGqHy5IRyESh+gxjEKShJ7bZufbQGvCQUmYFnrtDtGI
 6f7Lxjvu17Dx7ITZW4zy5p1rfzxHOSMhfSbjx23EQCvnnxOP+9GZvnFcKMvclRWmwq0O
 FUBclyCjEynD1bnzMUwvWT49V1DFAMhoSgSZ1EVdmQ6PVeiMQu8W+oFm5iOL9CamiBWT
 HRqZ0WMUXvx49UP/kfobhqdDwwz35whKNs2/VivOJN8SFQ6vYIe8bz/oMq/96V9V/fIX
 Gs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=au9WXwX08BBTh5LKHhan7lypdLsLLcyPE8UGYw51Kno=;
 b=angazXpZQqOZWzZc5OM/TngpSuQNewqc9ZT4n2mgkxzZcMVBYd+wTR8iX/64iapKRf
 EkoLWhSxkzbn6xuY+ArsFlFMJVzrAfXXPiUuUHERl3NVYg3W01cByFfL4q52pCXi4GCl
 YFzitYT0L4Web0c5x8EXRAz9r5WB0KcgmK6MyGhNfdyo1xUVMmnu7L9/6+0dh8d9p2Tu
 Md1tkjKmulaj1oBwSysccUYIR+hN5k7TsGGhjcssQ8+C+NZTkYArRXyxI0R8e8LBoL06
 sTx/AqGVETZTFSkeTl2Y3ZPYDrgEnGBrLY1m9j3TsUpZ6p6CtphVcXl8Y/jPXOD10UPd
 kMSA==
X-Gm-Message-State: AOAM531XCHCij4vQs/im5Em9ZD0WQyMzSmDAqHVrStZjCL0/wjiUWr5X
 usu5PGoTe62N2lDlrl4en12D1u1o8Ls0uzyRQQE=
X-Google-Smtp-Source: ABdhPJxMrBDfVkpZ+sLYxVqdhO7iy7EoL59rnSUQvECKhq6UqDXY47c2MRunHK7TVLiStoayYJw1ktPDQUX/+0ksUb8=
X-Received: by 2002:a02:cc24:: with SMTP id o4mr23362603jap.105.1595207770984; 
 Sun, 19 Jul 2020 18:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <37af499e-2b8b-7e78-ed4b-0aaf711fcb38@csgroup.eu>
 <20200614233235.121432-1-gthelen@google.com>
 <CAOSf1CHjrFb3J6t0HQXQVVM-PEgAcaCADA8mcwYVi4mpq+f3Yw@mail.gmail.com>
 <xr93sgdo7i2t.fsf@gthelen.svl.corp.google.com>
In-Reply-To: <xr93sgdo7i2t.fsf@gthelen.svl.corp.google.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 20 Jul 2020 11:15:59 +1000
Message-ID: <CAOSf1CGJztzwHX__D0fXkPMXZfDHdwtvU4omwGrWhQfJpBj-Og@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/powernv/pci: use ifdef to avoid dead code
To: Greg Thelen <gthelen@google.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 19, 2020 at 5:13 AM Greg Thelen <gthelen@google.com> wrote:
>
> Oliver O'Halloran <oohall@gmail.com> wrote:
>
> > On Mon, Jun 15, 2020 at 9:33 AM Greg Thelen <gthelen@google.com> wrote:
> >>
> >> Commit dc3d8f85bb57 ("powerpc/powernv/pci: Re-work bus PE
> >> configuration") removed a couple pnv_ioda_setup_bus_dma() calls.  The
> >> only remaining calls are behind CONFIG_IOMMU_API.  Thus builds without
> >> CONFIG_IOMMU_API see:
> >>   arch/powerpc/platforms/powernv/pci-ioda.c:1888:13: error: 'pnv_ioda_setup_bus_dma' defined but not used
> >>
> >> Move pnv_ioda_setup_bus_dma() under CONFIG_IOMMU_API to avoid dead code.
> >
> > Doh! Thanks for the fix.
> >
> > Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
>
> Is there anything else needed from me on this patch?
> Given that it fixes a 5.8 commit I figured it'd be 5.8 material.

Oh sorry, I completely forgot about this patch. I sent another series
that included a more-or-less identical fix after the kbuild robot sent
a reminder:

http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=187630&state=*

That's current in powerpc/next, but if it's causing a build break then
I agree it should probably go into 5.8 too.

Oliver

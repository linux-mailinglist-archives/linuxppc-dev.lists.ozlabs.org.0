Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95136228F8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:10:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNnn0FcxzDqXY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DDIWY/B3; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBNbf74Y1zDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:01:34 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id t18so224888ilh.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 22:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZLJXwo1VKlX/iabelcLQZuAW4pn07ejBE0mltf65Z4=;
 b=DDIWY/B3jkEHldgmmar7sYKPfXtvFSOavr+QvWfRpbq6Z8FRN2iz9RFtLZIRW4RpF+
 0ULTKMglk0ohhvdtCaY7tVDxhoF+ghOUdSxFLjO9BBaDPuwoVPc3S9kCJYZIJuUVt3zu
 UCUbwmYskXJMG4XkbdiTpzk2g6PAk8kb3HFqScWyhVg4lqWs9KiIGVmQoPNt6mISc9Qj
 iNSoA1/UyC6BJiQXn7bgwY12zFkRH5sxZYor/KPuMUAqP/yE3DXNYFdbdo/xUd/diNcj
 182agpo1M5Lk198tZEt5Jrjadv3fCxGCIOz4r83FaVkv3i/4q8wK3Daut9uzlp288P/6
 MI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZLJXwo1VKlX/iabelcLQZuAW4pn07ejBE0mltf65Z4=;
 b=iX2TBSuu3JTMEc3GQTJoaRLsCSvzL35NHybRv3MeVndpEDj3AA/tjCj6XnlaSgiojz
 rQ52SEVoNrSYUJLCiaAw/nRtTc9ZRWD7KiNYDJKa7HTw7dEyYWRGESVG/iOY0SfYwEXg
 Z8inVZ9eb5ul9GEkeGGq1IB7sLl9wfw6hLwJGajvcomUcz8APuoYTmpc7nWI2abJlANV
 gr2LLaM+C41CTrgwGaWq5ZT3w6ScS5HOXOELyq8+besB2WLAFbESCCMH65oaqD+YQ7mA
 Ku9ArBb92yDxov9LwInGcjwkMjksnFyn9MyFSmiTTIWMQ7Qq3tY+V6rFulLGL1q7Yofj
 gtzA==
X-Gm-Message-State: AOAM5307VT7Qbxj4785L9/oIEdo3d6kPtgVogYLFFPULrW/wVwPZfgqr
 cGQ43N1qcZeUl8sswIClQm9qU2nTahidZdiLjO2RIQYQ6VU=
X-Google-Smtp-Source: ABdhPJy3Kg+mR49R9JNr2mwAHnab/8dH24afl/kp1QsVQXlcP7Rz50W2Ocmqeey8cSYpoNwxFM8NtX4sRc+FcqrFgRo=
X-Received: by 2002:a92:9a97:: with SMTP id c23mr32158353ill.258.1595394090801; 
 Tue, 21 Jul 2020 22:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-6-oohall@gmail.com>
 <42897409-5788-dfdb-f2dc-76e99a81b662@ozlabs.ru>
In-Reply-To: <42897409-5788-dfdb-f2dc-76e99a81b662@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 22 Jul 2020 15:01:19 +1000
Message-ID: <CAOSf1CF0jv_cq5xgVz+7fzf155MjHT72p+VN1EY6HjjW1Nza-w@mail.gmail.com>
Subject: Re: [PATCH 05/15] powerpc/powernv/sriov: Move SR-IOV into a seperate
 file
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 7:16 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> On 10/07/2020 15:23, Oliver O'Halloran wrote:
> > +     align = pci_iov_resource_size(pdev, resno);
> > +
> > +     /*
> > +      * iov can be null if we have an SR-IOV device with IOV BAR that can't
> > +      * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
> > +      * In that case we don't allow VFs to be enabled so just return the
> > +      * default alignment.
> > +      */
> > +     if (!iov)
> > +             return align;
>
>
> This is the new chunk. What would happen before? Non-prefetch BAR would
> still go to m64 space?

I don't think there's any real change. Currently if the setup in
pnv_pci_ioda_fixup_iov_resources() fails then pdn->vfs_expanded will
be zero. The !iov check here fills the same role, but it's more
explicit. vfs_expanded has some other behaviour too so we can't get
rid of it entirely (yet).

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE01B4611
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 05:42:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XTSv5zTvzF40n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 13:42:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HYGQmtsp"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XTNx2CsnzF33v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:38:57 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id q10so4234651iop.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lj39JjK1Ka6WytDXmoflHyCDfc0DT9CuN49WyQyzVE8=;
 b=HYGQmtspl6oODhr9V0m7qOpPjoTzgCZYKCDJTuzFme1GJsWenXbBQ6wmmttAWr1f2B
 hXhgelo31z6dq2vfA8vfHV1iOFEL/sP2OAWU4yiUow3U8TJnqKVYLYCYExmb3CoPP9Wa
 dxj24JjUbbydoQq17a0xXgvlitgWzGC1eewGk/A1YbO4/PJ0ncm+fZBP2ixDbe+tbAU2
 6phVIPXzC7JSlmGwvWdjcYAPsc94ulYDImbScBmJh4syvEUi+3hd85kR3jW1SqiI2h09
 JTx0jb/Iq9MKUFYDGAzv2LaWz3hHbSj+kjlfSan2cmosGlKFiknO8LyoOaTmkOYxeFUu
 2DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lj39JjK1Ka6WytDXmoflHyCDfc0DT9CuN49WyQyzVE8=;
 b=Vdf2x3cJppbSSGrmozrdJ1tqKfxAtA1M6a261efiGpC3hW4+hgn5MfcOG29693W+4b
 pxizQOoZdhz5DYcXSRzirailoS3H95z2U2buPlJIhkUDe1287fiUCpUu7UTrlk4e2mea
 txtufOo2teQoID24V4Xj9FLgN2YFlYVjlknxEbvpz5WVyc+PS/aFdxj8X0vL0m+o0zTZ
 Un2OrtKNVpG/O5OgPfiBs2BDnv/A2RWHrJijtWNa8bSB3lsM3XS2gFQtuL6z4qmv+VsX
 x2177TM/iz/LH0w8dZx5m2rNjTwYMmKvDwxJhLGmKFu4lb9DpFPz4pjleG8ys/6OwWb6
 nHJw==
X-Gm-Message-State: APjAAAX9Xs08SGEwoxSzbKXMJKYlNUDtdUu+nlGUVH6QYtnCcLDa/SXe
 mN/B1ldoFxB4MOb43zkbLn/VTOpZzk0G4tQLUOz1Ug==
X-Google-Smtp-Source: APXvYqzlhfEZEdSRwM7kta6GNTfhLPk9V0ay/VzIshvvsEcYab+iTlj/31EFDr/IsFJxNvtqdBfMP30VmsUwRtH1Ehw=
X-Received: by 2002:a5d:9b02:: with SMTP id y2mr1388095ion.146.1568691533889; 
 Mon, 16 Sep 2019 20:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-6-oohall@gmail.com>
 <20190917010421.GE21303@tungsten.ozlabs.ibm.com>
 <CAOSf1CERpP0aFKoTiBprLXfr-CwRhix0wGosXBYnMffFtzF+gQ@mail.gmail.com>
 <20190917033513.GK21303@tungsten.ozlabs.ibm.com>
In-Reply-To: <20190917033513.GK21303@tungsten.ozlabs.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 17 Sep 2019 13:38:42 +1000
Message-ID: <CAOSf1CEV-2AMv=rp6j57UmUZaE0Q8rUUfaft+jGsJ=J6LecgSw@mail.gmail.com>
Subject: Re: [PATCH 05/14] powerpc/eeh: Defer printing stack trace
To: Sam Bobroff <sbobroff@linux.ibm.com>
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

On Tue, Sep 17, 2019 at 1:35 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Tue, Sep 17, 2019 at 11:45:14AM +1000, Oliver O'Halloran wrote:
> >
> > Two reasons:
> >
> > 1) the eeh_event structures are allocated with GFP_ATOMIC since
> > eeh_dev_check_failure() can be called from any context. Minimising the
> > number of atomic allocations we do is a good idea as a matter of
> > course.
>
> Yes, but I meant directly inside eeh_event so there wouldn't be a second
> allocation. It would just be a bit bigger.

Right, my point was that increasing the allocation size also increases
the chance of an allocation failure.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9313FB1CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 09:20:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyhY35TZ5z2ymt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 17:20:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SMgmBVdj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SMgmBVdj; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyhXL5FKTz2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:19:29 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so13218158pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4UxgJMU7SdCSkB9TE+UzCTKQjT/pRZ81HpgcO06zNNI=;
 b=SMgmBVdjiVeMRDeJU7hooJHxpr7oV/xtMClpLw92ilmQkN2dscU+EuUP1FfyfJqAxR
 FkWMidLnklkTvQgAu0NWf8yzJ/BMRvo5t7cF8QTcEvdMuNXDPiwrtuUKnpNqDQ4jPq+g
 VEhC3wXkuhdUcNvk5lIgc0PIIetPFjol0MfplXqrAtXtH2ACXymta9OQq1JAsWgLg9uH
 RjoE4X+FCoaFBxWUpkqaGKKJ3P+AXgKecN21r+Y/eRS9ngH5rQcARuxtEaqWsiR8/BbC
 lmOLfAjcGgxZdlgLWhXt/kb0smBTSJp4patVPYPzqsCjLVVZH4ZZQvnKdxlM4/5Pakow
 Luaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4UxgJMU7SdCSkB9TE+UzCTKQjT/pRZ81HpgcO06zNNI=;
 b=ezIuZ/DgYYutwCJN8vn2tJ3EQHOuYgVFedksynLDNehcIi0SvoZ3wqCIy9Hm4073qF
 /0FTrSdwS1+lUAkrYhhEgSU4tRlNQ3JNv5yhpxApaCs6NI2kQAPGHo6o7Sa1nWeTSpO6
 6k92o208MDFxTby1o4zObsVqenph1Q5WkAokDjhM+FGYyHwU2SV73QeyvF4oIV8p3sql
 xc5TfajIETfh32k7j907Tj6xOBEHwRNe32kXM2/gO6KcyWbziZtsDCfCSxNQlU2GLEJ5
 nKw54hKZrUnjpd+FLXElp+PXoqWktuVrbvNvzv8f2wIoAKWFz8XZ7SQ01CJN8O9B3Bce
 C5IA==
X-Gm-Message-State: AOAM530YOLP8RmqLYuna9YaSZDnngOUuNGP/qihtWVqGxY21bEYwrvlj
 Toc0jUmrYoroAK7VEaxqajo=
X-Google-Smtp-Source: ABdhPJyULB6BUE+bh2kawE4ufELn/3nkaI//crlyM/m7mOt0Lypmo7hYtk2Ulf4Dlb0xFUg1e4/RHA==
X-Received: by 2002:a17:90a:5514:: with SMTP id
 b20mr25429870pji.165.1630307967636; 
 Mon, 30 Aug 2021 00:19:27 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id 202sm13885595pfw.150.2021.08.30.00.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 00:19:27 -0700 (PDT)
Date: Mon, 30 Aug 2021 17:19:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [linux-next:master 2837/10638] powerpc64-linux-ld: warning:
 orphan section `.stubs' from `drivers/platform/chrome/cros_ec_trace.o' being
 placed in section `.stubs'
To: Gwendal Grignou <gwendal@chromium.org>, kernel test robot <lkp@intel.com>
References: <202108271745.fAmJos3o-lkp@intel.com>
In-Reply-To: <202108271745.fAmJos3o-lkp@intel.com>
MIME-Version: 1.0
Message-Id: <1630307703.t3ejpsx47s.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux Memory Management List <linux-mm@kvack.org>, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from kernel test robot's message of August 27, 2021 7:29 pm:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   88fac11862d38306dd0d2398015744877140390d
> commit: d453ceb6549af8798913de6a20444cb7200fdb69 [2837/10638] platform/ch=
rome: sensorhub: Add trace events for sample
> config: powerpc64-randconfig-r021-20210827 (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Dd453ceb6549af8798913de6a20444cb7200fdb69
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout d453ceb6549af8798913de6a20444cb7200fdb69
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cro=
ss O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
>>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/plat=
form/chrome/cros_ec_trace.o' being placed in section `.stubs'
>>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/plat=
form/chrome/cros_ec_trace.o' being placed in section `.stubs'
>>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/plat=
form/chrome/cros_ec_trace.o' being placed in section `.stubs'

What creates .stubs? We have something in modules code which does but=20
not vmlinux code. I can't see anything in modern binutils linker that
creates .stubs. And why is this particular file setting it off? Strange.

Thanks,
Nick

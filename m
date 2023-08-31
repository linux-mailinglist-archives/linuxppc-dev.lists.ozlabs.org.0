Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B41578EF3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 16:05:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lZkWehjq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc2xt0K8gz3c86
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 00:05:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lZkWehjq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc2wz1NsFz309t
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 00:05:05 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-794d98181f0so33362339f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693490702; x=1694095502; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDYwl4eIi6h/gyUKt1OoObJst40opzW/aVju8PiClbw=;
        b=lZkWehjqVTmAFter6vWDDYRaeQPk1z4ulSwvmx/w0Y4Xe4v43yrPqlWYd8BnhCfUm+
         GMjglwtoWnxQb9ConHy/VmtSJ/mj0gpWH8v+osw3WONN0jThwlUu4le3P3nMvfiU+1zk
         SCkCf5+pk0o72ZllZNWxZVEJld+huIHFbVXia+rceEdwfEDEY+G50sQwSUL/ZlCzq29H
         cLJpbolTqUT+TBvXMuFHOqQEnQoPejjQdZcO3w+tqrpISK7p34uaDPyKbImlTbHs7uaK
         IS1KNHlZjyFwfGEIw+KN2H0l+eBrz7D0FbV6Xl/Tp2QJYruOIsOjA/2bddD+1sCnUZ0e
         ERRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693490702; x=1694095502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDYwl4eIi6h/gyUKt1OoObJst40opzW/aVju8PiClbw=;
        b=CRmonpppzgCcK+mzQxzr0y+p3e3+jZRVt7yOQr0YCIR1Ip/x2pMn2xVk3b+7zCxXE5
         G9rm50yVbt+7cZbrpXQjsURfldACvwfivWEdXsVNFSrj0j+IxL1ubMPEyCqR97f3rGQH
         y6OR4VGc8+cfTIAucfbhtJ4g3a2vtvI75/DpOcszzcM/c8fWKDk8794U2VaIc6bob8yJ
         dQiScGuhZt4Ql3tO0MecRKJwa+SLmMbH4VYFA2czjb5mmHrxYIO9kU6KdGhxiChnD6jS
         lmFSS2qAC4RlrfajTJCd5jTjkg6EMkyhPVT5eeaUO46EqyrrpgN5viCAuCXobVEJRyeL
         0Sdw==
X-Gm-Message-State: AOJu0YzzWJrVK4ZqAf2lXF8sacHq4fkYvT9Of+KtUKTPmyu43q0sRHMR
	5L1LbF3smEtvM5U8641PXPI=
X-Google-Smtp-Source: AGHT+IGJDvgnNN8eBDD5q/ZjqmhQeL+FjVbIQhi6XfcgsC0OOVkrKsw/bTxjp3ge/N2ardqbC8tOrQ==
X-Received: by 2002:a6b:dc03:0:b0:792:8230:c175 with SMTP id s3-20020a6bdc03000000b007928230c175mr5367301ioc.6.1693490701753;
        Thu, 31 Aug 2023 07:05:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t8-20020a02c488000000b0042b1061c6a8sm417875jam.84.2023.08.31.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 07:04:59 -0700 (PDT)
Date: Thu, 31 Aug 2023 07:04:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] macintosh: Explicitly include correct DT includes
Message-ID: <6df12112-0849-4d7b-8f99-d2a7a3560a97@roeck-us.net>
References: <20230714174654.4058898-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174654.4058898-1-robh@kernel.org>
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
Cc: Colin Leroy <colin@colino.net>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 11:46:54AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

This patch results in the following build error.

Building powerpc:ppc32_allmodconfig ... failed
--------------
Error log:
drivers/macintosh/ams/ams-input.c: In function 'ams_input_enable':
drivers/macintosh/ams/ams-input.c:68:45: error: invalid use of undefined type 'struct platform_device'
   68 |         input->dev.parent = &ams_info.of_dev->dev;
      |                                             ^~
drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
drivers/macintosh/ams/ams-input.c:146:51: error: invalid use of undefined type 'struct platform_device'
  146 |         return device_create_file(&ams_info.of_dev->dev, &dev_attr_joystick);
      |                                                   ^~
drivers/macintosh/ams/ams-input.c: In function 'ams_input_exit':
drivers/macintosh/ams/ams-input.c:151:44: error: invalid use of undefined type 'struct platform_device'
  151 |         device_remove_file(&ams_info.of_dev->dev, &dev_attr_joystick);
      |                                            ^~
drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
drivers/macintosh/ams/ams-input.c:147:1: error: control reaches end of non-void function 

Bisect log attached.

Guenter

---
# bad: [b97d64c722598ffed42ece814a2cb791336c6679] Merge tag '6.6-rc-smb3-client-fixes-part1' of git://git.samba.org/sfrench/cifs-2.6
# good: [1c59d383390f970b891b503b7f79b63a02db2ec5] Merge tag 'linux-kselftest-nolibc-6.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
git bisect start 'HEAD' '1c59d383390f'
# good: [53ea7f624fb91074c2f9458832ed74975ee5d64c] Merge tag 'xfs-6.6-merge-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
git bisect good 53ea7f624fb91074c2f9458832ed74975ee5d64c
# good: [4fb0dacb78c6a041bbd38ddd998df806af5c2c69] Merge tag 'sound-6.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good 4fb0dacb78c6a041bbd38ddd998df806af5c2c69
# good: [05c618f39089d977b0c3dc1105cb6cd5fc53cd01] arm64: dts: use capital "OR" for multiple licenses in SPDX
git bisect good 05c618f39089d977b0c3dc1105cb6cd5fc53cd01
# bad: [4a3b1007eeb26b2bb7ae4d734cc8577463325165] Merge tag 'pinctrl-v6.6-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
git bisect bad 4a3b1007eeb26b2bb7ae4d734cc8577463325165
# good: [47ca50600efcf994adb62a9a4e75c77d91bd0781] Merge tag 'soc-defconfig-6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 47ca50600efcf994adb62a9a4e75c77d91bd0781
# good: [8f447694c23a432b2e9cfe67fb2651f8f6655bfd] Merge tag 'devicetree-for-6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect good 8f447694c23a432b2e9cfe67fb2651f8f6655bfd
# good: [cd40a1ffddc963e69884a713d8704edd98035861] Merge tag 'qcom-pinctrl-6.6' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into devel
git bisect good cd40a1ffddc963e69884a713d8704edd98035861
# good: [82a65f0844852cec6a70ac05c7d8edb0586c851c] Merge tag 'intel-pinctrl-v6.6-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
git bisect good 82a65f0844852cec6a70ac05c7d8edb0586c851c
# bad: [ef2a0b7cdbc5b84f7b3f6573b7687e72bede0964] Merge tag 'devicetree-header-cleanups-for-6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect bad ef2a0b7cdbc5b84f7b3f6573b7687e72bede0964
# bad: [233d687d1b78080ee79f67356327e0e0e50ef6f5] macintosh: Explicitly include correct DT includes
git bisect bad 233d687d1b78080ee79f67356327e0e0e50ef6f5
# good: [6303d0693f7d6c44bb6eb0b29c906ee28156dd28] clocksource: Explicitly include correct DT includes
git bisect good 6303d0693f7d6c44bb6eb0b29c906ee28156dd28
# good: [32bc7297d855608fcb13af62a95739a079b4f8e2] hte: Explicitly include correct DT includes
git bisect good 32bc7297d855608fcb13af62a95739a079b4f8e2
# first bad commit: [233d687d1b78080ee79f67356327e0e0e50ef6f5] macintosh: Explicitly include correct DT includes

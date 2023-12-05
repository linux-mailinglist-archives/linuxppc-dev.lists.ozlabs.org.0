Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82289805A49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 17:49:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t+qDUyC3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl62r0Q8rz3clL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 03:49:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t+qDUyC3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl61z1Z8Vz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 03:49:09 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7c513dc5815so1982155241.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Dec 2023 08:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701794941; x=1702399741; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YfqclM3ZkWiAXDbZmcjbBwB6xmJbMZCT4iOO/IexVc0=;
        b=t+qDUyC3Ke4U0BFbdAO4Xn2amYmWnRS8MM9TPKnXAejIXcig56uC8WtKFrIR5LOTGW
         teLcQSXNskI0gb+O8oKj2OMYYajBTgb4H1DtsQovMnmjKebxBWNo1TAIvHpX5FpSTMQZ
         zTXbuIbq+K+B3giF6pKSmKqG1gaRa2gRd+cjYuo9kyr11DWkjSPWlQFrjPP7micSSQno
         GnoebOSkTa+34B2wBamuBtdV10gwKLTCU6TFKgbVuYaNr2jDLP/0D3d1XyS4L4GH2SIF
         CDH6oj8ZcUhCYKGszjozIkuk2xCkb8JH8AWx8PHH8orTnXomhEwZbybY9jPTtwC61OIm
         Mykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701794941; x=1702399741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfqclM3ZkWiAXDbZmcjbBwB6xmJbMZCT4iOO/IexVc0=;
        b=jp4Wx+pA615tNTg/iuXmJTXAVYKl3DWHx7cpKiXXQaL7LZ/jlS7q0KkUpSKAsvnUxh
         8CPN3EJlpsIhWX6+ZknbTqYGhxhqrEwbEFZ+SM/6QRghmMUHpyMFevIBjrZUDX1M0VOF
         3slIAhlsZvnZiqwNNW237XvGeM6NZijIBYhwafcB18hNbZk2oUVpLsy29w6XxbbHohwF
         FbJS8RiO6vw+hqOasz9hvrV/mRn5KUAMGWSUMIFSjM3QeRKEM177bkxntDLl+DawNwK5
         Y9F40ZOnamYH14pWwDGsqd8aFhF1mJOaZvFFuHYSorHYOWBgAzllxYC1r1L7TRmcrwIK
         ywHA==
X-Gm-Message-State: AOJu0YwMIHE6RE/NYi8MVyYNffv4vv94sZL9pE0AVVtlJq6Kdkftspnc
	EY98kRM8ZuV2E+NH+EjDgrtbZzj8n6/ZaG6O8VrQ3Q==
X-Google-Smtp-Source: AGHT+IHus3uB7dNMpJ0cP1uy5kkamJOMFLF8zMXjR6WyF50uZ0U0xiaK7tFOWnFeBiVqsPbRDg47o04MaF15ciRegfc=
X-Received: by 2002:a05:6102:34e2:b0:462:c2e9:6dda with SMTP id
 bi2-20020a05610234e200b00462c2e96ddamr3198642vsb.31.1701794940837; Tue, 05
 Dec 2023 08:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20231205031519.853779502@linuxfoundation.org>
In-Reply-To: <20231205031519.853779502@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Dec 2023 22:18:49 +0530
Message-ID: <CA+G9fYs-XB29+aZ2kk9psA+MTo8PCh0owWgwGRiq8JK60CuUtg@mail.gmail.com>
Subject: Re: [PATCH 5.15 00/67] 5.15.142-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: f.fainelli@gmail.com, Gaurav Batra <gbatra@linux.vnet.ibm.com>, rwarsow@gmx.de, pavel@denx.de, conor@kernel.org, shuah@kernel.org, allen.lkml@gmail.com, patches@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org, srw@sladewatkins.net, patches@kernelci.org, akpm@linux-foundation.org, jonathanh@nvidia.com, torvalds@linux-foundation.org, sudipm.mukherjee@gmail.com, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 5 Dec 2023 at 09:10, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.142 release.
> There are 67 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 07 Dec 2023 03:14:57 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.142-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Following powerpc build failures noticed.

* powerpc, build
  - clang-17-defconfig - FAILED
  - gcc-12-defconfig - FAILED
  - gcc-8-defconfig - FAILED

build error:
---
arch/powerpc/platforms/pseries/iommu.c: In function 'find_existing_ddw':
arch/powerpc/platforms/pseries/iommu.c:908:49: error: 'struct dma_win'
has no member named 'direct'
  908 |                         *direct_mapping = window->direct;
      |                                                 ^~

suspected commit:
powerpc/pseries/iommu: enable_ddw incorrectly returns direct mapping
for SR-IOV device
 [ Upstream commit 3bf983e4e93ce8e6d69e9d63f52a66ec0856672e ]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.141-68-gbff845be423f/testrun/21492943/suite/build/test/gcc-12-defconfig/details/
  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.141-68-gbff845be423f/testrun/21492943/suite/build/test/gcc-12-defconfig/history/


--
Linaro LKFT
https://lkft.linaro.org

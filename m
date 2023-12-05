Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94FF805D44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 19:24:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Lj3F+Ag5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl87l23xxz3dBg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 05:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Lj3F+Ag5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl86t0BtXz3cDy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 05:23:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 229CDB81C68;
	Tue,  5 Dec 2023 18:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C20BC433C7;
	Tue,  5 Dec 2023 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701800608;
	bh=1u3S+qdTDDJpU1AH8fRxdM6v7mEapa2b3xh7jr42q/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lj3F+Ag5ozXNa3vw9pJkWyWpOZmMTl8+2HFnH4W/RwXkvCsduK0p1onlXVpCTJmp5
	 2/ugFcqip8aPFmSVrmEWjpBRHj21UKjTnF8MkrqJ7vpxdii/xEfiF0vq0KD1ffM4+U
	 vXh9snhqG0gpkuMFeJp3bGzqjhqHcGiGpTvTpOQ0=
Date: Wed, 6 Dec 2023 03:23:26 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 5.15 00/67] 5.15.142-rc1 review
Message-ID: <2023120610-cause-chariot-961b@gregkh>
References: <20231205031519.853779502@linuxfoundation.org>
 <CA+G9fYs-XB29+aZ2kk9psA+MTo8PCh0owWgwGRiq8JK60CuUtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs-XB29+aZ2kk9psA+MTo8PCh0owWgwGRiq8JK60CuUtg@mail.gmail.com>
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

On Tue, Dec 05, 2023 at 10:18:49PM +0530, Naresh Kamboju wrote:
> On Tue, 5 Dec 2023 at 09:10, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.15.142 release.
> > There are 67 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 07 Dec 2023 03:14:57 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.142-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> Following powerpc build failures noticed.
> 
> * powerpc, build
>   - clang-17-defconfig - FAILED
>   - gcc-12-defconfig - FAILED
>   - gcc-8-defconfig - FAILED
> 
> build error:
> ---
> arch/powerpc/platforms/pseries/iommu.c: In function 'find_existing_ddw':
> arch/powerpc/platforms/pseries/iommu.c:908:49: error: 'struct dma_win'
> has no member named 'direct'
>   908 |                         *direct_mapping = window->direct;
>       |                                                 ^~
> 
> suspected commit:
> powerpc/pseries/iommu: enable_ddw incorrectly returns direct mapping
> for SR-IOV device
>  [ Upstream commit 3bf983e4e93ce8e6d69e9d63f52a66ec0856672e ]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks, now dropped from 5.15.y and 6.1.y

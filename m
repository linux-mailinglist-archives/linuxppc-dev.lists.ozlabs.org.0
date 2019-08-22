Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88075999C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 19:05:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DrWJ3rBhzDrRY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 03:05:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yahoo.com
 (client-ip=74.6.130.121; helo=sonic316-11.consmr.mail.bf2.yahoo.com;
 envelope-from=lyons_dj@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="NmY+dLDG"; 
 dkim-atps=neutral
Received: from sonic316-11.consmr.mail.bf2.yahoo.com
 (sonic316-11.consmr.mail.bf2.yahoo.com [74.6.130.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DkM70XNGzDqTx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 22:27:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1566476856; bh=dOeHeJ8je/EwH6H7VSDhlJGPO95TLpwetHtiJjPPwaI=;
 h=Subject:From:To:Date:From:Subject;
 b=NmY+dLDGUREAsurrjTm44gVlzM9yfgqe3XOfX6AhI3yHn6VfxcjkeZl5ZxRXgBLGn3mnj6CbWJjDWGuJZdK6BBDIz+Vx+dzdioK9WGCWOz+OjjtyBMa5S5pc1XRw2l8MYo3yIIKacVQwC21d0HMxsLIxYPhAt2Q/s+FaAr/qn3hjBfO9kxR6B4F+/IG0Ymwap8S0rDcfiooK2lqdDKxLAiRWcq2DjobivFV3ZekQRymBGX++Z6bVzNqEkKCbatoLjE4JzFHRGL5efdVpmspCl1v59MocRK2YFyjz+X6Sxst60Z4Uqc4CDO9X3Lly3u50vOg4euWXyhne/NPxA+rT/Q==
X-YMail-OSG: DaUc4hIVM1nMth5mnhT.vr2DXTpyfVJc1lcJeuy06IhqI43KF.3DvrMDnJ.8InL
 ibC1hpVPIn0WrqNxMHx3nUIpX9a9iaak1VoWeeFDPWZYwZ0dILtbbBIS6_2v2DsMQElpWZe_gd4l
 R7seyIEU.EkLeOm09akbROWb8Wz3.qWAFfWc8zhFZEWbpxygnWts24d9A77h2aC0ZUDFxy7__gNU
 vSjqW6pxLZ8hHMi8Btau.lfby6dJSW84EfRDQaHkPzH.Yvh3oyY9D6arq8vPKD.DU4iXyKEHXa1K
 WRnKR4bS1BVcBSanFElouybA7PbkpX80zUYepJYZi7CXws6poARvVn9puRf.bJADyhUc6KpYfh8s
 WJIgisJLwmWapaE5rT.FiKnPg1MWXfffW4ZRkk3AtI2rE2AWHSHrj_D56VXsJ3bweRoHBCHRZliZ
 SlrDHc82WM6imDKXdt0oLUlHIN67VYoSeB0dUkZVd3FNBAGLdVTVL3ZHV9Vl0m0AOJFaeTLSBLQS
 vfB9zo9JGfkI2wuhkw7UxXvohAC2P6cVms5_PYQlPfy67zKD.Xr_OBDv4T.yvW257exbTcZ7lFWq
 6_sc3Hwn3xgsYYxdEyMqmoZDmxVpaOWUOpKfMyWmf532lO.aaPF3PNnFRzfFuZdC28mb3x_ty8KW
 wQ2rCL0Nn2o2lEthUtuMo0o3VCfEZ.rXTzlAfhudxUyOIOvN.ES3TKnzuUSza4dD3vmn_Scjj6aP
 CPCpFFnNC_wNwnDKjy2PVoPGmCa49N_hXep_l5PyIRZq7ly9nJFpm5cwjaxWyyiw12wgZ0.mewkd
 zmXVs3k9NzVceiezvihPa1YJm1ONdwsMfV826_O.ExChMO9saV.1QDJhkvA6PqWDNghlagEvTHKG
 4QDXCMMvvrezf.f3Ng4KDaP_M2RuSnYunQZ.kNqHLV6XvLoHh0z.NE7CU3RHS6ybZ2AvT3fdUXGz
 _aDENp.HfuFxM5NazNqmMCGO_M3mmpUUyB13IiKZU4Q2BQS5baKLga9Y6rzv8SaMS0ZZxLy89fNh
 mkPECdoOyvXyGCAPZ0zsWHna2xOz_U1NMbaO1Gjsd.QYqsP8xDrLxVzctuJhNc0rN3UJhi_DHklr
 EDZWgUW.5DBeUIyeqDUpnL4CnPlpLNetWxd4fkypyLNAwMS_58rb6.fsKL0y2GkAcQ1XJXXsQCw4
 vFTw.vRZlX4MIuk3IYWySbVGvPaTRFd9acbN3wmIYk2TaHGssPWXX7jamlEM3SYr4rnb.xg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.bf2.yahoo.com with HTTP; Thu, 22 Aug 2019 12:27:36 +0000
Received: by smtp403.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 636b3eb7e5933c4267c7b7822479b993; 
 Thu, 22 Aug 2019 12:27:34 +0000 (UTC)
Message-ID: <f35cf5dd99530a8e73084f9aa071ddf6bd7df62f.camel@yahoo.com>
Subject: Kernel build error
From: James David Lyons <lyons_dj@yahoo.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Thu, 22 Aug 2019 08:27:26 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 23 Aug 2019 03:03:19 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm have trouble building the latest stabe kernel linux-5.2.9 on Debian
10 ppc

 uname -r
4.16.0-1-powerpc64


 CC      kernel/iomem.o
  CC      kernel/rseq.o
  AR      kernel/built-in.a
make[2]: *** [debian/rules:6: build] Error 2
dpkg-buildpackage: error: debian/rules build subprocess returned exit
status 2
make[1]: *** [scripts/package/Makefile:75: deb-pkg] Error 2
make: *** [Makefile:1422: deb-pkg] Error 2

I'm not sure if it's a problem with the Tabs or white spaces in the
debian/rules file or another issue. I ran into this before but don't
remember how I fixed it, or if I downloaded and oldeer kernel.
#!/usr/bin/make -f

srctree ?= .

build:
        $(MAKE) KERNELRELEASE=5.2.9
ARCH=powerpc        KBUILD_BUILD_VERSION=1 -f $(srctree)/Makefile

binary-arch:
        $(MAKE) KERNELRELEASE=5.2.9
ARCH=powerpc        KBUILD_BUILD_VERSION=1 -f $(srctree)/Makefile
intdeb-pkg

clean:
        rm -rf debian/*tmp debian/files
        $(MAKE) clean

binary: binary-arch

Anyone know how to fix this, or what the error means?



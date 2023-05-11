Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D95701224
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 00:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJ3D54RhQz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 08:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxsystems.it header.i=@linuxsystems.it header.a=rsa-sha256 header.s=linuxsystems.it header.b=l1b8aQpT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxsystems.it (client-ip=79.7.78.67; helo=mail.linuxsystems.it; envelope-from=darkbasic@linuxsystems.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxsystems.it header.i=@linuxsystems.it header.a=rsa-sha256 header.s=linuxsystems.it header.b=l1b8aQpT;
	dkim-atps=neutral
X-Greylist: delayed 501 seconds by postgrey-1.36 at boromir; Fri, 12 May 2023 18:59:10 AEST
Received: from mail.linuxsystems.it (mail.linuxsystems.it [79.7.78.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHjPB32K7z3chX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 18:59:10 +1000 (AEST)
Received: by mail.linuxsystems.it (Postfix, from userid 33)
	id 8FE56215913; Thu, 11 May 2023 19:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxsystems.it;
	s=linuxsystems.it; t=1683825926;
	bh=yhp7v3luRGJ6mq7f7i4QZFLveEgF64yIuE8ANbdh7GA=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
	b=l1b8aQpTATQR13/g/283QB5g1vVSF33CfqUnpPF7R0RUk2S+daOGymYtQIpZjIh1u
	 06SQLvNI2ryQZzryPHkJm2WDq6ccI50rSgLnWQWuxz339kF+r8ty1Z9w/m97zX6SXM
	 UFYKxruaQcQvqqcNG2kKtcaod6rVcMDLGEsqhMOA=
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to  read user page (1128) - exploit attempt? (uid: 0)
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 11 May 2023 19:25:26 +0200
From: =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
In-Reply-To: <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
Message-ID: <a50537d1f1af34104793218acb954a61@linuxsystems.it>
X-Sender: darkbasic@linuxsystems.it
User-Agent: Roundcube Webmail/1.1.5
X-Mailman-Approved-At: Sat, 13 May 2023 08:21:47 +1000
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
Cc: Linux Regressions <regressions@lists.linux.dev>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Il 2023-05-12 10:32 Bagas Sanjaya ha scritto:
> #regzbot introduced: f4f3b7dedbe849
> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553

It doesn't look like the aforementioned patch made its way into 6.3 yet:

niko@talos2 ~/devel/linux-stable $ git branch
* linux-6.3.y
   master
niko@talos2 ~/devel/linux-stable $ git show f4f3b7dedbe8 | patch -p1
patching file 
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
Hunk #1 succeeded at 227 (offset 15 lines).
Hunk #2 succeeded at 269 with fuzz 2 (offset 19 lines).
patching file 
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
Hunk #1 succeeded at 49 with fuzz 2 (offset 15 lines).

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909232575A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 21:12:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmkVT2Vxlz3cZW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:12:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=qYoy3qMe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=qYoy3qMe; dkim-atps=neutral
X-Greylist: delayed 448 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 07:12:28 AEDT
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmkV41snKz3cYX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 07:12:28 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B4C3177F;
 Thu, 25 Feb 2021 20:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4C3177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614283491; bh=lFhsGiaPaFrLP7bCx4x5oX0VuWHZvAm6Q4Pio+vky4g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qYoy3qMeV1Jj27pmWOiJ6LCiqLr/yY8dbHBPIwyJHt8OVdyWASoMm9KhBPhJdXP+E
 LkmVUwfRo0J7Yj1xmJ7nnwyZadGmRB8OQ0jow4P1BN47q+SP1y66P4sqfgyq3ZGnCs
 moXKp3phc/nShUfAFxWrufBr/3vIIMdzpyaCdIqBI+JcAquHuCIyYlpSAX2AWE5CU0
 d3ajcvGl+et67nkQbL/8Xsaad3WrOoPYLdMvWPs/W/NpSh+M6m81LbjbmaEDrZ3lw0
 +G8Uc4ExKGgWW0ouHlAYwlSEU0lsGAZ9jq94Ep2LhGNxewpZur03EFCkelAWadhC3A
 J1hPwm/YEvnJA==
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] docs: powerpc: Fix tables in syscall64-abi.rst
In-Reply-To: <20210225060857.16083-1-ajd@linux.ibm.com>
References: <20210225060857.16083-1-ajd@linux.ibm.com>
Date: Thu, 25 Feb 2021 13:04:51 -0700
Message-ID: <874khzdicc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mchehab+huawei@kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> Commit 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed
> table") attempted to fix the formatting of tables in syscall64-abi.rst, but
> inadvertently changed some register names.
>
> Redo the tables with the correct register names, and while we're here,
> clean things up to separate the registers into different rows and add
> headings.
>
> Fixes: 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed table")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  Documentation/powerpc/syscall64-abi.rst | 51 ++++++++++++++++---------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Applied, thanks.

jon

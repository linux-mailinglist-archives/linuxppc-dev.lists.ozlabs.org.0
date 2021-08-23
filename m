Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA73F4C4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 16:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtZK66c96z2yHw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 00:25:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QOkt6awR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=QOkt6awR; dkim-atps=neutral
X-Greylist: delayed 316 seconds by postgrey-1.36 at boromir;
 Tue, 24 Aug 2021 00:24:56 AEST
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtZJS13FBz2xnd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 00:24:56 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id BF75C559;
 Mon, 23 Aug 2021 14:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF75C559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1629728371; bh=+A2veN2danoxcwS7sX/Lap+UU+FoQD+t06BbYIv/mQA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QOkt6awRxvbY72UFMEgI/Fb/xrFgVrvjMX/cZuCFSvs/CfhjPVjIT4L8cL3w4o+1i
 kY3SLEd7D3OWCWkIaEZGyUD8gPTRJxEQrjIhbwGswzz2BOUs12tEtVp+1YTpYAJw2l
 Ak1NWibjuKRi6Mn2rjFS97+yjoCIfv6ZsujId/yKkHwsgCvWpctdA8moIlebmUDa03
 /qdY30E+Z2tAHPFIa2iXd7eT6om5CP759mM2Pvni+YP0hx23BLB9ehGsKPuJwpNLfM
 w7umjkbiyfX7o61Nw3JrdNy+J9Lu8WM04/Iku/CYrBKdVTU4xiFPVAW13UvEUAyvkq
 5XmMD9bcg+11Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <20210823204803.7cb76778@canb.auug.org.au>
References: <20210823195540.4d7363ed@canb.auug.org.au>
 <20210823204803.7cb76778@canb.auug.org.au>
Date: Mon, 23 Aug 2021 08:19:30 -0600
Message-ID: <87a6l8p7kd.fsf@meer.lwn.net>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> [cc'ing Jon in case he can fix the sphix hang - or knows anything about it]

That's new to me.  Which version of sphinx?

jon

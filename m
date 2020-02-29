Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D421748A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 19:27:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VFHV4p0VzDrB4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 05:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VF5L5kL3zDr9B
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 05:18:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=denx.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48VF5G6rwkz8t1l
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 05:18:10 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48VF5F2ZPRz9sRp; Sun,  1 Mar 2020 05:18:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=denx.de
 (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=agust@denx.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=denx.de
X-Greylist: delayed 559 seconds by postgrey-1.36 at bilbo;
 Sun, 01 Mar 2020 05:18:07 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48VF5C69dpz9sRL
 for <linuxppc-dev@ozlabs.org>; Sun,  1 Mar 2020 05:18:04 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48VDtD2wlqz1rfPg;
 Sat, 29 Feb 2020 19:08:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48VDtC6Sd5z1qql9;
 Sat, 29 Feb 2020 19:08:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ZgJXLnzSXOOR; Sat, 29 Feb 2020 19:08:35 +0100 (CET)
X-Auth-Info: uOJgOoUGSWhnpYpJZ6Ce4sZpFOhSnb7o1YTun+Kg6Kk=
Received: from crub (pD95F11D0.dip0.t-ipconnect.de [217.95.17.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 29 Feb 2020 19:08:35 +0100 (CET)
Date: Sat, 29 Feb 2020 19:08:30 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 6/8] powerpc: Update MPC5XXX MAINTAINERS entry
Message-ID: <20200229190830.52eebda0@crub>
In-Reply-To: <20200224233146.23734-6-mpe@ellerman.id.au>
References: <20200224233146.23734-1-mpe@ellerman.id.au>
 <20200224233146.23734-6-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Feb 2020 10:31:44 +1100
Michael Ellerman mpe@ellerman.id.au wrote:

>It's several years since the last commit from Anatolij, so mark
>MPC5XXX as "Odd Fixes" rather than "Maintained".
>
>Also the git link no longer works so remove it.
>
>Cc: Anatolij Gustschin <agust@denx.de>
>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Anatolij Gustschin <agust@denx.de>



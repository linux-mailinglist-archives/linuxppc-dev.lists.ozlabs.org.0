Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB0351360
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 12:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9znD02xBz3btF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 21:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RJ8tvMOa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RJ8tvMOa; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9zmp1nzvz2yy7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 21:23:54 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1318610CC;
 Thu,  1 Apr 2021 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272630;
 bh=MZ3Ne7ildQK4xFvvzsF6ZSktnlVMdKCIZSj1JEw6htk=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJ8tvMOaVhlGiMjt6SNGdffrUCik9IPv+22Lj9ln8X1D5YKAJpPlRHI7PwxmPDXjk
 k+tMiKCk1lzd4L7/Ijz9gq9wCP+Cg/H3kQH6noZnlfERXRR+L/Js8deCIqF6+Dx5yE
 fLhuKtuBRc6d6GlCMN4MRQkNsG5nS1+Qf3HmRVJUbXZBLtONpUJJVd7vOFagWdCVOx
 M5BQUh483IJcedke6tsujvWW62ZLTwC+1CcbBUKaDb1Y3YrDp+dwSSonww96LHz06i
 nE7hrZqrxvgxeSg3clSt+LoRqErWs1rVwFX0QNaQcCqTzaPYVA4zaUMuPd5miPs7Qh
 m/OMrKD7enkBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
Date: Thu,  1 Apr 2021 12:23:30 +0200
Message-Id: <161727243810.583633.4915294266076534019.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131530.2619900-1-arnd@kernel.org>
References: <20210323131530.2619900-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 soc@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:15:23 +0100, Arnd Bergmann wrote:
> When building with W=1, gcc points out that the __packed attribute
> on struct qm_eqcr_entry conflicts with the 8-byte alignment
> attribute on struct qm_fd inside it:
> 
> drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
> 
> I assume that the alignment attribute is the correct one, and
> that qm_eqcr_entry cannot actually be unaligned in memory,
> so add the same alignment on the outer struct.

Applied to arm/fixes

[1/1] soc/fsl: qbman: fix conflicting alignment attributes
      commit: b9ab2619047edc1c6c07dc68963d84a5979f0abe

       Arnd

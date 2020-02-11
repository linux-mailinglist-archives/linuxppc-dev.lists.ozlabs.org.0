Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BE1591B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 15:19:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48H4dh4WDLzDq99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 01:19:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1iXmxO2G; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48H4bb1wkCzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 01:17:14 +1100 (AEDT)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B24BC2086A;
 Tue, 11 Feb 2020 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581430632;
 bh=vByQHF503laKmhY+4TYWWMdtMcuYYlOvZ0CloVKFDm0=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=1iXmxO2GvOoo8kXKFPnbLpyWfTQQAJRgpEVjSP4xXNWQNHbUK4AbvnvogZkfu5fr+
 DqfrTSVcHz7apoL4nmNqa1LcWQvkxdB9D5GRZcFinlP+j0KGO4JOvkqhC18SwUrv8T
 oW4UMcsSVjSDjkuddE2dG+3u3IxWhVRcq0okOP6I=
Date: Tue, 11 Feb 2020 14:17:12 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/3] powerpc/tm: Fix clearing MSR[TS] in current when
 reclaiming on signal delivery
In-Reply-To: <20200211033831.11165-1-gustavold@linux.ibm.com>
References: <20200211033831.11165-1-gustavold@linux.ibm.com>
Message-Id: <20200211141712.B24BC2086A@mail.kernel.org>
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
Cc: , mikey@neuling.org, stable@vger.kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 2b0a576d15e0 ("powerpc: Add new transactional memory state to the signal context").

The bot has tested the following trees: v5.5.2, v5.4.18, v4.19.102, v4.14.170, v4.9.213, v4.4.213.

v5.5.2: Build OK!
v4.19.102: Build OK!
v4.14.170: Failed to apply! Possible dependencies:
    1c200e63d055 ("powerpc/tm: Fix endianness flip on trap")
    92fb8690bd04 ("powerpc/tm: P9 disable transactionally suspended sigcontexts")

v4.9.213: Failed to apply! Possible dependencies:
    1c200e63d055 ("powerpc/tm: Fix endianness flip on trap")
    92fb8690bd04 ("powerpc/tm: P9 disable transactionally suspended sigcontexts")

v4.4.213: Failed to apply! Possible dependencies:
    1c200e63d055 ("powerpc/tm: Fix endianness flip on trap")
    92fb8690bd04 ("powerpc/tm: P9 disable transactionally suspended sigcontexts")
    a7d623d4d053 ("powerpc: Move part of giveup_vsx into c")
    b86fd2bd0302 ("powerpc: Simplify TM restore checks")
    d11994314b2b ("powerpc: signals: Stop using current in signal code")
    d96f234f47af ("powerpc: Avoid load hit store in setup_sigcontext()")
    e1c0d66fcb17 ("powerpc: Set used_(vsr|vr|spe) in sigreturn path when MSR bits are active")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha

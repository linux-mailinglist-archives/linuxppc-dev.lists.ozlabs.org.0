Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F8084C0CB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 00:21:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H5iOZ77h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTzlS3pzmz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 10:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H5iOZ77h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTzkg0BhYz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 10:20:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E60961714;
	Tue,  6 Feb 2024 23:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CCFC433F1;
	Tue,  6 Feb 2024 23:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707261640;
	bh=1O9RvWgEImib2iF51r5QYr1VDYDSSOzJ9bKUEoxfyA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5iOZ77hy5azlnJnGSyQdl4mhV2QCSpLc03NRtFn/YccY2rA3WUNmT0O2OGzZ4+sb
	 APKAEO2dBqXiyKR6pv6SRbtOOxA5OmZ/ZB3THAEwTODuO2IHIi/HsY8d6qVi7FaVvC
	 Cl0PPplbM88qe73PhLyGAML1/E23IiVS+mqwCsSM1/Ik1at9AN2t0mJgFnINMd0epr
	 m0hjrx1Ss6L+E/Qy3jQXrJ9QXvI35J6PdcDUJSjFqAlgp7suRJXeUzh35NHim+7F2l
	 8e5gZuZMP5trLx514I7b961ZTrSSN3CKIFCoBc87XzSxl05XS1+XLz5HL5K3VQr2Y+
	 KYX3PG36klLYw==
Date: Wed, 7 Feb 2024 00:20:36 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH 2/5] sched/vtime: get rid of generic vtime_task_switch()
 implementation
Message-ID: <ZcK-xETH4ny8zMbW@localhost.localdomain>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <1f519a8c86cf13bc4acd18ed5d8d1705d1554083.1706470223.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f519a8c86cf13bc4acd18ed5d8d1705d1554083.1706470223.git.agordeev@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Sun, Jan 28, 2024 at 08:58:51PM +0100, Alexander Gordeev a écrit :
> The generic vtime_task_switch() implementation gets built only
> if __ARCH_HAS_VTIME_TASK_SWITCH is not defined, but requires an
> architecture to implement arch_vtime_task_switch() callback at
> the same time, which is confusing.
> 
> Further, arch_vtime_task_switch() is implemented for 32-bit PowerPC
> architecture only and vtime_task_switch() generic variant is rather
> superfluous.
> 
> Simplify the whole vtime_task_switch() wiring by moving the existing
> generic implementation to PowerPC.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B684BFD0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 23:07:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iwO/K19o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTy663nYcz3cGc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 09:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iwO/K19o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTy5G70BTz2ytd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 09:06:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9560CCE13C7;
	Tue,  6 Feb 2024 22:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DD8C433C7;
	Tue,  6 Feb 2024 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707257198;
	bh=UZGZYo3rQF8ZQt1Q1DO6QY0N+zaL6JsoCk2GwJ5HiIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwO/K19oOMhIFA05HctRHnCNinzvDTEPi6r/OPZCpX6ODROincXYZIvFUe9tG6VAo
	 45smlY0+UFtPN2QC0xdZqny1b3KP2nNLylVIJLW+keZdmoUNuYlzLQjNtqipSWzVzb
	 JSK+y2MlwrWJL+PF5lBe2vsNyrZMNhtK/ODjWE6K9R+FiuCy5IdXAKiOZ7jX6YnHmA
	 1BuEzcln71eQ6ARbFYWn5NSojNYyUuccwYIKGz/Bv6ipnbxu7cLMSm3d78GF/zmBMF
	 faQYnNiKH7FXNJejU5AeFK24fONgNcBgicsrI7b2w+AMyh5rrWAiZWC6rCVbSkhxbx
	 Bn6LnGkEx/SKw==
Date: Tue, 6 Feb 2024 23:06:35 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH 1/5] sched/vtime: remove confusing
 arch_vtime_task_switch() declaration
Message-ID: <ZcKtaw6udrihSsKw@localhost.localdomain>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <443aebea9128f7f455c76479f161bb6a2c956db5.1706470223.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <443aebea9128f7f455c76479f161bb6a2c956db5.1706470223.git.agordeev@linux.ibm.com>
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

Le Sun, Jan 28, 2024 at 08:58:50PM +0100, Alexander Gordeev a écrit :
> Callback arch_vtime_task_switch() is only defined when
> CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is selected. Yet, the
> function prototype forward declaration is present for
> CONFIG_VIRT_CPU_ACCOUNTING_GEN variant. Remove it.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

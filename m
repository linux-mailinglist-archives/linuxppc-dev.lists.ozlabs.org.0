Return-Path: <linuxppc-dev+bounces-14421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7582BC7CC5D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Nov 2025 11:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dD7D75Ng3z2yD5;
	Sat, 22 Nov 2025 21:11:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763806311;
	cv=none; b=m/00CTW20BmX+aJVYvhlg5F2FfLMAm2tGap3RSDBD5f/kcJcpLpiiCdOZTh7eCR6ZOM8srMfjpQmi/JokYqEODfOiS0NWl35r4VFESOs3cuYyX1hXtKLKHcPwM+FJ1nEym83OEcC1f+TBQNHhRdtGSkR6vieM0Svm5YSjpz7874cse2hJ22PLfWEnJpd48OvNhGgYVZRwAnlCtdEUQIEU69QFynfypAxT3Nu0eYquDgn6qoXoj29Idlw9zpjNQGnYQjE8RI8TqPe+cS8Pxjo4S8jPCa9RVM7rUyTXqrQsdvqo9CeM0FnJ5ziXwqAPJZsALJo0629shY0WsQALFxT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763806311; c=relaxed/relaxed;
	bh=u2P7H6CSeWfeRavuvxhdKjLxwAh5A39cihk4/topHg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFOUpAqZ1xKQiGMVTzSDhfe2Rjr3Rg9hB50J0/O6EU4B1ZTiRBr/12+kLjdkC4Z4R7P/2YrJL4ft1uFsIjMWcfwgFMyKkC9NevcH63lcx2VCnikiT6qjbhLvSPuWLxZ/K21cdbJ6su7C0qy3TZtIaH/z/vHjY+F8DTElBetU7tL8eP3iXRA6HKw9spfMKkvLpcl3r2Yy0vAOUAN+H0DNk4NSa62x3Yq2bgcbqYVYreaDR+rh7k3krxGE3TUZA+8dZu34zmoXwqJCNqwoRB5E4zPkq6Ek1tSDI5fuf0EsQk7fJfMAoSPZHJwv+kX2D2bDOl2wFYJiTdHsBoTvSNHtFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cGVd2iLj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cGVd2iLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dD7D65zS1z2xqn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 21:11:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99AD243AB8;
	Sat, 22 Nov 2025 10:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F44DC4CEF5;
	Sat, 22 Nov 2025 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763806308;
	bh=gGkpOCI4RD9+V/lhr7rLU1PbrWKMwrcPaYukubgCn6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGVd2iLjY3YbXoOgpZPWbV8VI/Q0gpuXxeTsEgUUkjE/QeE1BJB7SDo9Rxiwrpnos
	 M7Gvts5A037kLXQ0efZ5xXTxHdmHZy/sts2Az25ycq2NLydbTQJeSy2fm4kmowFeyw
	 3c6Puat0OSjYdVQzFal9hj0EYFIBZmKqUq5kSOzYyQ3z2uWKfz2Kr8/f/xTHGEBfiK
	 HiqlEN29dMRHCQ6LfACWIMph1Nvghv67Kub2SHo1tQaGsxILuc06Ui+neOSt8zBkrH
	 gkTKLcN/31/XdNURzpkpWZ6puS4EkMTkLF+nsqoMVDYO9fA5hrGhumrA+jPE8cvLfa
	 xG/mZdoSkZYFA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>,
	Gongwei Li <13875017792@163.com>
Cc: wangfushuai@baidu.com,
	frederic@kernel.org,
	ligongwei@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] soc/qman: use kmalloc_array() instead of kmalloc()
Date: Sat, 22 Nov 2025 11:11:31 +0100
Message-ID: <176380603653.1964777.3896069792665004828.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251121061022.114609-1-13875017792@163.com>
References: <20251121061022.114609-1-13875017792@163.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=403; i=chleroy@kernel.org; h=from:subject:message-id; bh=NgxY/adJ3cobR8fVnYzUybTqc0RHqQIANpRfoJAxGII=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQq9oQ80vz5WzrrYw2D1brb7y6xHlT9ND/4j/k+/4feU w2+MpjFd5SyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJGKxl+F/tnVWXe+Di3dsX fW2n/Z+UnqpeN/mZ5fdzvDM/C5ZtenqT4X/Z7cBntQuKzic/iNVSff/ik8599U7h4FkXKsUTehd 67OMEAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 21 Nov 2025 14:10:22 +0800, Gongwei Li wrote:
> Replace kmalloc() with kmalloc_array() to prevent potential
> overflow, as recommended in Documentation/process/deprecated.rst.
> 
> 

Applied, thanks!

[1/1] soc/qman: use kmalloc_array() instead of kmalloc()
      commit: 4ee2a8883d9cd6370a2f858e886f16d7414c9c2f

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>


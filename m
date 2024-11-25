Return-Path: <linuxppc-dev+bounces-3549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D919D860B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 14:13:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxmNk0Wcsz2yMh;
	Tue, 26 Nov 2024 00:13:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732540405;
	cv=none; b=MswGsmVNtO1jC3G5CpfHpyHHHcNv0tgDxxZKIDI1flVNGebDvx3wU+GGerbs2LFgvMD0uudC0hwAzOKrIgAHABUX3TIbt+LNIEUQmtCyFRWs6Su8Gl6H7eFRk2nyzk5pgL0njBlyMbOc9FrXr6/BqASEM0M3B5bCBbSzJQ/43DHkjvHfokBpH10SuGokfKWuIUMo4a35q4OX/8dZ4qvDEdfvtlopTta3aPp0pRqvyugaKnptT7dR2E2xJ6jnewA2MaLBcrpBou7Hc3t8QOppVtujujI3dq7zXzW56UnbEY1ESiEdSRiHuV90FAL9JOi0kg+we+KMtZK/D2xp9OJxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732540405; c=relaxed/relaxed;
	bh=zoe9keCgOz8TdgaZeY2U5FChsOFwHzQn4aQ2XQc2oMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nPcJEofuLlz0qcioUKFxI37o4MVKWH8S+zYfT5pkDC+pojEY8jjfJsdws/sh3Na895kEHc4HKYVvpBhFvYC2Lb/V7lapzkzd2axejtq3ieG/m2GsGmTqFtffH3uDS+jbABnp9aVN85lAMnACVnIBHYgtoN2/Tul7PhuP/LhnMJ8Dc9vtl7XVB1v0TbLHd9AzdYAa4OZSBSKSpzxbzMJm6Jn93kFHqOyyWmp1TOXezE0h+A2KJcKCS1zrTixkTq/Pyu29SOtSyOWe4HHEJTblDLqia+PUWe0dGUKZUsAqw+YfvaNcmsORcNfD6x2fxcyVaRrhoxSS/kt+fyconpyvMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUnFiL7m; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUnFiL7m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxmNj0YPXz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 00:13:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92F92A416C6;
	Mon, 25 Nov 2024 13:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F59C4CECE;
	Mon, 25 Nov 2024 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732540400;
	bh=zoe9keCgOz8TdgaZeY2U5FChsOFwHzQn4aQ2XQc2oMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HUnFiL7mAae91KuKIjZq38fKCFSJ/xeAJC0MKHSCYoLch7XSINlDDErAkmEKfKrBl
	 7JuTksfjNvU+Dypx8p0EI/G2Fhzu9c8FHGOHjTRsxtkA6VLNB7Gy/Tskmtr9VySjLd
	 1/BwilXjzpT7eWAlgRWDMQVe6RXh1uSt11U6NtohY5ZZvTxLsSbPatv3SQLMVqkMnR
	 1GVIZ9VmtROba4i4EU1fuSctCl91TePgrrkXglv5+hmJlc3o//fcw0LB9Z5o8wnSYB
	 zY4qKyBWauQxBjUch391Y/FMHbdTpfMlXB+FVYUOR6QUhRl2qKkos6e6S6MjIiLwlQ
	 MF/4czrgX+pWA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
 linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 25/25] Revert "riscv: mm: Add support for ZONE_DEVICE"
In-Reply-To: <f511de7cb9817e2e2fdd274ee842c228d699abea.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
 <f511de7cb9817e2e2fdd274ee842c228d699abea.1732239628.git-series.apopple@nvidia.com>
Date: Mon, 25 Nov 2024 14:13:17 +0100
Message-ID: <878qt7zcb6.fsf@all.your.base.are.belong.to.us>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple <apopple@nvidia.com> writes:

> DEVMAP PTEs are no longer required to support ZONE_DEVICE so remove
> them.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>

Oh, we're getting the bit back! Thanks!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>


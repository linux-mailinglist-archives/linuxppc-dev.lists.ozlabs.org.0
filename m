Return-Path: <linuxppc-dev+bounces-2791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD769BA7E8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 21:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhQx82bjqz2yDl;
	Mon,  4 Nov 2024 07:21:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730665308;
	cv=none; b=GFfT7fHf/GgStKM09Y5NdEKYcU7nOZlmdg01rp4SHBGAJ2h74S+9DG79CGCKTawyI82sRf+Ziu3WsZg6Vfvmr1tsKV8nHb28LIkd7FxoPRGs3vqHEMzRukDvpsx0GYkcY0MQUpisjied4j2kJu/wCqiTa0qrPAZJwFG9D5SkkVX7jdi9Pe469K8HVTg6hfNbZ9PlugNHI0vr6Jxu7Ng6j/zY3v6rQjv8Pvys9N6gHIMrYYzZ9xB5DAwU7wWOC6UFaiHsVOBNti55xTe32c+yieUEDu27PixS5LcBkznm/D/pki55HwqwjBbKkDObYW2F7iDKWWtBF/YVYnrTBDzZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730665308; c=relaxed/relaxed;
	bh=8Ukc+M8CZYwlrpkjWIRwsZhzje/hVh2caYXefeqy6UU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VO204XU6HB9BSAFwqABwk9s7cX8LwMvixK5dh75hf0dPVGME/hx7FhRwEWxhX/MC/ut1wX4w4vOu/edinSO2s2XwqusQroBdkaLGPgSKAsKtQr0/teV7UL8eqpIXvj8vpO/BiU7KSNLwb3x1XJAE++scn9jpkogO11mcgjmowhcCRw0/l4nXONWJGyYqM/upK8mCALjzw8PNAbFiJCJRxVmNNdzz3AflZivdbM8MxEqSUo+4m2BTbIgxGU5fYqgYNBZ5XaugdtbgYdzHnc4Iqere+uSEztWTvZ7FmlDUfWj4W5OCOTS5tSwo8aOB4OeSqffxU256v2UQ2YefqKgsFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hbPRZL05; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hbPRZL05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhQx71VYXz2y7M
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 07:21:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D59F8A41CBB;
	Sun,  3 Nov 2024 20:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD122C4CECD;
	Sun,  3 Nov 2024 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730665301;
	bh=8Ukc+M8CZYwlrpkjWIRwsZhzje/hVh2caYXefeqy6UU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hbPRZL054fJi30LppOH0pHtwRISF1ZSCdVrUtYIu0ppNa8ioEdfJ/dm3YYfLz3NtM
	 FDDzikzL4fj4/2tA7J1E2L9mrUIuRitDbxRchOPRHLYcpY+eVOIJJUF/2sw3Nv+KC/
	 MkKYL5CoKKRrOmeBncDVf/hgEJBxRSJtwv+KWf1H5OACVRVjFtm4ZhiLiklw82+0AM
	 m+Qj20+jgyR1zDpVDBdBJVbyxI0vaXCMLviA7xAjCakdiPWw7LkGP1wzsNIVt0xcPl
	 p/Kmu0WgZ75pRzFzZgf6IDZpKyq49AkrdXRhOn5GT7MpWMd7DiNlI4obZ4xpQ3JFue
	 qRzwHjaAGgKpw==
Date: Sun, 3 Nov 2024 12:21:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arthur Kiyanovski
 <akiyano@amazon.com>, Brett Creeley <brett.creeley@amd.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, David Arinzon <darinzon@amazon.com>, "David S.
 Miller" <davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, Felix Fietkau <nbd@nbd.name>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Geetha sowjanya <gakula@marvell.com>,
 hariprasad <hkelam@marvell.com>, Jason Wang <jasowang@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Louis Peens <louis.peens@corigine.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Noam Dagan <ndagan@amazon.com>, Paolo Abeni
 <pabeni@redhat.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, Roy
 Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, Shannon
 Nelson <shannon.nelson@amd.com>, Shay Agroskin <shayagr@amazon.com>, Simon
 Horman <horms@kernel.org>, Subbaraya Sundeep <sbhatta@marvell.com>, Sunil
 Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, virtualization@lists.linux.dev
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by
 reference
Message-ID: <20241103122138.6d0d62f6@kernel.org>
In-Reply-To: <20241031002326.3426181-2-csander@purestorage.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
	<20241031002326.3426181-2-csander@purestorage.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 30 Oct 2024 18:23:26 -0600 Caleb Sander Mateos wrote:
> In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> 94% of which is attributed to the first push instruction to copy
> dim_sample on the stack for the call to net_dim():

Change itself looks fine, so we can apply, but this seems surprising.
Are you sure this is not just some measurement problem?
Do you see 3% higher PPS with this change applied?


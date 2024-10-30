Return-Path: <linuxppc-dev+bounces-2738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07A9B70ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 01:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf4Fr0zWGz2yDk;
	Thu, 31 Oct 2024 11:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730333583;
	cv=none; b=bWf83Kq+o7mGPfg+vXqOrOw/enuUF/x4CsY2mgR0WFcj/AclSEJxBP21YSK3CMgZs5B4Ak9qImrehHmnB3e1jkjk2/RSJ4iBdioolWkxB7Gc55zWIpdix/yzGTitYZ07dgywFGt4A1A/fVXA+CJqfllAdJGLlCFYK6wIahIoIlZG/HblzD8xWId7AcW2sOAusuvtRXXEZHMzwOOiUfHNVOTxNARGCVlJr+gnmzUFt0qVlLwsv2a++Cxnqcd+r0XORdmpP9zKgE3zvh5vZYWWgWpQAleso07HwsSldprFJrkT7cJvGZa36OIEaxiuImprmSNxLtZOWifGBv+EsezW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730333583; c=relaxed/relaxed;
	bh=1gQ9k41W3wMLr1E72MP7qlXIkEHrg2DS7W0/qcJ6WFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iz9U7IE7HrRAi+WgUDzqBaDUwTc0HzjGwXQ48/NjTscg73ICFBCYpLORng8DZPf6UpQ6a4bPjUbhy7HRzyZo3eVWRcaHW84+sr+qDBZH/ebTrAJHvFcXEFPNSnCRXiWhW8lTiqvUEi9nbSUJ5j5J9pXdEQjWASeOPR9YC4eXbz+a8qiEoxSVg9z/ZuQPTAVjh1zaz1bgYK5kOh7QzpfJMH/x0iMgUjeTZGfxv8YINq8134HEwM4Ekj/WTKt/7+/Xzezulx2ThSYNb5/1hL1AmLDfrylJIZFhOLyxN9sp9NhjVF/9Gz60PORuE49NK3xQN64wVSoVE733b/dO4Xbveg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ju76Edax; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ju76Edax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf4Fp5h7Gz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 11:13:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B36F5C6FFA;
	Thu, 31 Oct 2024 00:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA34C4CEF0;
	Wed, 30 Oct 2024 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730332089;
	bh=Q0wXyQGBlYip/F0j6/woGSioAXOUzqyfPJJC3tkOLK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ju76EdaxYrc2VgAjivV0KVt2GMgCCgQhkFEfaJJ6/pgDxTefM1lg4Tf1OWyD6kJF1
	 KPs45HSaTf/dlBDXadIlmKLrd/PTXlvHaEPFN+6htEnDe9la3DhVDjvzJ08pFbHCu1
	 Mi9Dcrl+rhMsrI94lHkbmm+ltjVTd56lvqQYX2iMsa9T1VhTsDaczRIlDIIrjNFfwV
	 BJFkhdoI7ChFFbj0fL95fN0enUv6F2jgu70AtVwj6XP/DlYWjcgdm+p8m6To/KCBGH
	 7u3hKM5vMU2n1gcpbXdQJ1gi5+guUy9KsxG9mMUy4fX4yx/ByjRBAgjJViZhPyf2di
	 YfF8DVjTLFaVg==
Date: Wed, 30 Oct 2024 16:48:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Tal Gilboa <talgi@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon
 <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, Saeed Bishara
 <saeedb@amazon.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Michael Chan
 <michael.chan@broadcom.com>, Doug Berger <opendmb@gmail.com>, Claudiu
 Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Felix Fietkau
 <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Louis Peens <louis.peens@corigine.com>, Shannon Nelson
 <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, Roy Pledge <Roy.Pledge@nxp.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
 oss-drivers@corigine.com, virtualization@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Message-ID: <20241030164805.40408945@kernel.org>
In-Reply-To: <20241030194914.3268865-2-csander@purestorage.com>
References: <20241030194914.3268865-1-csander@purestorage.com>
	<20241030194914.3268865-2-csander@purestorage.com>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 30 Oct 2024 13:49:08 -0600 Caleb Sander Mateos wrote:
> net_dim() is currently passed a struct dim_sample argument by value.
> struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> passes it on the stack. All callers have already initialized dim_sample
> on the stack, so passing it by value requires pushing a duplicated copy
> to the stack. Either witing to the stack and immediately reading it, or
> perhaps dereferencing addresses relative to the stack pointer in a chain
> of push instructions, seems to perform quite poorly.

Looks like patch 1 didn't get CCed to netdev. Please repost?
-- 
pw-bot: cr


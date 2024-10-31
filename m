Return-Path: <linuxppc-dev+bounces-2756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F69B8566
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 22:36:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xfckc3HfQz2xvR;
	Fri,  1 Nov 2024 08:36:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.95.48.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730399323;
	cv=none; b=N+bray7R/kFzTctiZi4M1U00a5l1gGDzzn0ng9RekmFVy038bwlZsejcaaxmTSaPQvJZRmM8d5sXoYzbI6MXekCg+y/s0rGlpedrwujRmTgaZyS9PvvN6AOFfUzohTDqVWN7bpdzEZlEnfHwyeHWbFqbNWL60jEUmlyqmRVMos3h1ucx8qirq0NvVLrI7/bSZd+Mox2c2O/aaeRa18whFNMXsowg+SHIkgkd0qjyxUnmCQZ7qxf3FF4nQePocBTynkNOQLOTC+XaSFYTv1VrpAW7rldNtQQLYJodiSe7+zJrQ3pIXhf4Q+VDasL1HWfmmMweSS1E9EvQ8Cerw/Qu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730399323; c=relaxed/relaxed;
	bh=ecc7x6z5tBSynVvbhNaEuzIQivszgPRWP9c+1MOAWAs=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RLaxyqOiAYN72kArCLE6c3MEhpWMn/nAsdwdFrK5mKgyBPnSPczePBstR4GB7U6/LgFIeCzIwhQWjvmRAc1lM9B9qFibJojbUR/nxjIRCrLe57uYLJD8QDO0L7svNlOAmALazWZ2qQo/G2YqeSKQavCit/jYoyY+cNmd7FmdDaRKBLOXCfMPI0j6zgsG9UFEc1S7VZNOkTKFnB+s7QNsTX1f87WW5YnxHxnCXRhWrR4CMZlUNlbMF/5FfOSrozKKGsW92Ma5LPQbtU/FkleAhkGa3WfSW0Yu+xHolCsAmMfNLso+FGsdAa6lyQVUYjRai6iIAxXnSMBOVJyuQJ2Q9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=e0bx/aeZ; dkim-atps=neutral; spf=pass (client-ip=52.95.48.154; helo=smtp-fw-6001.amazon.com; envelope-from=prvs=027303c81=akiyano@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=e0bx/aeZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.95.48.154; helo=smtp-fw-6001.amazon.com; envelope-from=prvs=027303c81=akiyano@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfXZ244Thz2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 05:28:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730399323; x=1761935323;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=ecc7x6z5tBSynVvbhNaEuzIQivszgPRWP9c+1MOAWAs=;
  b=e0bx/aeZ0iSOZqPpV3wZajFYWFLBldCFDQcfAmGZVPsxJrNRMWjdeI5y
   H3Q0qVw2rw/ESqXkQRZZ8TYJCk6aN7TQcrJLLVxZZRiMnQPCbiXYicmhI
   ccmIx5lF2dUD77IN6WIjLf058pDV/V62ZHsQ7/fe83044Rm7Ug/l5jwhh
   4=;
X-IronPort-AV: E=Sophos;i="6.11,247,1725321600"; 
   d="scan'208";a="436222997"
Subject: RE: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Thread-Topic: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:28:34 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:34386]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.16.73:2525] with esmtp (Farcaster)
 id 86134643-d973-4b41-85cd-ca98a4e48a9d; Thu, 31 Oct 2024 18:28:32 +0000 (UTC)
X-Farcaster-Flow-ID: 86134643-d973-4b41-85cd-ca98a4e48a9d
Received: from EX19D005EUA004.ant.amazon.com (10.252.50.241) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 31 Oct 2024 18:28:32 +0000
Received: from EX19D022EUA002.ant.amazon.com (10.252.50.201) by
 EX19D005EUA004.ant.amazon.com (10.252.50.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 31 Oct 2024 18:28:31 +0000
Received: from EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d]) by
 EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d%3]) with mapi id
 15.02.1258.034; Thu, 31 Oct 2024 18:28:31 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Caleb Sander Mateos <csander@purestorage.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Brett Creeley
	<brett.creeley@amd.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	"Arinzon, David" <darinzon@amazon.com>, "David S. Miller"
	<davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Eric Dumazet
	<edumazet@google.com>, =?iso-8859-1?Q?Eugenio_P=E9rez?=
	<eperezma@redhat.com>, Felix Fietkau <nbd@nbd.name>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>, Jason Wang
	<jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky
	<leon@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Louis Peens
	<louis.peens@corigine.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Dagan, Noam" <ndagan@amazon.com>,
	Paolo Abeni <pabeni@redhat.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Roy Pledge <Roy.Pledge@nxp.com>, "Bshara,
 Saeed" <saeedb@amazon.com>, Saeed Mahameed <saeedm@nvidia.com>, Sean Wang
	<sean.wang@mediatek.com>, Shannon Nelson <shannon.nelson@amd.com>, "Agroskin,
 Shay" <shayagr@amazon.com>, Simon Horman <horms@kernel.org>, "Subbaraya
 Sundeep" <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, "Tal
 Gilboa" <talgi@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Xuan
 Zhuo <xuanzhuo@linux.alibaba.com>
CC: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "oss-drivers@corigine.com"
	<oss-drivers@corigine.com>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>
Thread-Index: AQHbKytOj0WWkTVG4E2tmTmQTyqqDrKhLiag
Date: Thu, 31 Oct 2024 18:28:19 +0000
Deferred-Delivery: Thu, 31 Oct 2024 18:27:59 +0000
Message-ID: <7f494c4ae5a041fbafa4059e85431857@amazon.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
In-Reply-To: <20241031002326.3426181-2-csander@purestorage.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.106.101.5]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> -----Original Message-----
> From: Caleb Sander Mateos <csander@purestorage.com>
> Sent: Wednesday, October 30, 2024 5:23 PM
>=20
> net_dim() is currently passed a struct dim_sample argument by value.
> struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64 pas=
ses it
> on the stack. All callers have already initialized dim_sample on the stac=
k, so
> passing it by value requires pushing a duplicated copy to the stack. Eith=
er
> witing to the stack and immediately reading it, or perhaps dereferencing
> addresses relative to the stack pointer in a chain of push instructions, =
seems
> to perform quite poorly.
>=20
> In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> 94% of which is attributed to the first push instruction to copy dim_samp=
le on
> the stack for the call to net_dim():
> // Call ktime_get()
>   0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> // Pass the address of struct dim in %rdi
>        |4ead7:   lea    0x3d0(%rbx),%rdi
> // Set dim_sample.pkt_ctr
>        |4eade:   mov    %r13d,0x8(%rsp)
> // Set dim_sample.byte_ctr
>        |4eae3:   mov    %r12d,0xc(%rsp)
> // Set dim_sample.event_ctr
>   0.15 |4eae8:   mov    %bp,0x10(%rsp)
> // Duplicate dim_sample on the stack
>  94.16 |4eaed:   push   0x10(%rsp)
>   2.79 |4eaf1:   push   0x10(%rsp)
>   0.07 |4eaf5:   push   %rax
> // Call net_dim()
>   0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
>=20
> To allow the caller to reuse the struct dim_sample already on the stack, =
pass
> the struct dim_sample by reference to net_dim().
>=20
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---

Thank you for this patch.

For the ENA part:

Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com>

Thanks,
Arthur


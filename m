Return-Path: <linuxppc-dev+bounces-2755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A79B8565
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 22:36:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfckL5tCcz2xfb;
	Fri,  1 Nov 2024 08:36:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=207.171.188.206
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730398968;
	cv=none; b=CB0H34SN3187pMUr5UshG9qLAA81MvWE9H39BHqFblecqpy2VlK6CTGoJdGog1Kl3IKcAsQoMxNMU2M8FS1NxXdPoFQ9/dftdZnwVBPvsd+3NHdQjnfhYwc99AWkFKk5cRay+OptQU0FZf+bgFBfy114eRUR53X22k+LnhIjiUl0fBC2IW1v5hm3EbPRGmFgvwk7oyqAwtbDxzU6mV43U1u7NvLsvYRtKylNA9RnfeTPJueHe0kiAaH3X//M7f7brnHXCG0CIQ9z07I9OjF2JS6SRDYS3MZgYfMPmlR0HoYPcnCN6sLWQeLOJPiHmT1AiA0O1kn0qTlFxRtFrhI0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730398968; c=relaxed/relaxed;
	bh=W9ptO2AWHJvDBqBcplJ9x7hVH9AqEur0XDGEUTb8INw=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RQbD3tEJ01Ejby02W+zLNpcGtx618S54b7iIYCYjW70KnCm1pWc6VuHLe9Wd3Aq7eyME5vazL9WelkBErr41TH+TeFizszvG4DqmRZ9GccHoljA7KeCIvLTIVLNMOssZB8RE5RFW9eq4gu8dFeAMuSY4PyO6btVE92CL7+xWbtdWLjs5ANj6srZ3TLqacTDGDH1XTmIvaN26rwvuDD7As1XUJtNj/EQC5kj+9972tdReTmcQKVpkheDRGtQYSwFXaFdYTmZHjTaijqd4MIhyfFEXd3nElykMUwGntjtsP3z6/cWNdMtYLkqURo7vT/epaIKK6RYJqRHQE5kn/lwpeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=MhKC0eWA; dkim-atps=neutral; spf=pass (client-ip=207.171.188.206; helo=smtp-fw-9106.amazon.com; envelope-from=prvs=027303c81=akiyano@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=MhKC0eWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=207.171.188.206; helo=smtp-fw-9106.amazon.com; envelope-from=prvs=027303c81=akiyano@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfXRB5kJzz2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 05:22:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730398967; x=1761934967;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=W9ptO2AWHJvDBqBcplJ9x7hVH9AqEur0XDGEUTb8INw=;
  b=MhKC0eWAm3yeJTqw8WCPRgDxj0kCswMWu/P3m1Vuxr0fysHfQcP/jG6W
   /me6UTmTRAWGTjuY1bwLvyjn/uLKnaB33xx1I2eT78uf1FFUR17s6ScpZ
   jzTDY3IBM1YWUqMI5qaZDwxX9lYpEYxq0EG6HymjdVgrNT5ChFRk5Y52e
   E=;
X-IronPort-AV: E=Sophos;i="6.11,247,1725321600"; 
   d="scan'208";a="771897177"
Subject: RE: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Thread-Topic: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:22:33 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:61073]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.2.199:2525] with esmtp (Farcaster)
 id 5b69f371-b19a-4292-b4a0-5c7f596b7e5d; Thu, 31 Oct 2024 18:22:32 +0000 (UTC)
X-Farcaster-Flow-ID: 5b69f371-b19a-4292-b4a0-5c7f596b7e5d
Received: from EX19D005EUA001.ant.amazon.com (10.252.50.159) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 31 Oct 2024 18:22:31 +0000
Received: from EX19D022EUA002.ant.amazon.com (10.252.50.201) by
 EX19D005EUA001.ant.amazon.com (10.252.50.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 31 Oct 2024 18:22:31 +0000
Received: from EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d]) by
 EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d%3]) with mapi id
 15.02.1258.034; Thu, 31 Oct 2024 18:22:31 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Caleb Sander Mateos
	<csander@purestorage.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Brett
 Creeley" <brett.creeley@amd.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	"Arinzon, David" <darinzon@amazon.com>, "David S. Miller"
	<davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Eric Dumazet
	<edumazet@google.com>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, Felix Fietkau <nbd@nbd.name>, Geetha sowjanya
	<gakula@marvell.com>, hariprasad <hkelam@marvell.com>, Jakub Kicinski
	<kuba@kernel.org>, Jason Wang <jasowang@redhat.com>, Jonathan Corbet
	<corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Louis Peens <louis.peens@corigine.com>, Mark Lee
	<Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Dagan, Noam" <ndagan@amazon.com>, Paolo Abeni
	<pabeni@redhat.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, "Roy
 Pledge" <Roy.Pledge@nxp.com>, "Bshara, Saeed" <saeedb@amazon.com>, "Saeed
 Mahameed" <saeedm@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, "Shannon
 Nelson" <shannon.nelson@amd.com>, "Agroskin, Shay" <shayagr@amazon.com>,
	Simon Horman <horms@kernel.org>, Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>, "Tariq
 Toukan" <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>
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
Thread-Index: AQHbKys/FLYzAvitdkSVBoM6s5J6lrKhGqwAgAARw2A=
Date: Thu, 31 Oct 2024 18:22:15 +0000
Deferred-Delivery: Thu, 31 Oct 2024 18:21:26 +0000
Message-ID: <7bf7d713339e4854bfcb80c866aa55fe@amazon.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <d9c01354-853c-459b-9da4-3c1d77102749@broadcom.com>
In-Reply-To: <d9c01354-853c-459b-9da4-3c1d77102749@broadcom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.106.101.5]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

T24gMTAvMzAvMjQgMTc6MjMsIENhbGViIFNhbmRlciBNYXRlb3Mgd3JvdGU6DQo+IE1ha2UgdGhl
IHN0YXJ0IGFuZCBlbmQgYXJndW1lbnRzIHRvIGRpbV9jYWxjX3N0YXRzKCkgY29uc3QgcG9pbnRl
cnMgdG8gDQo+IGNsYXJpZnkgdGhhdCB0aGUgZnVuY3Rpb24gZG9lcyBub3QgbW9kaWZ5IHRoZWly
IHZhbHVlcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2FsZWIgU2FuZGVyIE1hdGVvcyA8Y3NhbmRl
ckBwdXJlc3RvcmFnZS5jb20+DQoNClJldmlld2VkLWJ5OiBBcnRodXIgS2l5YW5vdnNraSA8YWtp
eWFub0BhbWF6b24uY29tPg0KDQpUaGFua3MsDQpBcnRodXINCg==


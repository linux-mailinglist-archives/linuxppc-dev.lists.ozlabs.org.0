Return-Path: <linuxppc-dev+bounces-2815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989469BAB11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 04:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhbpG46B4z2yDp;
	Mon,  4 Nov 2024 14:01:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730688340;
	cv=none; b=GLAy6TVRijUOVYxfCGV4HZDXLEw6/Phsr595kFUQUV9mB3SOtqiuhT/SG1cULwYU+3mT4MOKOJhOmS8FNNEJAEx/C8Td12MACnWlaZiDz3riyADd2do/XQErv6PGgFQSq7OSW4EHAt1ngnd9Lrqirjh9t2t9ba+wjFt77RRqY60atN59cZMGaLQiO9Ln8m5ehIwdrZc+mqicAoCWeEBANkqw9f8QF79hg3W4qfDZH8C+R9B3G5SL9Sj6nqBlh3QuVxYtl4cCTrGqXo8rFoPDAFPqHRNt7NJv9UWmcSdMARi8TzS44JQX11ANFi2p3kFYKUzHQUbvor1su8XBijNbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730688340; c=relaxed/relaxed;
	bh=VMJ0qNC7D3RhewOuf4cdyfmebiUIbRwkpgu9S0MsSDk=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=aU+rUBOKtpbLCXjUR1m09f2rR5Lfm4qkbrLyEVISNXx6HuLIh172J6QBqRtAPRI1EyH3eQ+L1pQJUGfF1UxU/ovefiabRXoSxbNTOvF5F0omIkgVeDl8YNC/XOE26x7IfP+SNiRy2k9pdGleHFOuVw71vGcbmo2VROW4/1ty7M7TWFzZNv9o0+M4Y78Qb0Q7+nlEnyKuJzYBhOVE810Y//LLfSu990jnJZWZsuJqShOLKw5/g+ZkecrIg/jgqO3NZ4VzUHJFKOp6fQWIDPZTZ39QEVrkfq3oz7JWET5QEq18zVaFxhz9tQBtr0ddvt0KFN6I/OwAOd7DaK9cVwmTeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TTpnZdIE; dkim-atps=neutral; spf=pass (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xuanzhuo@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TTpnZdIE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xuanzhuo@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhbS125M2z2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 13:45:34 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730688328; h=Message-ID:Subject:Date:From:To;
	bh=VMJ0qNC7D3RhewOuf4cdyfmebiUIbRwkpgu9S0MsSDk=;
	b=TTpnZdIEhQmNJfmGQHF2L+0E28itDFF1ZcLBNaADSfzCsoSUBaQYMGD2D6zqyA3w7i7+eGZ5NKPpeLJoS6JaJbDpsTesZLZJM+qoICuOTFClKXpPg3wNzHLZK0l5cOVCCcyAiPFhapaRE2fLEfMsmrBCWrLDCqs7lMwr7Qxx0QE=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0WIZlEgZ_1730688325 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 04 Nov 2024 10:45:25 +0800
Message-ID: <1730688315.6177652-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Date: Mon, 4 Nov 2024 10:45:15 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
 intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org,
 oss-drivers@corigine.com,
 virtualization@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arthur Kiyanovski <akiyano@amazon.com>,
 Brett Creeley <brett.creeley@amd.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 David Arinzon <darinzon@amazon.com>,
 "David S. Miller" <davem@davemloft.net>,
 Doug Berger <opendmb@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Geetha sowjanya <gakula@marvell.com>,
 hariprasad <hkelam@marvell.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Jason Wang <jasowang@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Louis Peens <louis.peens@corigine.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Noam Dagan <ndagan@amazon.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Roy Pledge <Roy.Pledge@nxp.com>,
 Saeed Bishara <saeedb@amazon.com>,
 Saeed Mahameed <saeedm@nvidia.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Shannon Nelson <shannon.nelson@amd.com>,
 Shay Agroskin <shayagr@amazon.com>,
 Simon Horman <horms@kernel.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Tal Gilboa <talgi@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
In-Reply-To: <20241031002326.3426181-1-csander@purestorage.com>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

On Wed, 30 Oct 2024 18:23:25 -0600, Caleb Sander Mateos <csander@purestorage.com> wrote:
> Make the start and end arguments to dim_calc_stats() const pointers
> to clarify that the function does not modify their values.
>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>


Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
>  include/linux/dim.h | 3 ++-
>  lib/dim/dim.c       | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/dim.h b/include/linux/dim.h
> index 1b581ff25a15..84579a50ae7f 100644
> --- a/include/linux/dim.h
> +++ b/include/linux/dim.h
> @@ -349,11 +349,12 @@ void dim_park_tired(struct dim *dim);
>   *
>   * Calculate the delta between two samples (in data rates).
>   * Takes into consideration counter wrap-around.
>   * Returned boolean indicates whether curr_stats are reliable.
>   */
> -bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
> +bool dim_calc_stats(const struct dim_sample *start,
> +		    const struct dim_sample *end,
>  		    struct dim_stats *curr_stats);
>
>  /**
>   *	dim_update_sample - set a sample's fields with given values
>   *	@event_ctr: number of events to set
> diff --git a/lib/dim/dim.c b/lib/dim/dim.c
> index 83b65ac74d73..97c3d084ebf0 100644
> --- a/lib/dim/dim.c
> +++ b/lib/dim/dim.c
> @@ -52,11 +52,12 @@ void dim_park_tired(struct dim *dim)
>  	dim->steps_left   = 0;
>  	dim->tune_state   = DIM_PARKING_TIRED;
>  }
>  EXPORT_SYMBOL(dim_park_tired);
>
> -bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
> +bool dim_calc_stats(const struct dim_sample *start,
> +		    const struct dim_sample *end,
>  		    struct dim_stats *curr_stats)
>  {
>  	/* u32 holds up to 71 minutes, should be enough */
>  	u32 delta_us = ktime_us_delta(end->time, start->time);
>  	u32 npkts = BIT_GAP(BITS_PER_TYPE(u32), end->pkt_ctr, start->pkt_ctr);
> --
> 2.45.2
>


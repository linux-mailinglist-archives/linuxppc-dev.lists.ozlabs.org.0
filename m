Return-Path: <linuxppc-dev+bounces-6787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3807DA559DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 23:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z843X3q3mz2yVV;
	Fri,  7 Mar 2025 09:34:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741300472;
	cv=none; b=IbRSek8sDZyOi2mJlasKL5EPBF8fQxTZJtQ1GRbiBo3wY5UmtHlpQcITyADEjJ7CLh11dzXmPbECCdLV/mZmBGt9GEf0zDaBMdVP15z7W7qgIeb3TNH3rxHSNGlQVGHmj1Paax7z1Y2gin2SDCYAYJYc0u2OcfzApw7Fs2qiXNQAl1CXlA7yQbSV91NEowF1yu0X+C3w+aS76jDiba91qsD6gih0QzM4XSn8h8VtbKe68UBPC4PW2hiz2DdWbElq9HLwkiF/3MIwv3k7xopP1P66YMtQgiDP8+BWgYqXpEMhaRANxVdoAz6daW5bfTNim82ZPCnfU+fhuPbD1z+hRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741300472; c=relaxed/relaxed;
	bh=kGi1rwym2I6sBWfNVUXqZVoYxgVmoGLVRkUZgtYr+sg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSqYDZUO7qwGAaSoUBuRqewtNMiyu8PE+lB3y76r1hh9rKYgPs2FXcowU63PBqlsYDgfjH5lJpGKkNUmzXrEGov2K3DeNC6cbXw8x+Sz7Mb9UqbiczR02Xu7k1gTpWRmlVhbQi6RBvEceFhAfJeY+qMwqgqG6BD80sGs8wqh9Df1p7LtKsEGKOLrWoiMvxRpRsM5vIcrz1c4DU3pIphseQEy+GvLKp/TX2/o97PjWqn+GveMUcof4GDqOopJ28AmwBwqQaIIQcTPxHwcstNp7c74FyTbe1+968mD/nwOOx55XWelu6QjNPhMU86Qjtxl9f7QmKzAGzjKTJwXMB0v6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pEzHs+Vr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pEzHs+Vr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z843W5lzbz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 09:34:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BBC5A45224;
	Thu,  6 Mar 2025 22:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47383C4CEE0;
	Thu,  6 Mar 2025 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741300468;
	bh=jnmEI0O48dE/8nutBn2HVLhExmXei9Y4n/ey1QBf6Q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pEzHs+VrlHLMd6zr1qi15LpNpPfR1LabvhCacarSCskvDHYep7dWk3zsDEMunufkk
	 lC/TV9815LsESFjZhqaQfBqnK+8KGbWmLDZqL7o6o7NUqwcE+g4uoX163PY+O9ECkM
	 sg8/P832YOFgKaN0v9ynHgTO42xYgjDEiL7UnbTTpImtLts114YI5AZDk47h0ebGgd
	 2+eZfUNhELiIsxjp5Qbjm2pg0cHcWt6AFs6hZbRskG+4LJPXpZ1HOBwJv/lahbIC/0
	 EVq4FOQjmnV65GO93QN3IeWVN0KjvLkNO+KVOTHb6b6G4E4sXJm9izqq8wXiNwHLfn
	 5aoBXxnE38T5A==
Date: Thu, 6 Mar 2025 14:34:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 06/13] net: enetc: add RSS support for
 i.MX95 ENETC PF
Message-ID: <20250306143427.2bf83572@kernel.org>
In-Reply-To: <20250304072201.1332603-7-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-7-wei.fang@nxp.com>
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue,  4 Mar 2025 15:21:54 +0800 Wei Fang wrote:
> Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve
> the network performance and balance the CPU loading. The main changes
> are as follows.
> 
> 1. Since i.MX95 ENETC (v4) use NTMP 2.0 to manage the RSS table, which
> is different from LS1028A ENETC (v1). In order to reuse some functions
> related to the RSS table, so add .get_rss_table() and .set_rss_table()
> hooks to enetc_si_ops.
> 
> 2. Since the offset of the RSS key registers of i.MX95 ENETC is also
> different from that of LS1028A, so add enetc_get_rss_key_base() to get
> the base offset for the different chips, so that enetc_set_rss_key()
> and enetc_get_rss_key() can be reused for this trivial.

Please split this patch into refactoring of existing code and new
additions.


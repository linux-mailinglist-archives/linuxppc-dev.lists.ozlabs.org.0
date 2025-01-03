Return-Path: <linuxppc-dev+bounces-4641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9CA00C04
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 17:25:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPppB2TjDz30TJ;
	Sat,  4 Jan 2025 03:25:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735921522;
	cv=none; b=IG5SYkCR1frfuYSFhKc0faiGsSZq1s2qELigYS5T6S64ad0kMhUih+reykkO+SRok4U/MCPOJApl+RbPfZQdtkBR4zpsbo/k0MRuwROfPrAu5ssLk5S5zik8mjwUKvVcurf9eq6RHaDGIWJKY68gxHR5zwRTK+LKwwEg2Owl9pn6hKeQohAVz7jSR8sC0pAWkvY1lIIeyHlaIcAMNV25Yeh49QGZpSXxzBoWUkcdIjW0eig+UuQL0lpYgQcXCJPqMtTkMpxn52M93TV5xGxNQS/jBHRZC2Z0SjFiyZaSDwqAj8ILd3NHLzJbSci2irv9AEhUGfDBjYDz0AYCrNPnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735921522; c=relaxed/relaxed;
	bh=unC2Fhn6EJ32Xsi2ODneZGcaNI6Y5JHf0QRbi/IbyPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+y4Db7SnKa5IuLsaZ2jj+ezdqTb1g8JY8k+uAXmYv+31YR1k1HJtucaY9sr7mE2x92O1xhSm22fXHS/9gi5zrlF/XkUGs8YyaNx7L6fvfSGKKLrGmDe3l3359eXsIIZstl3kCvSFZkaKlbooCv4rDofyxnKKCpRTc55his4860JvMydrchcs9XfMnbRGIZE2JpNc8e+sRIId0HjgxPfO7lI9V1KfICA33dywUihMgJwQf4LeNuJ0K9Bi6VOObt0Iq/cpNdNZDTpJeJ1UrG+edZzHV2L+kHOWBSllIThqn26QZ6p0bHqBS4eBm7q1R0+rSABYcuc2kVI47RvczhKQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=nNfH4Lh4; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=nNfH4Lh4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPpp91mW3z30Gm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 03:25:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=unC2Fhn6EJ32Xsi2ODneZGcaNI6Y5JHf0QRbi/IbyPo=; b=nNfH4Lh4tOUqX+xZn1XjPeQHHF
	gFsOfzz8PlpDhe8RzH1in7ekPJfClWgJcCj52YWEv/WO6PNBF7tbqOBmftkQ3r4ECsjthmIsNsklL
	zb6MUEM8BF/DDwVkrTm1p7+QGspl2CRgzr414HmCNtSgZz6N3yjl/UgwZW6UvdIfmMvo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkU4-0015M9-KI; Fri, 03 Jan 2025 17:25:12 +0100
Date: Fri, 3 Jan 2025 17:25:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH net-next 05/13] net: enetc: add debugfs interface to dump
 MAC filter
Message-ID: <696fb436-40f6-4a9c-af0b-2851f8450bd1@lunn.ch>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
 <20250103060610.2233908-6-wei.fang@nxp.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060610.2233908-6-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 03, 2025 at 02:06:01PM +0800, Wei Fang wrote:
> ENETC's MAC filter consists of hash MAC filter and exact MAC filter. Hash
> MAC filter is a 64-entry hash table consisting of two 32-bit registers.
> Exact MAC filter is implemented by configuring MAC address filter table
> through command BD ring. The table is stored in ENETC's internal memory
> and needs to be read through command BD ring. In order to facilitate
> debugging, added a debugfs interface to get the relevant information
> about MAC filter.

How do other drivers do this?

You should only use debugfs if there is no standard way to accomplish
something. And if there is no standard way, you should be thinking is
this a common feature other drivers will need, and if so, add a
standard mechanism.

You will get pushback for using debugfs as a bumping ground without
adding some justification that debugfs is the only possible solution.

	 Andrew


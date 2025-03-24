Return-Path: <linuxppc-dev+bounces-7314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A1A6E011
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 17:44:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLzQk5lbLz2xqD;
	Tue, 25 Mar 2025 03:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742834638;
	cv=none; b=ocRq5SZ4WOYzyWjL1Pk6xv9hvaVYOt973hOka5HSGGAn3LLooiXavuXxoT2jVjK8JwZPZauko4rvrswuyenv8EjjprMgKjcwKpA+ImkDhSyhatj2iX6iyLsxX4ydH10jPo+7C+jElio+eVrpyyg0hZPrPvcxfbLnVHVEhMq+9DzGFMyL+i0h05M4ona9f1kDimXnl5+RzrKhOn4RxnLW67FAWKF3irDqqXMler+Ki1gUu22fXYB8SFmOE0wyBWFAFY4L3pTGG3p4VY2wosI/MHDe9UvG9wov+HDzWeKIrkDtONcpi4h2IkfFfn0XC65OeXTL9T8xexAVBJUILvF7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742834638; c=relaxed/relaxed;
	bh=s2yB0qJZpX4HboD+4QZdS6xo9d9KPY26126mG3ZecY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=doVpyjtGck9XBifSgRGTcUaK9k+fqCylnFiu9K7PuzXGEmrRQQz2tK3Rplv8MGRb/bmmygzHmNGIEZkhHBh5k/m04wA5CFFEOaHu9mXiQ7rwJmHv/+Z+E30pGZtfcUphAzUsG/83rBk18TMc2gZdPKAgx5lxO0FJdd5IsFQzahc0wXWIypjdquJ5S0RYNA8xTL7RZx8wKRtaBPMbrYg13etByVOPhN+w4jEqg+QEDK173xsRataypWvZFv+oQEwKFgqw7OvZphkVZ3hh8iVHnGjal+GgSzcfqJknmV4iyUkSLV3uKRP+uxYl1Zg6hIzAZWsJyuqmDsyCgvD9T06TPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e77Jb53O; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e77Jb53O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 555 seconds by postgrey-1.37 at boromir; Tue, 25 Mar 2025 03:43:57 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLzQj3X0Sz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 03:43:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AED77437FC;
	Mon, 24 Mar 2025 16:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986D4C4CEE9;
	Mon, 24 Mar 2025 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742834077;
	bh=JFWxah0yn9IuLTdnRpfNkLfC6UF7xa6SumacmP2pPUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e77Jb53ON9OcMUZ6ghvNMRYbGsKcNW6OlJxiZVp8l1kPDux/ThRnF97o+a237kxJK
	 I5+5fi9B4ljXeYDBv9mx1dVjSMmxxEMh6DWPa734LPEOzacFNXxS+D/ewTg8n1ju53
	 VEz/gztxCia/YcWNdmHjgNeMo7hkMP9v3VR4Ie+pPKF+T9ekcTLiWTg5mNBBy4Fyob
	 XAn+xIwv5CdyGt9Yd2WOW/H1TQbz/2gMch8NC76qDeVJX+7SYk2fx2DirtPR+EiYbk
	 YSp4LDc9PtgqxNLKn3dg4rxLC1G0YvqvHiylSsMyhOrWl5uqwpwL4GuRbVYBflmEax
	 XjzM/g6ZbttPQ==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, Likhitha Korrapati <likhitha@linux.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 maddy@linux.ibm.com, atrajeev@linux.ibm.com
In-Reply-To: <20250321100726.699956-1-likhitha@linux.ibm.com>
References: <20250321100726.699956-1-likhitha@linux.ibm.com>
Subject: Re: [PATCH] tools/perf/arch/powerpc/util: Fix is_compat_mode build
 break in ppc64
Message-Id: <174283407758.1817265.13747137437378271196.b4-ty@kernel.org>
Date: Mon, 24 Mar 2025 09:34:37 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 21 Mar 2025 15:37:26 +0530, Likhitha Korrapati wrote:
> Commit 54f9aa1092457 ("tools/perf/powerpc/util: Add support to
> handle compatible mode PVR for perf json events") introduced
> to select proper JSON events in case of compat mode using
> auxiliary vector. But this caused a compilation error in ppc64
> Big Endian.
> 
> arch/powerpc/util/header.c: In function 'is_compat_mode':
> arch/powerpc/util/header.c:20:21: error: cast to pointer from
> integer of different size [-Werror=int-to-pointer-cast]
>    20 |         if (!strcmp((char *)platform, (char *)base_platform))
>       |                     ^
> arch/powerpc/util/header.c:20:39: error: cast to pointer from
> integer of different size [-Werror=int-to-pointer-cast]
>    20 |         if (!strcmp((char *)platform, (char *)base_platform))
>       |
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung




Return-Path: <linuxppc-dev+bounces-16065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F7D3C546
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 11:31:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwNsd737Sz2xKh;
	Tue, 20 Jan 2026 21:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768905093;
	cv=none; b=kvFx0HR0zGWMa259qBgJoaMMTBCNNIdscvIKXZc39gc2E5Xw6hdaiqiuUSMy0c42P9cRuqcX9NzRBqoq1FRfmNUszHpq/qRpSR9ytWXTtbSnvLoCSvyg1AyfVl9vcrcijDRnZaPA7Vgofm/SFMRxxhOt1I72ThZFStkWstThpaRmPe4J/ZGsT2YrvD/5UoksqorbGu4eymo9I3/aggiKP0joL+B5DOs8wRdD0emfidZ9UoKD61cZMBInM2OluLR7YCOra482zZI1DrLZtYZInW5Yyv11pS70nxD1GPStGtdEeCXyYRdz9sjkmoNluZnAxUMaWbjQjbJvOMnOgmbucw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768905093; c=relaxed/relaxed;
	bh=a0xuVmHZ5HB6mdYDqyzYB2LKTzWEE7fIoJdg+ENYqUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdJvDvmIT3bCLKCChum24OPvpyAbGyeYWnUR7E0bX526uABrPMNGRq2kErDtvDzKwNg6XI4qmTr8hyD8ot03kAKlhi7bEzZc1Kl/JPOFGlbbBJdXn8lxrmOJ0b+cTrTwzB8R96x4J9tU9ZHJ7/v6lFjSaSzKVGnxHUqgR5fEnX4BzbL7cEght3OyZRuX6bYhl0zUcQ7bk7EJg07XOxgsIcxmJin/cS8lZ/LaTNJWqc7Y8cn/9P0CJ+UAzeZsrB+FoyN1kJ1l1gFGm9Zn8ySR33lfa+DnB9EPPuEyuZZHAz7BGTyrgxWLiKkrJHtM+beYJmOy11fafJYO2zOFXDnlRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QnLBqnYC; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QnLBqnYC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwNsd2VMjz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 21:31:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA18841A4E;
	Tue, 20 Jan 2026 10:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE6C16AAE;
	Tue, 20 Jan 2026 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768905090;
	bh=bJN0DSC6Ua6pKsP/DOPJJOTlRRY5NsWRrEymD+za6QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnLBqnYCradIChvnsPAVk/kjMSoR0YsDiYIOor1O0d9cH9wbEnXp8CTydAOCkEgXu
	 Bvz8+eDdEFeE51Gcr6zRaGUmcEL23vGwDrATnru+LbA/emXS9oybE9d7RjiOm+y2M2
	 eEVdL+vllEgtoNTtKpbjgldvtggYDbX4IqrZMTTHaOBe2zOdfvI44O0bfj570y/jps
	 W3UuGYSyRzFBPkAP+3/apHuoq0rZgsoqRgpWnQkt472JPPtUTrJ/UbyfbyFfULhRLU
	 VWgllMGl6qeUHxoGl9+KZYH3wEDHWWR6kLgMLXDfrJYYcdRUVe+t9dgSyTVCQpvRS0
	 KerF2z2I0oooA==
Date: Tue, 20 Jan 2026 11:31:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-2-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> There is no power domain defined on i.MX952, so make power-domains to be

There is no defined or there is no power domain? If the first, then this
patch is incomplete. Please read writing bindings part about complete
bindings. If the latter, then you miss constraints ":false" and commit
msg phrasing is incorrect (and remember that in such case you won't be
able to add power domains later because now you add complete binding).

> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Best regards,
Krzysztof



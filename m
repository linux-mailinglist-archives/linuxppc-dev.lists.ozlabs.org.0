Return-Path: <linuxppc-dev+bounces-3165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2D9C83DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 08:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xprxw2GvXz2yMb;
	Thu, 14 Nov 2024 18:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.199
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731568484;
	cv=none; b=BgfaE7icn4742KzHwRqE9gKYvQm5xA+NdKYMRLOjNXnAPA7K/OSleq9xktaPEq+bnZIU3zqR/JVywOLkk64uO6uB4+eCO7R/fpHtL3QdddNdbORImZHFatd+11g/grLZfUkF6AWTHAZaJJYBkntaPsHoYmuwLK2lizdjWt/p+rhz+oMApow+djh3Tep8YFfH0awqB6CFnIpGpkzYK3q3gdq1D5t8StZFjnlYX/+gYwsCpjQBAonWYQ6UeQamThzzjJ2ggbGUO83604isAY2nZyLokYjMhBdzycZZicmbjIr73SXIi5sIamN8+xBD8Pa4Q2T0/T1tktvxreEE4S/0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731568484; c=relaxed/relaxed;
	bh=jsDnUfrZgRFjY0UmHDUk9SJkSWvJeDPxPrYP69lT6wc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h05lD44pxwx3AcCUeWzZjfQNXRHgtSNGDsvHYthpmGyVrQZ4uAuV7vhZGCmxi8KHc2GjloUkhIFD/C/tM0RBpwai4/yMvbDgGrNdFASZzIJMpP8HI/p7YjOJpCfyF17SkEia4YiD9cTyLo7Yt4mKb7RLVeS+SQFJ3FRQ/5LDv9N6jeUeiKnyB3ExD/RGFDYiA4L/l7clsuib6Z8xRZ4aMlW45ROpUYzfrLkrCiHoamzt/2YO5vPQvP0tyR7UbTsfp7Se6hsRJbL7ABWFZM5fV2L7Lrpd2EB/XCvaXS1g0ZVGGoNhy4EokOevL+RtVarkxMtPXZ8uzxkjCEnylwqIGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=GxyE51Eu; dkim-atps=neutral; spf=pass (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=GxyE51Eu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xprxs5cVqz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 18:14:39 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76132FF804;
	Thu, 14 Nov 2024 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731568474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsDnUfrZgRFjY0UmHDUk9SJkSWvJeDPxPrYP69lT6wc=;
	b=GxyE51EuidCqn2Pdn8OFA7Sg+ji/0pvC1ymekdKgHVmZfvPCiqsiUouuyUi4tsY/fS7vN6
	cVDFaSLazT5yVHbAmh0kHHzGhgyZcEB4FtrRBrO50Fslm44scJDHFVdAfA+ykhXCnptg9j
	BGr7XT76RNrPgGZKZktJDuVVlLeZfPV9QvLhKZ97obQKy+0JyWMvazYCmv61ReV1WRLX7P
	QTvvr4vMHA3k0kdQB/TFuOTzi3YwDEiaWXn8QwzNOqF/026N6sFNf8+jg15XoAuw3nyLS1
	zmtwYNHyvI3M6JektsUL7TL/MBA5fdzQG9MG6bTqVvUZLJwZFijnTmGTeAYtbw==
Date: Thu, 14 Nov 2024 08:14:31 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: switch to
 for_each_available_child_of_node_scoped()
Message-ID: <20241114081431.23296fd9@bootlin.com>
In-Reply-To: <20241002-tsa-scoped-v1-1-ba6a6d657f82@gmail.com>
References: <20241002-tsa-scoped-v1-1-ba6a6d657f82@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Javier,

On Wed, 02 Oct 2024 22:21:51 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

> The non-scoped variant of this macro turns error-prone as soon as error
> paths are included, because explicit calls to of_node_put() are required
> to avoid leaking memory.
> 
> Using its scoped counterpart simplifies the code by removing the need of
> explicit calls to of_node_put(), as they are automatically triggered as
> soon as the child node goes out of scope. Moreover, it is more robust as
> it accounts for new error paths without having to worry about
> decrementing the object's refcount.
> 
> Note that the device_node is declared within the macro, and its explicit
> declaration can be dropped as well if it is not used anywhere else.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/soc/fsl/qe/tsa.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé


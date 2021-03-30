Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F8134F2DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F92Gw13WNz3bvV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 08:13:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=k33NE2CX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k33NE2CX; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F92GS2c2fz2yR0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 08:12:45 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id s2so12968123qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvg5KeeLafDks20d9MA0DVK+cDxKZn2jW/3PZAzDQ/c=;
 b=k33NE2CXIobJjoB4dL34gEB0xWjLB3X1YdTxpiNE4m0w39+avHYjIPTlPYWXgE++hd
 CGQkltFiOHlY66qiAVKRvXxWVeakz1vHzUgjMGABg2PdcXzfe4r3i+hllFqwhr/VX80V
 uTac3mVQxYNW6lBVUmFdY/ZTI21BQcj9z97C+l86gNTTNqfOUpNO1cef3VITKGOdj5ZS
 ptEdf7sJdINv/ay1cfflAq7AeGQma+759sqdmJKNeuL+0T3qU0k3TxjPWmmAuFuQt/qP
 SnTM8sTfRkspWWUd4gwPfQngwZ66vFuqI7L5F8zrbvx6YUTXzNQsV6Apc9bQGppT2onR
 AZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rvg5KeeLafDks20d9MA0DVK+cDxKZn2jW/3PZAzDQ/c=;
 b=Mja98ebxUyw7dvPCuizq00FC+H0gRblN1Vd4ri/eWkzd9MpDpYWWcLp4vgLAPzVlh8
 OAhNK3O2Gtvn8TaiASFtW9Vx/ymRnBtkfJuwNYcpPp7wN9OoMU8cCkG478noe5Rih5fb
 V/Tk0RgJumVtaGV4DJUP/xQHa4gKu5ERvRncTLTyL0pQjxMoTKQcGw7ihy0Ba3o4JUpv
 AkifMatjXbmjWoh/v3v4Kizu+Exxz/lr9DP2rF/oL8TnaoiwiX9L8rX/WoFgVn6QhuKk
 FrH3VkRYOxiyUai5ji+cR8SwmNZQ72Zhk0dzBFIQDU2fHAo6rbnc7S4GuqwioWRgnNjW
 2FGQ==
X-Gm-Message-State: AOAM532ctkkxJk53cjOQ9pl7BkKYX6c4uLfs0+J5eqUcqwAyajSK8l80
 OiEljLexCEIkX3pBUn0W9E0=
X-Google-Smtp-Source: ABdhPJzBICbv2tB+pZHOQUhX9mgUx+2f/OIMBmWy7u6Wt0v1ME2jB1BtLU0fWk8lwylmTW63ROdomw==
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr28861530qtx.292.1617138762074; 
 Tue, 30 Mar 2021 14:12:42 -0700 (PDT)
Received: from Gentoo ([143.244.44.215])
 by smtp.gmail.com with ESMTPSA id b2sm119921qtb.54.2021.03.30.14.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:12:41 -0700 (PDT)
Date: Wed, 31 Mar 2021 02:42:21 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Message-ID: <YGOUNbCJOHLmeHm9@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
 <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yapxdGUX50HbkJ4L"
Content-Disposition: inline
In-Reply-To: <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--yapxdGUX50HbkJ4L
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 22:59 Tue 30 Mar 2021, Vinod Koul wrote:
>On 29-03-21, 05:23, Bhaskar Chowdhury wrote:
>> s/transferred/transfered/
>>
>> This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.
>
>This is not upstream, why not squash in. Also would make sense to write
>sensible changelog and not phrases and use the right subsystem
>conventions!
>
Changes like this don't deserve a history to tell, specific to changelog, one
line is suffice.

>Droped the series now
>
This is a bad commit slip in , not suppose to be there, thanks for catching
it.

Sorry for the noise.
>
>--
>~Vinod

--yapxdGUX50HbkJ4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBjlDIACgkQsjqdtxFL
KRXbEQf9HOVQ3RETxBGqN9aTy39IsbyS5nu7/kFDhcZEJysEreLDXKPWNNQ2PX5w
cirIvKOlvWXDyrO8kTzZj7lyhdV4i20kBx+wWdBZ5Pzgxv7EsC29/u3MLwHH9eWk
/yvTPpfI8KLYpPNMU8bMS8NKR+hP+75gM0gGO4zmirTubaAIH9709n3MVg4A7Qlj
ZdJE1MCUqt+VHUnBqZzu2Afv10gBlrsy671OsH0K/m8/ZOWoIKg50Epc7s2/LPEg
DnYTel5gyXWtZh4thSXcjV0hm5Q6jzE0DQjGE7NDxeI8yIz4c6hZBJ2OOTXp1h2A
O5yOuKgqXzo95RFK6W9QSbfhv3erIA==
=mURO
-----END PGP SIGNATURE-----

--yapxdGUX50HbkJ4L--

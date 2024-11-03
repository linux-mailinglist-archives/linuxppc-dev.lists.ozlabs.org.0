Return-Path: <linuxppc-dev+bounces-2812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CE9BA962
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 23:51:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhVFW72TLz2yLY;
	Mon,  4 Nov 2024 09:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730674271;
	cv=none; b=m2ARaTYQg3tA10zRPfNOMl2Iqq2oMCrp3+kJBrSYvB1KwjJgIE8rGJYeTslajF7CczT4sbiQZsoJxUorsQ/xmqSq+QCAn0plnLL9MalFtfDv0DxgSeWgxj683ijhEHt1fq3P54vqEOGOSL8ABQVfIhxZyb0xjmO6Z4nWFp6opN5ynPHJLpVi6Z2tpgENPdzrehqKjZY18ZaAVNB7CxsFOyKWzy4qej78gwRYqu6/T1piDb3PIpKsBPBt6yb28ez6yPbbJYK4jajDy/UnsoClOMBfkL0zbLNG4gSW+Nmbw1h2zkRobc+xBZM+nrKpyjNYp/sx82YNi2lIc+1HEPTJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730674271; c=relaxed/relaxed;
	bh=vbZ+uzGqdW4hX03Xi3d7fgtT2grFuBySNiXCV4fiIF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzZ3vaZG6tIK6VLLlw74ZeUy4+Bf/WQ74czbSrdgNfYmhyDy4FmQ+VS+uHBR1yVGT98Pzjt5pFEAiUZ2zvwSLaOixM6kKj2U/H3RbLcky7Yy1y4jED/WCYa6XIXfEnQckkpeU7CcyxrbBXvmp0HhWv61N1ms9bDRR9nHxwpYy7TDkcc6u7UhttreDG1rm/bRZMnFbsgCeLhYvFdkjzJv6n7wrm5k/NqLY8hO2exAX9BsgX2ZTksNydWbG50CScS9lEzhfOSL+i+zjrcHrGQV7mXQqhzlvojUsrWCzaqRcvowzjPTfj5SCKaHsb5plvGcvbtA6LhIzeESk5p4IKXAyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=e4ca1fQr; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=e4ca1fQr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhVFT0h7cz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 09:51:06 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e31977c653so356008a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2024 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730674259; x=1731279059; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbZ+uzGqdW4hX03Xi3d7fgtT2grFuBySNiXCV4fiIF8=;
        b=e4ca1fQrmPDo1yy3nVZbK5ho2bzCJ9+Uzoe7qDMRxyY2dQKJcvBUPezSoTlZz9cPKy
         SlXPKCUUXp+GaZMxpzgIALM1jTunotXzyW0HrLoVP5wOXLWyNnBxSohBAZ7WiYGH+j3p
         8GZKcgQ2UzaSDurN1Fw4izNSxvFy3E2RhmAiZVjd/xWeh/rGCwdTH8XZzPhVZhXKftBo
         rlu3xFS7f7w+5Cz971LwPab+pE8Zrv2AmvnpfDy1uBueaHkOzSOhff+ftb3WvrqZvK8W
         z3hkONKKZ9V+Om3xh4r5dmER2fI8LPqS3YB9T3YUR7VeZx0iLmDOQUq4ICfcaiCqhTde
         g5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730674259; x=1731279059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbZ+uzGqdW4hX03Xi3d7fgtT2grFuBySNiXCV4fiIF8=;
        b=Aov0/MDZmfEuVD2rBIGOVjzpJglfusCTGOGX5HzRopAcHLWAPh5toMZyo5JkbxqxUW
         GPJ1B9Flcz2QpvN2FoCGSk2rhBQYsvrutKcn5Epw+YK/MBFLPcAoc3b/ViwwHNZfFafP
         Cag/cQvfEDR/2j/8WfgoCqw8Seg6ad8OVIw8BDET0DYc/3NsuA0UqhefsBJIpcAMq02S
         YlLURauXHGObkRZbpEq6yTRPUtUaoG0lNMPPyKZ6f34z7wYtubQGFDe/r8r7PpMPWGar
         sVbmRzU3ZlsmfgyGHwNFAOVHO6eXsL11MOR1n3sEQ8k1APouQ+wJSjOpIipRlXy+JiMp
         a21A==
X-Forwarded-Encrypted: i=1; AJvYcCWTAmOEXh6Ot9kxWQEdQPNIK1p/nmJJZ9zeiraQvXQkKtj0hbkau3evcrmw0Xch/8y+UGI3QaIBHrujRy8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxU28++uSjDFsbdLbQCTC6aLzS5Q615gXeRJzRDCeCGf1t2r75d
	YSKAbYuLtGPUXqacuWgely3Fb/2qeBwiBPXsH04HCobGVp+O13/IUvq37NdRZPb9J35Qcw2o/Hf
	1OgkzuUbqHbZFxfGqR+6snx4babS638vZoIReSg==
X-Google-Smtp-Source: AGHT+IFUl1GCcoqWHoZYbz+qEG71KEMvn1Im+9ZYr+neR/oxPoOmgzFQQqZYN0kcHlFEkQf/7jeXNqXwpJVr9GMXuU8=
X-Received: by 2002:a17:90a:e511:b0:2e2:e139:447d with SMTP id
 98e67ed59e1d1-2e8f0d62425mr14589494a91.0.1730674259424; Sun, 03 Nov 2024
 14:50:59 -0800 (PST)
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
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com> <20241103122138.6d0d62f6@kernel.org>
In-Reply-To: <20241103122138.6d0d62f6@kernel.org>
From: Caleb Sander <csander@purestorage.com>
Date: Sun, 3 Nov 2024 14:50:48 -0800
Message-ID: <CADUfDZpBfwGJwhUHCZk8AgZDY0QP3j2dEUHZfC1VkR+75jj2WA@mail.gmail.com>
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, Brett Creeley <brett.creeley@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	David Arinzon <darinzon@amazon.com>, "David S. Miller" <davem@davemloft.net>, 
	Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Felix Fietkau <nbd@nbd.name>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geetha sowjanya <gakula@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Louis Peens <louis.peens@corigine.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Noam Dagan <ndagan@amazon.com>, Paolo Abeni <pabeni@redhat.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Roy Pledge <Roy.Pledge@nxp.com>, 
	Saeed Bishara <saeedb@amazon.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Sean Wang <sean.wang@mediatek.com>, Shannon Nelson <shannon.nelson@amd.com>, 
	Shay Agroskin <shayagr@amazon.com>, Simon Horman <horms@kernel.org>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Tal Gilboa <talgi@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, intel-wired-lan@lists.osuosl.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org, 
	netdev@vger.kernel.org, oss-drivers@corigine.com, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 3, 2024 at 12:21=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 30 Oct 2024 18:23:26 -0600 Caleb Sander Mateos wrote:
> > In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> > 94% of which is attributed to the first push instruction to copy
> > dim_sample on the stack for the call to net_dim():
>
> Change itself looks fine, so we can apply, but this seems surprising.
> Are you sure this is not just some measurement problem?
> Do you see 3% higher PPS with this change applied?

Agreed, this bottleneck surprised me too. But the CPU profiles clearly
point to this push instruction in mlx5e_handle_rx_dim() being very
hot. My best explanation is that the 2- and 4-byte stores followed
immediately by 8-byte loads from the same addresses cannot be
pipelined effectively. The loads must wait for the stores to complete
before reading back the values they wrote. Ideally the compiler would
recognize that the struct dim_sample local variable is only used to
pass to net_dim() and avoid duplicating it. I guess passing large
structs by value in C is not very common, so there probably isn't as
much effort put into optimizing it.
With the patches applied, the CPU time spent in mlx5e_handle_rx_dim()
(excluding children) drops from 3.14% to 0.08%. Unfortunately, there
are other bottlenecks in the system and 1% variation in the throughput
is typical, so the patches don't translate into a clear 3% increase in
throughput.

Best,
Caleb


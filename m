Return-Path: <linuxppc-dev+bounces-2751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98499B8112
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 18:20:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfW375njDz2yvs;
	Fri,  1 Nov 2024 04:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730395219;
	cv=none; b=kEFtlH+FOPWPkXMHgLAoAQHkqs7eNY/pPdxyF6KIhywquhLFJ/9FnPGVuSLZvX4UdVtmZW41onbXL0uWM/QUAzgztm3PlYzHBdFfJNnkyNxsgeuW59F4bPkmdf89ZtxUusU4KFtED0K1J2cAyIEuBoCWSB3S/CbqBDdgBNMlawCn6zMnhOJKh/ETPCQP774HrUYYNmBfq2puei6w3vCmdFXaJD2z32qzt1/Pe0AuA0tZfXqc/USZFxuAtLd4+AiGS8ZsSWvKHu0Ek1OXX9n36JX6WagnsDFMsBF3DjaLGJbsW9Rus+yZqZZ2WxtPtAwbeXvoHKY+7stvRfZWZWv5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730395219; c=relaxed/relaxed;
	bh=SKkFDkzIEBItD3yNbuSEm7Az14lr6rR23lccwnGeVnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3KHmM/fy6DS4N/MK9KHMkKUIhLTENGxeiR69kr4g1bf6e0COc+EP+29H0JVxr7+WID9ZbzWMKHObLFW7WzpWqkN5FDQ70Wvw25N20LHoURVMuVYr4mi7ibRBM4twzghLP5rWMM8318tFTFlBD0NXjOfUqTKZ2V/ggFQ5um4Ep92VtrzRwwjWAOWFp3EwW+G0DQq5sMSpOqaw47gUx6gfUjAp4a6mGFS/z2VH/1oVbTIwYUXb/8oLELQnZZ9aD/Ljbnue4DlLrsapKme1hZUZA3fwesp/cAz8OxGgbn8ja6R37UV8Dx85tzaFSfP7kinME6wMOiSz+nhSrNNOgSLVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PlwigAqR; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PlwigAqR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfW355dxsz2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 04:20:16 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e31977c653so134146a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730395206; x=1731000006; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKkFDkzIEBItD3yNbuSEm7Az14lr6rR23lccwnGeVnE=;
        b=PlwigAqRzJh0Jbog1jc7rRmp2hTcBewycDrjLGaGSPMNArg7fsCqojkZDG0BMCdOzJ
         aMHXPOe0gEOWGppSwkaHXikEkTtXQbEHY3smpk0PeGYh8mw3v/TiWUzNjDdpxeQJuq4e
         WuoZhYB8ilql41Cs44Yo7dL8FFPFkxu2JqFPk7yGt8yN69H45y1w05BCyL1vVHG9Zo/J
         0/m+zIEMBbGsjR2BXxXrt8UljF3hiCLK/HWkL27YA3KoY7Pbi7D6P+ucAJlecCcuiTA6
         34jNTIg9tXy3A1vMIwfGIiIJ+IwSveKNcdQ1cXn4Pqbx7BHd3fw/8lxEudbkZ6idjIpo
         3JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395206; x=1731000006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKkFDkzIEBItD3yNbuSEm7Az14lr6rR23lccwnGeVnE=;
        b=spu7ZN2Vr0lBXDKeW0UiwINR1UDRfA9SBfBNxjOZqM0Wdx7GDme9/kKzc+OLiGX73q
         JBGqjN/Uut10JgrGFlBt0QnoIDwZXLMArESgoE/eqsyB7QCRQvvU64kKkG0EpRvu680k
         uGoP4Qsu0d4z8jvNQOoAV/owXUbScirryVStamnp+TH+Xho1oBxLou58kQeXqs6Cdogr
         51ZS41TpBINbZD4+4wDx4UbEmnKE6vsgk4pLXXK64s2RexX3kCf/+yQ8nb+6eIQXJWAc
         LL9eLQyZLVGUA6307XnfCs+FSle5cfkcktL0jCaFBTmU/jKLdgARV0npIxWn1IrDDBtg
         fUHg==
X-Forwarded-Encrypted: i=1; AJvYcCWNVvXmrrFStum6BEkqbfVNV4bWSzyyCzSefIg4y4YCmxw7+ZUIaeF2V9XA9aJtdNjv7sg7iS6WohxNMiQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbemH9sfATWadQ05DT0lHOW+5TlhYeT3mDE0Nh1tej8+VvzpTM
	F/I3Bd7BLDmg2IXNZnLNx0Wccad6FfXN5Z0imjpi2ABrKojuNorJkqRmScjctYHtqMnNxBTgRjW
	BKQQL8mRgTdL8xJwz+3vIfq2eKvjYDbZgaqG55w==
X-Google-Smtp-Source: AGHT+IH6t05mbCPluyw/Zm7bZ8Y86vIuSvJgupQimK2c7oAZcHqEQQGqxSncMtgAi8PvmdylJnQUlmy+Sc53Mt/5SYg=
X-Received: by 2002:a17:90b:3003:b0:2e2:b45d:bbb9 with SMTP id
 98e67ed59e1d1-2e8f11bfd7bmr9879885a91.6.1730395206352; Thu, 31 Oct 2024
 10:20:06 -0700 (PDT)
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
 <20241031002326.3426181-2-csander@purestorage.com> <ZyN8xpq5C36Tg9rz@LouisNoVo>
In-Reply-To: <ZyN8xpq5C36Tg9rz@LouisNoVo>
From: Caleb Sander <csander@purestorage.com>
Date: Thu, 31 Oct 2024 10:19:55 -0700
Message-ID: <CADUfDZoba9hNOBU7TT+0K6BYiYzVkZ_awt751g6HBm+-cCZf8w@mail.gmail.com>
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
To: Louis Peens <louis.peens@corigine.com>
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
	Jakub Kicinski <kuba@kernel.org>, Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leon Romanovsky <leon@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
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

On Thu, Oct 31, 2024 at 5:49=E2=80=AFAM Louis Peens <louis.peens@corigine.c=
om> wrote:
>
> On Wed, Oct 30, 2024 at 06:23:26PM -0600, Caleb Sander Mateos wrote:
> > net_dim() is currently passed a struct dim_sample argument by value.
> > struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> > passes it on the stack. All callers have already initialized dim_sample
> > on the stack, so passing it by value requires pushing a duplicated copy
> > to the stack. Either witing to the stack and immediately reading it, or
> > perhaps dereferencing addresses relative to the stack pointer in a chai=
n
> > of push instructions, seems to perform quite poorly.
> >
> > In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> > 94% of which is attributed to the first push instruction to copy
> > dim_sample on the stack for the call to net_dim():
> > // Call ktime_get()
> >   0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> > // Pass the address of struct dim in %rdi
> >        |4ead7:   lea    0x3d0(%rbx),%rdi
> > // Set dim_sample.pkt_ctr
> >        |4eade:   mov    %r13d,0x8(%rsp)
> > // Set dim_sample.byte_ctr
> >        |4eae3:   mov    %r12d,0xc(%rsp)
> > // Set dim_sample.event_ctr
> >   0.15 |4eae8:   mov    %bp,0x10(%rsp)
> > // Duplicate dim_sample on the stack
> >  94.16 |4eaed:   push   0x10(%rsp)
> >   2.79 |4eaf1:   push   0x10(%rsp)
> >   0.07 |4eaf5:   push   %rax
> > // Call net_dim()
> >   0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
> >
> > To allow the caller to reuse the struct dim_sample already on the stack=
,
> > pass the struct dim_sample by reference to net_dim().
> >
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >  Documentation/networking/net_dim.rst                   |  2 +-
> >  drivers/net/ethernet/amazon/ena/ena_netdev.c           |  2 +-
> >  drivers/net/ethernet/broadcom/bcmsysport.c             |  2 +-
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.c              |  4 ++--
> >  drivers/net/ethernet/broadcom/genet/bcmgenet.c         |  2 +-
> >  drivers/net/ethernet/freescale/enetc/enetc.c           |  2 +-
> >  drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        |  4 ++--
> >  drivers/net/ethernet/intel/ice/ice_txrx.c              |  4 ++--
> >  drivers/net/ethernet/intel/idpf/idpf_txrx.c            |  4 ++--
> >  drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |  2 +-
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  4 ++--
> >  drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c      |  4 ++--
> >  drivers/net/ethernet/netronome/nfp/nfd3/dp.c           |  4 ++--
> >  drivers/net/ethernet/netronome/nfp/nfdk/dp.c           |  4 ++--
> >  drivers/net/ethernet/pensando/ionic/ionic_txrx.c       |  2 +-
> >  drivers/net/virtio_net.c                               |  2 +-
> >  drivers/soc/fsl/dpio/dpio-service.c                    |  2 +-
> >  include/linux/dim.h                                    |  2 +-
> >  lib/dim/net_dim.c                                      | 10 +++++-----
> >  19 files changed, 31 insertions(+), 31 deletions(-)
> >
> --- snip --
>
> > diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c b/drivers/net=
/ethernet/netronome/nfp/nfd3/dp.c
> > index d215efc6cad0..f1c6c47564b1 100644
> > --- a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > +++ b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > @@ -1177,11 +1177,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->rx_pkts;
> >                       bytes =3D r_vec->rx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->rx_dim, dim_sample);
> > +             net_dim(&r_vec->rx_dim, &dim_sample);
> >       }
> >
> >       if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
> >               struct dim_sample dim_sample =3D {};
> >               unsigned int start;
> > @@ -1192,11 +1192,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->tx_pkts;
> >                       bytes =3D r_vec->tx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->tx_dim, dim_sample);
> > +             net_dim(&r_vec->tx_dim, &dim_sample);
> >       }
> >
> >       return pkts_polled;
> >  }
> >
> > diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c b/drivers/net=
/ethernet/netronome/nfp/nfdk/dp.c
> > index dae5af7d1845..ebeb6ab4465c 100644
> > --- a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > +++ b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > @@ -1287,11 +1287,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->rx_pkts;
> >                       bytes =3D r_vec->rx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->rx_dim, dim_sample);
> > +             net_dim(&r_vec->rx_dim, &dim_sample);
> >       }
> >
> >       if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
> >               struct dim_sample dim_sample =3D {};
> >               unsigned int start;
> > @@ -1302,11 +1302,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int=
 budget)
> >                       pkts =3D r_vec->tx_pkts;
> >                       bytes =3D r_vec->tx_bytes;
> >               } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> >
> >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sam=
ple);
> > -             net_dim(&r_vec->tx_dim, dim_sample);
> > +             net_dim(&r_vec->tx_dim, &dim_sample);
> >       }
> >
> >       return pkts_polled;
> >  }
> --- snip ---
>
> Hi Caleb. Looks like a fair enough update to me in general, but I am not =
an
> expert on 'dim'. For the corresponding nfp driver changes feel free to ad=
d:
>
> Signed-off-by: Louis Peens <louis.peens@corigine.com>

Hi Louis,
Thanks for the review. Did you mean "Reviewed-by"? If there was a
change you were suggesting, I missed it.

Best,
Caleb


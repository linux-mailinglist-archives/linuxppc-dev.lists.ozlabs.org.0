Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D23AC2D3291
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 20:15:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr8z94pJTzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 06:15:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr8xd1Dz9zDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 06:14:24 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id f132so6100694oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Dec 2020 11:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJqe5GlOkGactXd+UvB7dTXx80iqow5kmSOsvIg6D6I=;
 b=U0LY9Svn9U2DbGAAdbGBbFTL2eFNxhs2bq+Iiw5cJPyGtVEU3/ndFO+tjTNI6TDVDl
 hNcEoVCS+oejHwO9i8eDfuqbcSVyIHbEo2Dc1UFvr+dng7FOrYagNi8ynL8fefCrMlJr
 tvMs+gmEBCFAREj3v8KK30Gt5Hy4hqLhTm+puygCn03C4FHH2Eai0ZqxpKYwT49Jy7c7
 +qubr5cEol5e+FcppNC+qxrLwD/KGLVPLPR9qyeEujlnj2xVwvPdkKuBpqFj2B5xDCIw
 DcISVGqrEZC25J05V6m4/9OtbtwEc9i6XF2vpaNhXqL49Xlx+LTZT9yQn6IjKcg8/cJC
 tFrQ==
X-Gm-Message-State: AOAM533XgL6kDzyUOzw6zsz/SkDOM28WYz6uk9qcLS32j7OQdqXvha5E
 i9FQCdxb27OhM12sJHYtlfciKogOJwQ=
X-Google-Smtp-Source: ABdhPJxvb5cUcgrZRdelE3gackmQ5B+km9smxfaUa6WMeDYpsPotkoI9hViV/OtoEL2xxBJEAvf+/g==
X-Received: by 2002:aca:c615:: with SMTP id w21mr3939859oif.68.1607454859826; 
 Tue, 08 Dec 2020 11:14:19 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id g6sm3588447otk.40.2020.12.08.11.14.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:14:19 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id h18so12861906otq.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Dec 2020 11:14:18 -0800 (PST)
X-Received: by 2002:a9d:711b:: with SMTP id n27mr17989008otj.221.1607454858711; 
 Tue, 08 Dec 2020 11:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-3-rasmus.villemoes@prevas.dk>
In-Reply-To: <20201205191744.7847-3-rasmus.villemoes@prevas.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 8 Dec 2020 13:14:06 -0600
X-Gmail-Original-Message-ID: <CADRPPNTgqwd37VSqiUcv2otGVr4mnQbuv6r887w_yCp=ha1dvA@mail.gmail.com>
Message-ID: <CADRPPNTgqwd37VSqiUcv2otGVr4mnQbuv6r887w_yCp=ha1dvA@mail.gmail.com>
Subject: Re: [PATCH 02/20] ethernet: ucc_geth: fix definition and size of
 ucc_geth_tx_global_pram
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 5, 2020 at 1:21 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> Table 8-53 in the QUICC Engine Reference manual shows definitions of
> fields up to a size of 192 bytes, not just 128. But in table 8-111,
> one does find the text
>
>   Base Address of the Global Transmitter Parameter RAM Page. [...]
>   The user needs to allocate 128 bytes for this page. The address must
>   be aligned to the page size.
>
> I've checked both rev. 7 (11/2015) and rev. 9 (05/2018) of the manual;
> they both have this inconsistency (and the table numbers are the
> same).

This does seem to be an inconsistency.  I will try to see if I can
find someone who is familiar with this as this is really an old IP.

Figure 8-61 does mention that size = 128 byte + 64 byte if ....    But
this part is not clear also.  Not sure if the size of the parameter
RAM is really conditional.

>
> Adding a bit of debug printing, on my board the struct
> ucc_geth_tx_global_pram is allocated at offset 0x880, while
> the (opaque) ucc_geth_thread_data_tx gets allocated immediately
> afterwards, at 0x900. So whatever the engine writes into the thread
> data overlaps with the tail of the global tx pram (and devmem says
> that something does get written during a simple ping).

The overlapping does seem to be a problem.  Maybe these global
parameters are not sampled at runtime or the parameter RAM is really
only using 128byte depending on the operation mode.

Are you getting useful information by reading from the additional 64
bytes, or getting changed behavior for setting these bytes after your
changes?

>
> I haven't observed any failure that could be attributed to this, but
> it seems to be the kind of thing that would be extremely hard to
> debug. So extend the struct definition so that we do allocate 192
> bytes.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  drivers/net/ethernet/freescale/ucc_geth.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
> index 3fe903972195..c80bed2c995c 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.h
> +++ b/drivers/net/ethernet/freescale/ucc_geth.h
> @@ -575,7 +575,14 @@ struct ucc_geth_tx_global_pram {
>         u32 vtagtable[0x8];     /* 8 4-byte VLAN tags */
>         u32 tqptr;              /* a base pointer to the Tx Queues Memory
>                                    Region */
> -       u8 res2[0x80 - 0x74];
> +       u8 res2[0x78 - 0x74];
> +       u64 snums_en;
> +       u32 l2l3baseptr;        /* top byte consists of a few other bit fields */
> +
> +       u16 mtu[8];
> +       u8 res3[0xa8 - 0x94];
> +       u32 wrrtablebase;       /* top byte is reserved */
> +       u8 res4[0xc0 - 0xac];
>  } __packed;
>
>  /* structure representing Extended Filtering Global Parameters in PRAM */
> --
> 2.23.0
>

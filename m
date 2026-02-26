Return-Path: <linuxppc-dev+bounces-17307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH2rNA18oGmMkAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 17:59:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B51EC1AB844
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 17:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMHkc1fKMz2yrW;
	Fri, 27 Feb 2026 03:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::634" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772125192;
	cv=pass; b=M3CJJzQa0MtgeTYHzF+4CQQpFaodqJUfYPyLfknxjM/WPPCwnOj1pDYDJwtbvGsXoRDxyaMsnFmJo0Xk8mKtI20kXWij2liq/KAsLq5GKcTpGPlsvI013+H5iYF5arFTGvEFP95zrbWhE0mNGvNfOIWhhGXBMDGJtFVEx7Ruhed5hfw0cLgf8bHGFzfK7cOQJpOOlh8HyANfGnsYRd1FYSSyhqhyzxgfxaTKDqw+M6qP1hsGArssP29Ge4KqyMHVZhaKloEe6PMm9d2cceYT30K4V++l8T7Kg7qLvzB3VuR9oaFsqe7RGo8s3OExh7Pgp1BHLHizscJplNES/gQKGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772125192; c=relaxed/relaxed;
	bh=VQTahQG7JlQriU0U/uIUNDwnC7GIEojKelvv8zx/TyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETEndux/AcYuIgd+zlDvfbra6rW+61QWaQhreEnSurrsMHwrgyWTHKYNcXQ5RBGylj/3ik8thDV29w6Jl4P3d5uFX1z43253HZvd9OFvw50UAO+kOSeAMvwUXcTHYdmO2vukaujPfbgFeU2ACD94GGYgAonOjAaH4fKVzUS19hSrjWVmQPjpZJ5dG0JAf0V8HUuGiSxv4a8Cy58Of5/CFWdX/ESRMRmm4q/UqXCKgnIur+kHCE2sLv5jqg/40diUEFyX5jPzeuJ5LW2pyHNFV6iUiT2IEHafpH2/Y7pAdnmFl76/qEiw545Ms+Pvu8vh0QBgEfcqLxdwiwnEEoNjqg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=B8RhHvt1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=B8RhHvt1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=purestorage.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMHkZ0b9Lz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 03:59:47 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b8f8324d2eeso17416566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 08:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125179; cv=none;
        d=google.com; s=arc-20240605;
        b=BfsSMYFN+uv2zzAF7ppRyEEg72TTDsMEr87PgvGazxLc3/ifW+bi/n25ou4wm9Lz9f
         9VJluWT8MJysC2f90NoozRxOT9Kx/ybxudi3CR1l84xeJABLWHdh8BUSXtYfvNimlpIk
         IG5ISfYQB1+nqP+IA217ROmQZ2QoVn0dIOAe5YhyrFzHRnOIx+oomTO0gEgnqkwAI5Rl
         rSBYVLAFZ4qL6gZsngHbtMQP9hRGLlDS5aLZ7hPKVJwSpiEJeVgox7dIzn2cneUXB+uC
         ggzVy6h3XA1iZXVp5E5JUPoheVzH2gYs/Uxh1tsvsVFcEa+PiVj0GiS0w1qRfOTkPg6L
         g1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VQTahQG7JlQriU0U/uIUNDwnC7GIEojKelvv8zx/TyY=;
        fh=lx6c/vOgucj6HdgdVtNCDV8B9QFv4TiwCz6kGMrEzYc=;
        b=kWvnKZ/k0OwbYX2Y/7TAtvHEwLRpw0AZG4CJNelDl30yB4DBY5JuHMhcZoKdDc1ZJz
         8E71oHLOuU8C2y51FtqenknSaFRAaBl4klbWTvZPntRADhZYs34YXXE7z8c+w/u+YoYX
         OdxKMOLeyiWa6KOE9aReV3LSBwlkKLtc9f1YZa6jlVwvFrYKC72acf+uC9yhrwf64Z+e
         QQzBQrt+78Ihp2PHcSeMxu3p3HxyJtPL/kOA+wCFS2ZkjhQPjx3p/steYe40uZNqYJgO
         Gd2zY8pwqj1LNadTZ5Fr5YFKDgZdW+uWxYotSM8F9cOLbaimtnZ4HBb/6UxdwUumP0r7
         kJUg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1772125179; x=1772729979; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQTahQG7JlQriU0U/uIUNDwnC7GIEojKelvv8zx/TyY=;
        b=B8RhHvt1aqXAKvCXL3p9sGEtCKGwYLPk3fg8w0UNyK4TwIyWgfo8eiZV544dYBBPiZ
         OWnXPYv+jBN+9sL6LmFVCIs6Hw5qKh0WId2SXfKf1jfDc6nlG5jsOolH+JDavwHUdpgh
         JnYC3NET+eNmOrJnuBDOIdzoItzbJ9GGBOOUOiExrP3RfOUWK1Z3XUMAj8xBAZKblq7K
         z9ScBiDeRjoNOL2LbzV6xdZ1fkoIMPc5glqhOeqrroGoqIbPF9FjgQUN8QSFHVwSV12X
         KBbHuXmyVxNUAmp+0InLGUFWEjLqV+d155NsOxGe3mPrbEokLSEeOz3hBwP6Vvba+jg4
         XE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125179; x=1772729979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VQTahQG7JlQriU0U/uIUNDwnC7GIEojKelvv8zx/TyY=;
        b=i5b132x+BTR7bSGN7bSOFbtF6ZyxOR3T9MvmN1HW11x8sfTfThIfWzwIbm80q4m5yU
         boDj6tXa1Z9Asa+SrPOhrKFdGJUe2XkY9t+2H660BMPXh7YReB65OmG9zqVy5ZRsdBL3
         Pa59koQqV0/CE3PsC8C5QpDUI0YL2o7Vm9tgUEVpbXEF9nOHiK+x68oJG6XAzG/LSXsU
         CYeAZ3/o9zWYc2i817irLZLwvhVLo0538UR25IgyLPsX1vwt4pSGjm+hABJPSuucFX7C
         yZDhaUtqM9PU+UnC4toZcA6+podGUooU4NS/lqdC08lo1gtvZgUe7FYClnNvR2A6EVSn
         ZkzA==
X-Forwarded-Encrypted: i=1; AJvYcCUJRtdughHIxF19vxf6IImYeuCJwc2creussD2hbYgLR7/MHaof+d9HxMBOlTqLX2JWRPxtJ9MGpwLQzPQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqBSPz70MSt1C7q/cQr+ica0BeKzwQe39/1hhzR0ARoczj977T
	kLUjgwOTr0uqoCPLenAEGuiKZVgI4/5ayTijsPgnFDxULMPx9xt5sf6OasNCd4dC7alX3CgFZA/
	xfNn075nIRGwITPw7lMUiDNplgRFcN55XOF2BpNfgJxDmxG/U5wK1iQk=
X-Gm-Gg: ATEYQzw7k2q9XKuJC8qGpkNGaKV2gQkC9pJEJk2C82gAoqewDVtuFHQHuqthTahqSfh
	byd5oGrDR4/uDNN0xqo7GTuIBd5x4uT5oCjNhlZksFl+8s2LLKie1QC7BcteDfpXW/raTL9SOkO
	2JNa02nrDMfeL4yJt+peXp+qykzUNm09ilK5/pHzWj3Lqu7N1PMX1297zsyLTIcute/y5mS3sDE
	S9mxcsKKyoz7mUqJsUvE4vCd6LFESJTTnGUKitAFS2Ki/Y44yfJlX0epVKnvp7oAgACGItJu6c5
	jWhZdel1Y/Bz1eoRfg==
X-Received: by 2002:a17:907:3da5:b0:b73:59b0:34c6 with SMTP id
 a640c23a62f3a-b9081aee279mr725994366b.4.1772125179302; Thu, 26 Feb 2026
 08:59:39 -0800 (PST)
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
References: <CAGVVp+U0EYVX+VbbEHzcYP70zdmOXwAmUvpMYV9y3jBSRFmS6g@mail.gmail.com>
 <CAFj5m9L8ahNYFf-tUAZFKAUzkeyqV-Sx94MxC268XJ-hqHPCig@mail.gmail.com> <CAFj5m9+OCswLULgVx8eSydTG0OeN4f-8dK1-JyoAA70CNF88Qg@mail.gmail.com>
In-Reply-To: <CAFj5m9+OCswLULgVx8eSydTG0OeN4f-8dK1-JyoAA70CNF88Qg@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 26 Feb 2026 08:59:27 -0800
X-Gm-Features: AaiRm50GWYX4r6oeginYJ_RUg2KTIoXKruIV8H25SbNGKcfgCAGwcyPjO6BwPXE
Message-ID: <CADUfDZrq96YGiMN9==gMitAHZtXydOAwy-767-d0j5LdUqO91Q@mail.gmail.com>
Subject: Re: [bug report] Bug: Write fault blocked by KUAP!
To: Ming Lei <ming.lei@redhat.com>
Cc: Changhui Zhong <czhong@redhat.com>, Linux Block Devices <linux-block@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[purestorage.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[purestorage.com:s=google2022];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17307-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[csander@purestorage.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ming.lei@redhat.com,m:czhong@redhat.com,m:linux-block@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csander@purestorage.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[purestorage.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B51EC1AB844
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 4:44=E2=80=AFAM Ming Lei <ming.lei@redhat.com> wrot=
e:
>
> On Thu, Feb 26, 2026 at 6:48=E2=80=AFPM Ming Lei <ming.lei@redhat.com> wr=
ote:
> >
> > Hi Changhui,
> >
> > Thanks for the report!
> >
> > Loop Caleb Sander Mateos  in.
> >
> > Thanks,
> >
> > On Thu, Feb 26, 2026 at 6:37=E2=80=AFPM Changhui Zhong <czhong@redhat.c=
om> wrote:
> > >
> > > Hello,
> > >
> > > on the ppc64le arch, I hit the issue below with ublksrv on the latest
> > > linux-block/for-next, please help check it, and let me know if you
> > > need any info/test for it. Thanks.
> > >
> > > INFO: HEAD of cloned kernel
> > > commit 37a43fd770f3dcac8f72f3ea909b3e893e2385c9
> > > Merge: 13cd9b41227a c1dfbd7e71b0
> > > Author: Jens Axboe <axboe@kernel.dk>
> > > Date:   Wed Feb 25 08:37:06 2026 -0700
> > >
> > >     Merge branch 'for-7.1/block' into for-next
> > >
> > >     * for-7.1/block:
> > >       ublk: report BLK_SPLIT_INTERVAL_CAPABLE
> > >
> > > reproducer:
> > > compile and install https://github.com/ublk-org/ublksrv.git
> > > #echo 0 > /proc/sys/kernel/io_uring_disabled
> > > #modprobe ublk_drv
> > > #cd ublksrv
> > > #make test T=3Dnull
> > > #make test T=3Dloop
> > >
> > > dmesg log=EF=BC=9A
> > > Feb 26 00:24:30 ibm-p9z-27-lp26 journal: running null/002
> > > Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: start ublksrv io
> > > daemon ublksrvd-0
> > > Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57923: ublk de=
v
> > > 0 queue 0 started
> > > Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57924: ublk de=
v
> > > 0 queue 1 started
> > > Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083476.4882] platform-linux: do-add-ip6-address[2:
> > > fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IPv=
6
> > > is disabled on this device)
> > > Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083476.4885] platform-linux: do-add-ip6-address[2:
> > > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > > ipv6: IPv6 is disabled on this device)
> > > Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083476.4938] l3cfg[0f1985ec14299e62,ifindex=3D2]: unable to
> > > configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
> > > rt-src ipv6ll
> > > Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083478.4938] ipv6ll[95ab7f3fdbfe643d,ifindex=3D2]: changed: no I=
Pv6
> > > link local address to retry after Duplicate Address Detection failure=
s
> > > (back off)
> > > Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083478.4943] platform-linux: do-add-ip6-address[2:
> > > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > > ipv6: IPv6 is disabled on this device)
> > > Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083488.5034] platform-linux: do-add-ip6-address[2:
> > > fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IPv=
6
> > > is disabled on this device)
> > > Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083488.5037] platform-linux: do-add-ip6-address[2:
> > > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > > ipv6: IPv6 is disabled on this device)
> > > Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083488.5041] l3cfg[0f1985ec14299e62,ifindex=3D2]: unable to
> > > configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
> > > rt-src ipv6ll
> > > Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083490.5034] ipv6ll[95ab7f3fdbfe643d,ifindex=3D2]: changed: no I=
Pv6
> > > link local address to retry after Duplicate Address Detection failure=
s
> > > (back off)
> > > Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > > [1772083490.5039] platform-linux: do-add-ip6-address[2:
> > > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > > ipv6: IPv6 is disabled on this device)
> > > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Kernel attempted to read user
> > > page (7fff81210000) - exploit attempt? (uid: 0)
> > > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: ------------[ cut here ]-----=
-------
> > > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Bug: Read fault blocked by KU=
AP!
> > > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: WARNING:
> > > arch/powerpc/mm/fault.c:231 at bad_kernel_fault.isra.0+0xc8/0x2c0,
> > > CPU#5: lt-ublk.null/57924
>
> oops, it shouldn't be related with `ublk: report BLK_SPLIT_INTERVAL_CAPAB=
LE`,
> Perhaps one issue lies in the ppcle64 architecture code.

Agreed, the "Kernel attempted to read user page" error seems
incorrect. The call trace shows this is in copy_from_iter(), so
reading a user page is expected. I too would be suspicious of the
powerpc copy_from_iter() implementation.

Best,
Caleb


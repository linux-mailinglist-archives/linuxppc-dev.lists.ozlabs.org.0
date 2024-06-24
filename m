Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3B919E08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 05:54:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dreamsnake-net.20230601.gappssmtp.com header.i=@dreamsnake-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=LG3xFgR4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8l7n1fMRz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 13:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dreamsnake.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dreamsnake-net.20230601.gappssmtp.com header.i=@dreamsnake-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=LG3xFgR4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=dreamsnake.net (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=aad@dreamsnake.net; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79BK1460z3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:21:28 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6b4fced5999so20905826d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dreamsnake-net.20230601.gappssmtp.com; s=20230601; t=1719238885; x=1719843685; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyM7SpnmS6E42kucj9mVuoblNwWj8XmJP/H7ZZM8ROY=;
        b=LG3xFgR4MecYQCnFiEWQ4lRAziQhy6KMnUEG62GM7g9dE1mXm2Kx5OTy754ZJQxksJ
         sxlnwIMX77rRd3mfEqWv37QPfk7F19Kjv8ulWoFbaiTZnS0p/eRScXXYq9eP+2Fx1Z1+
         rzIn7cCQZvvdN6zHIt9YAq9z+5WnwmMsBteVvlFFNbsc6vwmioakztwe/f9cWvSJU5Lg
         BS8YWQLKU53qb3+bKNGiYlvGB6xDkWVwYFG932drt69B/v0j5KeOB11kOcVzg4+MXdiP
         69t9D9KTNhW2NuHNj+s50LLUCa4gv3fgXWdI/oqVplmglkMMLYzn/fTyzGSIQdjpJFI2
         QgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719238885; x=1719843685;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyM7SpnmS6E42kucj9mVuoblNwWj8XmJP/H7ZZM8ROY=;
        b=rW9cP3fJM3OtNZ73nbtMN1n3M9IkwlgmBt6sL7NeFZTKFdhw7PMB9CI202xDvRhFj2
         A4TX9K1SKTCleeTrz1kN6tC8W0Rr+yPukF0Av9DGKnuZymPIb5JbEpo0xUfY99FJR3mk
         hWU7c3CLVH2oNWC8gsRw8CmnaHkk918J3ylSeQu9UeajLISmnSp+D3VIod871deLT8vb
         tFA8GdJFQtGNPfa+nLTtv3UrnRQ2o+GCg/lYd3wtB6D2d1ufmnB2js/PZUOkH0OyiL3+
         KFtNhZDnLV997P0W2LDaN/mKpVZAT5/Pd5/qq3bThI9K0gufz7nN1KD0t+HWkHD2QsTI
         x8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW6qCHycGEVtFclTjp8JOwhukL6uI8zQn5ALviAQU60zX2WE+HMwRf7MkCrVOfy/kCpSwCXpMrQTlKzbqJ2E4NkOJnsy894oFBGBDVcjA==
X-Gm-Message-State: AOJu0Yz+lo/JRaKNO9a953i1co5aDU31/RUNJlrv1oKLN30cj9750DN+
	MovSyDQBoNppHF3lDUalGUwm9VnU6VUYRoxGSmDZI73vxDObYwkDxZhensk5
X-Google-Smtp-Source: AGHT+IHXYJoHqe+lVWeHEvpL31lPzpeMHrumwGR4d2Z3MDIXugyalKxqFS2lKuqDdFuxVAxlh+r7+g==
X-Received: by 2002:a0c:f594:0:b0:6b5:50ba:42c3 with SMTP id 6a1803df08f44-6b550ba45a4mr31114516d6.43.1719238885298;
        Mon, 24 Jun 2024 07:21:25 -0700 (PDT)
Received: from smtpclient.apple (pool-100-6-75-225.pitbpa.fios.verizon.net. [100.6.75.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef30ef9sm34454366d6.76.2024.06.24.07.21.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:21:24 -0700 (PDT)
From: Anthony D'Atri <aad@dreamsnake.net>
Message-Id: <1E6AF1FD-5E2B-49D6-B42E-1BEA85BA7E93@dreamsnake.net>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f: fsmark.files_per_sec
 -64.5% regression
Date: Mon, 24 Jun 2024 10:21:13 -0400
In-Reply-To: <Znl4lXRmK2ukDB7r@ryzen.lan>
To: Niklas Cassel <cassel@kernel.org>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
 <20240624083537.GA19941@lst.de> <Znl4lXRmK2ukDB7r@ryzen.lan>
X-Mailer: Apple Mail (2.3774.600.62)
X-Mailman-Approved-At: Thu, 27 Jun 2024 13:53:28 +1000
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
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org, fengwei.yin@intel.com, linux-mtd@lists.infradead.org, linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

S3610 I think.  Be sure to use sst or the chassis vendor=E2=80=99s tool =
to update the firmware.

> On Jun 24, 2024, at 9:45=E2=80=AFAM, Niklas Cassel <cassel@kernel.org> =
wrote:
>=20
> SSDSC2BG012T4


--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">S3610 I think. =
&nbsp;Be sure to use sst or the chassis vendor=E2=80=99s tool to update =
the firmware.<br id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote=
 type=3D"cite"><div>On Jun 24, 2024, at 9:45=E2=80=AFAM, Niklas Cassel =
&lt;cassel@kernel.org&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">SSDSC2BG012T4</span></div></blockquote></div><br></body></htm=
l>=

--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF--

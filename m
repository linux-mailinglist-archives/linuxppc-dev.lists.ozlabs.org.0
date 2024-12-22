Return-Path: <linuxppc-dev+bounces-4418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D69FA769
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 18:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGTJl2mQbz2xbP;
	Mon, 23 Dec 2024 04:52:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734889975;
	cv=none; b=SL/0bnuV0vpQjMr/dINCko5ftchORti2v/oPkrbql0EhyGbadFM4WNOzCVC2737N4uvpxQ48fBwKuY3RN230mxziYRWOnVo4WGmo+zkZcCjDiLvZhLUGzQgxfRTg19YwRlIcPutiVaxWkNG9JUBRktEjfvr1H6+kNRf+QzPuLda2drRO+ebyk0PM05+Kx2zTMkPTBeotRgTDP/WSUVnhJMWQ+3plBL6flhbVJCs/LnYukLEqmCxv2WfwA4vPWrYsx2FOeienF+urW8UtC35JL9SPjzaNRn94PCiDjyS9yN8wQ2ZKKw02owxblp5N+iRFqSfEIU6ZYrdG7zEfmONVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734889975; c=relaxed/relaxed;
	bh=PUT6HYn3p+eOnR5/3YxggsDpwP1OTV4d4GKc89IZO/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnCWAf8vkkqlvkVfYZzMCNaDD4aEERj9tQz2cwSbwZzQtN7CEhCryIuMlpgg97mE4iioU9jsYn88VNCR3T47iL7hwAMFilOD5MBYPSaYraJMrLd6NSjCT+i5NoXl3SGHaPTld1quNkq9NIRSteHj4+nQqTKX4l9mr2nznu9uGGzF3wScbPnx2csYqXwOXhZHEGtV4ME63qAaORNp0rP7HBr0OZdqbkVq7kJvBCjGJc3Io8Sp40YcAgikqVXhsAhs304QP9GtxZRYPyhXSnhs8l0PdpCYknKX80IBnKf3jO+yU+pkOSNZIZiyz/x9eUmykVKI4Coza+8SjWt0Dyddmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=br8IZRst; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=br8IZRst; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=br8IZRst;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=br8IZRst;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGTJj558vz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 04:52:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734889965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUT6HYn3p+eOnR5/3YxggsDpwP1OTV4d4GKc89IZO/8=;
	b=br8IZRstGM5ZP42NA3QcPHuQUWb8MFkqvKFDrO3vL3seXhhER7fOY8KORa1jkDzOi83QDI
	p2m7P1uK3bScllcahA85xSIO4JeMEHS949l7lKYfh6GviS55Vl6/SuO+6TCXcUetZJYhCY
	qCvil4rnoJR0GAd29trcioWoeL3um+Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734889965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUT6HYn3p+eOnR5/3YxggsDpwP1OTV4d4GKc89IZO/8=;
	b=br8IZRstGM5ZP42NA3QcPHuQUWb8MFkqvKFDrO3vL3seXhhER7fOY8KORa1jkDzOi83QDI
	p2m7P1uK3bScllcahA85xSIO4JeMEHS949l7lKYfh6GviS55Vl6/SuO+6TCXcUetZJYhCY
	qCvil4rnoJR0GAd29trcioWoeL3um+Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-gltqxBzzMwGPMQxOP5xCaA-1; Sun, 22 Dec 2024 12:52:43 -0500
X-MC-Unique: gltqxBzzMwGPMQxOP5xCaA-1
X-Mimecast-MFC-AGG-ID: gltqxBzzMwGPMQxOP5xCaA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3860bc1d4f1so2026788f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 09:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889963; x=1735494763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUT6HYn3p+eOnR5/3YxggsDpwP1OTV4d4GKc89IZO/8=;
        b=NvLtpk7hPgUIwLqDin3Eg6bwRnJxYxJCouC8FlQby/8LVSK6WabjAiwJSuKY6sJNPP
         U40XV/sjppN7IxXOt7vrcf2OM6qIXZp5yuuRTj5bcTKXtzxPwnx33tI2BpUoQAG4gaQ8
         z89UZ0qzfxp7xeBfJohaYgtJ1BkU5Uo1oM1QRD3yR7ooG3xY4Fa6LOwal+y3mhY0xBmt
         C4hZckWwbGbNjBGto53Ok+tqLrvKQdBKK0upVk5TgrbqhPJpLrkIkGmDPpxZ+z90wG/z
         +a+bMzMhtaZC+cSPRFjaDF+s7Gh75o4Iipjvebp7ae52KKRoRaiG2tJJL4Z8VXQFTc6s
         KFpw==
X-Gm-Message-State: AOJu0YzG7ZfyrCvvT05y9DYai346pBQnOKeiqxSNAQ5YiUqzRmIL1pyV
	foVCIo8H7Zipv3QqbtbNiV0txXCiemuCwtxN+HLUuDhCRpwk0e76Lfe9ZTfkf3WJ5M2+bCGN1Qg
	2oWCNtI1+KsGaXQTzSJCZ0tJ5YIDznyUDaCdguiw1GKyUaffU2obnuWMrxyTgsPnn2PO7MscjCs
	kPhYdZlNNAzwHRoDFqPdGt92zHA9aBzHkuLzJVNQ==
X-Gm-Gg: ASbGnctPwHj5TcqiAZsKR7nLdlS5dDxvihyFA3TYBhxlyV7d7jlFfmu6i8DYj2T5p9S
	VROg+nPxLoX5WRtCCyJG3fodDFjK1uiyGKRAIaQ==
X-Received: by 2002:a05:6000:144b:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-38a223fee74mr8854486f8f.51.1734889962778;
        Sun, 22 Dec 2024 09:52:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdLxRQSyjBrqOT3kjTm+aba8OV1gzjTIw4k0In3VukgGMNVAbqYTWkCIc/Xu/NR1CLB+p1H0O4XOPn5wEhbTI=
X-Received: by 2002:a05:6000:144b:b0:385:df73:2f18 with SMTP id
 ffacd0b85a97d-38a223fee74mr8854472f8f.51.1734889962460; Sun, 22 Dec 2024
 09:52:42 -0800 (PST)
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
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de> <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de> <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de> <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com> <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
In-Reply-To: <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 22 Dec 2024 18:52:29 +0100
Message-ID: <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>, 
	Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>, 
	madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PhvyCcrp814AI9EvFNLvD8T9y3fUnkMhRgLnQcdOn8U_1734889963
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024 at 5:24=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> Hello Paolo,
>
> I tried it but there is a host boot issue at the same time. Bisect log:
> https://github.com/chzigotzky/kernels/issues/4

Thanks, I left there some instructions which I'll copy here for reference.

We need to bisect the host boot issue:

  git bisect start
  git checkout c9be85dabb376299504e0d391d15662c0edf8273
  # check that it does not boot
  git bisect bad
  git checkout adc218676eef25575469234709c2d87185ca223a
  # check that it boots
  git bisect good

If the two commits have the expected result, the first bisection step shoul=
d be

  # Bisecting: a merge base must be tested
  # [e9001a382fa2c25...] Merge tag 'kvmarm-fixes-6.12-3' of ...

There are two possibilities.

## If e9001a382fa2c25 succeeds to boot ##

Then `git bisect good` and bisect to the patch that causes the host to
fail to boot. What's left seems to be all non-PPC KVM patches, which
is a bit weird but you never know. Once you have the result, we'll try
to fix that, and provide you with a fixed branch to bisect the actual
KVM-PPC failure.

A potential candidate, based on your skips, is commit eec1e5db464e
("KVM: Annotate that all paths in hva_to_pfn() might sleep").

Please also provide the messages for the boot failure (I haven't seen
it but I might be missing it).

## If e9001a382fa2c25 fails to boot ##

Then the boot regression was in the v6.12 tree. Fortunately the KVM
tree can be rebased without conflicts to v6.12; go on with

```
git checkout -b bisection-rebase b467ab82a9fde4b46c0cd2c299220857afb0e0d4
git rebase v6.12
# check that it boots. if it fails to boot, please report this. if it
succeds, continue:
git bisect start
git bisect bad bisection-rebase
git bisect good v6.12
```

Proceed to bisect looking for the failure to start guests. If you
never find a kernel that fails to boot, report the bisection log.

If you find a kernel that fails to boot, drop the bisection. Start
another bisection between v6.12 and bisection-rebase, this time
looking for the first patch that fails to boot, and report the
bisection log + the boot failure messages.

Paolo



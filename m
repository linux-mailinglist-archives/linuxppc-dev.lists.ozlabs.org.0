Return-Path: <linuxppc-dev+bounces-14078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43AC4C044
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 08:13:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Hnn68lLz30FX;
	Tue, 11 Nov 2025 18:13:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762845229;
	cv=none; b=YUjQa5uEUDhW5zL2ensWMDt7/zoYgAWbzM56CKeqvWQKe2v21MvvSCC4FmamuX+DSJ9o2GTIIoW4qJ9p5cpinQjyj6J7sdEiWyTLtA9qTPuUOVTjW83lR69yq/8PX0lfsez8N32lfMgBdZMR5vnFiCEF8znyzstDtaLg+r/sNe0yGBd+bxz4TQT5VLsI5+ClX07E840Bzzh0n6aGCho2Lm/hBcYer29KYoBvSCxwTyGY764Wp3b8Z2CTnB6AbaW1aO//0rhXYYPNCVjx62msaZdnrhVzgT13Ig3Po11/1r+m7R2BrOodBnbTEKBCKu+Zh3UunpDsD9+id5nHbWQktg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762845229; c=relaxed/relaxed;
	bh=qQOor7E4dbeNIdzwuyVMMdwivPTgd7AVyRPfTl2aFVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OD7h6yQ0udVpFWrd63X2PGtG/wcDf3IO2C1pg+mGtT9nq7Q/rZl+JIGn5k9g11W9fx7OGqm9f1Gxv5DvTunvNbkAfewXAy+Xd8cKag5RATqCsZICPqnoptkYKaGyChCPr9rbl9+cZum8LBYggVldzZ2IO2952ScqyPKTI9WXbIrHcamSo8W0Z9RgqQC6ZFiOO0QXH3eV7y+23/hstemNadm1uwWZ78f86NpV7nfRIqb0aLubysMN7a0wAqVyS5hIpBVTMW0gXB791aXCeBROObMlb+rpgFvQvRvOCWWxKhwDLJlhNhUfJ6KHplM2wrFONyHi0Hf8vVWimYmkMyzC7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0UskhF1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZoGAkiU3; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0UskhF1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZoGAkiU3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5Hnm5S2fz2yvd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 18:13:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762845222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQOor7E4dbeNIdzwuyVMMdwivPTgd7AVyRPfTl2aFVc=;
	b=e0UskhF1Qf5gh11Zt06WcgSXS5Epfc1XaeFfKysODjO+iCQ4kHgxPt857IdqT5RhOaPkM3
	0Xj1LzGp4HsVdZaF2SWWdYEzSB84R1XgbqxVIekTL2f7/isp1ZNyxpHKIrloOhLXEoQtXE
	JQSQshk9nHFv4pG72AOAMxv3CxuaHBg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762845223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQOor7E4dbeNIdzwuyVMMdwivPTgd7AVyRPfTl2aFVc=;
	b=ZoGAkiU3BoAqeCFRB/YT+6Apsgy68J/FPP60P7bIzrytNlkrwsM9DU8iXAgbx9HSjwg3VO
	K8aC2OdAbYNhKKsZdsfPnG1qDmKG+69InhJPKMXqSTB8FOWRPvow5dj04A/ujpbA7lug8m
	68l9j6g11G0hgWkiOzQeZ9fol24ZR8Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-JIStRuNgOASEVExFchSF7Q-1; Tue, 11 Nov 2025 02:13:40 -0500
X-MC-Unique: JIStRuNgOASEVExFchSF7Q-1
X-Mimecast-MFC-AGG-ID: JIStRuNgOASEVExFchSF7Q_1762845219
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477771366cbso12893715e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 23:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762845219; x=1763450019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQOor7E4dbeNIdzwuyVMMdwivPTgd7AVyRPfTl2aFVc=;
        b=vkPhzi0JbXU/0q4tGyUuIH6ttanF01pjBVzTG4Iyg+J0NtPF+r7x5/sGCxCepLUW4z
         HfAh/vmCCphPQTq4HDhhbDCEKDAGpoXcrue1W1CYt03JT4BaaNBVOYw/d+7DSAmgrMdp
         pqxQQ2dy41on7L/JkDvQPouWiyGsFHrUu7KzHVGrLXsEa8QYiv+eMrZEkqhhnMPDTu+6
         vdahlLG2Mj7ISLej3j4Toc28WzGs3Jl0zqLH4MDCohxamG3a72b7o16RPrMEh36TMu2e
         cd3/inmiJO7NDFq5+IQRtn7RpG+Z7xbui0E79D7Z67qBAol9+8wE8AeDy1iMMyJEMaUU
         8aqg==
X-Forwarded-Encrypted: i=1; AJvYcCWICToVFAWRR2dnnuYsbFvaROsRKJw5Wa5pZG4ONLsRNn+eFnC52UcCVgzduAlEPDdPo+8QfiYSArKyFfM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxk5wA+KN20lUNUSC6FuXbqRhLAwUu9XPbbPv7aD6srvI/9dz2M
	FUk52tBaL6DSsj75uyTAasPSCUuPU9ctTiFb4ZYACKjl+1NG8JudFnv8HK5jC2n4YNBHW/mtzS9
	5Qz6fsFGjKY2cR0ngMp4SgJ8JE5iFkPNUr2WWzYh0dQxwvipvgN+hAGTfvY5CchTkN1+WDQRQJg
	JPinpVc5/R0A4+twj1vDMCsQG26bFQU4QhimX2LsmBMQ==
X-Gm-Gg: ASbGncvM/IxpZ5HHcruFKDlfv+GMAx9oJ7e05M+XKciTP0R61wGoCMm5CEXU4yEJgRz
	P80lOga++uemAx0qxYF0WiJ7KmFSIjFulo49PTf2l8xHDR26YqqPq7yxzLw+Zv+P06Uk7LE72bZ
	qRJMXWe31LRewwG5xEFqZncsqejo+5zD9upVmEYUT2246k5BSsrNkz1GA=
X-Received: by 2002:a05:600c:444b:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-4777a783204mr56164195e9.8.1762845219450;
        Mon, 10 Nov 2025 23:13:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw/+Bs8p75RPgUBjuCYroBPzYtzRIGy+11fRuWx6Iz1E14m6XadOX1hcZgO52e5MYFfXjwjk/ig8B+S2Lnoz4=
X-Received: by 2002:a05:600c:444b:b0:477:7a78:3016 with SMTP id
 5b1f17b1804b1-4777a783204mr56163945e9.8.1762845218970; Mon, 10 Nov 2025
 23:13:38 -0800 (PST)
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
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
 <CAFxkdApQVEqCjQMAUqy8cuKnMy8GY9j+brgPZBkxCpeGi5xHxA@mail.gmail.com>
 <CAASaF6zvFa-mPaPfKnBcerfVBkDt5B3TEn7P9jjAfentqSNmxQ@mail.gmail.com> <d2e51443-49dd-445a-88aa-f29d7b777bce@csgroup.eu>
In-Reply-To: <d2e51443-49dd-445a-88aa-f29d7b777bce@csgroup.eu>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 11 Nov 2025 08:13:22 +0100
X-Gm-Features: AWmQ_bmxCpD__pGofmjig0yXldv2fVwGSDiIyFzuYlizjt54SnDPYGTazzntDqc
Message-ID: <CAASaF6xv6D+Bebv8u5BpDP4-9hb5qX6HRfcdVNaUxb2ke2vuVA@mail.gmail.com>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check scripts
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Justin Forbes <jforbes@fedoraproject.org>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, 
	linux-kernel@vger.kernel.org, joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _LTXpHRckJsVozq0YoOIH0agWBjxITbrkDdtnsR-o3Q_1762845219
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 12:33=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/10/2025 =C3=A0 19:09, Jan Stancek a =C3=A9crit :
> > On Mon, Oct 6, 2025 at 10:19=E2=80=AFPM Justin Forbes <jforbes@fedorapr=
oject.org> wrote:
> >>
> >> On Tue, Sep 23, 2025 at 9:31=E2=80=AFAM Jan Stancek <jstancek@redhat.c=
om> wrote:
> >>>
> >>> We've been observing rare non-deterministic kconfig failures during
> >>> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> >>> disabled and with it number of other config options that depend on it=
.
> >>>
> >>> The reason is that gcc-check-fpatchable-function-entry.sh can fail
> >>> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit whil=
e
> >>> there is still someone writing on other side of pipe. `pipefail`
> >>> propagates that error up to kconfig.
> >>>
> >>> This can be seen for example with:
> >>>    # (set -e; set -o pipefail; yes | grep -q y); echo $?
> >>>    141
> >>>
> >>> or by running the actual check script in loop extensively:
> >>>    ----------------------------- 8< -------------------------------
> >>>    function kconfig()
> >>>    {
> >>>      for i in `seq 1 100`; do
> >>>        arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
> >>>          ./scripts/dummy-tools/gcc -mlittle-endian \
> >>>          || { echo "Oops"; exit 1; }
> >>>      done
> >>>    }
> >>>
> >>>    for ((i=3D0; i<$(nproc); i++)); do kconfig & done
> >>>    wait; echo "Done"
> >>>    ----------------------------- >8 -------------------------------
> >>>
> >>> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-fun=
ction-entry")
> >>> Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> >>> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> >>> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> >>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> >>> ---
> >>>   arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
> >>>   arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
> >>>   2 files changed, 2 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.s=
h b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> >>> index 06706903503b..baed467a016b 100755
> >>> --- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> >>> +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> >>> @@ -2,7 +2,6 @@
> >>>   # SPDX-License-Identifier: GPL-2.0
> >>>
> >>>   set -e
> >>> -set -o pipefail
> >>>
> >>>   # To debug, uncomment the following line
> >>>   # set -x
> >>> diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/p=
owerpc/tools/gcc-check-mprofile-kernel.sh
> >>> index 73e331e7660e..6193b0ed0c77 100755
> >>> --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> >>> +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> >>> @@ -2,7 +2,6 @@
> >>>   # SPDX-License-Identifier: GPL-2.0
> >>>
> >>>   set -e
> >>> -set -o pipefail
> >>>
> >>>   # To debug, uncomment the following line
> >>>   # set -x
> >>> --
> >>> 2.47.1
> >>
> >> Would love to see this picked up, it fixes a problem we have run into
> >> with our CI.
> >>
> >> Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
> >
> > Thanks Justin.
> >
> > Would any maintainers also care to review? Ty.
> >
>
> Is the problem only with those scripts ? I see other scripts using
> pipefail in the kernel:

As far as kconfig goes, we've observed this issue only with the two
gcc-check scripts.


>
> arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh:set -o pipefail
> arch/powerpc/tools/gcc-check-mprofile-kernel.sh:set -o pipefail
> drivers/gpu/drm/ci/dt-binding-check.sh:set -euxo pipefail
> drivers/gpu/drm/ci/dtbs-check.sh:set -euxo pipefail
> drivers/gpu/drm/ci/kunit.sh:set -euxo pipefail
> drivers/gpu/drm/ci/setup-llvm-links.sh:set -euo pipefail
> scripts/check-uapi.sh:set -o pipefail
>
> Christophe
>



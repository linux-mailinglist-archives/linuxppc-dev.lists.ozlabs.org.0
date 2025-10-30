Return-Path: <linuxppc-dev+bounces-13573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A034C21B18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 19:10:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyBwX4lRCz2yG3;
	Fri, 31 Oct 2025 05:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761847804;
	cv=none; b=G2yU4cxw+jnGTezD7T09nAz9kZu+cgyPr4BTRwqih+vBop9fY04WLp47duBb698pe19/HiNbHjLHvhoKMvkWnP91CYO0sndqSBSILbfqonqjSby1I7/aGPeqmqA4fvGDKdx8cKvKoN0qu1WJfaVrCACsWF7vG/7PcV0BjRhxChBzSeH2tHJreMtGdy8EB5LJR4AzaSAl3rRb6G3wM6hAaTApZFRdxf8jubQemj+to9+5JzljwxORlESCuY8Qw6XIhRknXvlqhLorIPv+XI9z/Gvb4oDeqZVxBpCdLlnG7hD91609tf01KQQdu8lQhBFNELqWEi9Z7fLjmK22UPrsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761847804; c=relaxed/relaxed;
	bh=mctqRaSLMd7c2qit82j5QIoFnAfSUGLlal0MZ5uxEJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3gm/RRLd0oRpbzNc2GXG5wu9fQ2Lcl1I+96h+dMmfjGFsAF8SLTwLmpJJ25lwewSFqmim20sRIRaUjNSyGYsDZ4tOrHikJPAkQPf98azQPWKmiuHKkR1q6q1Fe0MmLnlfROj1wHabWoovPFPo8umjOyWiNkupUhS+XL40hsi5GqksAwdxwJ17uD9I5f0oLRgYsUpoyd38gRAovdaeW1eDBEYapaS55voZEqLjjtV/cTbx3ztzQsMA6T1w4qsm4vgkerxhF7ew+RFp+N5ZQze8etTRw8+leVRkl8/a3fzHPQtidUAfdyV6eapz/nQVknR7pGiXHloAymnDWAVw+UCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOUNo9bu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOUNo9bu; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOUNo9bu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOUNo9bu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyBwW0fFYz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 05:10:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761847793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mctqRaSLMd7c2qit82j5QIoFnAfSUGLlal0MZ5uxEJc=;
	b=QOUNo9buTxS2v2DWCZN6fLa9iuB+UHBVFBpgzcw8dMYzUmOl8+t2WphFT6Eg+hKQ08UL1g
	nl3T+3+MvyivPecq0WmtYrpxFmtUaXQL+ypd1+VQbCkqs+84ckOdE/pHtHqykGgLOeIwyr
	WQOv71f3G7OtA1JrVvquwsCSCpCOGo0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761847793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mctqRaSLMd7c2qit82j5QIoFnAfSUGLlal0MZ5uxEJc=;
	b=QOUNo9buTxS2v2DWCZN6fLa9iuB+UHBVFBpgzcw8dMYzUmOl8+t2WphFT6Eg+hKQ08UL1g
	nl3T+3+MvyivPecq0WmtYrpxFmtUaXQL+ypd1+VQbCkqs+84ckOdE/pHtHqykGgLOeIwyr
	WQOv71f3G7OtA1JrVvquwsCSCpCOGo0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Yrq8xAtPM3af0beDPmJwdA-1; Thu, 30 Oct 2025 14:09:51 -0400
X-MC-Unique: Yrq8xAtPM3af0beDPmJwdA-1
X-Mimecast-MFC-AGG-ID: Yrq8xAtPM3af0beDPmJwdA_1761847790
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429bd66fe65so196726f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 11:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847790; x=1762452590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mctqRaSLMd7c2qit82j5QIoFnAfSUGLlal0MZ5uxEJc=;
        b=XiKuiCmzbCwOR1oCOT984TtZJLpDldtlUFKxatPxHppgzpPcR82b844RdHLLQ4V0rj
         JFmGD79rM4EpIOI1SeNqgfvg5gw+Ffh3PyDVVe+h6WqIQLhnC0+qyJOR7rndxXekyJyp
         744zJi/RiboivqL+d1uWBOlMzzU8jQqH7FG3Tu2ICsedMBvqIReF7AH35CUax70tmFbW
         Ko1XEMfAss5Yq7lxxKFQtdUdegfxZyxuMh0eoPkK5VQXgrhh9iJGHwJiDjh0XNTAM7BB
         r7inFyxUubF7HQAYY8UVvDkyx3t0TWwk9ZdjgxwySZEm6Gc78hphHr6rdNrUlIopkBnF
         joTA==
X-Forwarded-Encrypted: i=1; AJvYcCVC62c6G3dUON5QC0shF8kfzZWVSddErQI051craXkT5VhZCI47BbEQ7MPFqglD2YaPjMqbfWHB5MZnU9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywo039S4nTXVA/8LAFWFEc5VR2eSEKyWDAm+5dmcHzLNR5Zp430
	s1L0KHqB1axOTpJ/WOaR/f0RbzFKiKtX36iqaxWebnsX4WOq1kQirATU3qjb/np0bOBH1GPPF7z
	SVP8vp/y4nH50fGKQzqMuZJJXhmJe0OQWgFTAzVX3buusYxlqcQItTVjaZJ38tXzYBI2LOk2xpp
	OCl2ydSDLHTnn2zQnd4BkfOt1yDQJmmb3JfzSF+A2PkQ==
X-Gm-Gg: ASbGnctFRZmGJuLfbf9OVxz/qWxazcyYPBMuxiV08xgwxCnweIRDFaUBaP2A9ZLMYoR
	EdpYooqWQavSSbWFCZQJLLtW/KIUJ3NNmwyeJU7uqJ/fhdeVMDA3IapJDoE+N0N3wYGfMor+kpq
	W65a4R3AKLvuRqJEXC3yrhSb+P2bRV3p7Z7LJQI/xGjE1G7cByi4Jt4w==
X-Received: by 2002:a5d:588e:0:b0:428:5674:7a13 with SMTP id ffacd0b85a97d-429bd6adccamr491057f8f.36.1761847789664;
        Thu, 30 Oct 2025 11:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIVcwcrZLyKZAEVO6CsM/z7QkByVRb/zeVY0UBsbLqggacUkqCldcvMgAZwWM0uXZNWZCqwgsj/lVCgmiDrik=
X-Received: by 2002:a5d:588e:0:b0:428:5674:7a13 with SMTP id
 ffacd0b85a97d-429bd6adccamr491032f8f.36.1761847789166; Thu, 30 Oct 2025
 11:09:49 -0700 (PDT)
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
In-Reply-To: <CAFxkdApQVEqCjQMAUqy8cuKnMy8GY9j+brgPZBkxCpeGi5xHxA@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 30 Oct 2025 19:09:31 +0100
X-Gm-Features: AWmQ_bmanZjZxYXwlDN92d79oco1q_2AvRPQQHVSh93R4vGkOq-pVqgD2FItu1g
Message-ID: <CAASaF6zvFa-mPaPfKnBcerfVBkDt5B3TEn7P9jjAfentqSNmxQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check scripts
To: Justin Forbes <jforbes@fedoraproject.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KTkerAUPZixGOVUys6ySGfKqZzyII9Pi28JycFMeas0_1761847790
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 6, 2025 at 10:19=E2=80=AFPM Justin Forbes <jforbes@fedoraprojec=
t.org> wrote:
>
> On Tue, Sep 23, 2025 at 9:31=E2=80=AFAM Jan Stancek <jstancek@redhat.com>=
 wrote:
> >
> > We've been observing rare non-deterministic kconfig failures during
> > olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> > disabled and with it number of other config options that depend on it.
> >
> > The reason is that gcc-check-fpatchable-function-entry.sh can fail
> > if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> > there is still someone writing on other side of pipe. `pipefail`
> > propagates that error up to kconfig.
> >
> > This can be seen for example with:
> >   # (set -e; set -o pipefail; yes | grep -q y); echo $?
> >   141
> >
> > or by running the actual check script in loop extensively:
> >   ----------------------------- 8< -------------------------------
> >   function kconfig()
> >   {
> >     for i in `seq 1 100`; do
> >       arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
> >         ./scripts/dummy-tools/gcc -mlittle-endian \
> >         || { echo "Oops"; exit 1; }
> >     done
> >   }
> >
> >   for ((i=3D0; i<$(nproc); i++)); do kconfig & done
> >   wait; echo "Done"
> >   ----------------------------- >8 -------------------------------
> >
> > Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-funct=
ion-entry")
> > Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> > Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> > Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
> >  arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh =
b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> > index 06706903503b..baed467a016b 100755
> > --- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> > +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> > @@ -2,7 +2,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  set -e
> > -set -o pipefail
> >
> >  # To debug, uncomment the following line
> >  # set -x
> > diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/pow=
erpc/tools/gcc-check-mprofile-kernel.sh
> > index 73e331e7660e..6193b0ed0c77 100755
> > --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> > +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> > @@ -2,7 +2,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  set -e
> > -set -o pipefail
> >
> >  # To debug, uncomment the following line
> >  # set -x
> > --
> > 2.47.1
>
> Would love to see this picked up, it fixes a problem we have run into
> with our CI.
>
> Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>

Thanks Justin.

Would any maintainers also care to review? Ty.



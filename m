Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5384F156
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:28:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=akwUFXKH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWRnj1Bg7z3cX4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 19:28:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=akwUFXKH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWRmx3fYRz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 19:27:44 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d94b222a3aso5527235ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707467262; x=1708072062; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTTD1zUl6XbIoz3C+fDNL2dHgdo/Av/V6kztlCMET94=;
        b=akwUFXKHpeVqq+hbjAldTWP1gIqYgNsigcm3r7Yew/baS/efOeCsLb/yiAj67AlGlx
         ZoofN9SZyxrImOQ+o7n1qX95OLSGR6WGNa/dL8ISGuJD2COdEgYOcQApcLi/nKFOBuqX
         MDBh3UF/TWdmcn4a7SdvIydvIV/hw/9kaGov2HNYXdEge4KgPlAjAkjVjWYcnrFmF9SH
         86sBOSR635Lnn9jOqlXKp+YfXaOdDC5viJniiqkLSD040+eK1idMiUtimwtQVYccKLeA
         B/Xvz9xyFke2zRg38RnHZo6Zp+fMRBL79rolyBwi0AVPTK9DXo70WauwVYLhXdrX3Qnp
         l/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707467262; x=1708072062;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MTTD1zUl6XbIoz3C+fDNL2dHgdo/Av/V6kztlCMET94=;
        b=DGQkGUdqFcOME3d/gcrax5DOMbbWDaGpCyQlGjzb9tuTiTYTirEPzKMUomI87Gxe7e
         LgmLgbA0l+FcJSy1nYeRnH/C/7GieVryfDLNCmOxuZIqVl7RUEdtlwuz1Hm1Z98BlQCz
         b8ldiI3B9e5KhnXiRbW1+Vpgia/8Ib9MJcF9szSTwJC86oMik49EUNQ2ge9gnD/pGX7r
         NG6MNrSbyuJOWcy/NCP9p7D1cXLpId0FcNdER2hICXH69YX1UKCp0olkjlabTE2pGdRx
         SyRJRVGC4vemc3pgc659qQF5AJcETsdcNiZ5f4Hj3g/1ToDxCp4eS1Yrm+fFTDTe73Gs
         vwng==
X-Gm-Message-State: AOJu0YzQx7gpkWlHUZPUww/lPnJflp92dKg0nqYUaBdmuWcC6WJZXOT2
	3IoihXOkyUjaQX36P+ZFv7I9ZfhUKUeHgJWE+qu238xg7LkEKAJg
X-Google-Smtp-Source: AGHT+IG5BMthemltiiFcIr8v360fN9gt+99vayEmFyCcvEZHyJpxukdjW15W7pZ34jdmNysLP/78mg==
X-Received: by 2002:a17:902:f7cf:b0:1d9:93d2:5208 with SMTP id h15-20020a170902f7cf00b001d993d25208mr848603plw.49.1707467261671;
        Fri, 09 Feb 2024 00:27:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVf8VYvdZg1I9yYmtndJcECe7KBKpqawuTH71hxKTK10aCEzRGDcfp3x9IY0+mu45sKSfxMDCWOrm7OBeiIWjO8ccl1e/i7CzEyWzzRtpFkUwhl4kXYpMLRDcTNGBczKQG1R0+mRRS68AMbYgcHbyhRuTBvr46GlbLZovYZHTxRZ4DhLqtitlTUzfcxSR49t8OWGM6YDUh7XCxZtpsCc8VuoPfHjT0+rs5SVlVBwZuN/OeAhQ2MJlI8oE3bR8/55mwTUjleK8apXPQoAXDXhaolhb1P/oXRjLrAox/02p5e+POLA5rq5izQCWv+jBsnz1rtpokU0wN5cZrjiavgUUkNyTdxtwiIW9iLXityb25p3YcPAWe0bZs7KLkEXgYsfHjQEIPE8YL1yScD1T7MriDMFFouTvMeFpKkov+d+jNbRPZbS7+iqWptbJsiS9Vgo5BmatDLUAxRGIsXaP0bdS/okn8LIK4SvNr+T7OptWixdDpsjq5g7JPIJgD0FM1y2QCyqTq7IlNB02O1dFmmO8apGGvY
Received: from localhost ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902edc200b001d91b617718sm1014472plk.98.2024.02.09.00.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 00:27:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 18:27:32 +1000
Message-Id: <CZ0EMJ56C8WS.1RRW73R6KWDEQ@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v3 2/8] arch-run: Clean up initrd cleanup
X-Mailer: aerc 0.15.2
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-3-npiggin@gmail.com>
 <9fb2f113-db36-41a6-a6f2-0499f28ace0a@redhat.com>
In-Reply-To: <9fb2f113-db36-41a6-a6f2-0499f28ace0a@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 9, 2024 at 5:32 PM AEST, Thomas Huth wrote:
> On 09/02/2024 08.01, Nicholas Piggin wrote:
> > Rather than put a big script into the trap handler, have it call
> > a function.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   scripts/arch-run.bash | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index 11d47a85..1e903e83 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -269,10 +269,21 @@ search_qemu_binary ()
> >   	export PATH=3D$save_path
> >   }
> >  =20
> > +initrd_cleanup ()
> > +{
> > +	rm -f $KVM_UNIT_TESTS_ENV
> > +	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
> > +		export KVM_UNIT_TESTS_ENV=3D"$KVM_UNIT_TESTS_ENV_OLD"
> > +	else
> > +		unset KVM_UNIT_TESTS_ENV
> > +		unset KVM_UNIT_TESTS_ENV_OLD
> > +	fi
> > +}
>
> Looking at the original code below, shouldn't this rather unset=20
> KVM_UNIT_TESTS_ENV_OLD after the "fi" statement?

Yes good catch.

Thanks,
Nick

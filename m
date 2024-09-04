Return-Path: <linuxppc-dev+bounces-994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2196C439
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 18:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzSpK1cNqz2y8G;
	Thu,  5 Sep 2024 02:37:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725467865;
	cv=none; b=Vc4nhaHFgf4sVDaJnGEVMuYFQ9J2uHzw97gaZVqY/KZB/AnHOTm5iflf+P1YlnHIaK9rqghw72WQY0A/lDHqw2h0NaMLOSu4CWSq2sgYo7QE4nRtH6yGq4kkVOj51LNIPbF3U7tKxEPGm23rjiLEet6PCf8Ax9B2FhP/qG8FWVW6H5tTg6mKRNlVSTisui9V5Qj2EuK0RQb7Fh/4mXXqKPx7CQkN3pmQ7OLmDYMHCxLaMvsBWiCi3XnCBSYPFgv7F6QzHXwyB+KuQkJXQehatMjDUotu/Fiw2EFztfOAS//2d754meqABA3FNoHA5KMKQ/eMts6RRvCM7XhNBY9XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725467865; c=relaxed/relaxed;
	bh=ytl0r9TAcD8O+89JumHN4lgJwo80RLVIXPusfUj9giI=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=DBPLBjJQEzojbie7aTOrtJ9A5tgeBRQok4eLHMbc+TQERqXqXOUinTIRicdBsuGWCzT1w41PIq5LxS05ZLTjQoaBPKv3/QdVuQzAeNUXRZudjbKVzVuuN3MP1uBeM/sDoKJ4kJHP+CdJ1JZhbQH2OcgwqAuprgBeOb7apguyOf1x7XZEF+1I2OPnV1VV88ZmpuhC4xtsHYG5CCBXPpFrBLM3M+4TCKs/rDaPTAT25nUkWgYCDi/Wg0pkPmg5zpz3zhBe9KwhONXi2Ro84jzT5rFpRrDCHDacsWPgmrlcTqbb8uLZe2TtRQpmLdXio+AxuPPoemEQGqRTwyYtkNhBng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=DGp4l2k9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=zifb=qc=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=DGp4l2k9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=zifb=qc=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzSpH3bjJz2xT8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 02:37:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A41565C563D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 16:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBE2C4CEC2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 16:37:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DGp4l2k9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725467859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ytl0r9TAcD8O+89JumHN4lgJwo80RLVIXPusfUj9giI=;
	b=DGp4l2k9B6siCZLTRhfUMPNvqx7RUP3YZ/VN7D80hrgSMRlSLNEob+oI5e0mhUGE/iedF8
	8gw60beZtSxBbGbmjWHFz2DT61CGfX2ysW1a1wTSga1HkDt2Ejif9Ok/PytgnRqmcSRPxq
	RixMdQibl7uqIkqUDdxSGeXDRrmfV0o=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b57a9a5e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 4 Sep 2024 16:37:38 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5dfa315ffbdso3989485eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 09:37:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfRlBfTzgD9VUt68RYHO8UU2q3kE/ZefvVY2pwnanvq2X9xNoUW283pNVH3nY3rgcueAV/9yqjeDwiHQ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxjLZv+FI5XqmiBXneNseX44m7RfSNgJ2Mqwrh83KLHSp9nRiiY
	mjPo+ImWb1BZTvNSO9f16EMRrx6N9SF8npuNJOL48hbGk4S1UzJqrigc6IFTdt7PEbQT+GFZ/Wt
	C9UYSYxD8tjO2BZ3rXPCTICUDTks=
X-Google-Smtp-Source: AGHT+IENXxGDivKi28BOw6DECCQW3as/v8z5ANaZ8b8VDAnQEdV7BaJeDtYlSJIrSgzEy1UJ/kozOSe9JEidGKhqYRM=
X-Received: by 2002:a05:6870:170c:b0:27b:5890:bd38 with SMTP id
 586e51a60fabf-27b5890c337mr2227565fac.7.1725467857891; Wed, 04 Sep 2024
 09:37:37 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <30e9575c-a53e-4e17-bbbd-7127798efb05@csgroup.eu>
In-Reply-To: <30e9575c-a53e-4e17-bbbd-7127798efb05@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Sep 2024 18:37:26 +0200
X-Gmail-Original-Message-ID: <CAHmME9riDsWbfQe898EAGPCU1k-pasnVV=fXu_JWKdB9AJru5Q@mail.gmail.com>
Message-ID: <CAHmME9riDsWbfQe898EAGPCU1k-pasnVV=fXu_JWKdB9AJru5Q@mail.gmail.com>
Subject: Re: Profiling of vdso_test_random
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Xi Ruoyao <xry111@xry111.site>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 1:41=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
> I'm done a 'perf record' on vdso_test_random reduced to vdso test only,
> and I get the following function usage profile.
>
> Do you see the same type of percentage on your platforms ?
>
> I would have expected most of the time to be spent in
> __arch_chacha20_blocks_nostack() but that's in fact not the case.
>
> # Samples: 61K of event 'task-clock:ppp'
> # Event count (approx.): 15463500000
> #
> # Overhead  Command          Shared Object        Symbol
>
> # ........  ...............  ...................
> ....................................
> #
>      57.74%  vdso_test_getra  [vdso]               [.] __c_kernel_getrand=
om

Can you run `perf top` to see which instructions are hot? There are
some smp barriers in there which might be significant.


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836373AA8B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 03:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G54XB14y4z3c0Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 11:41:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ryuq2VGO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=dhfd=ll=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ryuq2VGO; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G54Wf5T4Hz304R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 11:40:45 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4G54WT1mdcz9sXN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 11:40:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G54WT1GS3z9sW7; Thu, 17 Jun 2021 11:40:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ryuq2VGO; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G54WT0ZTJz9sW4;
 Thu, 17 Jun 2021 11:40:34 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso2901072pjp.2; 
 Wed, 16 Jun 2021 18:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XE0Uu0x7WxO/8W+LzqTJdpHuYjnFPOrGbCBFZ9cFpc0=;
 b=ryuq2VGOgbryrm2XSr8SH51X7nKQVI3hUozBMkuXwRpcjYr3i05owjj+o/nrnfUgZu
 eb1+qW7UCH3LpGQhP2ezauPMm/gLYZKQH7YTGKeg8COOpwVMHBnYbipHrpq/xzT2lh1k
 hXayaJvwZHApz7mg1bXyb6zOykwdYlZUcAXn+Y/gTtLmIAPCc34EljEySAL2s3qY6GOC
 LuuLTKiAoKaZafWWJ9y4z0ZGzgoilHb2AT+Ao0pE9UcGQwGubyMx3RVTe8hjRgbjArHj
 aTRJWEhK3opcw5ruouuAFv5axZbhY4aIxqR3LyznY0A11kb0TB0+80ehw6trJ7/e7o+z
 IoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XE0Uu0x7WxO/8W+LzqTJdpHuYjnFPOrGbCBFZ9cFpc0=;
 b=kYSoZXvH1gTZPnPgw2chSZFHXEUEERNX5hGhaXhQnEj6DzuXe0VDLu4aHG/mvWEnK+
 o+t97sMirSPxdDkPQRC9wsZC1hNl0mnGgijUSxEacnKCXW6b3+DmhnaYsKPJWuffFpnR
 QLmMv3cTOZOsfbWaG7kxMCnKRgVuvayFwybMTCmb2HQXV1uV3TuxBjEt349T6hBFwzNI
 oPJbaVMBbGJZk+67yBqOAkNYc8diCTE9Yu9ADTJO92NrxNscMag4pPkT3Wc0bP9p5Czf
 o0g0BZ3gb13U7bdFl3oPN3501ioS+ckr6I/PF6zZDqgUsd0xlLlz/uUZg3pwO3fba1cC
 mkdQ==
X-Gm-Message-State: AOAM53398QTts45v3Ez5z3YQEl7w64cN1fWkaeTEsuAB5vIrGKkR4t8N
 JCNnB7xBZWNysT5iyc5aFcm+qJLXY9U=
X-Google-Smtp-Source: ABdhPJx4Jgz5BHCfjqlkevc/Ue1J9N4wAyOL51k+Yr4K8cwPQddKPd8oEiz6MzEZ9BfJY/9OvUOfzg==
X-Received: by 2002:a17:90a:ce8b:: with SMTP id
 g11mr2003647pju.170.1623894029112; 
 Wed, 16 Jun 2021 18:40:29 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id i125sm3199259pfc.7.2021.06.16.18.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 18:40:28 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:40:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 11/11] powerpc/microwatt: Disable interrupts in boot
 wrapper main program
To: Paul Mackerras <paulus@ozlabs.org>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMfgt4ndMrtYwWYY@thinks.paulus.ozlabs.org>
 <20210616233739.GN5077@gate.crashing.org>
In-Reply-To: <20210616233739.GN5077@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1623893913.zpw6v9dt4c.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of June 17, 2021 9:37 am:
> On Tue, Jun 15, 2021 at 09:05:27AM +1000, Paul Mackerras wrote:
>> This ensures that we don't get a decrementer interrupt arriving before
>> we have set up a handler for it.
>=20
> Maybe add a comment saying this is setting MSR[EE]=3D0 for that?  Or do
> other bits here matter as well?

Hmm, it actually clears MSR[RI] as well.

__hard_irq_disable() is what we want here, unless the MSR[RI] clearing=20
is required as well, in which case there is __hard_EE_RI_disable().

Thanks,
Nick

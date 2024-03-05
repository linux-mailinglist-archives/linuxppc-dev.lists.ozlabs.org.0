Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699A8713A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:31:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C3rTgp5p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfhZ66fcz3dWx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:31:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C3rTgp5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpfgt2H77z30YR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:31:04 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc49b00bdbso46550905ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709605863; x=1710210663; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcBFJjHmVyjxJY256SmdudDut0j5ZrNSRHrci0UWjL8=;
        b=C3rTgp5pH8yJ3VziGJLRfVN2fYN9w4gLD1ZUIB7jVZ1lvSvWxxO3JB5y7/U/s28cM+
         ddmPJPDRXmfZobONOobleVmy5U6FFQAlG6rydpMT/mf+WZRFZxrxsFHSOkG/jxABC7cI
         76saUnosdx615wMdZOimvYd+XVCG2/PmVCsnmsE33dp1T/MVMBHpUZZwxSCurqrZmrOG
         H0DXITypiKNnpAm4rn82OIpuDjNjp5hEjkgUeESl0zh9/vdYMQ1siN70CJSAxvDoTBHB
         bTWqHlS2EUP1h9gS+cOmUYlYmcv58tlQNLWouILoYCZ9NTlcos+3akoAK9XNHMK6Cgfp
         pnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709605863; x=1710210663;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zcBFJjHmVyjxJY256SmdudDut0j5ZrNSRHrci0UWjL8=;
        b=KiJ4XSSl8QmckscWj2jQEWp+qzxQ6b9T+qttQA4ohM9z76j6yEfWEopbFTEa8ny/FO
         Ctcg7BmN2iVcOL5fN5TZ22mK9/3bdmCzsjFucGIJtYzWKR4UlUUvqU7Foh065XtZIimd
         xgnHvWhtvIao6Z0UwEj7amoLqmXyUfOlZ2xHKZwQ3xG+bbOVKe7Z/tsTyt+f9ZkLeNKo
         FcFYBEN+zmR4GFRfHdMk91R6TB+4eDu+3y80OKnt+/lPhPSwiKPec7A07+7zEqw9vPr3
         +b1r7qjWmbeQPf4EZDqa7oFgl667m6Q3EkfHfJMS1orOWevAYk8HYlBr/pyRhp0ohC29
         19YA==
X-Forwarded-Encrypted: i=1; AJvYcCUHT/qRexfnbs5YlvS079Tuk8GvAsjCZrdtIj6txYdBBoE0SpjCSrL83wxyxrSF8LmOpRcAUqyJBl81FltbuHLuTT/tsSExpRw9LASRMg==
X-Gm-Message-State: AOJu0YxKtnxR3R99CwNqvOa7/sRduXDrHCIY4SReXbtBAdaUY5DDyOrc
	dBDIAzE+08iuMcHXHjfgPZA7+TMuWGpZNTVycEnS0E07rOEe7swk
X-Google-Smtp-Source: AGHT+IFVGXsr5tOFvMPOLx67KzPiI5rdKFM47a+cY5+eENxJa8h38L3eQnfiU1tEHSjkg4RwT2UdMg==
X-Received: by 2002:a17:90b:4ece:b0:29b:34fc:e94c with SMTP id ta14-20020a17090b4ece00b0029b34fce94cmr4639082pjb.27.1709605862860;
        Mon, 04 Mar 2024 18:31:02 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id cz13-20020a17090ad44d00b0029ad44cc063sm10510067pjb.35.2024.03.04.18.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:30:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:30:47 +1000
Message-Id: <CZLGOZZBFIS3.1ZVPJ6AKUMP3A@wheely>
To: "Andrew Jones" <ajones@ventanamicro.com>, "Thomas Huth"
 <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <20240301-65a02dd1ea0bc25377fb248f@orel>
In-Reply-To: <20240301-65a02dd1ea0bc25377fb248f@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 1, 2024 at 11:45 PM AEST, Andrew Jones wrote:
> On Fri, Mar 01, 2024 at 01:41:22PM +0100, Thomas Huth wrote:
> > On 26/02/2024 11.12, Nicholas Piggin wrote:
> > > Add basic testing of various kinds of interrupts, machine check,
> > > page fault, illegal, decrementer, trace, syscall, etc.
> > >=20
> > > This has a known failure on QEMU TCG pseries machines where MSR[ME]
> > > can be incorrectly set to 0.
> >=20
> > Two questions out of curiosity:
> >=20
> > Any chance that this could be fixed easily in QEMU?
> >=20
> > Or is there a way to detect TCG from within the test? (for example, we =
have
> > a host_is_tcg() function for s390x so we can e.g. use report_xfail() fo=
r
> > tests that are known to fail on TCG there)
>
> If there's nothing better, then it should be possible to check the
> QEMU_ACCEL environment variable which will be there with the default
> environ.
>
> >=20
> > > @@ -0,0 +1,415 @@
> > > +/*
> > > + * Test interrupts
> > > + *
> > > + * Copyright 2024 Nicholas Piggin, IBM Corp.
> > > + *
> > > + * This work is licensed under the terms of the GNU LGPL, version 2.
> >=20
> > I know, we're using this line in a lot of source files ... but maybe we
> > should do better for new files at least: "LGPL, version 2" is a little =
bit
> > ambiguous: Does it mean the "Library GPL version 2.0" or the "Lesser GP=
L
> > version 2.1"? Maybe you could clarify by additionally providing a SPDX
> > identifier here, or by explicitly writing 2.0 or 2.1.
>
> Let's only add SPDX identifiers to new files.

+1

Speaking of which, a bunch of these just got inherited from the file
that was copied to begin with (I tried not to remove copyright
notices unless there was really nothing of the original remaining).
So for new code/files, is there any particular preference for the
license to use? I don't much mind between the *GPL*. Looks like almost
all the SPDX code use GPL 2.0 only, but that could be just from
coming from Linux. I might just go with that.

Thanks,
Nick

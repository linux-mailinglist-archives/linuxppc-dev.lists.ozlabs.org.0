Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDA6C2A47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 07:15:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PghDC0bZKz3chr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 17:15:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jcLtPjox;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jcLtPjox;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PghCF1HsNz3bm6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 17:14:32 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id kq3so2602868plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 23:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679379269;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Hv33fIuyzWrpPNOhwXyMnK2Osr5j5jrVm6wuMJwEGo=;
        b=jcLtPjox8yaJKvcik6ldfPraHUAFu0NRxgtNszsuTrcnUnhZU4oG+hKwiJdhpQfktE
         olxzuQb4UNZlDg5L4truU8y24PypOUAsdXbXCWkQMZc8uC+n0Iweh2f+/i0Jt4GCewBg
         85+Lo4FhBzRK0MYTex/PdwZIRDCF1llW4z7IE4JcJgCiBEz5uNPo45WlodfdGzvuSZVB
         gaQypJmfW0R5Xt9bq/UNYZVjFwtrgVlNiHpc2sCbq0lFZYEsA1224E0C8z/+1YFP5vV6
         qhVCT68sV1kOEUXqntJL2n+6lUfYI0e1pmcEUczRrXJGYbXXZMpWl7rqZM2WZ+Q7z69S
         MslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679379269;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Hv33fIuyzWrpPNOhwXyMnK2Osr5j5jrVm6wuMJwEGo=;
        b=PC4Oar4D7b2tNW9zjzqaGrYf6g/kmr2EMvgTTQvrGvqcxPA4177MYBLZp6jWPv3t23
         aF+Jyi03XjVqdlYyZmKi1Uc+vY4DMexUeL0fYFQRhCp+Q5BmqIbYlNkak2f0H4xOwX5x
         wfuYWfM2IxkSl40g/ivejbeU8d9BpiFH+7r8SywvlY/xWCXR9n+YjeGLsS6ji1yUTIdd
         vZbc9v/flSGDL+isXXjRxHPB62pQnGw5+2A8y9tv42Hjgqp6Fcg6bSTzWHHNJDEfs0SA
         N+Z4+8FnTme3g0pSW7K0jjP9vDO77xbE6IdrXSDkavonn7OINxyfd7eu1IMU1C1/708l
         iUKQ==
X-Gm-Message-State: AO0yUKUtdLeXK/IA0MPJgA0/XUiyPuww8QvKOPV71MEwWrPI4KZEJuWo
	TvUPa0q5ED6rdlAn0qGurs0=
X-Google-Smtp-Source: AK7set+IGQr/Gyi3tCMdxzG5V3SGiniaHiXhH64UIDad+ZC4DjuZeAWIh0gUu6vatmMI8uZM6qeB0w==
X-Received: by 2002:a17:903:246:b0:19c:be0c:738 with SMTP id j6-20020a170903024600b0019cbe0c0738mr1265226plh.59.1679379269274;
        Mon, 20 Mar 2023 23:14:29 -0700 (PDT)
Received: from localhost (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id u19-20020a170902a61300b001a1dc2be791sm1746933plq.259.2023.03.20.23.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:14:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Mar 2023 16:14:24 +1000
Message-Id: <CRBU9JHY52KF.1RQWXLU6SPDIR@bobo>
Subject: Re: [kvm-unit-tests v2 00/10] powerpc: updates, P10, PNV support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230320070339.915172-1-npiggin@gmail.com>
In-Reply-To: <20230320070339.915172-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 20, 2023 at 5:03 PM AEST, Nicholas Piggin wrote:
> Since v1 series, I fixed the sleep API and implementation in patch 2
> as noted by Thomas. Added usleep and msleep variants to match [um]delay
> we already have.
>
> Also some minor tidy ups and fixes mainly with reporting format in the
> sprs test rework.
>
> And added PowerNV support to the harness with the 3 new patches at the
> end because it didn't turn out to be too hard. We could parse the dt to
> get a console UART directly for a really minimal firmware, but it is
> better for us to have a test harness like this that can also be used for
> skiboot testing.

I'll send out one more series, I have a couple of fixes for PowerNV code
(I didn't make the OPAL call to set interrupts little endian for LE
builds, for one). I'll wait for a week or so for more feedback though.

Thanks,
Nick

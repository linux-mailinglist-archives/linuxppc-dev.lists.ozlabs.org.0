Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBCF64D4D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 01:53:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXYdD6TQFz3bgy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 11:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I9U7Sow8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I9U7Sow8;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXYcG22lNz3bYD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 11:52:45 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id 21so5680709pfw.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 16:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwOgfPFskdSQjMHfwEy91wa0YjrY8dBYMuUZYG0hYc4=;
        b=I9U7Sow8RRk6gGSFiVGpmTOUE2YhQnIXZV8ImF8D0lDqUaOmQu0a+m2HD59JhSUrUs
         i6QPFMa8Jfcn9JBzY1qj4I07C6+nvSOk9GkQ2YOK2rrScGP2ZYJYp0oNPIast8ZKhXq3
         YSHPz2J0lngO2NtfLWo7arXFTRgtQcYa+uVgba+VzzxS0kONVL9KNQ9E5k6J2ITvAPCf
         MW8MZCIN7AcORZbvKcgdhOsmFovnSLPQech0HLV5oberOO19CiJyaQQCZ/JmSSpvUUep
         mpy2Zo0LHOkrd1QgO+IgBo/ffshOzYUj5TGJuxhiWiwiMbcYR1g5fHnnGZYfrUrjkJQz
         zSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NwOgfPFskdSQjMHfwEy91wa0YjrY8dBYMuUZYG0hYc4=;
        b=Wi7gM1sos/L0ATGiVS9mcjexMJ+gZsKezuwGpX5reRHR0+UCUzxZnntPt5MTnvcpCt
         s63HZp7Zc4Oh2t5FXGWBcbTocJyBV49++gi7cauDebC0M5XcMvbgH4nVlNMnmmxcJiAe
         vzp7JdCR0PMo7QofXmc9tTt1H8aRfE4/RpJkTIvANw+wf1tYHVWJHkwutQTCBDE8IiBJ
         BsErSGjhCBxK8e0lrM6WX52h0EOkaTEfBw+E0FvZVi4qktTnhxGNk8hrnD+9fxzW6uw4
         SbFigG0UE6PeughvZdDhRrPSX9NsrJjMHU5XSL4K4zrpJzJqBUSksvFeF04KH6oad9Id
         w9uA==
X-Gm-Message-State: ANoB5plEJZRn1rIt84VnZpegtEV5imRpzCSpL4diqKChm5m7rXM5uB9C
	paNqnbFDzQoeCQeLLM3plqU=
X-Google-Smtp-Source: AA0mqf560kYEQGWEhBwMjR++JoEA1Md98dKiD0Yv3xNHvuLBhAm+nF6DtT06PlPw2lhrkVcAUMUGlw==
X-Received: by 2002:a62:f251:0:b0:577:ad:49c5 with SMTP id y17-20020a62f251000000b0057700ad49c5mr23206951pfl.9.1671065560913;
        Wed, 14 Dec 2022 16:52:40 -0800 (PST)
Received: from localhost (14-200-18-82.tpgi.com.au. [14.200.18.82])
        by smtp.gmail.com with ESMTPSA id e66-20020a621e45000000b0057564323987sm423787pfe.139.2022.12.14.16.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 16:52:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Dec 2022 10:52:35 +1000
Message-Id: <CP1ZAUES4MNI.1TT3NQ1N4VG7Q@bobo>
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.13.0
References: <20221214044252.1910657-1-nicholas@linux.ibm.com>
 <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
 <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
 <20221215001725.GS25951@gate.crashing.org>
In-Reply-To: <20221215001725.GS25951@gate.crashing.org>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Dec 15, 2022 at 10:17 AM AEST, Segher Boessenkool wrote:
> On Wed, Dec 14, 2022 at 09:39:25PM +1000, Nicholas Piggin wrote:
> > What about just copying x86's implementation including using
> > __builtin_frame_address(1/2)? Are those builtins reliable for all
> > our targets and compiler versions?
>
> __builtin_frame_address(n) with n > 0 is specifically not supported, not
> on any architecture; it does not work in all situations on *any* arch,
> and not in *any* situation on some archs.

No, but the particular case of powerpc where we have frame pointers and
calling from a function where we know we have at least n + 1 frames on
the stack, it would be okay, right? The code is not really different
than using r1 directly and dereferencing that.

Thanks,
Nick

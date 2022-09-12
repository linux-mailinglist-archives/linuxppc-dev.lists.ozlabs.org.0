Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC335B59AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR4j163Xmz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qgpbmrYA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qgpbmrYA;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR4hN2NJKz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:52:04 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id fv3so7815496pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=o1pXZdS6UYUSgoyev59q3U9bI5vQiQ2icGdAzhK9Bno=;
        b=qgpbmrYAT6os10gI7K62w/LHAhNPBu2y3ogydEWMn6RLhbX6+SLVuETpZHcVZ5qhZq
         SlAxzY6MYX8pwxPzfXVHgQ5FThVC6I8yCQT3h5CWJDYFWLzZimGH+ppaTvb12HqiAHY6
         ZPsxONG5O3rhyx7cwHcH0H9PJN15a/B/T2j0YKXAWnbnUr+/SXH59yyiSCOaXQMUDihi
         pA6BMjQgjscjzb5cuQMn2hZxJn6j2NPo3Qv4tlN3Ha1aii3JdJZH7SMoyjIIyNLu7Ghy
         1f7rCxydEgVZAHWaNoylLIMxeuL1GXHO65+5K5KyFee8E7lAxyhC3fTv3t9F10EQ0w08
         BNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=o1pXZdS6UYUSgoyev59q3U9bI5vQiQ2icGdAzhK9Bno=;
        b=DtU0n01x4flXZJF/2TwgJbxLLYEwV2JjdME/aQ45kHsapWycEpyA0iUAmuHIseNAS4
         hJVYzy12itknmayIFYs19tvE15n8azwy3sIFnQK61M1WpKqjzjFqqGRaSiNRj5wRc8AC
         0J14AEn6gQy++Du6GRw1E8tgmUY1KJ9SghepECVpdS6UMPT7TVPokROdX9riNrVpRtsa
         QtQsEziikktJVqexfz1KXTlL0ekejg8VIdtPcLy/kYgAlw0xreZN6OPBaZZ/xMf77135
         4ecwz6AAduUiUen6SQ5FCPOt8kTeH+CVOuio6AbDUEWI/e2OhwljkKJR3Eup5tu3Dicu
         2HXg==
X-Gm-Message-State: ACgBeo1oeMlLSvkHs44nTS7aRUNVo8Ka3qJ4lhFAMVCFyqZrvNdHZfpn
	YRiGWZcFLuaR7WXHO31RAFCb3SluYBE=
X-Google-Smtp-Source: AA6agR62bCivs1iexGPnw+8E3hIaq9Lb4CwJ9nGw4MlDCIX18M3uET78fuLXSQklGOOaHRAWpUVnTA==
X-Received: by 2002:a17:90b:4ad1:b0:202:5f15:39fa with SMTP id mh17-20020a17090b4ad100b002025f1539famr22831354pjb.19.1662983521242;
        Mon, 12 Sep 2022 04:52:01 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902c40500b00172dc6e1916sm5821017plk.220.2022.09.12.04.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:52:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 21:51:57 +1000
Message-Id: <CMUEGH54LATI.1D41E2W7W5M3I@bobo>
Subject: Re: [PATCH v4 18/20] powerpc/64s: Fix comment on interrupt handler
 prologue
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-19-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-19-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> Interrupt handlers on 64s systems will often need to save register state
> from the interrupted process to make space for loading special purpose
> registers or for internal state.
>
> Fix a comment documenting a common code path macro in the beginning of
> interrupt handlers where r10 is saved to the PACA to afford space for
> the value of the CFAR. Comment is currently written as if r10-r12 are
> saved to PACA, but in fact only r10 is saved, with r11-r12 saved much
> later. The distance in code between these saves has grown over the many
> revisions of this macro. Fix this by signalling with a comment where
> r11-r12 are saved to the PACA.

Wondering if this kind of comment is useful at all really... But it is
better than broken comment.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Given its own commit
> V2 -> V3: Annotate r11-r12 save locations with comment.
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 3d0dc133a9ae..a3b51441b039 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -281,7 +281,7 @@ BEGIN_FTR_SECTION
>  	mfspr	r9,SPRN_PPR
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	HMT_MEDIUM
> -	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
> +	std	r10,IAREA+EX_R10(r13)		/* save r10 */
>  	.if ICFAR
>  BEGIN_FTR_SECTION
>  	mfspr	r10,SPRN_CFAR
> @@ -321,7 +321,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	mfctr	r10
>  	std	r10,IAREA+EX_CTR(r13)
>  	mfcr	r9
> -	std	r11,IAREA+EX_R11(r13)
> +	std	r11,IAREA+EX_R11(r13)		/* save r11 - r12 */
>  	std	r12,IAREA+EX_R12(r13)
> =20
>  	/*
> --=20
> 2.34.1


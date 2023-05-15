Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533B7023A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKT6X6L8Sz3fDl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W7rYEf2p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W7rYEf2p;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKT543YTGz3f6Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:51:20 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-24de3a8bfcfso11481648a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684129878; x=1686721878;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DrvG7Flkrg+jx4DVQ8IBYrFJwImFSzvF1tPDDqihaw=;
        b=W7rYEf2pVNgapo9muo7vW04O8U7x0iRKD/5O0uJkt8PgzhKO+FcFn6f0FhE1tRMLJ4
         HsQvoP57ugGzO2w0nOAd/y0Q8NQt3j/emnFIad858H9wfe6/SmaOkar/YyVGhPOCtGwl
         PucfcFNSCkpIXXRJTADkfcV7yX6/O3Rd9dcCnKT7UcxkRu/L/2Z1a7iqjL2WZzpQoeUf
         vUzhsQ9grUUfTNjGT4+kt28hoRek8jfGBS6KQ73L0vzwqwgkJM7WrBCRWkcXxYtnco7E
         i0cYOeCvN90diu+1H5Ni955XrfJyPvIc6Z77zdKTh42ILGREVPhC8lFAUPzf4keWdVvM
         HZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129878; x=1686721878;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2DrvG7Flkrg+jx4DVQ8IBYrFJwImFSzvF1tPDDqihaw=;
        b=NJbj8ebV0ooVoK2oxDhYAYUf9t5E8KuFSxB+edEe2Y6nRvXascPfS7aD8FkrYdXD0n
         4RCDMOjz+30bfT+zPkPnvZXa3sR/PD/9FzizcpxmloUcEVzQKaYud04sX8VwrU4yWkZF
         AAlD0o5Fo2ypnfd3fuf85ExXULFmrz/raN1bev7VktYi1R3MjXxC/Wx/rRkKkzHYDtZB
         fmKtN5qMv46E9xrgeMQSodIqAnDI8KefAB5kawccygESDFHE7USScj0DXs3+IqwQgOfs
         cA9M+Fe3SuG9/ymiNjHiVC32Bmd/UjLk11jnY2oayVo2yYpa+kbR9UAvw3Z1fIdpWHtc
         d2Ow==
X-Gm-Message-State: AC+VfDwASe28jHTNsmyguXQ82JhpOm0p5CM+gBryCpNT+uP4NipIL/X7
	yUO3J418wGOhliYdljPIlyU=
X-Google-Smtp-Source: ACHHUZ7OI9pbcS9M9rIN1K/U2cSodGGznHyCCidhRVwnUzDi+0xeq91ZcvaSUFN4ZZ8v75JHgKB1iQ==
X-Received: by 2002:a17:90a:e38f:b0:23a:5f51:6ee5 with SMTP id b15-20020a17090ae38f00b0023a5f516ee5mr34577262pjz.12.1684129878100;
        Sun, 14 May 2023 22:51:18 -0700 (PDT)
Received: from localhost ([1.146.119.84])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090a7c0500b0024e4f169931sm20651203pjf.2.2023.05.14.22.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:51:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 15:51:11 +1000
Message-Id: <CSMM7Q709LEP.1GCQ2TQHPIZ7@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 07/11] powerpc: Annotate accesses to ipi message
 flags
X-Mailer: aerc 0.14.0
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-8-rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-8-rmclure@linux.ibm.com>
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
Cc: gautam@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
> IPI message flags are observed and consequently consumed in the
> smp_ipi_demux_relaxed function, which handles these message sources
> until it observes none more arriving. Mark the checked loop guard with
> READ_ONCE, to signal to KCSAN that the read is known to be volatile, and
> that non-determinism is expected. Mark write for message source in
> smp_muxed_ipi_set_message().
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F42220290
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 04:58:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B62C34fvZzDqdP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 12:58:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JNnaIhVC; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B625g3lWjzDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 12:53:59 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id i4so652230iov.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtFp8U1b6BENSgSZDGY3gDXQq0rheXhSd0EOSiGFWLg=;
 b=JNnaIhVCX8VLZK2m3RK/vp9B/cEEGk18cxihQxh4k0yXk4a5FWxyqJ/VCUgQR/vdxv
 Kfm/5YWihmxDwBj7ERBb4vijxKYIao2ynnxy2AtRtIWruwSSbrPSVNrJgawU1ED9JQml
 0qSrzhQOWZ+6JZ6WUMsFyhLo8f9ZI8ZOkqAXeS6v4dZEtqDVVasuiF1YPCY+qnA+dgIL
 hghLPYw1JO/Td/8ZqDacTxYXGyA70pWJUSPZ774K/HjJUo46MOzFPkd0CRMSxWENLGFu
 lCxkKcT0joYrLW6R1K43kRwakpboggMwFtmg685RiDHEqgJnvMO+nbO1DxxD3cdNWVf3
 mUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtFp8U1b6BENSgSZDGY3gDXQq0rheXhSd0EOSiGFWLg=;
 b=GqZuKb2j7kfYljP7QNH1GRvvPsFgv+s+OtPfXUj9lC3WYjAaJb5MgQEt3DVbs0WMDy
 AflJkvMYkMWF0h9xMMO8t16C5iAPaYqsjZloqcgg8DjWRByQmZKnnu2uRvAVCdmk/bNo
 9jBt8I6R28QCi63vDFvTJPDij+iEKS0ZgjmweIKcGAGWDNVAI6agAZd9fs+tOOdTR6XV
 U0/tNxLnm+jmd5CcpsSLUA8Bi3gU7Dm1OauZ0jl1N0jVEMWoW+pG0xyeXom7jcz+CHOv
 kvbf0CJDmevmgqOFiS1hnuzkR+gYXNyK2WfvUw9INQl7yV/H3D/XEKO1L8+X0AwTFbYr
 RTbg==
X-Gm-Message-State: AOAM533OZat63+LIj8qZ0SzwzmFM8m++4ulcNhnA4yyniYHjiuxyUlYy
 gL/uCiuqQ067qhaPxCh1M0Zmx++7tZHx/aVqkCy1zcTL
X-Google-Smtp-Source: ABdhPJz7xBzwR8YE6iLTdClmpOTXjWCHJzFFFbJ1XU39bIYHPFokE9G6qq1pmHNyDgfc6+RJln2EYVdr4jiYeRzTer4=
X-Received: by 2002:a05:6638:250f:: with SMTP id
 v15mr9280844jat.97.1594781634836; 
 Tue, 14 Jul 2020 19:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-11-oohall@gmail.com>
 <dd85f256-0f52-f2f5-f729-2d5b7269f895@ozlabs.ru>
In-Reply-To: <dd85f256-0f52-f2f5-f729-2d5b7269f895@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 12:53:43 +1000
Message-ID: <CAOSf1CGkQBL5caG7tgCUzC7OP55qVk86_XbAx9L43+hy7YNXSw@mail.gmail.com>
Subject: Re: [PATCH 10/15] powerpc/powernv/pci: Refactor pnv_ioda_alloc_pe()
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 12:29 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 10/07/2020 15:23, Oliver O'Halloran wrote:
> > Rework the PE allocation logic to allow allocating blocks of PEs rather
> > than individually. We'll use this to allocate contigious blocks of PEs for
> > the SR-IOVs.
>
> The patch does not do just this, it also adds missing mutexes (which is
> good) but still misses them in pnv_pci_sriov_disable() and
> pnv_pci_ioda_pe_dump().

The current implementation doesn't need the mutex because alloc,
reserve and free all use atomic bit ops. The mutex has been there
forever with nothing actually using it, but with the change we need to
prevent modifications to the bitmap while alloc() is scanning it. I
probably should have mentioned that in the commit message.

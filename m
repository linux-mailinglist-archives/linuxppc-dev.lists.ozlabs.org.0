Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D65555240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 19:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSqsJ0Trhz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 03:20:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Dsp3eLP6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Dsp3eLP6;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSqrd5ggHz3bq7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 03:19:59 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id n185so9611390wmn.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g7rgKaNRu6VI+rL2tcZJVezyj5b7Lszc6RDU2QcG3NQ=;
        b=Dsp3eLP695OxhLmAxgCpTladrks0d9cl3c4pqEG8IsiuYRxlbmyT9zMcfK+VdJOEhP
         vqcEAnywIUG3D4hOvDO4vgW7mTKDWa4FOUacvv0rZZ1u/SO4iaTUMJT1YLVZARqV4UnP
         VVaOZc6pGpqsRfWobvfoyII6hejsz2rE4brC494B2LoC31jIRjDfn1jZaLdHctRIJGTs
         eYVx6Mr13FW6Ezg18RcNdgljwra6zUmgwIfkDvEWL26pByjsiHrTuzgpz4XG6qL9VH6q
         2R9XZ6ufukStzJFEMcZ2MrXmX7/nzP3kY80P4OPxqAvqF9i9lBRjwSybCsaRqRMoajR9
         c2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g7rgKaNRu6VI+rL2tcZJVezyj5b7Lszc6RDU2QcG3NQ=;
        b=JgHuD4/JQZMtm5/vhsxsAWzAeI+wJfhz60Dzyme8SI6hh2wfAjOloStg007Mws4rKG
         9NYKpzlylq5DbteQ8XQPA2A8yz5qydwiAlgmEuDzoyd/9kO8lmgNXIaPxnAwa8NAjuXT
         n2h5B2GxHDaONnInr1b5KUWNNQ6hELgrjdujq6wXJxMPCKAxQF8OKiFR/uWmPDvLiAoE
         PqI7MbtB+bSpnGg4U9gnxl8pioKQMUppwTPe7Yc4U3+6j4abVQ492WcVA/aaqOwRJ1xA
         WHJVnNfUhnDDrz6f84WD7G59dNYBS7yu/7S8S5KRNSsxydWZP7SKo6z8wFlD2yx2YPxK
         6HaQ==
X-Gm-Message-State: AOAM533jOpT4JccWpfpyr6DfEeFndOm1C97DZA+TUzdfrYBS9VEhlXbt
	sZQx1mb8q/fzPlcW1IH65yDKPA==
X-Google-Smtp-Source: ABdhPJzonljILXzP/YeUVGmI5wxNQjklVcp+NVX87qobxoQHEtny1OoVzedlkPsbhH9Zvj4Jv4dkKA==
X-Received: by 2002:a05:600c:3229:b0:39c:65b2:8935 with SMTP id r41-20020a05600c322900b0039c65b28935mr48023528wmp.155.1655918390841;
        Wed, 22 Jun 2022 10:19:50 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id j18-20020a05600c42d200b003a02b9c47e4sm26041wme.27.2022.06.22.10.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 10:19:49 -0700 (PDT)
Date: Wed, 22 Jun 2022 18:19:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH v5 00/33] objtool: add base support for arm64
Message-ID: <20220622171946.mc3cd375fy4fou3b@maple.lan>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
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
Cc: linux-arch@vger.kernel.org, mark.rutland@arm.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, will@kernel.org, linux-kbuild@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, madvenka@linux.microsoft.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 22, 2022 at 11:48:47PM +0800, Chen Zhongjin wrote:
> This series enables objtool to start doing stack validation and orc
> generation on arm64 kernel builds.
> 
> Based on Julien's previous work(1)(2), Now I have finished most of work
> for objtool enable on arm64. This series includes objtool part [1-13]
> and arm64 support part [14-33], the second part is to make objtool run
> correctly with no warning on arm64 so if necessary it can be taken apart
> as two series.
> 
> ORC generation feature is implemented but not used because we don't have
> an unwinder_orc on arm64, now it only be used to check whether objtool
> has correct validation.
> 
> This series depends on (https://lkml.org/lkml/2022/6/22/463)
> I moved some changes which work for all architectures to that series
> because this one becomes too big now.
> And it is rebased to tip/objtool/core branch.

What is the sha1 of the base?

With b4 and git am the patch series is derailing at patch 6 and I'm even
after a bit of fixup (had to use rediff) I'm still getting a cascade of
errors in later patches to decode.c .


Daniel.

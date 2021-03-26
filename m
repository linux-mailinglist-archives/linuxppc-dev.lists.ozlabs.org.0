Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9434A12C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:54:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6B4943D6z3c0b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:54:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=CaEdMjdP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=CaEdMjdP; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6B3l4xLjz303X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 16:53:37 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id l76so3876828pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Y5ZjdJD9lzvGZs8O1aH02ljto+6/HMHLz2PN6E96Pug=;
 b=CaEdMjdPFsNQtsnqEoUfORzxLDuQRxtrsYrOLPFikD4kq50sV2x5oio9MhZoEoc5iG
 E0DqeYaqmycRLMslOfJS+tMMcH2XwClWM3P2iEKzn0sBU8i/KIHI35ZFLUYdbyvWPMww
 JI4jBgbJDInR8yZiOsMCKKkSIda15ScyLLBiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Y5ZjdJD9lzvGZs8O1aH02ljto+6/HMHLz2PN6E96Pug=;
 b=hRFTm0ps+Pu0MQIq5w1uWy756/1rObslpnVpYn0l6lt5vYvkAjV4X3jH2p6lnz00jb
 iP1MtJwuUtHZiSqyuXfEmiyS2SXb79R2Jrmu+HeDDSudov722dwf/AUFqoM4SRom7XgO
 Cj2zBZYmRxg6QLRJexxAti06R1tg9ZBx09zJymyfa935bWIk/UFjd271ATn1cvsXnxVA
 NRYNpvEdh18e5X14hqgYymgtAbnDDE4fkzhK6TwFwIw3U8lc6STLfm6bZlVSBgDkFAch
 yryvCavXpQNbxYopZTyYw8MkG3P24lXwavBAQmzKM9992I56Z7G42+ycjvlQsbNAlMhf
 oxag==
X-Gm-Message-State: AOAM533yRKQv5fyWftGFext1iqC5t8dYg+I32HTGk8t0t7J6si78nKWR
 JnXlWqbucwavNa9jKZ4o0UMJaytYmtvp4g==
X-Google-Smtp-Source: ABdhPJz9qBbGit+YZ97K9knhsbT2xS6mWEQY3kaqtF45tSGVY1j7Ee7CXeJ/NbWNykkL5JLWWMziow==
X-Received: by 2002:a05:6a00:72b:b029:218:6603:a6a9 with SMTP id
 11-20020a056a00072bb02902186603a6a9mr11018722pfm.78.1616738013763; 
 Thu, 25 Mar 2021 22:53:33 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id l190sm7708477pfl.73.2021.03.25.22.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 22:53:33 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/iommu/debug: Remove redundant NULL check
In-Reply-To: <1616406217-94635-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1616406217-94635-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Date: Fri, 26 Mar 2021 16:53:30 +1100
Message-ID: <87r1k2795x.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jiapeng Chong, <jiapeng.chong@linux.alibaba.com> writes:

> Fix the following coccicheck warnings:
>
> ./fs/io_uring.c:5989:4-9: WARNING: NULL check before some freeing
> functions is not needed.

This looks correct to me, and matches the description of debugfs_remove
in Documentation/filesystems/debugfs.rst.

If you have a number of similar fixes it might be helpful to do them in
a single bigger patch, but I'm not sure if coccicheck reports much else
as I don't have coccinelle installed at the moment.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FA41A300
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 00:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJHSZ1vCtz2ymr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 08:32:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=OGr73FRv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20210112.gappssmtp.com
 header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=OGr73FRv; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJHRs5WLRz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 08:31:35 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id y197so24763404iof.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 15:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sX6r+VtFysjF4oYWhq8xiiNNA4lX1D1DfLKUJZfhu90=;
 b=OGr73FRvt46870zXruqJzO3SP1Ff106DAwHYXUFkbZMroSt9xlbgYfx7Ha7zEr+0eQ
 fFB+gzMSVZ08KIy7nyZNnCarwiShb9palyfj0dXtHLBmtY9QZen0dwLXBl4Rvl7CxcNn
 SP7cAuUENfc4oxY/hNo+0A66ksQ9JUCs/MnzyXpskmihN/bESuVMBxAXmMC+yskn4ewF
 cvNKll/Bip9zfqynoppKB6jf4oU5D9Xmqy9wGOf+8D4/xEcZSZdSXUHc0DgUlJw88XJd
 dW6kqum5J6035JIytkWK80yNFYf+nDLSA6v4LNgfQDtCvMy5K9RF5zPvdixHvFODqSpb
 uFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sX6r+VtFysjF4oYWhq8xiiNNA4lX1D1DfLKUJZfhu90=;
 b=GDgx+nJFGFGpewdd1jknj6czF/SZJ0Xj1OBrMjG9jc37/asob7bLlt+jb2MjY+tZn2
 JSpJyeHCeWwXv3i9yY6iawzpcoN3m0TejR+1Maj1NYSrrl2Q5Ka1aHCMIDfLn0cWfuet
 370oJwGKSOaUCpESrVVNwNbZ/Fni/++8VFMoMRvZ6mVjDgvuTdAjKpJbnEgaN2Cr9mAm
 srzo08JjjhpF/nni9g/VbcQ2YigLbIwlLF3Tzd4EepPPfVtwbQfvWY+V7WNX/MGGlCBQ
 NzPDvZJym0dPG27OS8zmg2a/y3npzRAyqLGHXRxzsvCwmrhpwe4eVgBg3+A61EgmBZ+2
 /n/g==
X-Gm-Message-State: AOAM533IYyvVTdUl5ddiXlO6t88b3MTqVMsdw/nu4UnMp7uaaDaN6yqO
 /hlWsd+ydEgeoul43o1/vCOGvA==
X-Google-Smtp-Source: ABdhPJzP/D0Hpjy1B2sLyeFE8yokRGllLNT0YFxbbt65jzTeEocCKfwSycbAz2t49gx5XfwHzWMFZw==
X-Received: by 2002:a05:6638:dcc:: with SMTP id
 m12mr1876527jaj.68.1632781891278; 
 Mon, 27 Sep 2021 15:31:31 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id t16sm9791519ilm.68.2021.09.27.15.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 15:31:30 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] block: fourth batch of add_disk() error handling
 conversions
To: Luis Chamberlain <mcgrof@kernel.org>, bhelgaas@google.com,
 liushixin2@huawei.com, thunder.leizhen@huawei.com, lee.jones@linaro.org,
 geoff@infradead.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
References: <20210927220157.1069658-1-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <529d5e4a-82a4-2498-f63d-34c177ca4ab4@kernel.dk>
Date: Mon, 27 Sep 2021 16:31:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927220157.1069658-1-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/27/21 4:01 PM, Luis Chamberlain wrote:
> This is the fourth batch of add_disk() error handling driver
> conversions. This set along with the entire 7 set of driver conversions
> can be found on my 20210927-for-axboe-add-disk-error-handling branch
> [0].

Applied 1-2, 6, 8-9, thanks.

-- 
Jens Axboe


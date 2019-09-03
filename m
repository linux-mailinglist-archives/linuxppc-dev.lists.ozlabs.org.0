Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3109A6A80
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:55:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N7kP3bqSzDqlj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 23:55:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="nN8cX37p"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N7g05PBWzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 23:52:11 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id x5so1879095qkh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 06:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/R8RJDNpye5FLl3og5Wq9/dqGw44U2FIoixhMRWi4I=;
 b=nN8cX37pAWvMObPKDBbnrAc31TKMJQLvM5YlcbnM3/IYofmSnqlXNC8Q2sRLfdNCeh
 68CHAMLOA5FFN8NdCJGMYCo+qVTpZ75yB7dEIZxn6wmAJnXvHLRTSm+3JLHLDgUNw+Mc
 BcZQ/FO+Y+gbwOV+Jw3VCVThKOrmoRLzMf3NyqklNLg+YSKXJr26f9vZz6AmaTEhD0+A
 Pw0QVWE14ML0YqUGW6D69HBwnYcWs11NOAbFVf8g5855Cmr2bfUMqCg7GQTLm7M9D+TR
 An0sHtB4kNQ0sN82f8mELTW3M3CY9HPPxa6Agc4N+1NRHIO0v8zlCKhYt+LuSCvsvB2m
 bFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/R8RJDNpye5FLl3og5Wq9/dqGw44U2FIoixhMRWi4I=;
 b=L1Za320NwWBWdtlz5IPPFo2Bniz50ZsXnVBcU2ApeN/cGavxFHP4l8/lbyhm2eueN4
 FDaaevcA0gI60y4hoNp2KWKuRsn7DG1d1gaLVDTUTBLD4bncn852WgHjiYM/FCgWmevm
 ii18POQGMMtIy0DhjU3iz77CsjMiUG5Jnr38/Djv82jicDrB1m17H1mYRf+a8DPSDDef
 2nh6yFoJqFQvmXluLFl+X1VQ+Xvy5h26I0DGEVGRZf6G3Zc5KavarEV+6fZuW28YoqJH
 EpJve503AwmkQCY7fnaZktBJQIMQcsfG6c2sS0lh6eA40Tdgns/XBhUajzu6IuKnYcU9
 HFDw==
X-Gm-Message-State: APjAAAVKpoy7BYVJf39g34V0FMzq17upg9lQfSNwfQttTmvjbOXGJ71X
 LbsRyUsDY39b/rxWYA4cKuUSaA==
X-Google-Smtp-Source: APXvYqy/OawhyqFF4oGRKBlI5kQb3e9GCFV//8yxa4FqQRP0SymEHCLOcrJMoVQsyrAZgPZHdlrLQw==
X-Received: by 2002:a37:480d:: with SMTP id v13mr33166288qka.295.1567518727565; 
 Tue, 03 Sep 2019 06:52:07 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id 31sm1314959qtn.52.2019.09.03.06.52.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 06:52:07 -0700 (PDT)
Message-ID: <1567518725.5576.48.camel@lca.pw>
Subject: Re: [PATCH] powerpc/powernv: fix a W=1 compilation warning
From: Qian Cai <cai@lca.pw>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 03 Sep 2019 09:52:05 -0400
In-Reply-To: <20190903133051.GA23985@lst.de>
References: <1558541369-8263-1-git-send-email-cai@lca.pw>
 <1567517354.5576.45.camel@lca.pw> <20190903133051.GA23985@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-03 at 15:30 +0200, Christoph Hellwig wrote:
> On Tue, Sep 03, 2019 at 09:29:14AM -0400, Qian Cai wrote:
> > I saw Christ start to remove npu-dma.c code [1]
> > 
> > [1] https://lore.kernel.org/linuxppc-dev/20190625145239.2759-4-hch@lst.de/
> > 
> > Should pnv_npu_dma_set_32() be removed too?
> > 
> > It was only called by pnv_npu_try_dma_set_bypass() but the later is not used
> > anywhere in the kernel tree. If that is a case, I don't need to bother
> > fixing
> > the warning here.
> 
> Yes, pnv_npu_try_dma_set_bypass and pnv_npu_dma_set_32 should go away
> as well as they are unused.  Do you want to send a patch or should I
> prepare one?

I would be nice that you could prepare one since it probably could be a part for
your previous attempt.

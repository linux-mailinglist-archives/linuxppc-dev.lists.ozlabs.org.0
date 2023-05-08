Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1C6FBBAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 01:56:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFdTq3YRzz3fM3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 09:55:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kEDnz3HB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=htejun@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kEDnz3HB;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFdSx2gFTz3cB7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 09:55:11 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64115eef620so38418948b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683590108; x=1686182108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YJeCVahMakSFFIeHkE0L5vaAYWzeS9qst+vBo++bi0=;
        b=kEDnz3HBHpwlfpsmiIKoxFtmB7UopMLc791cfXEFTHVEM2V06tbocn3GNL9PXegqrk
         lKFozCWqhCfHqs/xKMhtjzLYfumrIc3/qd+YMM4NVaPJcRHtOdQKsEJEIkw/u/jtrWDC
         2STrSj0a/H15eizoL0flgSJ/9Zx3svNtzSLUH1CUTrQMAk1+WrpMZyNcr8k0VRDlqYgM
         8AttIRLuQoL6JY53l/9ov3tkkkElwtTYEfXPsI4WS15EOy1eMgTomMJ1P4JQWmraAX6A
         IvzobrnF623SUtXSxQP3POSdOrUHflP7Qx8yAU+ceID3Uus3BHv0WqvuYk+L1raU922w
         ivUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683590108; x=1686182108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YJeCVahMakSFFIeHkE0L5vaAYWzeS9qst+vBo++bi0=;
        b=Pu7Y7Vo3K6WTUDxCBX4hQzzq8V6yMGJQEmmIKz1ux9xVBdldtqIdfgikKcHNHM9Rxh
         a2uuM2YeVkkhha+PhuaVNxMS/84lYwiSCrixMCeHMGPCh9JkjG2svmx2Pha7xgymRvig
         NeqeZ0JuVldzuvCffUxfFnKprQsQ6fFugzxyfPi8g3DnVWSus2TPYmMSKLsyxBhFfIiu
         297EFnlikvytS20OxOJBKvTl6VP+1Zmh0knDQe+ySYj5r0ke0sDsm9wAZnzqueXfk3bE
         UC7pA0saSFMbCBoh0CEv9zi1rCF0tAw3oBLAwgbJNZ7uX+Opzdx8bqyOdwZ3aiV5aP96
         /AyA==
X-Gm-Message-State: AC+VfDxn1wnmk5jBz2aosqTZTRqtY38rJyK+pTz6ct/Is/bfxYIYKN0k
	JtIazFdfWjbIe4WdBOr0fbk=
X-Google-Smtp-Source: ACHHUZ6uUlRVwCl7xqtVWvmPEWKSEwObz7Bs5nIR2W97LJ6xWTMOpMeR2LdVumAU0g4rKOI9wdnWcA==
X-Received: by 2002:a17:90a:db07:b0:250:50c5:cabc with SMTP id g7-20020a17090adb0700b0025050c5cabcmr10017677pjv.3.1683590108029;
        Mon, 08 May 2023 16:55:08 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id lr8-20020a17090b4b8800b0024752ff8061sm18727035pjb.12.2023.05.08.16.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 16:55:07 -0700 (PDT)
Date: Mon, 8 May 2023 13:55:06 -1000
From: Tejun Heo <tj@kernel.org>
To: jiangshanlai@gmail.com
Subject: Re: [PATCH 01/22] powerpc, workqueue: Use alloc_ordered_workqueue()
 to create ordered workqueues
Message-ID: <ZFmL2r5z1ZSuGZQW@slm.duckdns.org>
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-2-tj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421025046.4008499-2-tj@kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Applied to wq/for-6.5-cleanup-ordered.

Thanks.

-- 
tejun

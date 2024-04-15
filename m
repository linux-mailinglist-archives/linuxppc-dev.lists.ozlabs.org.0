Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B48A598C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 20:04:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K3BIBsy9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJFRr1QJjz3vb8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 04:04:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K3BIBsy9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJFR212vnz3dTr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 04:03:40 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ed5109d924so2996725b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 11:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713204216; x=1713809016; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4sux801NSFwuuMhJbH9Cvh1/+fruiCubgx731NNdqY=;
        b=K3BIBsy9NRvKIDl6fbGYZrNdhn/iizWIfO1PNWl/eNNT3BeuMJFAlj9jRVuHdBrf7x
         H8bYpVVghFTDHgRocqXJ7Yn1pBzRfgwGIWdz3nTwfN2Hlj/ES2WrpZkjvkEz31t3TpHb
         ywY6IOfV16C9IJVGbbwK9wU8/UVBXLKQT22pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713204216; x=1713809016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4sux801NSFwuuMhJbH9Cvh1/+fruiCubgx731NNdqY=;
        b=P1ooBv5Hh42ngi8vnZG6d4853+4pKnvfYlyMnKcSpD64aovWOZRgLt2/zN4pJ4yhvy
         7x8rbR+hvG8LaSTsOSEa4sRZwX3mPO2hfdu4y7xowRW3Jz9FEeWtxhJdgRkM+bJrLhXH
         ma3KPnx2ZS/C4zPHwpFQNswRMk3SLjOfePipUhFkZGr/J6RWc29FXgIKstK08V3U8lcO
         BR48QLwGVtiSJ+PLyRp3hZuAQo1qscWUokR6FsI7ZkPjjP1RA8Kc2GEZjFWNfm2quyHr
         MKoYWBeS5V22cQaI8lcHPA9mbPHo7d3Y8mhiUD8zrJWikpXZqw20WmxU9n0cuYHYLXN3
         B9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA/+i2CQ7tloRIsmvuRmuHz0Zw647TPmTrkHOE8HYWHe3KImxiu5SqZASSZtDi+KdFAvbsBe0yFbhr4sGKWP2zTNcisHQRhnGW1jgZcA==
X-Gm-Message-State: AOJu0YxqsoS/xMOhkUQuQ4bEUwhMCYyKkHKXV5iE7F94TKK/tRiN4720
	xjNRt7DKSJeLAu89rb3sOmopmjwfP0HjcN7iopr1n4Si6NBrwHZrgs5iFNtn5w==
X-Google-Smtp-Source: AGHT+IFIWOUYwYEZlxNFBi0wlOTgNr/4Lo8wgfnaN7h0tXPTNOrYhumHaZQ1GyIfyPJrf/G0omoagQ==
X-Received: by 2002:a05:6a21:47cb:b0:1a9:3cda:dc3c with SMTP id as11-20020a056a2147cb00b001a93cdadc3cmr9909409pzc.61.1713204216367;
        Mon, 15 Apr 2024 11:03:36 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fh39-20020a056a00392700b006e69a142458sm7452150pfb.213.2024.04.15.11.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 11:03:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org,
	Vignesh Balasubramanian <vigbalas@amd.com>
Subject: Re: [PATCH 0/1] Replace the macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
Date: Mon, 15 Apr 2024 11:03:32 -0700
Message-Id: <171320421021.253137.15736984105365154364.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412062138.1132841-1-vigbalas@amd.com>
References: <20240412062138.1132841-1-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: felix.willgerodt@intel.com, matz@suse.de, Kees Cook <keescook@chromium.org>, jhb@FreeBSD.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Apr 2024 11:51:37 +0530, Vignesh Balasubramanian wrote:
> This patch replaces the macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
> as discussed here
> https://lore.kernel.org/lkml/CA+55aFxDk9_cmo4SPYMgG_WQ+_g5e_v6O-HEtQ_nTs-q1zjykg@mail.gmail.com/
> It is a pre-requisite patch for the review
> https://lore.kernel.org/lkml/20240314112359.50713-1-vigbalas@amd.com/
> I have split this patch as suggested in the review comment
> https://lore.kernel.org/lkml/87o7bg31jd.fsf@mail.lhotse/
> 
> [...]

Applied to for-next/execve, thanks!

[1/1] Replace macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
      https://git.kernel.org/kees/c/a9c3475dd67b

Take care,

-- 
Kees Cook


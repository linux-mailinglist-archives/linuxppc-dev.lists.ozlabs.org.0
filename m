Return-Path: <linuxppc-dev+bounces-13547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6AC1E5D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 05:35:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxrrL70gQz2yvv;
	Thu, 30 Oct 2025 15:35:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761798914;
	cv=none; b=cknnRXMKzuaTdOnBkDM/XednXBVo15j2oDIfv/XsxEaBg3MRnURpcBEetyG0FdLzbN/vnrNG67g3jLijOjHg2BAm09Ncvhg4dCdKT0J9fNAoDwvLNQ6rIOYw6Ypp3jHnjg6IrAN52MM3qDlDk8W3Sk2pKh8+QNJ/4XCSAOQ+BVi6EPWvxvpgAIzZh7rZNvz8poOrNO6Cr2VTcVjQd+FmYNx2VJRpZREf6TlCZ3AnPmFBYenzSDJlVdf9zjT3Yg64Rh156vjiStjxsY8p8uFyo0QhhuQDoT0gKJeEljSsBUUi7T1rDtbuC7QP0CqJETfxGuU36Iz1G0HpWMRjyFG13A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761798914; c=relaxed/relaxed;
	bh=T1IjWo6i6ovO6dMEojAGaj3a/KLGmm2gjTEUcV51NUE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References; b=Idk6/VPepF9yu3QaKpsFeWIJiyff9dg+zKN0TPwuHmasQvuRKT4NkcyQA0669XUMJNjoXjo0k+ASd5ekQOwujkht6dU1N0qUOb+Go8EEfh1KHNUva/6HOqXsIHPJHQrD2JFJDXoh9Ua/IrCQEJreYL8tIbXCrplkyLoDhyufEEJP4smg9mNvN+Qoxyi5ENx5bh4r06nd9sxyA69TCmgFSWvMOdpGij5xprlLr62UZ59kXfP4QSpk1LmpEbO5o3xN9SAwB7MYWXwa41hA4puYScnYysfAUV2RvL84k8eFZp5/6kJ5qSo9rrvAz8uKxte3lAAvpCeUK2XK7RdnumyQSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RFQH2pkB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RFQH2pkB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxrrK4XJcz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 15:35:13 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so709693a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 21:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761798910; x=1762403710; darn=lists.ozlabs.org;
        h=references:date:in-reply-to:subject:cc:to:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1IjWo6i6ovO6dMEojAGaj3a/KLGmm2gjTEUcV51NUE=;
        b=RFQH2pkB37h+SBKJITRYust7i+JE1g3UO+m2T7jlI/cIr0ULN2X2m+3lsCnVr2bXJx
         e8angRF72yzRj20JQsx/cIEkF+9sp7ebf8JI9j2JYDJlWWolEx09EmGXlJOLj8hhWVNp
         p3FWVftJhma5nIYKMpxeoQmPvLteKrlF8n0uCeW+3wqUP6euzgS0y/nXrUFw7hi1K8HF
         1mMWiGyw/TMhWicJniRk36Or4aXuxF5Z/3oyGrFxmHQxmP5Ir6gWhNHafRJnKPdViXSr
         /+fgUIRPTHjB6hVK0cV2lL3rXN/hn3e/yC74FAfn9nikfEnNq/B1r/OSp+b1Plp+wv8O
         7obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761798910; x=1762403710;
        h=references:date:in-reply-to:subject:cc:to:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1IjWo6i6ovO6dMEojAGaj3a/KLGmm2gjTEUcV51NUE=;
        b=NFXB2IwbjB6NlWWK1KHg5wDkaYImyH0BAMzWkRJRlbMcNYUmvXCi9Zs45be4GnqTOE
         XJXGtoZ88F2Xkfk4/CXCivXauRaFP8VWtB/yVBb78lc3dpl2mBk3z4k9wR5AcYNnzIlY
         ITWMkvEhY8T9fyaL2SuoAgBpbMv7vbbedNX9piMiBBaDRj5MqybqDQMpngSeo3831FAu
         MJba2vyWGIq1qI8u6SbPuBJI1ftp36fJGQR+myRfbw8n7Uyiwed90D88mQBoP6QGv+E5
         vf8Lgxh39raFrljZYjrHUYFOJ3VmWnevcx96QmtiQieeNvLZwxuW/M61MGnU4Wdvrctv
         xqqg==
X-Forwarded-Encrypted: i=1; AJvYcCV0kicX+e3h9dWNUG78srpRxSATROvq2t9B2hCzzZLyX0gnMWmp4R9P8T3qtRu2aQFpiRJVgOKUbuHkjZQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwI/dRcM4PhA7fYJ1XRVIuzIwQPxunu1TLe5Qe5bI8SqbAsmfng
	kzb/B4x9SCZVmKLvJmyFqzWhfYrxXT6/oSlz/yulq/iCEHvvzqvEg/rhtGPrNlIF
X-Gm-Gg: ASbGnct/Ce3b/W8rWXCufP8FzW25JETgfivW7hgmQlhLAym/btYgKFvF8tYxA6CiLHg
	QVV7CdgH4sYAwHu9JGLMSAsgZh20FbVweU7Gl38FnM3YOiS5fVxka1tHZsjm9pj/B/NFiMPL1wU
	rOqVOGhk/2DgCSht3lcUABJVAonjHwBb9dZb9+ncSrLi8BLEVmJ0j4u6i3MoW77VW9DBf7/wB6g
	NA4vRTYxMhr9/SyDsB88jaN98ZZvjUTudVBjikZ2dAspHlTsEA3VkOxJoSi712un0jqtd8IYOml
	Zsvdse6xMCKAVcSQ1QUVXAfAVaE+ruPyd1271ATST89W/7NGXtRgQ9DFdCKQo0BLrN5ui1Z7PgH
	+dADf1/lseyGgaNnRo1ZNbyikn9PWLAMsMU/VVE6HlHbcRVxDEl+zK/Pn6Mo702e89uS6hg==
X-Google-Smtp-Source: AGHT+IHl6weE6GF7HNNqHe1114ZnX3tZMdh5kdEiK8Xsyp2FEK/FaeBC/Wnwk0oV634HPAnFIGig5g==
X-Received: by 2002:a17:90b:3a8e:b0:32e:7270:94a1 with SMTP id 98e67ed59e1d1-3403a29a2ccmr7189133a91.17.1761798909800;
        Wed, 29 Oct 2025 21:35:09 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727absm886808a91.3.2025.10.29.21.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:35:08 -0700 (PDT)
Message-ID: <6902eafc.170a0220.271be2.319e@mx.google.com>
X-Google-Original-Message-ID: <87v7jxdn51.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/02] scripts/gdb/cpus: Add support for get_current_task for powerpc book3s64
In-Reply-To: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com>
Date: Thu, 30 Oct 2025 10:03:30 +0530
References: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> This adds support to query p $lx_current() for ppc64 book3s64.
> This allows us to utilize gdb scripts functions like:
>
> function lx_current
> function lx_task_by_pid
> function lx_thread_info
> function lx_thread_info_by_pid
>
> e.g.
> (gdb) p $lx_current()->comm
> $1 = "swapper\000\000\000\000\000\000\000\00
>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  scripts/gdb/linux/constants.py.in |  1 +
>  scripts/gdb/linux/cpus.py         | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

Hi Jan, 

These patches still cleanly applies on upstream tree. Any plans to pick
this up?

-ritesh


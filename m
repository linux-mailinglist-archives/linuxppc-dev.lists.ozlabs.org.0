Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D21282F924
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 22:00:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ObpAGtxi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TF1d51rvnz3cb4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 08:00:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ObpAGtxi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chrisdown.name (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=chris@chrisdown.name; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDw070stPz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 03:47:02 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-337b71a0240so643133f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 08:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1705423619; x=1706028419; darn=lists.ozlabs.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ogzn1QqBOwM6/wPLFbgIITGAg256qwJXlVYrohCZ+U=;
        b=ObpAGtxiaEedjiL7AVFUX1gsl2p25B3LLEMFquULG3lW2F5qzjy+AUWjjWMvk3BdBn
         UdMqAQYAWUcLZWYbh9433+E7H+mnbt8xp1qCIrq982EbALTpxZ2K03zIZkSv7yfdc1A0
         f0ySlcHFSUQNm7EhJBbPZkdrNnY2xwCrTGkbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423619; x=1706028419;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ogzn1QqBOwM6/wPLFbgIITGAg256qwJXlVYrohCZ+U=;
        b=qTIQmKrMQU7Ns0cKruoXojWBAq4BMZsmWBXFDg2IUZWL9pIz1SsKv9VZPPNcxoQNbD
         HqPNI8Zp4qN8Mc5WQI1tFjizeKD6uL813LjBob/xpS7EK9mDXKQA4tgg6/Q8hu69rWmC
         7hgh5BGdj+hAbnefBIXL0cJOqy6HS0WFAEsxjBOTtlD0tbt6sn0EMeMYkFU1UISuDbdp
         dn5FGQ6UK3O/7+F0QL5rineIkHEb/3lCSDtdwZezRCSROsD1Qf6tcDHRtDnTxTVddBYn
         euFs/f5lkaNOzgIDVOSEjNy1l3IP6b43J43IkC2EMMqTYWP4VAtZr2hboajSdlkQPqhn
         /hoA==
X-Gm-Message-State: AOJu0YynMPc9vtjQJD5atRSuIjko57keD60iM7uqvrVq4qCQBrHwzebT
	KWpJEXj+lHKHpiGzM5oMQtVDqsgqy0CDTQ==
X-Google-Smtp-Source: AGHT+IHTwTfXe8Kw9MMMyJkn57jMIAuA/0iSLfegMtL87aQGeeTMAiAXO0QSXc2/GrfW77hv7V8JoQ==
X-Received: by 2002:adf:fcd1:0:b0:337:90e3:d66 with SMTP id f17-20020adffcd1000000b0033790e30d66mr4545484wrs.51.1705423619004;
        Tue, 16 Jan 2024 08:46:59 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id v3-20020adfedc3000000b00337bcbd0968sm1637227wro.104.2024.01.16.08.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 08:46:58 -0800 (PST)
Date: Tue, 16 Jan 2024 16:46:57 +0000
From: Chris Down <chris@chrisdown.name>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <ZaazAYaDMsW2Pou5@chrisdown.name>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Mailman-Approved-At: Wed, 17 Jan 2024 07:59:26 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vitaly Wool writes:
>> Existing users, if any, should voice their objections. Otherwise, we can
>> remove z3fold in a few releases.
>
>At this point I NACK this patch. We're about to submit an allocator
>which is clearly better that z3fold and is faster that zsmalloc in
>most cases and that submission will mark z3fold as deprecated. But for
>now this move is premature.

Why should that block completely unrelated cleanup work? Let's please not add 
dependencies between patches when there don't need to be.

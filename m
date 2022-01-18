Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E5491939
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 03:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdCyb3yXjz30Ly
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 13:53:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Uv5L+1MP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Uv5L+1MP; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdCxv1B5Qz2ynK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 13:53:05 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id s15so6157333pgs.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+dXow2D6kovl8GlAwap0AWMuajUQM5lAihY8qrTDEBQ=;
 b=Uv5L+1MPSrZqYe6Y8HG3UarPEcwEh0vkALvNOq2xAcgsltUatlSZhvAu4ZkCRlnxRP
 FG+LVXfusldaMUz7UqtURH52quTwxGC4/yimq+EOUpXqGwqor+DRCSsIvtYOcwN5QHl5
 W0R7HB/qG+3G2BxsGHl3Nt2xl43WRVP2gKUNTM1deSRo/DtHOwmzXiqK7q8tBs2HSebO
 pWYwrS/JgPs0ZJX5DjKnNjoEiljdIijhBH8X5esopzUOPtLubpjKOZixwwD4k2cn7/xZ
 xKKuycvIHwFIBOdVyt2yBQlZk3YaT50+wDcE8ANxk8CcAe3Avs5rNQ0FcOr7XVPi1ovc
 soLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+dXow2D6kovl8GlAwap0AWMuajUQM5lAihY8qrTDEBQ=;
 b=N4ROfgTyfKP06jEtWxxG20tNA3KRxth+aIsuqaBGnCLmtG9Hxd577uN8VuWh7N/ETY
 gqVHa89melm5G1VKw9rlgiqLo/RZHBaa9IJMq07pj2sRqDZNbuDznkx6+PsoCrAdMNTn
 hKiIC4DvecRW92JndSqfkV9OAKJKdmJnIa/7qZtYOrqHIYb3qXKaSjmV5JzMTAymxMOr
 oEF2v0Q1jjfQh+avNjbj40q6/yWjFOje/NeNrHQ066Rg+vnYkwnFdO8OWegN9A6FQbgs
 kHyfCcZ3ZJ8CpBkRdvQHM30euDvy1Gd/xLVmLcof1pOBdBKs1GSiTxJhwq8xhW7xgj3F
 FMaQ==
X-Gm-Message-State: AOAM531d7F1afeD4JEQ5Tff9MXYH6RshknoCPdWHJF6SPSkCvVSjkDac
 9jqlyjIG4rio3vTYKJ7Zfzg=
X-Google-Smtp-Source: ABdhPJwyL7zGIsi9bIicvksHnAC4wjZ/DiXJE76/NAwmIpYKT6kHX1pZelN6IF0T1eLHS2LvHWGV5g==
X-Received: by 2002:a05:6a00:23c8:b0:4c2:6a7:95c5 with SMTP id
 g8-20020a056a0023c800b004c206a795c5mr21194442pfc.53.1642474382328; 
 Mon, 17 Jan 2022 18:53:02 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id i4sm617438pjj.30.2022.01.17.18.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 18:53:01 -0800 (PST)
Date: Tue, 18 Jan 2022 12:52:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/3] mm: vmalloc: Let user to control huge vmalloc
 default behavior
To: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 x86@kernel.org
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20211227145903.187152-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Message-Id: <1642473992.qrnqczjfna.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Kefeng Wang's message of December 28, 2021 12:59 am:
> Introduce HUGE_VMALLOC_DEFAULT_ENABLED and make it default y, this
> let user to choose whether or not enable huge vmalloc mappings by
> default.
>=20
> Meanwhile, add new hugevmalloc=3Don/off parameter to enable or disable
> this feature at boot time, nohugevmalloc is still supported and
> equivalent to hugevmalloc=3Doff.

Runtime options are bad enough, Kconfig and boot options are even worse.

The 'nohugevmalloc' option mirrors 'nohugeiomap' and is not expected to
ever be understood by an administrator unless a kernel developer is=20
working with them to hunt down a regression.

IMO there should be no new options. You could switch it off for=20
CONFIG_BASE_SMALL perhaps, and otherwise just try to work on heuristics
first. Bring in new options once it's proven they're needed.

Aside from that, thanks for working on these ports, great work.

Thanks,
Nick

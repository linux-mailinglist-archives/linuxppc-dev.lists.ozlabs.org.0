Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3621D784
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:49:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B54kl0fV4zDqLw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 23:49:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CtIxbjVv; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B54hb3SHMzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:47:26 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s189so989537pgc.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mRbOWPWSQUmvbKy0Vhub198si/9PqoOoJ0fQEFD1GNw=;
 b=CtIxbjVvQWa4NtOA2BUa9bC75CZlL25vYzXPl0w/DuaxfU7K7Mef69GwIEcJ/9v5p6
 OyTNMFwhm1f7HQM2uGsZmLP6xjXBKRuhMQ9hjYqV97z8vDpzvMPKqVrCZulwKV7l0ws5
 K3UvPYHj/ywEJNqexpv9wcG57oWMcuiEgeUfm8PlVDi9B4tbFzDLz+RsIOz47QLajLgr
 bl4VArfJGMgjlFM+VPivRlfKklIGQka+bNxVx5kmcekxM4Un3QInWNH/VVOGvCzsetup
 O936Idv00TK0lxrJMmpDZv2HzgcR7mQsgOx8oeQ7xRjaoRoTVDzsffuYhhhu9CHwevtT
 ptHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mRbOWPWSQUmvbKy0Vhub198si/9PqoOoJ0fQEFD1GNw=;
 b=gH0Ahoq/Hh0Gq2ZJvkcrZAzlqhly5xnmaVPFUp4iWpSLROcfTffHVkMClMZTmE3A5P
 52q9+Mz03zLwzQfTuH3H0pacnznSQzSYxDa3aKC8iB8akFRuHcPkJFFx6J/Tg1H20kkj
 bBuYAAEZIpPvtHBFmZlZIGy+COx2jFd9zfZ9icd63UYtn4oidlFXfdDjRppv59LbpFZh
 9qBTwdBfGUfL2ycQmMnAMj/dYs7rcSDuKqOppEzfQSn7OIVWPiqXx1fMw6mvG/94EeQB
 e3hyLMXJnyNcFw5O/288m5ZzvBqFNyBJw1e/0vCEVf02Hbr1Kvq7jp8y1cnJP9LJBCPq
 KSmg==
X-Gm-Message-State: AOAM5301q5ESjDaWNW9qvc3ZtxNH5dfZwsJcn40VXoP8Esb4rlIaP/mM
 gIZkJrUJ8If8hKkZXsWldBA=
X-Google-Smtp-Source: ABdhPJy5mkqYezxWFiByUdDFyfgS7gHSAPhE+WWD7boFv7QO+6zf4EAUVlnl8xvc6AjqSYD9L+nxnA==
X-Received: by 2002:a63:e057:: with SMTP id n23mr67589534pgj.368.1594648043180; 
 Mon, 13 Jul 2020 06:47:23 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id h15sm15368954pjc.14.2020.07.13.06.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:47:20 -0700 (PDT)
Date: Mon, 13 Jul 2020 23:47:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@kernel.org>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-5-npiggin@gmail.com>
 <CALCETrVqHDLo09HcaoeOoAVK8w+cNWkSNTLkDDU=evUhaXkyhQ@mail.gmail.com>
 <1594613902.1wzayj0p15.astroid@bobo.none>
In-Reply-To: <1594613902.1wzayj0p15.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1594647408.wmrazhwjzb.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of July 13, 2020 2:45 pm:
> Excerpts from Andy Lutomirski's message of July 11, 2020 3:04 am:
>> Also, as it stands, I can easily see in_irq() ceasing to promise to
>> serialize.  There are older kernels for which it does not promise to
>> serialize.  And I have plans to make it stop serializing in the
>> nearish future.
>=20
> You mean x86's return from interrupt? Sounds fun... you'll konw where to=20
> update the membarrier sync code, at least :)

Oh, I should actually say Mathieu recently clarified a return from
interrupt doesn't fundamentally need to serialize in order to support
membarrier sync core.

https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-July/214171.html

So you may not need to do anything more if you relaxed it.

Thanks,
Nick

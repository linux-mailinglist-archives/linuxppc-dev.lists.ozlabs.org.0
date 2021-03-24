Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63945347DA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 17:26:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5DBh2sdrz3bt6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 03:26:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h9oN+J12;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h9oN+J12; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5DBF72Q9z30D3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 03:25:56 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id t20so8207296plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4x0pTl7vu9u+HKRmu4XTYvejN4k4GGeXIB+STZwV3gU=;
 b=h9oN+J12WVhNriNkY7c/yOu/Z4dUkL9/M+vFUkvaqxw/qhHQ558xDA2Voc2vm79bCT
 IHMpEnJucyJJ6h5t4jU2nbooCQHPvSyIEl1Wg1++4ilwxMLmmCSwrW7mi2zwqkXJaGRP
 ebbdBtG52+EjmSzOsyj9BS6lSn2y+ziTm5Ku+zKpNM30pIQQ6WjsWILwBY6/nX/2x9T1
 FH9XlPWl6+jij5SkPzEK2QGWdg8NDNvw/fKjIjXslrMKGS2CPPm2jGk7dwtnS+KtpFAb
 o1ZIOtHspDM3BScaP7ok1sg7D6ixRV4tc25tujB/d1kD/ljzKoM2tgPMmAij5giZC3db
 MG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4x0pTl7vu9u+HKRmu4XTYvejN4k4GGeXIB+STZwV3gU=;
 b=WTtupD0tc+oF5fBmIUz1KL7fsx2WD1VFhaEes69vdJBNZb1qKACCAf3yRUUwtx7nWc
 kEh6MBquKLB6pHu4wFM8aoiSrzaR+KVCEMQjPWNy7fzTEewYA0KQJUVFT4FewbWwfxcg
 zTR2DLmHvLiaUAck6CI8Ua8kCQvAX7Z6U2zmlVGqb8mKLeMCa0GkOLqGToyiYAdEdKja
 3gUsGIeVsfIfHWFyOuIL8VJfLIL0D4FqDd4pmJcOtV+DnGO6qm50MwPqW/ePjjkDaATR
 1iHJFcngej8AE1laTNHVbgZLB9FGauMjcOYpwibPVz/mHQ7+Niqhbz5VgAm49Wvnysoy
 XZXQ==
X-Gm-Message-State: AOAM531knEXd+xvgZCUQsxIHSJt03RSNQJ4Ck80TZC94P3bEq+U0OWvY
 8/VXM8ydvbS91DzMnll/mrU=
X-Google-Smtp-Source: ABdhPJzlEk3keginYgtSSKRq6i1wwXwj0Tvn8NcU4HEefS9F6DT4HNdJ4jsyySY7QOBkRMtZjdnFww==
X-Received: by 2002:a17:902:d888:b029:e6:1ca1:d7f9 with SMTP id
 b8-20020a170902d888b02900e61ca1d7f9mr4470860plz.17.1616603151443; 
 Wed, 24 Mar 2021 09:25:51 -0700 (PDT)
Received: from localhost ([1.132.216.217])
 by smtp.gmail.com with ESMTPSA id a13sm2836081pgm.43.2021.03.24.09.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:25:50 -0700 (PDT)
Date: Thu, 25 Mar 2021 02:25:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 00/46] KVM: PPC: Book3S: C-ify the P9 entry/exit code
To: kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1616602979.lxwl22jihw.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of March 23, 2021 11:02 am:
> I think enough changes and fixes have gone in since last round
> to repost.
>=20
> I put a git tree here to make things easier to get.
>=20
> https://github.com/npiggin/linux/tree/kvm-in-c-2

I just pushed a new tree https://github.com/npiggin/linux/tree/kvm-in-c-3

This mainly fixes up the compile error with older binutils and PR=3D1=20
hcall reflection into guest for PR KVM. Haven't been able to completely=20
test PR KVM because of unrelated connectivity issues but at least the
PR=3D1 syscall reflection is working again.

Thanks,
Nick

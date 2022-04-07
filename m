Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B97434F7C5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYxsh5HSQz3bdP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CErb0NIm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CErb0NIm; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYxs365dYz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:07:49 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id r2so6118751iod.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t+20wf0GtDSgwHKQPUIDUWXlshKcm23UV/5tifZ3qNQ=;
 b=CErb0NImHMXyWQaIX785WKOmy6LabafXklmq4w2GQC1o9NrCsnU5agIsDqEvUbNrtV
 LIUmI2DcrX6P59Z01TArpie430Im7o9yO77jivJ1UNmaOtloUOa1gro0ZbQZTPSvfOav
 oNMdgoK4CYEX1Wbawm01PtyLEo+kUhv4OzP4UloVbsrksGUDgbM1JlS652xyxJqeUL/U
 dlAPav2DQzkM5zixnH/llhORre1N2pE+E7IG3rznR7kXV9HFnvICKAOgY2c9EbnU3PYX
 JqS3INeNlD0S2Hvx9om7ZFfo2U0O+uUl51TubDHv3rJxSx7CAQCWHu7qi0Ruzh7B3pF6
 8P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+20wf0GtDSgwHKQPUIDUWXlshKcm23UV/5tifZ3qNQ=;
 b=INkZqpE3shlKbUjl14FL2+f9dPMMTB8VJHcKE9qlOSeypRaGQsNFElcvaxRPO2bBVU
 lLHBpfe9sI8vHWnp4bJAPomBnJs+eW24YKIu9CxQITumuoLUtFYGqoabQiOurL5M/K6m
 fInZZA89ig7PXQ5DlGw0+fzUYeNtu3tiI0MJUXI4Ab/fnwIFCFP37AsPoiGHt9Pn0YKi
 KcbYk7MQH2MfCLPJMhNcGzQJZmUPiOfhq2JnGfq1nn14m15XqaBMtKFnX5vjrCc+Sbmx
 g83uk0EuxkVyJe+MyFYLzj2SJnGst4rmvOQ4Qv2/HmV3KH1r+l/SpU10KXj18vKSy6AQ
 k5cg==
X-Gm-Message-State: AOAM532DNStH8Y64lwtWZiiysyZpeCvaLWuO8wmgG9yCuTppl5OBUuaM
 1P0eVkjXfmKGu5A/svZC6Kq3ryTYuaNOsStDTpU=
X-Google-Smtp-Source: ABdhPJxUPNYRorI9eAmMjOiqWAV3/Dg4IX9tjX/hdBgbEMkZi8T/5za5C9ftAX0TYRjxX+B0fSqX6M9cZ3U/vLNuKWw=
X-Received: by 2002:a02:ab87:0:b0:324:2157:2b4 with SMTP id
 t7-20020a02ab87000000b00324215702b4mr1514815jan.186.1649326065883; Thu, 07
 Apr 2022 03:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
 <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
In-Reply-To: <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Apr 2022 12:07:34 +0200
Message-ID: <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: rcu <rcu@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 7, 2022 at 4:27 AM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
>
> Yes, this happens within 30 seconds after kernel boot.  If we take all
> into account (qemu preparing, kernel loading), we can do one test
> within 54 seconds.

When it does not trigger, the run should be 20 seconds quicker than
that (e.g. 10 seconds), since we don't wait for the stall timeout. I
guess the timeout could also be reduced a fair bit to make failures
quicker, but they do not contribute as much as the successes anyway.

Thanks a lot for running the bisect on that server, Zhouyi!

Cheers,
Miguel

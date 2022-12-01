Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CC63E999
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 07:07:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN5FY33HDz3bfm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 17:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mVx70s5s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mVx70s5s;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN5Dd6Zl6z2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 17:06:25 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id v3so798517pgh.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 22:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMH0ATn2kfqCA2p4BpkUcziG4fvRGUL36gS2KjfmHyU=;
        b=mVx70s5s37n/6iFRtXW3+N2c7PKWUE14EYB1T5AXO7JmPa1xICx/BWilXM7liDl4ln
         7vheD9ob+xb9XlTlXAA+MjkmvZJS5rDK7mrPMK2l9CCCFJfrJ+hTgsoTUUECCeMXp0jP
         3GlEsQiK80wYmr4ZpgvWUanLpa4fkzkobZK9yaKNF0yQHP2oYl6eH9B430dCDR6weAdu
         z503M5enZMuGRlp7oDCXT3QfJ/SrZzI87+NpGOxye+FEz8CWyJuVfTkJvs46RTlnrYI4
         ErrGKmr24kHmI7/YwYVwBwngEkNbLWbIfFB9/Gy6kzdHX4/8iHHgkuDDqzjylbG4FPNG
         zmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lMH0ATn2kfqCA2p4BpkUcziG4fvRGUL36gS2KjfmHyU=;
        b=Lq9GteXaZB/s9GS7N0U6KnixO9eAInC360ZNHG+pSsg+0IEompf3cnFt11BXZJSIFw
         yN0QLw4BPSIhv5QysZu9MkLL+8kkMifMHwG/ByC02yBGDdcv78/z5smAwronTzXVAwop
         q+sd31e1ZwxBMikwlCjQrVJpDB9qoVketoLLfsixU0kvEHZoy9tCCgoGxcXstJPGsy7S
         oS02xZ+ePqN27f9VtPJWymyP3mbRRqSjnD64e6y049nZ5Pqv/L6rlwcuzMLbYdMj343F
         FOLRrSVwLstCQYH1lJUBxQ0sk5yolH2jCwp9YSQw9RYMcoMRB/7KxnNL2VpZ+Cc9c1vj
         jWzA==
X-Gm-Message-State: ANoB5pl93CKv7IPy/HiX+r6boQssi5vy7vzT4GzWymDKh2xG84uwAdjd
	VS6iWHPh/yDj5JXXF30RgSA=
X-Google-Smtp-Source: AA0mqf4Wjj3l5HxopWPdIVe688Ysw/iFKRIsVINi313YGWq6D0wEOVAfZSFkebzE481/lNYL5VolYg==
X-Received: by 2002:a05:6a00:2:b0:576:14a5:359 with SMTP id h2-20020a056a00000200b0057614a50359mr2374514pfk.26.1669874782542;
        Wed, 30 Nov 2022 22:06:22 -0800 (PST)
Received: from localhost ([61.68.162.196])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm2618454plb.43.2022.11.30.22.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 22:06:21 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Dec 2022 16:06:16 +1000
Message-Id: <COQ97E42D81J.FQM2WRVT7HIY@bobo>
To: "Crystal Wood" <oss@buserror.net>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20221128043623.1745708-1-npiggin@gmail.com>
 <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net>
In-Reply-To: <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net>
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
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-ppc@nongnu.org, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Dec 1, 2022 at 6:45 AM AEST, Crystal Wood wrote:
> On Mon, 2022-11-28 at 14:36 +1000, Nicholas Piggin wrote:
> > BookE KVM is in a deep maintenance state, I'm not sure how much testing
> > it gets. I don't have a test setup, and it does not look like QEMU has
> > any HV architecture enabled. It hasn't been too painful but there are
> > some cases where it causes a bit of problem not being able to test, e.g=
.,
> >=20
> > https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-November/251452.ht=
ml
> >=20
> > Time to begin removal process, or are there still people using it? I'm
> > happy to to keep making occasional patches to try keep it going if
> > there are people testing upstream. Getting HV support into QEMU would
> > help with long term support, not sure how big of a job that would be.
>
> Not sure what you mean about QEMU not having e500 HV support?  I don't kn=
ow if
> it's bitrotted, but it's there.
>
> I don't know whether anyone is still using this, but if they are, it's
> probably e500mc and not e500v2 (which involved a bunch of hacks to get al=
most-
> sorta-usable performance out of hardware not designed for virtualization)=
.  I
> do see that there have been a few recent patches on QEMU e500 (beyond the
> treewide cleanup type stuff), though I don't know if they're using KVM.  =
CCing
> them and the QEMU list.

Well I could be wrong about it, but it doesn't look it implements LPIDR
or GSPRs. The only use of MSR_GS seems to be a couple of places
including an instruction that aborts because no HV implementation. It
does have an MMU index selector but before d764184ddb22 that apparently
didn't really work.

QEMU probably should be able to run BookE KVM in PR mode at least.

> I have an e6500 I could occasionally test on, if it turns out people do s=
till
> care about this.  Don't count me as the use case, though. :-)

Do you have a KVM setup on it? And it works with recentish upstream?

> FWIW, as far as the RECONCILE_IRQ_STATE issue, that used to be done in
> kvmppc_handle_exit(), but was moved in commit 9bd880a2c882 to be "cleaner=
 and
> faster". :-P

Yeah that was probably reasonable at the time, that was the common way
to do it and thie patch avoids an unnecessary expensive write to MSR
(which my patch retains).

I think it must have always clobbered r4 though. It's possible it wasn't
tested with the right build option, or the right tracer active, or maybe
the call was simple enough that it was lucky and the compiler didn't use
r4. Easy bug to miss when it's not obvious that macro can call into C.

Thanks,
Nick

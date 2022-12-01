Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8163F6D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:50:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNsS067cz3fP5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:50:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I14/3bSr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=shentey@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I14/3bSr;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNDGR43RDz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 22:23:25 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id s12so1914194edd.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S/O0TPxY4r5bx3eEGM1onYSYaAFsABt6PFjLS9v3Jk=;
        b=I14/3bSrjlEhbLS4u8LK9MTkoE5FmSEqjFsP9c/bSnBb+kqUmNIe002n4HhhkNx/IX
         eFl+l7xHzP2AHQWuKl8fF3x+ZZTXSBOyzqxZsdS7beoZSUlKxWIqAUc663jccTOmVE/L
         z9ZHBUTCybEJVWrEON2JopPbFFNSvkBVxMKLO3CTWaR/8oy0ZqvVavvgy5fwrDgWrTWq
         jarDM9IRm8sRUl96QPAEYVGubZTQK4FVmG/VXux3E07qVdIt3tWhl+NzTFCzbWakQS4K
         GSGKbeL9kBYkhTKRMPe8IiOCsVqQ+bQh2Fm3WuadSjoK2JauxBnoCoQsswFE3uf4dF/B
         SyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S/O0TPxY4r5bx3eEGM1onYSYaAFsABt6PFjLS9v3Jk=;
        b=TjrM4wtJrop52SVgMshPzTM7VY6+Nba+p1ZFrOSdOKT6vaVlYNPuQNT9ycHJ+LfOJ9
         A2qCIaqQOTVbQKlaEO/cUOMBSqN9Jaki31EX8EZOJqJTVqxFgTy2zlg+JdCCGXHOwBLF
         MBt/RFaQMeuWAuBqLbro9zh04xLF1RIg+knXZap75gNxYGj44b531ABwOPF6FAN3iTc1
         ad8y1UnCqaxggq2KAxHKlXp0SADsslw4IbQMQjXVHuPEQsFsZyEE7JYEqIqOL30/BP/y
         E0iYdwRAspao23+5rSxxJh8IS70t06uPHjsGxvzJwW3dZzQ50IM6RofyzCTL0vnDWQ4i
         QXuw==
X-Gm-Message-State: ANoB5pld0uoAkvsxAR7GFVEDWc07i5q0mIjvLb8q+Dt5a5HlqdLJxDDy
	pngCLabiuDMDVmBKSpDSIr0=
X-Google-Smtp-Source: AA0mqf4l++TBWCmvOjjD8xY5CtumuoWZSdWM/DQN4gtLhBYBTYietHulrFiaXuGjc/dC9NP9138Tbw==
X-Received: by 2002:a05:6402:1103:b0:46a:779:4c6a with SMTP id u3-20020a056402110300b0046a07794c6amr38938182edv.201.1669893801181;
        Thu, 01 Dec 2022 03:23:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-205-107.77.183.pool.telefonica.de. [77.183.205.107])
        by smtp.gmail.com with ESMTPSA id z5-20020aa7cf85000000b0045d74aa401fsm1592876edx.60.2022.12.01.03.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:23:20 -0800 (PST)
Date: Thu, 01 Dec 2022 11:23:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Crystal Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
In-Reply-To: <COQ97E42D81J.FQM2WRVT7HIY@bobo>
References: <20221128043623.1745708-1-npiggin@gmail.com> <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net> <COQ97E42D81J.FQM2WRVT7HIY@bobo>
Message-ID: <39875EC0-09BD-4ABF-9AB2-426E99C2FFD8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: qemu-ppc@nongnu.org, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Am 1=2E Dezember 2022 06:06:16 UTC schrieb Nicholas Piggin <npiggin@gmail=
=2Ecom>:
>On Thu Dec 1, 2022 at 6:45 AM AEST, Crystal Wood wrote:
>> On Mon, 2022-11-28 at 14:36 +1000, Nicholas Piggin wrote:
>> > BookE KVM is in a deep maintenance state, I'm not sure how much testi=
ng
>> > it gets=2E I don't have a test setup, and it does not look like QEMU =
has
>> > any HV architecture enabled=2E It hasn't been too painful but there a=
re
>> > some cases where it causes a bit of problem not being able to test, e=
=2Eg=2E,
>> >=20
>> > https://lists=2Eozlabs=2Eorg/pipermail/linuxppc-dev/2022-November/251=
452=2Ehtml
>> >=20
>> > Time to begin removal process, or are there still people using it? I'=
m
>> > happy to to keep making occasional patches to try keep it going if
>> > there are people testing upstream=2E Getting HV support into QEMU wou=
ld
>> > help with long term support, not sure how big of a job that would be=
=2E
>>
>> Not sure what you mean about QEMU not having e500 HV support?  I don't =
know if
>> it's bitrotted, but it's there=2E
>>
>> I don't know whether anyone is still using this, but if they are, it's
>> probably e500mc and not e500v2 (which involved a bunch of hacks to get =
almost-
>> sorta-usable performance out of hardware not designed for virtualizatio=
n)=2E  I
>> do see that there have been a few recent patches on QEMU e500 (beyond t=
he
>> treewide cleanup type stuff), though I don't know if they're using KVM=
=2E  CCing
>> them and the QEMU list=2E

Thanks for CCing!

No, I'm not using KVM on e500=2E The goal of my patches is to run software=
 in QEMU on an x86_64 host rather than on a real PPC machine to optimize ou=
r development process=2E

Best regards,
Bernhard

>Well I could be wrong about it, but it doesn't look it implements LPIDR
>or GSPRs=2E The only use of MSR_GS seems to be a couple of places
>including an instruction that aborts because no HV implementation=2E It
>does have an MMU index selector but before d764184ddb22 that apparently
>didn't really work=2E
>
>QEMU probably should be able to run BookE KVM in PR mode at least=2E
>
>> I have an e6500 I could occasionally test on, if it turns out people do=
 still
>> care about this=2E  Don't count me as the use case, though=2E :-)
>
>Do you have a KVM setup on it? And it works with recentish upstream?
>
>> FWIW, as far as the RECONCILE_IRQ_STATE issue, that used to be done in
>> kvmppc_handle_exit(), but was moved in commit 9bd880a2c882 to be "clean=
er and
>> faster"=2E :-P
>
>Yeah that was probably reasonable at the time, that was the common way
>to do it and thie patch avoids an unnecessary expensive write to MSR
>(which my patch retains)=2E
>
>I think it must have always clobbered r4 though=2E It's possible it wasn'=
t
>tested with the right build option, or the right tracer active, or maybe
>the call was simple enough that it was lucky and the compiler didn't use
>r4=2E Easy bug to miss when it's not obvious that macro can call into C=
=2E
>
>Thanks,
>Nick

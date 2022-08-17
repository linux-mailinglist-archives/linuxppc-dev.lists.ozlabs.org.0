Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B68596A22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 09:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6zpv6GFFz3c72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 17:16:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JZduA1nV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JZduA1nV;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6zpJ6RBLz2xrK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 17:16:23 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id t11so9793112qkt.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nryQoqe6AewwF8xwvBN1jKdcFTmimDx7mWsg7uD2NRQ=;
        b=JZduA1nVMbuA4+YyhCBobJ5zFWs3v09E2z7tBb1t77Dq4mNd8zTsOhO7e3qC07Ze+2
         S1X95SF1O9p6wXlfVgyw/VOcY9UVpiPmnF/ndTtGqiZdgah9JkXDrAPwyT0Rvstg4mK2
         Ki1m2NiIo2KdLrd2uJu60p2J9J5IBfWNPGb6EXcpopRrFrhWL8TGOLv5W+yc3xqNAkJI
         WEvLT+zA/HfrM+KeNpoK4TU1KYAESsgQlbzX5t5o3MJB86AtgPiZ3nhXtAvWvtmqQP4c
         x67sn3nOIfUFFE5Dvfkk7tH6aPV2ZEz2GxJ75RXeuXayxBhFrtln/SS+DfyC+cyUxvXb
         oIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nryQoqe6AewwF8xwvBN1jKdcFTmimDx7mWsg7uD2NRQ=;
        b=jVO64+gBH019ablmSMESEL4ieytCzFi0Qu/80mci0IaNiFqtnFgk6zeuvL3bl+cdW9
         PBw32ZyDMN7DycXbdZFM013AyKc/Y6kl3Oy/tj3JlPX2Vr/GCg7awR/FeEAL8c3+T2yB
         YII2TDH5/GsQpFEEWK3o4wVVesysxYj1rLMROtOUtWjx4yzXhgWHW0FeZVH8/HeNeU6M
         eQHBm0/RkfyQS3U+kpssnd70FDL13K9MGT2IQqGSW81Yt86TRZ0af7ZntyVzOzZz8sUP
         hVxl55TVtTPdvD+lcjurmy1+9orczXHWOxmwz0CmaiC9lC5/Fj5eHa8Zms+LVqqT6jCB
         LvZg==
X-Gm-Message-State: ACgBeo0QYJ9w8Lv3jR/q0eHi1Pisp/DAgQlweRQGxHXf2Ly/+Qyh1r59
	u+1ZRbaSlQE/azPf0jFeXhLT3E0haiw59O4yheU=
X-Google-Smtp-Source: AA6agR5uFGoyzhZLSVSLbVilcNzhQ8epECEWPw6QT42rEfVGBmwZXjl/zbGmjgU0gROMAp6OMyt7yUcNfKGSYaJ/eJ8=
X-Received: by 2002:a05:620a:4706:b0:6bb:7e1b:5f0c with SMTP id
 bs6-20020a05620a470600b006bb7e1b5f0cmr3241534qkb.340.1660720580111; Wed, 17
 Aug 2022 00:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 17 Aug 2022 17:16:09 +1000
Message-ID: <CAOSf1CHicPi6B_tGZ64xEknkfCSUmERTLVq_92XHHmh6-gxYHw@mail.gmail.com>
Subject: Re: [RFC 0/3] Asynchronous EEH recovery
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 1:29 PM Ganesh Goudar <ganeshgr@linux.ibm.com> wrote:
>
> Hi,
>
> EEH reocvery is currently serialized and these patches shorten
> the time taken for EEH recovery by making the recovery to run
> in parallel. The original author of these patches is Sam Bobroff,
> I have rebased and tested these patches.
>
> On powervm with 64 VFs and I see approximately 48% reduction
> in time taken in EEH recovery,

Can you elaborate on how you're testing this? A VM with 64 separate
VFs on 64 separate PHBs I guess? How are you injecting errors?

> Yet to be tested on powernv.

If you're not testing on powernv you might as well not be testing. EEH
support on pseries is relatively straightforward since managing PCI
bridges, etc is all hidden away in the hypervisor. Most of the things
about EEH which give me headaches simply don't happen on pseries since
the PCI topology seen by the guest is flat.

> These patches were originally posted as separate RFCs, I think
> posting them as single series would be more helpful, I know the
> patches are too big, I will try to logically divide in next
> iterations.
>
> Thanks
>
> Ganesh Goudar (3):
>   powerpc/eeh: Synchronization for safety

I didn't pick that patch up after Sam left for a reason. I don't
recall the exact details, but I think I decided that the lock being
added had the same (or mostly the same) scope as the pci rescan lock.
All modifications to the EEH PE tree have to occur with the rescan
lock held since the per-device EEH setup occurs while configuring the
pci_dev (similarly the teardown happens when we remove the pci_dev
from its bus). I don't think that was true when Same wrote the patch
originally though since it pre-dates my big EEH init re-work.

It's possible (probable even!) I got that wrong, or that it was
something I was trying to make true through re-works rather than an
accurate assessment of the current state of things. I'll try page some
of this back into my brain later. I think I left some comments on
Sam's original RFC patch which might still be valid.

>   powerpc/eeh: Asynchronous recovery

I remember not hating the idea, but I think the implementation leaves
a lot to be desired. If you only really care about pseries then just
moving to a model where each PHB has its own recovery thread would get
you most of the benefit without needing to turn the already
complicated recovery path into an async trainwreck. IIRC Sam's
motivation for that patch was to make recovery faster for powernv
systems when an error was injected on a PF with a lot of child VFs.
Certain drivers took forever to recover each VF (might have been mlx5)
so doing it in parallel would have sped things up considerably.

Oliver

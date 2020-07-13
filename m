Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79D21CECF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 07:24:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4sXh1LRHzDqVS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:24:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VsPMs39W; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4sW6680SzDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:23:29 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id s26so5511493pfm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jul 2020 22:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=8HTpo0rLAbXQ9sJmED8h5spUCrEX7xc2cH23pVXei/c=;
 b=VsPMs39WKpM0JSOhcFGXdH9t/tCGCCpJEGsF1vTCw8+UNA5nMg6xZPPEZzO/anZPpC
 rzhUt+jLNHMlV7n/IMmqTgltf3WX7SfGPMpwDEvjb7nZ3mIcJpAbeZQqOxAvX7HLc94C
 8jSCVmUWSZ8cwecHfZz9HrTB3fB9MHrdVoxMQ66rZ9uHC/G1uMKcllLeMFJG6uvG9T/k
 zYMNxqQQLGq1QPgHvsYrwhEmdOrmDLTlrP/KUuw5Zar+SLbi4SDKEDZan8K/yyrTepnI
 qpbAh8QOiOjJYTbKlsN7Lv+d7QI1yDlFn6sPrT8f1ChKaQosFxOK9LNTcGI3EGidJy7H
 vTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8HTpo0rLAbXQ9sJmED8h5spUCrEX7xc2cH23pVXei/c=;
 b=O0W4aAZkPZcvtgXsD4WnAncTQdRK+58u1bdEFhgQtN03OH9Ss4QjjOt+zk6Xztl0me
 MC3401Z5M60/BuxxecOMDR3Q4jGf0F2r7OszqdOXUvEUg+9gpCBGByHZToHlauEUQvbJ
 u1S+0OzUozwvGT2V9bId43Wfh4DEbiIJVc7Z6gFFzIq9BQYifacvn69pvhiRE+72lDxQ
 E1s25i+V5zYnzrwYkSNyyrje4rLi+v9voBND89qWra/l9MKFNfnN8qhaJK3aFD39XZ4V
 ytMiKoc6K5fkezfCRm9Hgxt00MMpZZzLxCIMV2OjeKk8JBjHF93CG1mMRaQGM7Psjn/g
 EJgQ==
X-Gm-Message-State: AOAM531IX5AAswys4Q9Acm24XRiUIF0IaWzUkebJOt2EqEepA5PfoH62
 sbjk8ZXI56KUpLizTzdJz18=
X-Google-Smtp-Source: ABdhPJwJbVRh3lz7pO+zhlE9p9BHDFomi7Q38ZynCP+xUInus4jUuggHpQQg9GCais0r5Nr6eovRdA==
X-Received: by 2002:a63:5412:: with SMTP id i18mr54386771pgb.63.1594617807820; 
 Sun, 12 Jul 2020 22:23:27 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id 16sm13359573pjb.48.2020.07.12.22.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 22:23:27 -0700 (PDT)
Date: Mon, 13 Jul 2020 15:23:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/3] Power10 basic energy management
To: benh@kernel.crashing.org, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, mpe@ellerman.id.au, paulus@samba.org,
 pratik.r.sampat@gmail.com, Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 ravi.bangoria@linux.ibm.com, svaidy@linux.ibm.com
References: <20200710052207.12003-1-psampat@linux.ibm.com>
In-Reply-To: <20200710052207.12003-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1594617564.57k8bsyfd0.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Pratik Rajesh Sampat's message of July 10, 2020 3:22 pm:
> Changelog v1 --> v2:
> 1. Save-restore DAWR and DAWRX unconditionally as they are lost in
> shallow idle states too
> 2. Rename pnv_first_spr_loss_level to pnv_first_fullstate_loss_level to
> correct naming terminology
>=20
> Pratik Rajesh Sampat (3):
>   powerpc/powernv/idle: Exclude mfspr on HID1,4,5 on P9 and above
>   powerpc/powernv/idle: save-restore DAWR0,DAWRX0 for P10
>   powerpc/powernv/idle: Rename pnv_first_spr_loss_level variable
>=20
>  arch/powerpc/platforms/powernv/idle.c | 34 +++++++++++++++++----------
>  1 file changed, 22 insertions(+), 12 deletions(-)

These look okay to me, but the CPU_FTR_ARCH_300 test for=20
pnv_power9_idle_init() is actually wrong, it should be a PVR test=20
because idle is not completely architected (not even shallow stop=20
states, unfortunately).

It doesn't look like we support POWER10 idle correctly yet, and on older
kernels it wouldn't work even if we fixed newer, so ideally the PVR=20
check would be backported as a fix in the front of the series.

Sadly, we have no OPAL idle driver yet. Hopefully we will before the
next processor shows up :P

Thanks,
Nick

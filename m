Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D71578AC1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 02:42:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466v6w47Y2zDqfC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 10:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="cOKIonQh"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466v4r68jXzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 10:40:11 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bj8so1516427plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 17:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wEjzfUHdySvpHZoE9Ji81eu76V6vjLajXj/MO0b1Tgk=;
 b=cOKIonQhJPjpmgaeZtWqCUdhLyRYcIFlBTsNTeMHsWIoB0GnU2m/P9gw9fLAcXCcsg
 SoHmuTpMF2/v5Lhke1NVyy1Zq6HxuXRsJllemjigoHp9o0u2BV+od6csQnDiEoSSYjWm
 t2A65OhvmqZNzb+eatdppJmKoRtBxbRm3otkgCGj1B/yxiyDPSG4LPkDBptYk+HzGvPX
 yJmc47n7WkRElBH5yzRxKrYzpNjZFjKY1Kt32oG2kBNAKAY+zYdlbZCUudCKg878NpR3
 X/ySymuKoyv81V9AT05ngz4v/TMHk1dASIH7TxPVJpNTh9fdbvoACyPnS7mi+GfbG5V7
 IgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wEjzfUHdySvpHZoE9Ji81eu76V6vjLajXj/MO0b1Tgk=;
 b=St1lPgWVaEhdu195N7O6N9T/V9E4tsMXgPdO21CS0LhJ5Sohcv0KrrEaYu1ukw/8AN
 uiOhLEHMB94HYHYKTG/ukc0sU0S4ffDO3GtYUemIZ2U/dl6m960tRzPf8e5cbQ+nyx/J
 xyRkWpBgbk4bhWsPEapBZacqcChV/Q/IbpXbgqEYO8Qtc1QRsBwn3Z7DbhwTrj/GENLc
 QuR0fYLVnaB2iYrPNMXWjv7T4OkmC1iMnA4jyAldl2QzyCZsFIB16rWv93UQnYQ4aFNW
 66KND19qgJXVQ4LYZT9SKCji5Fr8W+1ngyXiHGyY6p5Vto0sdT6W4SAAD2UwEOBQ5JPk
 qSzQ==
X-Gm-Message-State: APjAAAVHO5h6OxHC15MsVJwtWXGNbdfVWMi6cl+zvGPmQc5IDlApr92d
 WT9XMgSnhkMUFsfpP7fErP79rg==
X-Google-Smtp-Source: APXvYqwovxi4+LD8JcnlGBd0HqEiNZqc9KwjyNQxlfxPw1GDXP3FddZimhLoZamzzj/3dQf2czmwyw==
X-Received: by 2002:a17:902:8543:: with SMTP id
 d3mr28536971plo.80.1565656808287; 
 Mon, 12 Aug 2019 17:40:08 -0700 (PDT)
Received: from localhost ([183.82.18.139])
 by smtp.gmail.com with ESMTPSA id g2sm173597842pfq.88.2019.08.12.17.40.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 17:40:07 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Sasha Levin <sashal@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Balbir Singh <bsingharora@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 2/7] powerpc/mce: Fix MCE handling for huge pages
In-Reply-To: <20190812135532.66AC120684@mail.kernel.org>
References: <20190812092236.16648-3-santosh@fossix.org>
 <20190812135532.66AC120684@mail.kernel.org>
Date: Tue, 13 Aug 2019 06:10:04 +0530
Message-ID: <87tvalrj8b.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sasha Levin <sashal@kernel.org> writes:

> Hi,
>
> [This is an automated email]
>
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: ba41e1e1ccb9 powerpc/mce: Hookup derror (load/store) UE errors.
>
> The bot has tested the following trees: v5.2.8, v4.19.66.
>
> v5.2.8: Build OK!
> v4.19.66: Failed to apply! Possible dependencies:
>     360cae313702 ("KVM: PPC: Book3S HV: Nested guest entry via hypercall")
>     41f4e631daf8 ("KVM: PPC: Book3S HV: Extract PMU save/restore operations as C-callable functions")
>     884dfb722db8 ("KVM: PPC: Book3S HV: Simplify machine check handling")
>     89329c0be8bd ("KVM: PPC: Book3S HV: Clear partition table entry on vm teardown")
>     8e3f5fc1045d ("KVM: PPC: Book3S HV: Framework and hcall stubs for nested virtualization")
>     95a6432ce903 ("KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests")
>     a43c1590426c ("powerpc/pseries: Flush SLB contents on SLB MCE errors.")
>     c05772018491 ("powerpc/64s: Better printing of machine check info for guest MCEs")
>     d24ea8a7336a ("KVM: PPC: Book3S: Simplify external interrupt handling")
>     df709a296ef7 ("KVM: PPC: Book3S HV: Simplify real-mode interrupt handling")
>     f7035ce9f1df ("KVM: PPC: Book3S HV: Move interrupt delivery on guest entry to C code")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?

I will send a backport once this has been merged upstream.

Thanks,
Santosh

>
> --
> Thanks,
> Sasha

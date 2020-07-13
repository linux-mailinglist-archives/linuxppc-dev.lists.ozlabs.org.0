Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA121DDE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:53:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B58qB093MzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 02:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CaXNnHr+; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B58lP32N1zDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 02:50:09 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u5so6262291pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=nVkt+Xm/RkQTKeA2jb/S9J8CgntFMc1lva1n2yBK5Ug=;
 b=CaXNnHr+IzMUDxpQDvFSv/E5P7KIiogfIyf5xsA3V0eQmBRaj/nQqUHwox4eg1pHgw
 7uIsGBjNVBJuN3LBDH0YCBLucPbVxinNIdOSXnl5/Mas7DUjsbz38jriPYj2f0AtJX6Y
 tngEXIFoBSx8o/IVVWDmoLKnXmYVsjf7ixWY/w4wQS05xSFy5AxAzX4t+v+tNTOhW1Q0
 ewX9cIPKqNTXQiXUUPWp9/PoGvsr4GX2HgjxIKUafu19cJuJn9rgs2bskytV/ludgQbF
 62vpj90Hzj+W+zXOEGicCFsvnZqsbBathrmOP1TOslsn4Ll4fYw59XBPeDy8AA3dbQMt
 DR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nVkt+Xm/RkQTKeA2jb/S9J8CgntFMc1lva1n2yBK5Ug=;
 b=DlAQ7KmprQfujG5mlp9yb9Jx4QyVEC87fSkXEa58JLEHmt0rLLk+a0suADdW+8o5c5
 IcfIj4cwqyA8lHRSpevzGu5ErAzP/5etmiBoTsfrK50XRt1v/cwRWRTqpJG2NuUTBczd
 +1sWXYKtIOJE7pDKUuDZh/7guHUFjyAQubKPQkrYNMmDUW4G6UlOE0e626WDmuhLut/m
 GPlFJNDZRtZzfqcm0aGXk05u+AZNf5j+JnFspUixpFGqeYS4UfoRF6KUo0GDXtafesJm
 ABbTyydptOANr++udyde/IcgvC21Bb/rNirU9qSbOsU+oUul6E4OQP1yglze4InCv+gK
 OldA==
X-Gm-Message-State: AOAM532aB80i8C4Fcmm6bgmfSzahmTj9phrMUn/ZqDwhqiEHWSmcsKu4
 i1swOwJF9ULW6t0BMDqvVDM=
X-Google-Smtp-Source: ABdhPJzOeudM5I8zL6WtkRfH73ta8+P2xSi1dulw3OXiBONHI3w8F2bCLGrZSAYaLXNb023RPhGS+g==
X-Received: by 2002:a63:1007:: with SMTP id f7mr78840pgl.147.1594659006024;
 Mon, 13 Jul 2020 09:50:06 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id x8sm14640967pfn.61.2020.07.13.09.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:50:05 -0700 (PDT)
Date: Tue, 14 Jul 2020 02:50:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/3] Power10 basic energy management
To: benh@kernel.crashing.org, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, mpe@ellerman.id.au, paulus@samba.org,
 pratik.r.sampat@gmail.com, Pratik Sampat <psampat@linux.ibm.com>,
 ravi.bangoria@linux.ibm.com, svaidy@linux.ibm.com
References: <20200710052207.12003-1-psampat@linux.ibm.com>
 <1594617564.57k8bsyfd0.astroid@bobo.none>
 <bc6494c0-9a17-2416-c6cc-15612020f497@linux.ibm.com>
In-Reply-To: <bc6494c0-9a17-2416-c6cc-15612020f497@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1594658947.97ndhsx6xh.astroid@bobo.none>
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

Excerpts from Pratik Sampat's message of July 13, 2020 8:02 pm:
> Thank you for your comments,
>=20
> On 13/07/20 10:53 am, Nicholas Piggin wrote:
>> Excerpts from Pratik Rajesh Sampat's message of July 10, 2020 3:22 pm:
>>> Changelog v1 --> v2:
>>> 1. Save-restore DAWR and DAWRX unconditionally as they are lost in
>>> shallow idle states too
>>> 2. Rename pnv_first_spr_loss_level to pnv_first_fullstate_loss_level to
>>> correct naming terminology
>>>
>>> Pratik Rajesh Sampat (3):
>>>    powerpc/powernv/idle: Exclude mfspr on HID1,4,5 on P9 and above
>>>    powerpc/powernv/idle: save-restore DAWR0,DAWRX0 for P10
>>>    powerpc/powernv/idle: Rename pnv_first_spr_loss_level variable
>>>
>>>   arch/powerpc/platforms/powernv/idle.c | 34 +++++++++++++++++---------=
-
>>>   1 file changed, 22 insertions(+), 12 deletions(-)
>> These look okay to me, but the CPU_FTR_ARCH_300 test for
>> pnv_power9_idle_init() is actually wrong, it should be a PVR test
>> because idle is not completely architected (not even shallow stop
>> states, unfortunately).
>>
>> It doesn't look like we support POWER10 idle correctly yet, and on older
>> kernels it wouldn't work even if we fixed newer, so ideally the PVR
>> check would be backported as a fix in the front of the series.
>>
>> Sadly, we have no OPAL idle driver yet. Hopefully we will before the
>> next processor shows up :P
>>
>> Thanks,
>> Nick
>=20
> So if I understand this correctly, in powernv/idle.c where we check for
> CPU_FTR_ARCH_300, we should rather be making a pvr_version_is(PVR_POWER9)
> check instead?
>=20
> Of course, the P10 PVR and its relevant checks will have to be added then=
 too.

Yes I think so, unfortunately.

Thanks,
Nick

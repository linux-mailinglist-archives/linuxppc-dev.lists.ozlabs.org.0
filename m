Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14C86F7B5E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 05:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFwy5YJdz3fCW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 13:07:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZgbOpyAh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZgbOpyAh;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFw43N6pz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 13:06:58 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-643465067d1so1047746b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 20:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683256016; x=1685848016;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clDf0mag7jSJOcBrV8uy3dVBVfVUaL1M4k8bgRC2I4s=;
        b=ZgbOpyAhMkj8DW2/1MjEkpRHTBanrpSvOIXdvw2BbjHVmZ3yQvz/iIqqqBoF62VREp
         0KPDwGbr8UkfcN/CdmloQHP/wMuOlu8WKNZwWqeLgpyxaqRlsAs8yJS74nIG9A+MoQgW
         GiM4xHJ4mGmhdHZC/EMJNHdHGTLyv2rN2XTODv2WApYaZiJoFXZ/07rkA/ewdFm9ZXrK
         iqBaFLdxuZpZeOKyIY3Iv1JZRUDo6TdPC/mDg2HHKld1Jiyoa9GXwVjzVX2qUXZO2bkw
         N4dzuSlzQMFUVCknsGFbdRBLFBpdBeX3NTx4XpMRWbR7QEUT8nPGpfd5Ln1naff9xKgb
         Pa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683256016; x=1685848016;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=clDf0mag7jSJOcBrV8uy3dVBVfVUaL1M4k8bgRC2I4s=;
        b=cZwcK9E/tMoABGIaqQP8NwwXSLHC3oTTNoUy3B9rV3UhktAlisj5Yam8sxVPEQBgBK
         mTygHuSLRESRKsIlE9FtH8KPhG/cSlmG+DneGCHPlIF3qF7UHIOBDrhX91j7nLO/rsd7
         czaUtMzTONHbVMOXEjqYSpRTuqLbIz0U0Ilf5G/aA8p8rDgOyyrqBG5gc/Ojhe6smM6d
         74aKQIYBw/h/6ygpNIi5hMoWbNu3gULtFoYn03DC7SCn3qgPavho1GlvW2BowO0/T/yv
         X9Ld4PQfa6JAPbvVQsb+iBo3/92/EyahfvPBtjaHz/FNRlMsJu7z+qP9kZJciXB3UkpR
         g/HA==
X-Gm-Message-State: AC+VfDw/4lQUxO1T3xC2Scxr2/OBMbXZvFx89qKEhOlz7Prdh/UwWsXe
	k4O4+uvOPlYBMnFW0pXyyow=
X-Google-Smtp-Source: ACHHUZ46P1P4WoTqpa9RKU3PzJiT096JVizromiqphOqiUBMf2I/jgGp4hWYnFU/0f2fFZ7lH7p5+A==
X-Received: by 2002:a05:6a20:9d8e:b0:ef:bd:38 with SMTP id mu14-20020a056a209d8e00b000ef00bd0038mr4174463pzb.55.1683256016392;
        Thu, 04 May 2023 20:06:56 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id b2-20020a170903228200b001aafa2e4716sm356432plh.264.2023.05.04.20.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:06:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 13:06:41 +1000
Message-Id: <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
Subject: Re: [PATCH v4 11/17] watchdog/hardlockup: Rename some "NMI
 watchdog" constants/function
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
In-Reply-To: <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> Do a search and replace of:
> - NMI_WATCHDOG_ENABLED =3D> HARD_WATCHDOG_ENABLED
> - watchdog_nmi_ =3D> watchdog_hardlockup_

These are just making prefixes inconsistent again.

If you really want to do a prefix, I would call it hardlockup which
probably best matches existing code and sysctl / boot stuff, and
concentrate on non-static symbols.

No problem with minor things like this that touch arch/powerpc
going through Andrew's tree though. I'm sure sparc maintainers
wouldn't mind either.

Thanks,
Nick

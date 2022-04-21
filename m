Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368C5094F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 04:08:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkLYK4Mxlz2ypD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 12:08:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SfHZcsq2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SfHZcsq2; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkLXf3wrpz2xrs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 12:07:46 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id md4so3614779pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 19:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IgkiTFcaCSnBgeBbH5bn3JHNihWqVy6EhWEd1qbpcqY=;
 b=SfHZcsq2d5XCzQfSY5eBx3QgswtL/jTsMBr/Sf8Gd62aZ0/LgOq0jTxdbAeVHL7n0B
 HyP9/ZX/hHuETjHg8u2xChsFYQsNJm5FcK0xz3qiiHNRAgjhUzpRC3N+4USg1t960zey
 J2H+YZP63uAT2CJxNbG/Az9j6Ty3/EYlWuVLJ/qeLWoPCOja/y3z27p982tqSCMRR+Tg
 bGoDmozOr8GQGXAGdfdbAjpgiz8Bo5e8Rd9gu6Ngrsm53hPZflCOOjiF+JgmUGDA+Je1
 1Hs0VwV5zmP/FbQ36dC7CoQODqttyLN8tntD8goVjqtVKgcrXGHM36ipW30TBlrf8SMH
 v6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IgkiTFcaCSnBgeBbH5bn3JHNihWqVy6EhWEd1qbpcqY=;
 b=ysHAXlvdqYnZu8BgVPzYCAGMZLG7l2x7bwSNuz6HcAFVfDZKczKR7W3aG7SXS9abeA
 LperkcJ9GOYOUbjQMBnjAopCIscKk4UtI9LRDnwAEQ5rnk29JXtw+UpMXMnm+AijxFqo
 8EUbSVdUKMI3Z3Vy6NSFUBsMqvwPHUZ1069bCte36GgZ8zPS/17goodwArvFCyY3isBo
 vfhVovuA8RlJfLBPBmPhosYMlfyL8LG17h947veWwsEpa3h1HwRTwPVLNncL/IhZJDHD
 CO7OcJh+Q/5giamorXN8ILt9p/vpA7jo9+5UTSDpFutNRppNRHJNerAjJjs8wHY9bdPY
 CxQw==
X-Gm-Message-State: AOAM5314DKDRf+7N2f+HImXoBntladzr3KcrjL1nG1YEEBO31Cl1bEEz
 TmTENLpWfVzPAuLN0wAd5dQ+G0s8ivM=
X-Google-Smtp-Source: ABdhPJw+o6qc7wxKS0qL3CzbuF0lMxnrT7O4h4U6h5dXlFwLuqC0WOUVJ6YbirO7YbJ03uUYbZqImQ==
X-Received: by 2002:a17:902:6b47:b0:156:ae54:deaf with SMTP id
 g7-20020a1709026b4700b00156ae54deafmr23208171plt.129.1650506862894; 
 Wed, 20 Apr 2022 19:07:42 -0700 (PDT)
Received: from localhost ([203.221.203.144]) by smtp.gmail.com with ESMTPSA id
 bw22-20020a056a00409600b0050a8e795672sm8932910pfb.29.2022.04.20.19.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 19:07:42 -0700 (PDT)
Date: Thu, 21 Apr 2022 12:07:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/time: Always set decrementer in timer_interrupt()
To: Michael Ellerman <mpe@ellerman.id.au>, Michal =?iso-8859-1?q?Such=E1nek?=
 <msuchanek@suse.de>
References: <20220420141657.771442-1-mpe@ellerman.id.au>
 <20220420142821.GR163591@kunlun.suse.cz>
In-Reply-To: <20220420142821.GR163591@kunlun.suse.cz>
MIME-Version: 1.0
Message-Id: <1650506701.dv7x3vxlhb.astroid@bobo.none>
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
Cc: miguel.ojeda.sandonis@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michal Such=C3=A1nek's message of April 21, 2022 12:28 am:
> Hello,
>=20
> On Thu, Apr 21, 2022 at 12:16:57AM +1000, Michael Ellerman wrote:
>> This is a partial revert of commit 0faf20a1ad16 ("powerpc/64s/interrupt:
>> Don't enable MSR[EE] in irq handlers unless perf is in use").
>>=20
>> Prior to that commit, we always set the decrementer in
>> timer_interrupt(), to clear the timer interrupt. Otherwise we could end
>> up continuously taking timer interrupts.
>>=20
>> When high res timers are enabled there is no problem seen with leaving
>> the decrementer untouched in timer_interrupt(), because it will be
>> programmed via hrtimer_interrupt() -> tick_program_event() ->
>> clockevents_program_event() -> decrementer_set_next_event().
>>=20
>> However with CONFIG_HIGH_RES_TIMERS=3Dn or booting with highres=3Doff, w=
e
>=20
> How difficult is it to detect this condition?
>=20
> Maybe detecting this could be just added?

Possibly not too difficult but I'd like to see if we can get this to work
in core timer code -

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-April/242212.html

I'll resend as a patch and see what flamage I get...

Thanks,
Nick


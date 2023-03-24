Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F86C7DB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 13:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjgv45dJtz3fSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 23:07:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=riygZrm/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=riygZrm/;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjgt61xr9z3fBB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 23:06:35 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-503e7129074so37444a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679659592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFHu7Mda2x8E1hE+tZMPpe9u9wFqlLA8qYyAD/nWUlI=;
        b=riygZrm/nvb3+6jgAal4GGvTTjqbs91tdEfAqhoMPbeofLmYK65e3LE4dOvjj+qTeC
         OxPcd5jVmOE5Qbsz8QWN2rlmuaBZA4qoAZFqIBTZAEh2ZbH0SN7lpk2L5Iz39XIYYuNx
         TlcFEMZWZaXmHeXMp8b9o4Z6KZINMO2a9yOP5d1q1LnFODmWMXFP25tG4o8xDfNh3Ncd
         Yy16d87dVQINCuKdV9+KOzSmjVx+wdnjPxk8/5hxjzSJVgbdA60WT2EcfuVvTo+jHiFW
         L4FSbMjLTMi8WtSNKhInrxbWKv5zyWKyPMhhpP9uHfLl2RF2qkpoEm1NlA27RE1c3b6/
         MpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679659592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFHu7Mda2x8E1hE+tZMPpe9u9wFqlLA8qYyAD/nWUlI=;
        b=KiBINJsU1gjLvZF04fEFztIpibTCMFegOncWfT4U2KH61d1GvePq1tu5xZoQoI3Upm
         hStXo7OM+d+nqABmtRbMsZIrW54OJxGLd8easRr8aGFATn1eHcztMa0gNXgUDbUatI3s
         9IlYY9NZh1yVsL7ADYsC9yTPiX0i/pYY+iqy9CA2E2fIjNuDpwnc1PflOHF/kV2Po6KV
         djUx3ZVM4BwFDz+p4HhhgiMEA5LEzFh37LX63rdAD2eMzZhea6bPl80wXLqjRpHgh5Af
         TjJKHXo5SFuMqHpJwu4cnu7uyJ+ZRKzOswXKjf0IlMvigjU6vSk6tLz6HS7mqyywLCOV
         9pGQ==
X-Gm-Message-State: AAQBX9c9CrQCtrMUXGufvWgpcE4MU9TXwziIZfWAUMB8P3W7jRfmkJ5t
	IfNej4hte1WpO0iBjNe0JrajvQ==
X-Google-Smtp-Source: AKy350a6BdGXWAkuR087R0OxaoCCxSJuxH7LY6E+vvPGZpOv0iqnamkRiY1hePQrFCKO4PKqCC8jog==
X-Received: by 2002:a17:90a:ce8b:b0:237:40a5:77cb with SMTP id g11-20020a17090ace8b00b0023740a577cbmr1123217pju.1.1679659592087;
        Fri, 24 Mar 2023 05:06:32 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090a398f00b0023f9ad42118sm2866137pjb.28.2023.03.24.05.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 05:06:31 -0700 (PDT)
Message-ID: <5fa06524-7170-aeb4-4b5c-2be2ffad696b@kernel.dk>
Date: Fri, 24 Mar 2023 06:06:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Memory coherency issue with IO thread offloading?
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <272cda99-3b1a-95cd-ce03-bc3d17d572ec@csgroup.eu>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <272cda99-3b1a-95cd-ce03-bc3d17d572ec@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/24/23 1:27?AM, Christophe Leroy wrote:
> Hi,
> 
> Le 23/03/2023 ? 19:54, Jens Axboe a ?crit :
>> Hi,
>>
>> I got a report sent to me from mariadb, in where 5.10.158 works fine and
>> 5.10.162 is broken. And in fact, current 6.3-rc also fails the test
>> case. Beware that this email is long, as I'm trying to include
>> everything that may be relevant...
> 
> Which variant of powerpc ? 32 or 64 bits ? Book3S or BookE ?

I knew I'd forget something important... It's power9:

processor	: 0
cpu		: POWER9 (architected), altivec supported
clock		: 2200.000000MHz
revision	: 2.2 (pvr 004e 1202)

-- 
Jens Axboe


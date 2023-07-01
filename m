Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58837445FE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 04:06:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=klNg5sOX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QtFt04XFkz3brl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 12:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=klNg5sOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=schmitzmic@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtFs64fSpz307d
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 12:05:45 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-39eab4bbe8aso1792171b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 19:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688177140; x=1690769140;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5bdNj9qKQT+LeuE7FEpcenxaBQ8UjPqvhX6kCdJ3+8=;
        b=klNg5sOXfBJXrDawfc5c+uQJmZ+nApGGt1VXEi+R7IlNg/rSm2Ny7D1GLQQpWqocOK
         MxHsGIe2gumfIfX4h8mfvv5eA0GdovAoPiDqh1i6iUdwrM5tExjVpakVRTzn9hJoFnFS
         jMgPpUG5oFddVbTu8ZnpZ9gaIZ3xAfJOePdabxCdpJD6VUUW5vpc12hyafyrFzsXmT4A
         62XMihkd7iqELBXqUrlYzgPIH1yxjXqTAUwy8LF4kvAwnGPbK9z1Ohm+RUNwb2TZ8p+n
         wCAPcD1To/tp0oqYNk50Z8r7u5DZ08vhwTX3EZ5/iEUYJbT8UJrR9ZZDxa9tKirjFQfK
         JnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688177140; x=1690769140;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L5bdNj9qKQT+LeuE7FEpcenxaBQ8UjPqvhX6kCdJ3+8=;
        b=eGYKP+qGRFENC+pTMruH4ww94kBOyWurvW9YY66kSc/mCWXRQaHCCdFS53nfr2VJCy
         COEARunQMfstiwEVop6E1I+yVswRdqGsTu2k1Qny2satko3+JGl6w7wUaHN435beE5S3
         MCQH4+fXANTu+kSC2JYL5QuifZRjih6sdmS0EvlMZE/Ult7GPfbpkfAPaRZJNfnmLjd/
         qtLcxGqTFg/wL7ZHThEm2jS+LOEUAyvMb2/trE68jU2cDZt10wQfJNckmQ9ZShx47pHN
         UP4TUMNCCdBGQiL6he3R9mFYO0Nd6PVSSF95QgbWp7iA4raNE2gFZyJscLWDl0FFOXQ1
         Wy0A==
X-Gm-Message-State: AC+VfDxEqpP8zZsa/JGfzo8p99Wf1oFFKsLvWLxRYfEqru2T3vt8sCsM
	URRS16huaEL8Sbj6ZIS3ZHM=
X-Google-Smtp-Source: ACHHUZ48tjc+IcWDbAbQg+zPS5cMLuBmRVp55qa2h5UwKVxtsAFzEaJw8mfQvpwupbww2dwFvHPYJw==
X-Received: by 2002:a05:6808:13cd:b0:3a0:492b:f07b with SMTP id d13-20020a05680813cd00b003a0492bf07bmr5455977oiw.26.1688177139964;
        Fri, 30 Jun 2023 19:05:39 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001b1866f7b5csm11284418plb.138.2023.06.30.19.05.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2023 19:05:39 -0700 (PDT)
Subject: Re: [FSL P50x0] [PASEMI] The Access to partitions on disks with an
 Amiga partition table doesn't work anymore after the block updates 2023-06-23
To: Martin Steigerwald <martin@lichtvoll.de>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, axboe@kernel.dk
References: <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
 <a113cb83-9f82-fd39-f132-41ba4c259265@gmail.com>
 <5866778.MhkbZ0Pkbq@lichtvoll.de>
 <0a8cabbf-89c6-a247-dee8-c27e081b9561@gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <48ded6f5-242c-a1b7-39b3-0585be4b848a@gmail.com>
Date: Sat, 1 Jul 2023 14:05:30 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <0a8cabbf-89c6-a247-dee8-c27e081b9561@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-m68k@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, linux-block@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Martin, Christian,

Am 01.07.2023 um 09:17 schrieb Michael Schmitz:
>>> By reverting my patch, you just reintroduce the old bug, which could
>>> result in mis-parsing the partition table in a way that is not
>>> detected by inane values of partition sizes as above, and as far as I
>>> recall this bug was reported because it did cause data corruption. Do
>>> I have that correct, Martin? Do you still have a copy of the
>>> problematic RDB from the old bug report around?
>>
>> It is in the first attachment of the bug report I mentioned above. The
>> bug the patch fixed.
>
> Thanks, I'll get it from there.

Confirmed the bug on that RDB block, also that my proposed patch fixes 
it, at least as far as that's possible to show with a sparse image file.

Now I note that this patch will actually treat any partition block 
address beyond the 31 bit limit as end of the linked list, but that's 
been the behaviour of Linux RDB partitions since very early on, so I see 
no reason to change that.

The RDB format description URL that appears in one of your messages from 
the 2012 thread has gone dead. I'll try to find it on Wayback later. In 
the meantime, I will submit a patch to fix the new bug ... We can has 
out details in the inevitable review process.

Cheers,

	Michael

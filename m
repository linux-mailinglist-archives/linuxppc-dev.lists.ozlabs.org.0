Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315FCDE6E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 10:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xVc843dlzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 19:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="AmvxbgxZ"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xVYq6hbYzDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 19:44:29 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id q12so9361439lfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8/hi6STco3BJnKtkPIQo5XB037qXP/mO2OC/fnkWZ4g=;
 b=AmvxbgxZ1nqplWkvkmvLg1S+3doHd3O+FoFnUODtx947C7JXyxKZdKzXZ54IPTFKwQ
 lk2r4Bw8JpfwR6ikz4X5Wx9JXMLQ4My9AM4ZPqlvln3zkn5qfMycvc54l/mKvx6Oid2k
 1GATkH6tw5bojR5GlUqxoIyfDpGcdFMFrqv/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/hi6STco3BJnKtkPIQo5XB037qXP/mO2OC/fnkWZ4g=;
 b=fdOFxxAdMC1k8WR89mlGQXWc2TLMh/QDKxtu+6tmwp8jiFCEsDbHF3wRbCwCrH5BW/
 Z3XlxNE4XyuY3lnsY/znizhCBa35c8oDugc1KUY7w6XD76oS6KepVJwbVFAqUjdkHUOq
 KOuVFwBznWFCD4wsW7lCONsbQQCsz33NjqaAAYH0x9GAL/RyZqY7E+FzY3tJNAREgcTB
 VRfjlK4RJmBUmKbuny1NuAs3S7h3ONEKX6QSLuvuYuRHt0C72VAIiDFnGh7Ek3T9DASx
 GwtknCosRaxBC/h57+kI8G2gb7lUqYPTdri588xO8dQNFss3R0k0vitQ/bFQTv/mnurS
 7A6Q==
X-Gm-Message-State: APjAAAX6WcD2Y7LqEy1iShm7sD/4YlQ88mw4PmKUkTmSPVuF3IRglH2j
 sxR/TaHfkizmQZngy08KFO8ojg==
X-Google-Smtp-Source: APXvYqyrWDcNM6SJ9gZHhTTWqc+blLcYki76oV/4j/OJ5eLQE2mSnwjUq8i2SjuIjDI2gDLu/mZSSg==
X-Received: by 2002:a19:c518:: with SMTP id w24mr14768885lfe.14.1571647464949; 
 Mon, 21 Oct 2019 01:44:24 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id i190sm11001603lfi.45.2019.10.21.01.44.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:44:24 -0700 (PDT)
Subject: Re: [PATCH 0/7] towards QE support on ARM
To: Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
 <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <679bf33b-8c05-b77a-0cb2-d79dc5bfbe75@rasmusvillemoes.dk>
Date: Mon, 21 Oct 2019 10:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/10/2019 23.52, Li Yang wrote:
> On Fri, Oct 18, 2019 at 3:54 PM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> On 18/10/2019 22.16, Leo Li wrote:
>>>
>>>>
>>>> There have been several attempts in the past few years to allow building the
>>>> QUICC engine drivers for platforms other than PPC. This is (the beginning of)
>>>> yet another attempt. I hope I can get someone to pick up these relatively
>>>> trivial patches (I _think_ they shouldn't change functionality at all), and then
>>>> I'll continue slowly working towards removing the PPC32 dependency for
>>>> CONFIG_QUICC_ENGINE.
>>>
>>> Hi Rasmus,
>>>
>>> I don't fully understand the motivation of this work.  As far as I know the QUICC ENGINE is only used on PowerPC based SoCs.
>>
>> Hm, you're not the Leo Li that participated in this thread
>> <https://lore.kernel.org/lkml/AM3PR04MB11857AE8D2B0BE56121B97D391C90@AM3PR04MB1185.eurprd04.prod.outlook.com/T/#u>?
> 
> Oops, I totally forgot about this discussion which is just three years
> ago.  :)  The QE-HDLC on LS1021a is kind of a special case.
> 
>>
>>
>>  Can you give an example on how is it used on ARM system?
>>
>> LS1021A, for example, which is the one I'm aiming for getting fully
>> supported in mainline.
>> <https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/layerscape-communication-process/qoriq-layerscape-1021a-dual-core-communications-processor-with-lcd-controller:LS1021A>
>>
>> The forks at https://github.com/qoriq-open-source/linux.git have various
>> degrees of support (grep for commits saying stuff like "remove PPCisms"
>> - some versions can be found on
>> <https://lore.kernel.org/lkml/?q=remove+ppcisms>). Our current kernel is
>> based on commits from the now-vanished 4.1 branch, and unfortunately at
>> least the 4.14 branch (LSDK-18.06-V4.14) trivially doesn't build on ARM,
>> despite the PPC32 dependency having been removed from CONFIG_QUICC_ENGINE.
> 
> Can you try the 4.14 branch from a newer LSDK release?  LS1021a should
> be supported platform on LSDK.  If it is broken, something is wrong.

What newer release? LSDK-18.06-V4.14 is the latest -V4.14 tag at
https://github.com/qoriq-open-source/linux.git, and identical to the
linux-4.14 branch. And despite commit 4c33e2d0576b removing the PPC32
dependency from QUICC_ENGINE, it clearly hasn't been built on arm, since
back around v4.12, mainline's qe.c grew a call to pvr_version_is which
is ppc-only. So from that I sort of assumed that NXP had dropped trying
to support the LS1021A even in their own kernels.

In any case, we have zero interest in running an NXP kernel. Maybe I
should clarify what I meant by "based on commits from" above: We're
currently running a mainline 4.14 kernel on LS1021A, with a few patches
inspired from the NXP 4.1 branch applied on top - but also with some
manual fixes for e.g. the pvr_version_is() issue. Now we want to move
that to a 4.19-based kernel (so that it aligns with our MPC8309 platform).

>> This is just some first few steps, and I'm not claiming
>> that this is sufficient to make the QE drivers build on ARM yet. But I
>> have a customer with both mpc8309-based and ls1021a-based platforms, and
>> they want to run the same, as-close-to-mainline-as-possible, kernel on
>> both. So I will take a piecemeal approach, and try to make sure I don't
>> break the ppc boards in the process (just building and booting one board
>> is of course not sufficient, but better than nothing). Once I get to
>> actually build some of the QE drivers for ARM, I'll of course also test
>> them.
> 
> Understood.  Zhao Qiang also maintains some patches similar to your
> patchset and I think they are tested on ARM.  But the review of these
> patches from last submission didn't finish.  It looks like your
> patches are better divided but not really verified on ARM.  Zhao
> Qiang's patches are tested but maybe need some final touch for
> cleaning up.  I will let you guys decide what is the best approach to
> make this upstreamed.

Yes, as I said, I wanted to try a fresh approach since Zhao
Qiang's patches seemed to be getting nowhere. Splitting the patches into
smaller pieces is definitely part of that - for example, the completely
trivial whitespace fix in patch 1 is to make sure the later coccinelle
generated patch is precisely that (i.e., a later respin can just rerun
the coccinelle script, with zero manual fixups). I also want to avoid
mixing the ppcism cleanups with other things (e.g. replacing some
of_get_property() by of_property_read_u32()). And the "testing on ARM"
part comes once I get to actually building on ARM. But there's not much
point doing all that unless there's some indication that this can be
applied to some tree that actually feeds into Linus', which is why I
started with a few trivial patches and precisely to start this discussion.

Rasmus

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE11E01C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 12:14:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y8Vz0fKPzDqHV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 21:14:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Ic0hqL5A"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y8T01Nr1zDq74
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 21:12:35 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id c4so1417745lja.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hjSv+wwiORAZwQroV0MjPyGZjVfHuvomytZjWA/sFNI=;
 b=Ic0hqL5AEydTjmoYQ4tUn1uoaJcRLZ+2GEpJ1kQHS1/OR4c9etzeWrdKjwV8o1tcLD
 LPpA2VaMo3XUzapC0wtQpSC2SFXhaBgPzMavdDagC7dYu7RNq+FMhBB+Ew5Kwqtg4jPM
 juN3r0sW/bDp/bnW5U/eHm7+dlCaX6fr83uZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hjSv+wwiORAZwQroV0MjPyGZjVfHuvomytZjWA/sFNI=;
 b=dDzQsqNKNuGxLq9/2ffU5ydnQoLXqnQkO/+Zkbzwf08iHJZVX0pB6opQxSKxpb6tPw
 3htlp8+BjyalYXauuOjce94Q9I3KgJxbqHHM3RvPl8NyWcKXTfcekc2T+hI8iayUxCgk
 9+IDrrGzYI2uoMT+CgnaUaf5Y0B3NKLksFMXWmkwssDsyQnEKvLxiLZk8Uw2RP4veEe4
 38YavcvGXLG7Vh4vEzuqG1wV/wlurUe5zbpqBI5dPY2/5BruVUT2lDmUXtJHC2m9SYm0
 RF3mqsKJqSaHs2KNBxtkLIS/ZLaam2RFveDV2Bdl9r+/jS3QdUKqt5sjTNInFLudSvr7
 3Ylg==
X-Gm-Message-State: APjAAAWfP4M4UW87447foo11SObBex4v30ZCLxLRFieQpxCek9Qy5ek8
 gDqlRWGcIrnhKO0H2kEZAs42cQ==
X-Google-Smtp-Source: APXvYqytv4x9SX0QXXZ5y785ZosmmkK9pTamMTH5LXkfjr+9GoKrqEXh83aR0//s2xRSFOK5cvBzdQ==
X-Received: by 2002:a05:651c:1042:: with SMTP id
 x2mr18711751ljm.127.1571739150552; 
 Tue, 22 Oct 2019 03:12:30 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id a7sm3846380ljn.4.2019.10.22.03.12.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 03:12:29 -0700 (PDT)
Subject: Re: [PATCH 0/7] towards QE support on ARM
To: Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
 <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
 <679bf33b-8c05-b77a-0cb2-d79dc5bfbe75@rasmusvillemoes.dk>
 <CADRPPNSiMUy77Dhxjg03sHDxyZzWf_BP8a5+fCncbynyO_cNGg@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <a2bfec28-1e5c-f3f1-56e7-b11b4c23aabe@rasmusvillemoes.dk>
Date: Tue, 22 Oct 2019 12:12:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNSiMUy77Dhxjg03sHDxyZzWf_BP8a5+fCncbynyO_cNGg@mail.gmail.com>
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

On 22/10/2019 00.11, Li Yang wrote:
> On Mon, Oct 21, 2019 at 3:46 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>

>>> Can you try the 4.14 branch from a newer LSDK release?  LS1021a should
>>> be supported platform on LSDK.  If it is broken, something is wrong.
>>
>> What newer release? LSDK-18.06-V4.14 is the latest -V4.14 tag at
>> https://github.com/qoriq-open-source/linux.git, and identical to the
> 
> That tree has been abandoned for a while, we probably should state
> that in the github.  The latest tree can be found at
> https://source.codeaurora.org/external/qoriq/qoriq-components/linux/

Ah. FYI, googling "LSDK" gives https://lsdk.github.io as one of the
first hits, and (apart from itself being a github url) that says on the
front page "Disaggregated components of LSDK are available in github.".
But yes, navigating to the Components tab and from there to lsdk linux
one does get directed at codeaurora.

>> In any case, we have zero interest in running an NXP kernel. Maybe I
>> should clarify what I meant by "based on commits from" above: We're
>> currently running a mainline 4.14 kernel on LS1021A, with a few patches
>> inspired from the NXP 4.1 branch applied on top - but also with some
>> manual fixes for e.g. the pvr_version_is() issue. Now we want to move
>> that to a 4.19-based kernel (so that it aligns with our MPC8309 platform).
> 
> We also provide 4.19 based kernel in the codeaurora repo.  I think it
> will be helpful to reuse patches there if you want to make your own
> tree.

Again, we don't want to run off an NXP kernel, we want to get the
necessary pieces upstream. For now, we have to live with a patched 4.19
kernel, but hopefully by the time we switch to 5.x (for some x >= 5) we
don't need to supply anything other than our own .dts and defconfig.

>> Yes, as I said, I wanted to try a fresh approach since Zhao
>> Qiang's patches seemed to be getting nowhere. Splitting the patches into
>> smaller pieces is definitely part of that - for example, the completely
>> trivial whitespace fix in patch 1 is to make sure the later coccinelle
>> generated patch is precisely that (i.e., a later respin can just rerun
>> the coccinelle script, with zero manual fixups). I also want to avoid
>> mixing the ppcism cleanups with other things (e.g. replacing some
>> of_get_property() by of_property_read_u32()). And the "testing on ARM"
>> part comes once I get to actually building on ARM. But there's not much
>> point doing all that unless there's some indication that this can be
>> applied to some tree that actually feeds into Linus', which is why I
>> started with a few trivial patches and precisely to start this discussion.
> 
> Right.  I'm really interested in getting this applied to my tree and
> make it upstream.  Zhao Qiang, can you help to review Rasmus's patches
> and comment?

Thanks, this is exactly what I was hoping for. Even just getting these
first rather trivial patches (in that they don't attempt to build for
ARM, or change functionality at all for PPC) merged for 5.5 would reduce
the amount of out-of-tree patches that we (and NXP for that matter)
would have to carry. I'll take the above as a go-ahead for me to try to
post more patches working towards enabling some of the QE drivers for ARM.

Rasmus

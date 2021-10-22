Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11154437703
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 14:22:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbNlb2P94z3cTb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 23:22:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=YGpdQ4Ia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YGpdQ4Ia; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbNks5fsHz3c6m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 23:21:55 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id m14so3455577pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vZmzBSaqto2YlWSTYieR/thSC+A+jDhsAocJx/v/72I=;
 b=YGpdQ4Iarts+p/pRe0/2MVsgPBaFVFO9qk6Nk6G81toYJuEffGsdBCuLfW0URewzoG
 P2J1OOokH6Bb41uq4lDDyrp5nPwXg6wqDnB4/2pOoNItzHU0BkAE7W86WXPsFmhopSEO
 UsxjG+wmHtmBdUKHLtgZuUlfTxa/sQ1kRDrtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vZmzBSaqto2YlWSTYieR/thSC+A+jDhsAocJx/v/72I=;
 b=BNtJvcoh70LmACxXIsOXZO9NzFxb0VOwSYHALpx0/6qXzmdDjBsc8pbonHXPnRtMMk
 9mR+7qKy1OJpMVgy0jcDOcdUibQxvWyZsKGViWMYFYX+//GXyV5X6FBu8p6m3rsIHiSG
 BhH3g/KxVv9xEaeANNSf9uRfeSKPUyp+6d7QlfnLNhtM0mGK98tovw8RlHoqKc34ilhi
 Z0679fWhcjE4tmyRwNaVASRiuSR3Uooj8z+Bg4J/4Xarc5rmZaIsJI4IFQ9nuFffPUSK
 1Ez6/qAkqSlxZVdPdYORASlUh6Chbtqkb9H9wXs/jCnynBCb1LEEaqCq7RhdJnQeuMGq
 x/rA==
X-Gm-Message-State: AOAM533cxH9TLMSx3HFitD/K7qCnBODpaKVD8VaGfNU6H6R3AiYID+Ye
 Et4j0SR/Depgno1rEFkdGN5v2A==
X-Google-Smtp-Source: ABdhPJyqXP7oIP3nfYJYqLMBPZ1eJNlxxZwu+kbFlorZbaqmPfmo6iztLl0+xwQkhecdi5tvIwcehw==
X-Received: by 2002:a05:6a00:cd6:b0:471:aded:3884 with SMTP id
 b22-20020a056a000cd600b00471aded3884mr9016275pfv.18.1634905312424; 
 Fri, 22 Oct 2021 05:21:52 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:be9e:8ca3:1a3d:7242])
 by smtp.gmail.com with ESMTPSA id d13sm10555847pfu.196.2021.10.22.05.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 05:21:51 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/mobility: ignore ibm,
 platform-facilities updates
In-Reply-To: <87o87iy3ji.fsf@linux.ibm.com>
References: <20211020194703.2613093-1-nathanl@linux.ibm.com>
 <87zgr3expl.fsf@dja-thinkpad.axtens.net> <87o87iy3ji.fsf@linux.ibm.com>
Date: Fri, 22 Oct 2021 23:21:49 +1100
Message-ID: <87wnm5fdwi.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:

> Daniel Axtens <dja@axtens.net> writes:
>>> On VMs with NX encryption, compression, and/or RNG offload, these
>>> capabilities are described by nodes in the ibm,platform-facilities devi=
ce
>>> tree hierarchy:
>>>
>>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,compression-v1
>>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,random-v1
>>>   =E2=94=94=E2=94=80=E2=94=80 ibm,sym-encryption-v1
>>>
>>>   3 directories
>>>
>>> The acceleration functions that these nodes describe are not disrupted =
by
>>> live migration, not even temporarily.
>>>
>>> But the post-migration ibm,update-nodes sequence firmware always sends
>>> "delete" messages for this hierarchy, followed by an "add" directive to
>>> reconstruct it via ibm,configure-connector (log with debugging statemen=
ts
>>> enabled in mobility.c):
>>>
>>>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:429496=
7285
>>>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:4=
294967284
>>>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v=
1:4294967283
>>>   mobility: removing node /ibm,platform-facilities:4294967286
>>>   ...
>>>   mobility: added node /ibm,platform-facilities:4294967286
>>>
>>> Note we receive a single "add" message for the entire hierarchy, and wh=
at
>>> we receive from the ibm,configure-connector sequence is the top-level
>>> platform-facilities node along with its three children. The debug messa=
ge
>>> simply reports the parent node and not the whole subtree.
>>
>> If I understand correctly, (and again, this is not my area at all!) we
>> still have to go out to the firmware and call the
>> ibm,configure-connector sequence in order to figure out that the node
>> we're supposed to add is the ibm,platform-facilites node, right? We
>> can't save enough information at delete time to avoid the trip out to
>> firmware?
>
> That is right... but maybe I don't understand your angle here. Unsure
> what avoiding the configure-connector sequence for the nodes would buy
> us.

It's not meant to be a tricky question, so the simple answer is probably
the right one. Just wondering if there was a marginal efficiency gain -
although I believe it's not really a hot path anyway.

>
>
>>> Until that can be realized we have a confirmed use-after-free and the
>>> possibility of memory corruption. So add a limited workaround that
>>> discriminates on the node type, ignoring adds and removes. This should =
be
>>> amenable to backporting in the meantime.
>>
>> Yeah it's an unpleasant situation to find ourselves in. It's a bit icky
>> but as I think you said in a previous email, at least this isn't worse:
>> in the common case it should now succeed and and if properties change
>> significantly it will still fail.
>>
>> My one question (from more of a security point of view) is:
>>  1) Say you start using the facilities with a particular set of
>>     parameters.
>>
>>  2) Say you then get migrated and the parameters change.
>>
>>  3) If you keep using the platform facilities as if the original
>>     properties are still valid, can this cause any Interesting,
>>     unexpected or otherwise Bad consequences? Are we going to end up
>>     (for example) scribbling over random memory somehow?
>
> If drivers are safely handling errors from H_COP_OP etc, then no. (I
> know, this looks like a Well That Would Be a Driver Bug dismissal, but
> that's not my attitude.) And again this is a case where the change
> cannot make things worse.
>
> In the current design of the pseries LPM implementation, user space and
> other normal system activity resume as soon as we return from the
> stop_machine() call which suspends the partition, executing concurrently
> with any device tree updates. So even if we had code in place to
> correctly resolve the DT changes and the drivers were able to respond to
> the changes, there would still be a window of exposure to the kind of
> problem you describe: the changed characteristics, if any, of the
> destination obtain as soon as execution resumes, regardless of when the
> OS initiates the update-nodes sequence.
>
> The way out of that mess is to use the Linux suspend framework, or
> otherwise prevent user space from executing until the destination
> system's characteristics have been appropriately propagated out to the
> necessary drivers etc. I'm trying to get there.

Fair enough. I do appreciate the perfect not being the enemy of the good
especially in areas of the codebase like this where there is scope to
improve things but there is also a lot of complexity that we cannot
really get away from because the underlying problem domain is itself
just plain complex. (I think EEH is the other obvious example in
arch/powerpc.)

>> Apart from that, the code seems to do what it says, it seems to solve a
>> real problem, the error and memory handling makes sense, you _put the DT
>> nodes that you _get, the comments are helpful and descriptive, and it
>> passes the automated tests on patchwork/snowpatch.
>
> I appreciate your review!

With those questions answered, and with the caveats above and noting my
complete inability to test the code:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

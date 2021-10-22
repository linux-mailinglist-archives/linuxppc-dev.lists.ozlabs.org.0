Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71308437121
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 07:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbCCY6GFkz2yPq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 16:12:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m5jwz+vp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=m5jwz+vp; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbCBs3frnz2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 16:12:04 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id t11so1903698plq.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 22:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4a28ib4VAGsXEe1LeIA7eO66+VzX5TAWGD3G0W4eei8=;
 b=m5jwz+vp5QrFzhU6f1FpwoOROZk1qTnw786thzWxgirF1oWtNTmIwT/DX+kkPdl9qc
 qegY7e9TaSwp0i9XPDzlgKo5aQ5Wyvgt8W5A02Ib8Ewlx48gUK+8DTLcBcZ76rCMGxUz
 CWLE7VUZCxV0lhTgK0QDZBkxNmSeL9xEtmeU/xQcpX1Rcv/lHVRdaiX7Fjl/6jU6vewa
 MF6aAu7dBwEYiqnS5yAqRAU7FsFCjSZPiaCSjcVQA4ze3q6yqSKtIQcUil0iC6vXRA+o
 Ae/EYF5SNU2Nol8eisPZmB6R3px1t6Zov28/i1adS2F0/ukj7Uoz3qMpG78LejQuxgw/
 SU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4a28ib4VAGsXEe1LeIA7eO66+VzX5TAWGD3G0W4eei8=;
 b=dUFDwLOcnyp78U3pbk44U+F2OEDUpOm32LGpfUmQn46raXVuhapvNmRY6ViyUAqVfD
 dYorODcB3VvEDxM44huR+8d7y8ZUY7U4TJ4enhA1WIlSLZc+pgl+eNFpJ0CRA3ZjvSE0
 rzWNFFSO08uI82gryHcFxk23e1lxdc6YgNX0j6QhVCNPThM/tr7QB11GyFrhf5/UuFFO
 WY7xxtxyqKHvAS4x6+eAL6gXd65N5GhMQ1gfLYjx78ua5TNyi7h+bI/kcTbXXF/MPFgk
 Eq+G8hfdaeSi0yZSYNVGOJL6MCbs6jiQcW/V/lvje/jHD9gJoEP65vB5ZLKT8I6dzDY8
 UCug==
X-Gm-Message-State: AOAM530G3l+ZOpaYPL7bM+ogSDz97TKSQnoanUyfhNnxsOXOYGbQeGku
 t/ciFSf5ORM94prcxk0zBbk=
X-Google-Smtp-Source: ABdhPJxkdsOCxa/dbdA9UdUCBxNnhMpE4dsE/Yz9aESqlLnvKrHc+BVc+r5xTwxJuetgzNwXKm+uFQ==
X-Received: by 2002:a17:90b:3b44:: with SMTP id
 ot4mr11673348pjb.33.1634879522448; 
 Thu, 21 Oct 2021 22:12:02 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 f18sm7632569pfa.60.2021.10.21.22.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 22:12:02 -0700 (PDT)
Date: Fri, 22 Oct 2021 15:11:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87lf2mxpov.fsf@linux.ibm.com> <874k99di81.fsf@mpe.ellerman.id.au>
In-Reply-To: <874k99di81.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1634879420.43ktgolisx.astroid@bobo.none>
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of October 22, 2021 10:19 am:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>> During Live Partition Migration (LPM), it is observed that perf
>>> counter values reports zero post migration completion. However
>>> 'perf stat' with workload continues to show counts post migration
>>> since PMU gets disabled/enabled during sched switches. But incase
>>> of system/cpu wide monitoring, zero counts were reported with 'perf
>>> stat' after migration completion.
>>>
>>> Example:
>>>  ./perf stat -e r1001e -I 1000
>>>            time             counts unit events
>>>      1.001010437         22,137,414      r1001e
>>>      2.002495447         15,455,821      r1001e
>>> <<>> As seen in next below logs, the counter values shows zero
>>>         after migration is completed.
>>> <<>>
>>>     86.142535370    129,392,333,440      r1001e
>>>     87.144714617                  0      r1001e
>>>     88.146526636                  0      r1001e
>>>     89.148085029                  0      r1001e
>>
>> Confirmed in my environment:
>>
>>     51.099987985            300,338      cache-misses
>>     52.101839374            296,586      cache-misses
>>     53.116089796            263,150      cache-misses
>>     54.117949249            232,290      cache-misses
>>     55.602029375     68,700,421,711      cache-misses
>>     56.610073969                  0      cache-misses
>>     57.614732000                  0      cache-misses
>>
>> I wonder what it means that there is a very unlikely huge value before
>> the counter stops working -- I believe your example has this phenomenon
>> too.
>=20
> AFAICS the patch is not reading the PMC values before the migration, so

My suggested change I think should take care of that.

Thanks,
Nick

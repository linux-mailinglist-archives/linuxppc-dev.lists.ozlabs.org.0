Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E06820E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 01:40:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5R6Y3Qw9z3cDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 11:40:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=atG3rW3Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=atG3rW3Q;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5R5f20Cbz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 11:39:48 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id o36so3219765wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 16:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6AfmE3NriTDZXeBtPjgO5/cFK1t9ckr012YHXC87X88=;
        b=atG3rW3Qq1QGQMTcmfDo7Fkt2jfEqLzTNzH/DGSkqLEzUcFKVz9LPmDmg9nYE9j122
         f52ewBWuv5abxIoF/Zlf+uaLuVozSK5l5PdKeg5aTD4U2r8xcMjzVNE8g1MdxLFRgnPU
         OWKunZLpyW48NzPeyrYKOGOFteyAi7CjZmxjXtZ7RMFOEeVYp3Lh3quhdstnaWxcX4Q3
         pNdsrFvjw7c2MoXa/HvcECRTxuPCE5wfAHZ0N99pC/vSxPMqVDbljTdqPQeOKTLziCkV
         Im8Pwoits5fwpIIIZoAvKWcGDj3KVV8YgCJroq8GPDtVj/o+iDDebPGsgKebl1hInui7
         5ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AfmE3NriTDZXeBtPjgO5/cFK1t9ckr012YHXC87X88=;
        b=0mWO3KGTsOSwhE0G+4ImIFLDXY8Dalnsg/n9gYrSrhqGTnyzjMLP2f1l3iAY7X+Y7S
         ETk4pEF0r6RDjTjsuEFH/oaJMTV70Z7DAt5JgGFBxdmfygYUPFtiukRGdOP7s/ABeI+o
         HbBMK0Jj020hRSDw2G05qJrdlRXXDT6ryjLD6kTeRluxQs1qEJxvWkpE+6zwVBReOMvS
         X8LvGXcrtyVpoIL2KIFoMR1BDSm2/uoTmO74n4jTh/VfJsTVXdUdMCEybtSe0/2FOUqc
         0hPeic1kl74uNJvxh6rantpjzze+CpKLRtsHBMRG1TGnKdIZ57/7/qUTkln0FvxYOumv
         aWAg==
X-Gm-Message-State: AO0yUKWHsYnZAbmVcgKms5NmqeYYcJuCeQ8jFCtiH8nvNoT+81aPQXmc
	dRltaW2P4Zn/hDz+8njir8B6IYdyACWV1ZC+hFj54g==
X-Google-Smtp-Source: AK7set8dbrb84Sq6Vq89iS+Rfc/IidveFR9I6gsKg0LdArFqaNehK7b3xc+T8mhT2oN98RrBoyaXefpNBRjJnygEtIw=
X-Received: by 2002:a1c:2b07:0:b0:3dc:19fc:3059 with SMTP id
 r7-20020a1c2b07000000b003dc19fc3059mr1488017wmr.188.1675125582994; Mon, 30
 Jan 2023 16:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com> <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
 <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com> <c18b2293-5f34-28b9-25de-c92c25d5c3f0@oracle.com>
In-Reply-To: <c18b2293-5f34-28b9-25de-c92c25d5c3f0@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jan 2023 16:39:31 -0800
Message-ID: <CAP-5=fWvdOFG0r5eibOy4Ai2EF2zcKZBsFU+vSDBPasvjFepVg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
To: John Garry <john.g.garry@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 30, 2023 at 7:22 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 27/01/2023 13:48, Ian Rogers wrote:
> > On Fri, Jan 27, 2023, 5:20 AM John Garry <john.g.garry@oracle.com
> > <mailto:john.g.garry@oracle.com>> wrote:
> >
> >     On 26/01/2023 23:36, Ian Rogers wrote:
> >
> >     Hi Ian,
> >
> >     At a glance, none of this series has your Signed-off-by tag..
> >
> >     Thanks,
> >     John
> >
> >
> >
> > Thanks John, will fix. Is there anything else?
>
> Do you think that pmu-events/__pycache__/metric.cpython-36.pyc should be
> deleted with a make clean? I would expect stuff like this to be deleted
> (with a clean), but I am not sure if we have a policy on this (pyc files)

Should they be covered by the existing clean target?
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/tools/perf/Makefile.perf?h=perf/core#n1102

Thanks,
Ian

> Thanks,
> John

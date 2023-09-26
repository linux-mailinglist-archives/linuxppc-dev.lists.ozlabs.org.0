Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C17AF65C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 00:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwF4b43Xvz3cFh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 08:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.50; helo=mail-io1-f50.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwF4719p6z30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 08:37:26 +1000 (AEST)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-79f96f83270so310617439f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 15:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695767843; x=1696372643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GH96LiNc6wK6MXQb714sEPdA/4C5gNr2ow4kqLj+00=;
        b=VByrNH8D6ADY8iHCkSI5Apkvrd9ApIk0YKQ8Ho4Ungri7M+zaySM8++PS1TWFotlNX
         9zoVIvTBzeEGXCnn+R2zD6bm7aEDpbh1zfgHSg9yViyYoZSAb8FqG70I1i0miWZB62GW
         nT+9md+2cIBRAVr6o5OP8yI5Vg9RZQLYG4xwD0D2N6qZIWeeu9LHNntPp6aZuRgoB2cn
         Le5O4l4n/vlnd8PfTHml7/+kzMlvB4UzBgF6J1T1Dfid3YWqHbojbKy+jsHhOcMHR3h1
         tWwLAhhOMftKxEjK5OXYk6vVURzLGAzO5o10a0eobwvtCSHOPIezWiEtg+0lFTW+MdoV
         4/FA==
X-Gm-Message-State: AOJu0YzCqz7rvVVR7XPkAczuPaTDymRdTL6twgzlKff5GQk90WGM5dAb
	d8kz/T6QqfYezYiNW3CTKccsPeCsWngcZIQwVIQ=
X-Google-Smtp-Source: AGHT+IEYuHig40h2Sk4Ta/ViVmjYwQksQIPo0D2f+Okq+2a8j2jNjoxOkvEhnfwwp5/anaD4GvcRmv41tCiiti4v4oQ=
X-Received: by 2002:a5d:9251:0:b0:79f:e9ac:f60a with SMTP id
 e17-20020a5d9251000000b0079fe9acf60amr153708iol.20.1695767843632; Tue, 26 Sep
 2023 15:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
 <1F3D650F-91B5-4570-85D2-A925320BE7AE@linux.ibm.com> <298307AE-8AB5-40B6-A9CC-C1DBE720450C@linux.vnet.ibm.com>
 <2C5606DF-4532-4263-9482-50D5668C09AF@linux.vnet.ibm.com> <CA+JHD90aQ5OM3PLrrt2nnBDL1b6-Hx7EsRjpnzawzYY3VSYi3Q@mail.gmail.com>
In-Reply-To: <CA+JHD90aQ5OM3PLrrt2nnBDL1b6-Hx7EsRjpnzawzYY3VSYi3Q@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 26 Sep 2023 15:37:12 -0700
Message-ID: <CAM9d7cj=h=8omHwerjXPaWJbNFOpaiogjw8gsTdvwS7mTschsg@mail.gmail.com>
Subject: Re: [PATCH V2] perf test: Fix parse-events tests to skip parametrized events
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Sep 25, 2023 at 10:37=E2=80=AFAM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
>
>
> On Wed, Sep 13, 2023, 7:40 AM Athira Rajeev <atrajeev@linux.vnet.ibm.com>=
 wrote:
>>
>>
>>
>> > On 08-Sep-2023, at 7:48 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com=
> wrote:
>> >
>> >
>> >
>> >> On 08-Sep-2023, at 11:04 AM, Sachin Sant <sachinp@linux.ibm.com> wrot=
e:
>> >>
>> >>
>> >>
>> >>> On 07-Sep-2023, at 10:29 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.=
com> wrote:
>> >>>
>> >>> Testcase "Parsing of all PMU events from sysfs" parse events for
>> >>> all PMUs, and not just cpu. In case of powerpc, the PowerVM
>> >>> environment supports events from hv_24x7 and hv_gpci PMU which
>> >>> is of example format like below:
>> >>>
>> >>> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
>> >>> - hv_gpci/event,partition_id=3D?/
>> >>>
>> >>> The value for "?" needs to be filled in depending on system
>> >>> configuration. It is better to skip these parametrized events
>> >>> in this test as it is done in:
>> >>> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
>> >>> parametrized events")' which handled a simialr instance with
>> >>> "all PMU test".
>> >>>
>> >>> Fix parse-events test to skip parametrized events since
>> >>> it needs proper setup of the parameters.
>> >>>
>> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> >>> ---
>> >>> Changelog:
>> >>> v1 -> v2:
>> >>> Addressed review comments from Ian. Updated size of
>> >>> pmu event name variable and changed bool name which is
>> >>> used to skip the test.
>> >>>
>> >>
>> >> The patch fixes the reported issue.
>> >>
>> >> 6.2: Parsing of all PMU events from sysfs                          : =
Ok
>> >> 6.3: Parsing of given PMU events from sysfs                        : =
Ok
>> >>
>> >> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>> >>
>> >> - Sachin
>> >
>> > Hi Sachin, Ian
>> >
>> > Thanks for testing the patch
>>
>> Hi Arnaldo
>>
>> Can you please check and pull this if it looks good to go .
>
>
> Namhyung, can you please take a look?

Yep sure.  I think it needs to close the file when getline() fails.

Athira, can you please send v3 with that?

Thanks,
Namhyung

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138D7AE1E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 00:48:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cmPq+ccw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvdMc2wfYz3cLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cmPq+ccw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=arnaldo.melo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvVSM46m2z3bXH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 03:37:21 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-65b0ffbf36aso11974476d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695663436; x=1696268236; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ulCl1joRz+BotgWPL7ghIaTPJUhcMv1ql7xoShQrtHM=;
        b=cmPq+ccwaMutCwRegfjDqIA53KS54bh9kywwBTZNWpumhZ2wknMqpngtQijBmVOLgC
         RcGlndhFIU8/xw86fkcQLknELPtLEtxXBvNn11PmtAGOviTOOQJcMSWAA+tGfQtbmhIz
         d3CimV5z0S83nYM3rwyz+WyF9Mn/p/PKBDTz54uDAdlVd7YMYigAuZE9s/MFsJdn4t0d
         A2C7ObfSNQ5w8TL4qG5zzK/sac3KFxqban33kGh7MA/2Bp0p7cnMspNMKj3qiuLBsH4U
         KEcETR0QNuTQtiASsGXroUyOYuX+rvZLGb/fIrVf+Pt8885tT1TfP5mGSG85RhZWmPkX
         +lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695663436; x=1696268236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulCl1joRz+BotgWPL7ghIaTPJUhcMv1ql7xoShQrtHM=;
        b=VoHre73ItWQvxzfQ37jZZuJV7dD1lsT3JbsCW56EZENvnYuBxMvS405Kt7+RB3v4Ok
         GjMhHkY4Wjxdo2bbGSvjVB1o0jTrG+LzDco+YlqGpAMNvJ7IFF6SKxyAEYFk/ieqrmbD
         oFo9H1W3WSkoitHnhpPEwpoAXtKNxQr5b0lmKYFojSks9Xd+X+ZqGrrs32PJhHOnsOWz
         qKOfUpweDgc5JpkmRpcz0XPjFs8KYO8pmJqCIIICfKJptzkduUd9L0RGYG+87yVZpze5
         CsLgKI25vX/S3KUSIW+FremQXuPrLIMVRfHuIIG3sGhjzyVeGPYGTaSF/tSnXc4blnqI
         0XJA==
X-Gm-Message-State: AOJu0Yyh2exp0unSE3Xwz4OoopYs48y75cw9D/lk5My168k8h4cpUAEu
	qJicg7GPrZOPdWqQ0kQb2KJa1O65L5TbaxnU+ow=
X-Google-Smtp-Source: AGHT+IErcC+QdNAw/xhwBQuoqUQRd+JBKhrQzqSi7W5q9IQHPaUrYoqXSZCcb1AVUeReWb+InIseLxDuAvFEqbOzMCY=
X-Received: by 2002:a0c:f48c:0:b0:65b:1468:8219 with SMTP id
 i12-20020a0cf48c000000b0065b14688219mr2075937qvm.18.1695663435993; Mon, 25
 Sep 2023 10:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
 <1F3D650F-91B5-4570-85D2-A925320BE7AE@linux.ibm.com> <298307AE-8AB5-40B6-A9CC-C1DBE720450C@linux.vnet.ibm.com>
 <2C5606DF-4532-4263-9482-50D5668C09AF@linux.vnet.ibm.com>
In-Reply-To: <2C5606DF-4532-4263-9482-50D5668C09AF@linux.vnet.ibm.com>
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Mon, 25 Sep 2023 19:37:05 +0200
Message-ID: <CA+JHD90aQ5OM3PLrrt2nnBDL1b6-Hx7EsRjpnzawzYY3VSYi3Q@mail.gmail.com>
Subject: Re: [PATCH V2] perf test: Fix parse-events tests to skip parametrized events
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Namhyung Kim <namhyung@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000c2d8540606326824"
X-Mailman-Approved-At: Tue, 26 Sep 2023 08:47:59 +1000
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c2d8540606326824
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2023, 7:40 AM Athira Rajeev <atrajeev@linux.vnet.ibm.com>
wrote:

>
>
> > On 08-Sep-2023, at 7:48 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> wrote:
> >
> >
> >
> >> On 08-Sep-2023, at 11:04 AM, Sachin Sant <sachinp@linux.ibm.com> wrote:
> >>
> >>
> >>
> >>> On 07-Sep-2023, at 10:29 PM, Athira Rajeev <
> atrajeev@linux.vnet.ibm.com> wrote:
> >>>
> >>> Testcase "Parsing of all PMU events from sysfs" parse events for
> >>> all PMUs, and not just cpu. In case of powerpc, the PowerVM
> >>> environment supports events from hv_24x7 and hv_gpci PMU which
> >>> is of example format like below:
> >>>
> >>> - hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
> >>> - hv_gpci/event,partition_id=?/
> >>>
> >>> The value for "?" needs to be filled in depending on system
> >>> configuration. It is better to skip these parametrized events
> >>> in this test as it is done in:
> >>> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
> >>> parametrized events")' which handled a simialr instance with
> >>> "all PMU test".
> >>>
> >>> Fix parse-events test to skip parametrized events since
> >>> it needs proper setup of the parameters.
> >>>
> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>> ---
> >>> Changelog:
> >>> v1 -> v2:
> >>> Addressed review comments from Ian. Updated size of
> >>> pmu event name variable and changed bool name which is
> >>> used to skip the test.
> >>>
> >>
> >> The patch fixes the reported issue.
> >>
> >> 6.2: Parsing of all PMU events from sysfs                          : Ok
> >> 6.3: Parsing of given PMU events from sysfs                        : Ok
> >>
> >> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> >>
> >> - Sachin
> >
> > Hi Sachin, Ian
> >
> > Thanks for testing the patch
>
> Hi Arnaldo
>
> Can you please check and pull this if it looks good to go .
>

Namhyung, can you please take a look?

I'll be back home next week, now at Kernel Recipes in Paris.

- Arnaldo

>
> Thanks
> Athira
> >
> > Athira
> >
> >
>
>

--000000000000c2d8540606326824
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Sep 13, 2023, 7:40 AM Athira Rajeev &lt;<a hre=
f=3D"mailto:atrajeev@linux.vnet.ibm.com">atrajeev@linux.vnet.ibm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On 08-Sep-2023, at 7:48 PM, Athira Rajeev &lt;<a href=3D"mailto:atraje=
ev@linux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">atrajeev@linux.=
vnet.ibm.com</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; On 08-Sep-2023, at 11:04 AM, Sachin Sant &lt;<a href=3D"mailto:sac=
hinp@linux.ibm.com" target=3D"_blank" rel=3D"noreferrer">sachinp@linux.ibm.=
com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt;&gt; On 07-Sep-2023, at 10:29 PM, Athira Rajeev &lt;<a href=3D"mail=
to:atrajeev@linux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">atraje=
ev@linux.vnet.ibm.com</a>&gt; wrote:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Testcase &quot;Parsing of all PMU events from sysfs&quot; pars=
e events for<br>
&gt;&gt;&gt; all PMUs, and not just cpu. In case of powerpc, the PowerVM<br=
>
&gt;&gt;&gt; environment supports events from hv_24x7 and hv_gpci PMU which=
<br>
&gt;&gt;&gt; is of example format like below:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/<br>
&gt;&gt;&gt; - hv_gpci/event,partition_id=3D?/<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; The value for &quot;?&quot; needs to be filled in depending on=
 system<br>
&gt;&gt;&gt; configuration. It is better to skip these parametrized events<=
br>
&gt;&gt;&gt; in this test as it is done in:<br>
&gt;&gt;&gt; &#39;commit b50d691e50e6 (&quot;perf test: Fix &quot;all PMU t=
est&quot; to skip<br>
&gt;&gt;&gt; parametrized events&quot;)&#39; which handled a simialr instan=
ce with<br>
&gt;&gt;&gt; &quot;all PMU test&quot;.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Fix parse-events test to skip parametrized events since<br>
&gt;&gt;&gt; it needs proper setup of the parameters.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Signed-off-by: Athira Rajeev &lt;<a href=3D"mailto:atrajeev@li=
nux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">atrajeev@linux.vnet.=
ibm.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; Changelog:<br>
&gt;&gt;&gt; v1 -&gt; v2:<br>
&gt;&gt;&gt; Addressed review comments from Ian. Updated size of<br>
&gt;&gt;&gt; pmu event name variable and changed bool name which is<br>
&gt;&gt;&gt; used to skip the test.<br>
&gt;&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; The patch fixes the reported issue.<br>
&gt;&gt; <br>
&gt;&gt; 6.2: Parsing of all PMU events from sysfs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : Ok<br>
&gt;&gt; 6.3: Parsing of given PMU events from sysfs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : Ok<br>
&gt;&gt; <br>
&gt;&gt; Tested-by: Sachin Sant &lt;<a href=3D"mailto:sachinp@linux.ibm.com=
" target=3D"_blank" rel=3D"noreferrer">sachinp@linux.ibm.com</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; - Sachin<br>
&gt; <br>
&gt; Hi Sachin, Ian<br>
&gt; <br>
&gt; Thanks for testing the patch<br>
<br>
Hi Arnaldo<br>
<br>
Can you please check and pull this if it looks good to go .<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Namhyung, can yo=
u please take a look?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&=
#39;ll be back home next week, now at Kernel Recipes in Paris.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">- Arnaldo=C2=A0</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks<br>
Athira<br>
&gt; <br>
&gt; Athira<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000c2d8540606326824--

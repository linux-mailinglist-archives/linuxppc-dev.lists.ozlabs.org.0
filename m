Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8945E704C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 01:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYX2V2vR5z3c6T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:45:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UoEi3MQn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UoEi3MQn;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYX1v5ZZ7z2xDN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 09:44:34 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id bq9so17917542wrb.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 16:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ggfQdZjdAa827c+Q4ONwD92LhyjF+5a7nbXBS1iOpTY=;
        b=UoEi3MQn1jWoFQNi3yggMKvZSsegg+k/b5oSYr33gLv/xFYjj/t2xVeqaVXeGHrDdI
         8Y1EpUmdZtf84zjg8pimx/RdJs4t6qJQGioUXmsp5/rrzqra2Gg51/ercWI1cTfKgMqK
         3oEbcI7BrUzRUFo1h/mWTC5WacY3a+WyNMvwegu8CS2VoVgkiwci5JHJ9UPb171lti7/
         6D3ZxQm7tUd+gdPO+6pG91nUyVvyOMLsC4nQ4pTASdKHh61m5NbA41ey5Ulv+pfEBuio
         DTcOel87mocnGxW6Lr9PU/AoGmttIA8bCaoKybDAzwOTRq/pQtcEvonlfyF3VmKRLMNo
         e6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ggfQdZjdAa827c+Q4ONwD92LhyjF+5a7nbXBS1iOpTY=;
        b=HA3P3ELJcS1tmD7n9jdMqNAVeElMTV28IfUhGD7U3CTorkrVMdvA10DD2nff2IUb0+
         0MHjnej00sWsW8D+x0bNhB2s1hsrPEw/9EFmEoyuNYZp40eZBjwdaE3i8rMMnLBFhY5f
         VqLwXzM/epfzArpub0K/GAxTcMt46CjzA/opt6/3zkGWzCu/GS5UKWDgpVWrPTIm8Jkw
         7i3uWqQ2jltWqCMpZjBCWVH9k9J/4d/vF4/hrfeeb/F3WcAFo6eHUD2Q21jG3W/DvuDu
         6ugb+H66AOEN1PX5ByZcgy94RcUyemqlx+EieXRtDNQfH5zyMlSwz7pPCNlZv+5Pz7Y4
         imtQ==
X-Gm-Message-State: ACrzQf2I7cF2CSelB7AJ3g6rSwZ4y9q/0beYKCmkWDA4vM35SZjP09Cv
	T9XKU3kt6YIKSqGCpcApZctwfvSwFBvFGQMG76u17g==
X-Google-Smtp-Source: AMsMyM6u/WuV0WiMixUedkRzYEe96mN+MeHLvNablSRwk/fwFB2OjE5y3sinLKe2odHdb8bGijJ50rWnK5BJOLHuSjM=
X-Received: by 2002:adf:dd8f:0:b0:22a:84ab:4be3 with SMTP id
 x15-20020adfdd8f000000b0022a84ab4be3mr3444502wrl.40.1663890265884; Thu, 22
 Sep 2022 16:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com> <Yyy0W6CnPk7BkkCU@kernel.org>
In-Reply-To: <Yyy0W6CnPk7BkkCU@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Sep 2022 16:44:13 -0700
Message-ID: <CAP-5=fUnmVXds0eR3x3u17VQHZJ_7Q5+yhpXhq1-542d6g1ezA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 22, 2022 at 12:15 PM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
> > The perf test named =E2=80=9Cbuild id cache operations=E2=80=9D skips w=
ith below
> > error on some distros:
>
> I wonder if we shouldn't instead state that bash is needed?
>
> =E2=AC=A2[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell/*.sh =
| grep ^#
> #!/bin/sh
> #!/bin/bash
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/bash
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/bash
> #!/bin/sh
> #!/bin/bash
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> #!/bin/sh
> =E2=AC=A2[acme@toolbox perf-urgent]$
>
> Opinions?

+1 to bash. Perhaps python longer term?  The XML test output generated
by things like kunit is possible to generate from either bash or
python, but in my experience the python stuff feels better built.

Thanks,
Ian

> - Arnaldo
>
> > <<>>
> >  78: build id cache operations                                       :
> > test child forked, pid 111101
> > WARNING: wine not found. PE binaries will not be run.
> > test binaries: /tmp/perf.ex.SHA1.PKz /tmp/perf.ex.MD5.Gt3 ./tests/shell=
/../pe-file.exe
> > DEBUGINFOD_URLS=3D
> > Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.PKz: =
Ok
> > build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
> > ./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitutio=
n
> > test child finished with -2
> > build id cache operations: Skip
> > <<>>
> >
> > The test script "tests/shell/buildid.sh" uses some of the
> > string substitution ways which are supported in bash, but not in
> > "sh" or other shells. Above error on line number 69 that reports
> > "Bad substitution" is:
> >
> > <<>>
> > link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
> > <<>>
> >
> > Here the way of getting first two characters from id ie,
> > ${id:0:2} and similarly expressions like ${id:2} is not
> > recognised in "sh". So the line errors and instead of
> > hitting failure, the test gets skipped as shown in logs.
> > So the syntax issue causes test not to be executed in
> > such cases. Similarly usage : "${@: -1}" [ to pick last
> > argument passed to a function] in =E2=80=9Ctest_record=E2=80=9D doesn=
=E2=80=99t
> > work in all distros.
> >
> > Fix this by using alternative way with "cut" command
> > to pick "n" characters from the string. Also fix the usage
> > of =E2=80=9C${@: -1}=E2=80=9D to work in all cases.
> >
> > Another usage in =E2=80=9Ctest_record=E2=80=9D is:
> > <<>>
> > ${perf} record --buildid-all -o ${data} $@ &> ${log}
> > <<>>
> >
> > This causes the perf record to start in background and
> > Results in the data file not being created by the time
> > "check" function is invoked. Below log shows perf record
> > result getting displayed after the call to "check" function.
> >
> > <<>>
> > running: perf record /tmp/perf.ex.SHA1.EAU
> > build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
> > link: /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e=
1a91cb
> > failed: link /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30=
fd0639e1a91cb does not exist
> > test child finished with -1
> > build id cache operations: FAILED!
> > root@machine:~/athira/linux/tools/perf# Couldn't synthesize bpf events.
> > [ perf record: Woken up 1 times to write data ]
> > [ perf record: Captured and wrote 0.010 MB /tmp/perf.data.bFF ]
> > <<>>
> >
> > Fix this by redirecting output instead of using =E2=80=9C&=E2=80=9D whi=
ch
> > starts the command in background.
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> >  tools/perf/tests/shell/buildid.sh | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell=
/buildid.sh
> > index f05670d1e39e..3512c4423d48 100755
> > --- a/tools/perf/tests/shell/buildid.sh
> > +++ b/tools/perf/tests/shell/buildid.sh
> > @@ -66,7 +66,7 @@ check()
> >       esac
> >       echo "build id: ${id}"
> >
> > -     link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
> > +     link=3D${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/$(echo =
${id}|cut -c 3-)
> >       echo "link: ${link}"
> >
> >       if [ ! -h $link ]; then
> > @@ -74,7 +74,7 @@ check()
> >               exit 1
> >       fi
> >
> > -     file=3D${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
> > +     file=3D${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/`readli=
nk ${link}`/elf
> >       echo "file: ${file}"
> >
> >       if [ ! -x $file ]; then
> > @@ -117,20 +117,22 @@ test_record()
> >  {
> >       data=3D$(mktemp /tmp/perf.data.XXX)
> >       build_id_dir=3D$(mktemp -d /tmp/perf.debug.XXX)
> > -     log=3D$(mktemp /tmp/perf.log.XXX)
> > +     log_out=3D$(mktemp /tmp/perf.log.out.XXX)
> > +     log_err=3D$(mktemp /tmp/perf.log.err.XXX)
> >       perf=3D"perf --buildid-dir ${build_id_dir}"
> > +     eval last=3D\${$#}
> >
> >       echo "running: perf record $@"
> > -     ${perf} record --buildid-all -o ${data} $@ &> ${log}
> > +     ${perf} record --buildid-all -o ${data} $@ 1>${log_out} 2>${log_e=
rr}
> >       if [ $? -ne 0 ]; then
> >               echo "failed: record $@"
> > -             echo "see log: ${log}"
> > +             echo "see log: ${log_err}"
> >               exit 1
> >       fi
> >
> > -     check ${@: -1}
> > +     check $last
> >
> > -     rm -f ${log}
> > +     rm -f ${log_out} ${log_err}
> >       rm -rf ${build_id_dir}
> >       rm -rf ${data}
> >  }
> > --
> > 2.17.1
>
> --
>
> - Arnaldo

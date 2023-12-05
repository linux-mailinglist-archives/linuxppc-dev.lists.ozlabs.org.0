Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71DB806172
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 23:10:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PaJm1DtY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlF8H1l9Fz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 09:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PaJm1DtY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlF7P1Mx1z3c09
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 09:09:20 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so3868a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Dec 2023 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701814154; x=1702418954; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MfXx0SuFaYaxfBUsv9sabs9aUoX/sqeNUvNoJsvnlE=;
        b=PaJm1DtYAvMcsmjArA3RVDnNZlduhwVXmIRlj5v8doAdA0oDTbCKAB2TSVW4dObROk
         uuLzm9NYab4r42Sk02dPjf9NBR1TBF4bu/zHQqM1qmiiS2o9ayqhfZ47eZsH5v6V3m8b
         dHV2jruW+yISiy8giVEbf7fcV/AnSUJBK8cYzuCMJFTr+JlU4mqG+QOJ0RAKWXnZyTNI
         GFhrBdyP1zgH8Fr2tO1i1VDFqtwQTvuz5oQC9T0Jh1jSz3zhzt8C4iIVpgCAjnO0jP6w
         E1wX6j3c13vyJnu/lSWSTtFHu6FfzCLZr3pWYZKTXMeRjruGexART/WPMqKYYbjzZiLj
         hdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701814154; x=1702418954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MfXx0SuFaYaxfBUsv9sabs9aUoX/sqeNUvNoJsvnlE=;
        b=IKnzxICH3QT3RUJR98P8itD5pgi2b1chbNbSXMeGhMXfgQP9eIoKW1HNxTr4OixcWR
         zP3ua9QAAqGoqBGlVp3UxD+EHLn1O6xPAlyDsxL9rLiDheieICN6QQD/pqAoyk0eHCV4
         PmC8i+Q6X0TEP3WpJDbS+v3tnIg/+Mvr0uPJH/R3nQgu5mpsIAN/VBwN8NgSoGgFRDtz
         ri0r0MArRsxfN0V4zr8bWHxLLp7gman1Iw7jf5TsDutpHJExvzg9A/iaFV3EfcOjV3uK
         3iCD/vUOTBHoXvckHz3WVaPe2u7aZELKjnzBJhjGat/PCOLDLtCQ0bkIE75SemX+hO7L
         Rinw==
X-Gm-Message-State: AOJu0YyUFFkzCd43kfM8HnWPRF5pIovjQrzc/ns8jdqRSRCW7uwQA5Jt
	MGCRUUjxDXpBJgOsh0Y3gijhkd9ilQMnnSgpH1vHqA==
X-Google-Smtp-Source: AGHT+IGFEpGOvnm0S40EH1LIvhCSLZo7DzOk0IVnTQfsfPAx/TKGVtoqJoCsLPt+JMA0HlaC/B7IyrBKnoR0DX7+Ktg=
X-Received: by 2002:a50:9f65:0:b0:54d:6a88:507e with SMTP id
 b92-20020a509f65000000b0054d6a88507emr30833edf.4.1701814154246; Tue, 05 Dec
 2023 14:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
 <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com> <ZW+bIGC3r2dcTQUO@kernel.org>
In-Reply-To: <ZW+bIGC3r2dcTQUO@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 5 Dec 2023 14:09:01 -0800
Message-ID: <CAP-5=fVAYnYd7yAQMRdQFoHyDK9SAd1jS6Tjh8QhOSU3Cymk_w@mail.gmail.com>
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, James Clark <james.clark@arm.com>, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 5, 2023 at 1:50=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Em Mon, Nov 27, 2023 at 11:12:57AM +0000, James Clark escreveu:
> > On 23/11/2023 16:02, Athira Rajeev wrote:
> > > --- a/tools/perf/Makefile.perf
> > > @@ -1134,6 +1152,7 @@ bpf-skel-clean:
> > >     $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETON=
S)
> > >
> > >  clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMB=
OL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-c=
oresight-targets-clean
> > > +   $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
> > >     $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-=
archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
> > >     $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd'=
 -delete -o -name '\.*.d' -delete
> > >     $(Q)$(RM) $(OUTPUT).config-detected
>
> While merging perf-tools-next with torvalds/master I noticed that maybe
> we better have the above added line as:
>
> +   $(call QUIET_CLEAN, tests) $(Q)$(MAKE) -f $(srctree)/tools/perf/tests=
/Makefile.tests clean
>
> No?
>
> Anyway I'm merging as-is, but it just hit my eye while merging,
>
> - Arnaldo

Makefile.tests was removed in these recent patches adding support for
the OUTPUT directory:
https://lore.kernel.org/lkml/9C33887F-8A88-4973-8593-7936E36AFCE1@linux.vne=
t.ibm.com/

Thanks,
Ian

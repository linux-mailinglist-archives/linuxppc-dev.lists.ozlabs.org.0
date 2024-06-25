Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF36916FD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 20:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7t7m1RMTz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 04:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.46; helo=mail-pj1-f46.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7t7M5jhlz3cNc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 04:06:22 +1000 (AEST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c825f0b381so3213183a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 11:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719338781; x=1719943581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYRoSYBMyUfFW3qOTYX0mms4VCXUWC1J1GTwb+UHwcs=;
        b=e86MZJaGruascwh6yyWUH9KruSXkt5ymSjejekK7jEVYvGok8mamVXnC5uVVNkQKZe
         ni+g8YZLGW+WVtj4G8jASY+NMOP7mlDHphvtgaA2HJp6DF7nJyp35yDmjy4dGWTGn4Fv
         nAa47jcyCqhwZwq4lVbPFk2bTmvnXXNBrrRBM5DZjEKIbEpPhsmSPtXsKr1G1rWEY6Cb
         Cqs/v7X3CyZuOGNlOMd/Pe6WSev7TOgfli8YmvW/0yaajm3PuxST5aTobBA0Cx/50oAO
         cs3laBLTs02Ce9y9Z0jSVCtILr+mO4ZZvBFcI2ckKdLywfflAqtfjB4myF9hmMRFSRRi
         Ewpw==
X-Forwarded-Encrypted: i=1; AJvYcCUvQedSQbj5wAmajszRufLkXtzT8MJ0IKwkqgRKSVFa2VDRjAbyFDkED/mX/37D4UWoI88n3Dy6b3w3NnT1x6/gOaSSFy+/gvN4udQgHQ==
X-Gm-Message-State: AOJu0YxwJvS8b0CZlbhhQJsmETZrAlhiP9IEBX+tbsnLj6Y62e6FJkhu
	U9gD/7wEewaFaNL+0UhXSVsMVjrgaC4DSp/upGlOYU0IvgQhmK5mMQteqN2rGxC/ruqYXj9LlaK
	O8LglJX1aKdZlG2N/HPwrLN8XTcc=
X-Google-Smtp-Source: AGHT+IEnjRNws1Iz7snCymBOJS0N0HgLeEPogsPgzYspdRnnmFsVh0OjNbMFg0qf1poVQ28TQR5WihNyX3Us7XRjSXE=
X-Received: by 2002:a17:90b:3616:b0:2c8:3f5:28ae with SMTP id
 98e67ed59e1d1-2c8504c7bdbmr7030880a91.4.1719338781055; Tue, 25 Jun 2024
 11:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
 <20240623064850.83720-2-atrajeev@linux.vnet.ibm.com> <536ccca7-278c-4d50-9c24-bf4409cd75dc@intel.com>
In-Reply-To: <536ccca7-278c-4d50-9c24-bf4409cd75dc@intel.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 25 Jun 2024 11:06:10 -0700
Message-ID: <CAM9d7chzgJXNDObXW2KVD7JALOh6C5ZbHw7cjuvfbaSNCtqqEw@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] tools/perf: Use is_perf_pid_map_name helper
 function to check dso's of pattern /tmp/perf-%d.map
To: Adrian Hunter <adrian.hunter@intel.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 5:03=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 23/06/24 09:48, Athira Rajeev wrote:
> > commit 80d496be89ed ("perf report: Add support for profiling JIT
> > generated code") added support for profiling JIT generated code.
> > This patch handles dso's of form "/tmp/perf-$PID.map".
> >
> > Some of the references doesn't check exactly for same pattern.
> > some uses "if (!strncmp(dso_name, "/tmp/perf-", 10))". Fix
> > this by using helper function perf_pid_map_tid and
> > is_perf_pid_map_name which looks for proper pattern of
> > form: "/tmp/perf-$PID.map" for these checks.
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>
> Add a Fixes tag, then
>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

Thanks, but I'm not sure which commit I can add the Fixes tag because
the original commit 80d496be89ed is too old and I'm sure we added a
lot of changes after that.

Namhyung


>
> > ---
> >  tools/perf/util/dsos.c    | 2 +-
> >  tools/perf/util/srcline.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> > index ab3d0c01dd63..846828ea1f00 100644
> > --- a/tools/perf/util/dsos.c
> > +++ b/tools/perf/util/dsos.c
> > @@ -275,7 +275,7 @@ static void dso__set_basename(struct dso *dso)
> >       char *base, *lname;
> >       int tid;
> >
> > -     if (sscanf(dso__long_name(dso), "/tmp/perf-%d.map", &tid) =3D=3D =
1) {
> > +     if (perf_pid_map_tid(dso__long_name(dso), &tid)) {
> >               if (asprintf(&base, "[JIT] tid %d", tid) < 0)
> >                       return;
> >       } else {
> > diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> > index 9d670d8c1c08..51eb78993fe2 100644
> > --- a/tools/perf/util/srcline.c
> > +++ b/tools/perf/util/srcline.c
> > @@ -39,7 +39,7 @@ static const char *srcline_dso_name(struct dso *dso)
> >       if (dso_name[0] =3D=3D '[')
> >               return NULL;
> >
> > -     if (!strncmp(dso_name, "/tmp/perf-", 10))
> > +     if (is_perf_pid_map_name(dso_name))
> >               return NULL;
> >
> >       return dso_name;
>

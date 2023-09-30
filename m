Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E977B3E88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 07:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RyGcZ0vRrz3ck0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 15:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.42; helo=mail-io1-f42.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RyGc52ry3z3by9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 15:53:40 +1000 (AEST)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-79faba5fe12so426015939f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 22:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696053217; x=1696658017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lMNDZtXrJLrGqzemt2EkDxCOgpyINxs4NaojVztYD0=;
        b=iKvrZz8wRmCfOQlG5SQk42TVjXAym4n3GxEC9MvVm70/d8gQxiYck5zX1QUAXF+LN2
         9rHfNt/wYjrxF+UxLB71uQM3WnbAC9yqhy2wLL6vRqCVFXgRwfm6AAqljCqWYn4asN/b
         7SKxR7+dMncBl/0NWGOdnnSQbjszHQb9iId5uC2zsZ29NEtk6C/W2yKZvJJ8uGUZp2Hk
         lJU15cXZ1bDochPlW1YLCqSNBqZU7fQN+fpLt7anDszO44+XAQfc4F99PiSZ4hcSz0z4
         saxeuiPWhiFzWO3ZlKJz3v5oGhhW0X8EIZKJ2b6ad93bdK1wZeY6mL8Z3/DnBkkpqcMx
         3RoQ==
X-Gm-Message-State: AOJu0YzY6pt8UsvEgMMDm3OQF8LbdJuJEi5slQTe5KDK79WoI1TpC1r8
	G2iF/RPhmFq4FsNoIjZ38599SENMJ8DYOHHN7c8=
X-Google-Smtp-Source: AGHT+IF3Cs2412FLTzw0lokrxjiBgnhFrJBSlhCmbiSTkFbdV+fqJW3d/Xlis7jFMnTSCdE2T8GYxHHQlKW6AOYmSWo=
X-Received: by 2002:a05:6602:2251:b0:794:c9a2:5fe3 with SMTP id
 o17-20020a056602225100b00794c9a25fe3mr6959471ioo.4.1696053216970; Fri, 29 Sep
 2023 22:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230927181703.80936-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230927181703.80936-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 29 Sep 2023 22:53:25 -0700
Message-ID: <CAM9d7ciNutXBM1LHMfkjLPKiT=8b0TMfiTRkn9w4=Tw53ACUNw@mail.gmail.com>
Subject: Re: [PATCH V3] perf test: Fix parse-events tests to skip parametrized events
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, Sachin Sant <sachinp@linux.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 11:17=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Testcase "Parsing of all PMU events from sysfs" parse events for
> all PMUs, and not just cpu. In case of powerpc, the PowerVM
> environment supports events from hv_24x7 and hv_gpci PMU which
> is of example format like below:
>
> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
> - hv_gpci/event,partition_id=3D?/
>
> The value for "?" needs to be filled in depending on system
> configuration. It is better to skip these parametrized events
> in this test as it is done in:
> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
> parametrized events")' which handled a simialr instance with
> "all PMU test".
>
> Fix parse-events test to skip parametrized events since
> it needs proper setup of the parameters.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Tested-by: Ian Rogers <irogers@google.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Applied to perf-tools-next, thanks!

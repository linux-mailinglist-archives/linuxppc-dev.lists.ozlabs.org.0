Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451C72F259
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:00:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e2RgK1vx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgpXk63N0z30PY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 12:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e2RgK1vx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=leo.yan@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgpWl6pfDz304l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 11:59:29 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-66643830ab3so251900b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 18:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686707964; x=1689299964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CptATqeseRZ9wnta/kqV0RFXggJlBwVL1UgxNIajgOw=;
        b=e2RgK1vxZSlLTPBqtiSaUZBIa1pYX3TyvB9mmgJfYVdBgv+uVbgWNieVfpID4RRcif
         Rh4aKrtEjMQbFQgL/1cBNFSOCLkJIm6gnJlgU8Sm7S9Qx/+9SjPfFVFylYIi6+1lbdK5
         0FjdUzRVBSxTFZj7AMQI1JkSrViqPraYB37ncZ/dv1/2vOTlVEBSHOUgWjQoWLktLHPw
         /p5w1w9Ffg2h+1tGmiEdfa69l4HvRozyl4o+nqtTpc9PvK5kXL1ea0sQsQsIkr/U1ZGm
         jh7Q0ITCO6NXcmc/6b1iRYJlDKFIoNGqKp//s5NetJgOxZdVgPd9tdT656pwTwyYsks8
         7UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686707965; x=1689299965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CptATqeseRZ9wnta/kqV0RFXggJlBwVL1UgxNIajgOw=;
        b=E5hSigyns6nEatd4D1vOt3xMfqqfAgW7V+Cpa5m76DEPVSmDX934US2JX3FUC8G5dd
         zKcR0PJ0rItRFg98nyOwykacm4kRfoqJHjorrsL8MprCZZx90jPMmIawOQvGmQ90vGwa
         unm/L0HF5y61WrPJF0lFcwAIkwjiLIYgm98Ptq+5FZwpNwu8pcXn0zeI0sjGiyL1H2yz
         zOwzsa/jN/W2nudOuvz5GacMmoP+Ckk7WtEloCYaQaC6lXMiSe5hOerdzgl3TfbIESrf
         qfjXHF2SxcJrHAE8Dw+BrTv6JdggPp3FDqJ2NRizRAShsaJ0FsCa4vhSRZxqlrQeGc45
         9a5g==
X-Gm-Message-State: AC+VfDx0gboS2UAZezVYypnX1ndxRDaL9W7TqL511wx5nq523S6HfTyX
	RkcHhQjEC8qcKMPNK1Tn6irVAQ==
X-Google-Smtp-Source: ACHHUZ7fIQKn6w558fr9elLAW7uFGq15RlsXFxAuykUMeZG/0doPLFqGLG+NTvihGA0DQVkqTDU/EQ==
X-Received: by 2002:a05:6a00:1a45:b0:63a:ea82:b7b7 with SMTP id h5-20020a056a001a4500b0063aea82b7b7mr715343pfv.28.1686707964453;
        Tue, 13 Jun 2023 18:59:24 -0700 (PDT)
Received: from leoy-huanghe.lan ([223.104.5.42])
        by smtp.gmail.com with ESMTPSA id n14-20020a635c4e000000b004fbd91d9716sm9813808pgm.15.2023.06.13.18.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 18:59:23 -0700 (PDT)
Date: Wed, 14 Jun 2023 09:59:14 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH 01/17] perf: get rid of unused import
Message-ID: <20230614015914.GL217089@leoy-huanghe.lan>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-2-atrajeev@linux.vnet.ibm.com>
 <ZIjJYCL38UX9FIl4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIjJYCL38UX9FIl4@kernel.org>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, Sourabh Jain <sourabhjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 04:54:08PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Tue, Jun 13, 2023 at 10:11:29PM +0530, Athira Rajeev escreveu:
> > From: Sourabh Jain <sourabhjain@linux.ibm.com>
> > 
> > Script doesn't use sys library, so remove it.
> 
> Please Cc the persons working on that file, I added Leo to the CC list
> of this message.

Thanks, Arnaldo & Athira.  The change looks good to me.

> Thanks, applied.

Since have applied this patch, it's no need to give my review tag :)

Thanks,
Leo

> - Arnaldo
>  
> > Report by pylint:
> > W0611: Unused import sys (unused-import)
> > 
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> > ---
> >  tools/perf/scripts/python/arm-cs-trace-disasm.py | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/tools/perf/scripts/python/arm-cs-trace-disasm.py b/tools/perf/scripts/python/arm-cs-trace-disasm.py
> > index 4339692a8d0b..d59ff53f1d94 100755
> > --- a/tools/perf/scripts/python/arm-cs-trace-disasm.py
> > +++ b/tools/perf/scripts/python/arm-cs-trace-disasm.py
> > @@ -9,7 +9,6 @@
> >  from __future__ import print_function
> >  import os
> >  from os import path
> > -import sys
> >  import re
> >  from subprocess import *
> >  from optparse import OptionParser, make_option
> > -- 
> > 2.39.1
> > 
> 
> -- 
> 
> - Arnaldo

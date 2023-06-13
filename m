Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B872EC70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 22:02:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dc6JxEdU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgfcD2vb4z3bWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 06:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dc6JxEdU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 465 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 06:02:04 AEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgfbJ2V0Tz2xqW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:02:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1B8F61272;
	Tue, 13 Jun 2023 19:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F50C433F0;
	Tue, 13 Jun 2023 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686686052;
	bh=mJcFbNoDMdxbnPLxc2sZOLisx0d5+7qqgKOXtrG66l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dc6JxEdUkpZAq7X/cRuQMyFR6uHQlB5DVykYfyn66zkco3SNaI5unn9Nlu5MBeWux
	 amAVvzmP5rsOd2GnOcvjKpJgeWpm5bjHxGVxF0NdIV0LKZe9oxw5JNVtz+JKIydyVd
	 MxgCXAdYR0RFrI/uCX2fNfYqOlRg1D8q2MDP/839+e00IDZ3+rfkIt8woZm+Eog1zS
	 RGNNv3KY2rrMDPT1CizsbJgcpXE9m+mAPfuvbOTLS/ZUSoiPwSkuwkHrkkIntZ3QWv
	 C30uCT6v0qnMQPDZq0DToI3Y2pjehZUtu3dYhx39XWmTEhuOVdcmOwUf+I5nWuamNW
	 wbfoJtjNDfJLA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 0FFAC40692; Tue, 13 Jun 2023 16:54:09 -0300 (-03)
Date: Tue, 13 Jun 2023 16:54:08 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH 01/17] perf: get rid of unused import
Message-ID: <ZIjJYCL38UX9FIl4@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-2-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613164145.50488-2-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, Sourabh Jain <sourabhjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jun 13, 2023 at 10:11:29PM +0530, Athira Rajeev escreveu:
> From: Sourabh Jain <sourabhjain@linux.ibm.com>
> 
> Script doesn't use sys library, so remove it.

Please Cc the persons working on that file, I added Leo to the CC list
of this message.

Thanks, applied.

- Arnaldo
 
> Report by pylint:
> W0611: Unused import sys (unused-import)
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  tools/perf/scripts/python/arm-cs-trace-disasm.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/perf/scripts/python/arm-cs-trace-disasm.py b/tools/perf/scripts/python/arm-cs-trace-disasm.py
> index 4339692a8d0b..d59ff53f1d94 100755
> --- a/tools/perf/scripts/python/arm-cs-trace-disasm.py
> +++ b/tools/perf/scripts/python/arm-cs-trace-disasm.py
> @@ -9,7 +9,6 @@
>  from __future__ import print_function
>  import os
>  from os import path
> -import sys
>  import re
>  from subprocess import *
>  from optparse import OptionParser, make_option
> -- 
> 2.39.1
> 

-- 

- Arnaldo

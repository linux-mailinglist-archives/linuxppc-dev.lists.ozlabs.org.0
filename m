Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76B73F647
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 10:00:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqxvt0Fylz2xLN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 18:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=james.clark@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Tue, 27 Jun 2023 17:59:38 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqxvG423Zz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 17:59:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57D222F4;
	Tue, 27 Jun 2023 00:52:49 -0700 (PDT)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC0903F663;
	Tue, 27 Jun 2023 00:52:03 -0700 (PDT)
Message-ID: <334989bf-5501-494c-f246-81878fd2fed8@arm.com>
Date: Tue, 27 Jun 2023 08:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/22] tools/perf/tests: Fix shellcheck warning for
 coresight.sh shell script
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
 <20230621083021.71203-14-atrajeev@linux.vnet.ibm.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20230621083021.71203-14-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: irogers@google.com, maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/06/2023 09:30, Athira Rajeev wrote:
> From: Kajol Jain <kjain@linux.ibm.com>
> 
> Running shellcheck on coresight.sh throws below warning:
> 
> In lib/coresight.sh line 1:
> ^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.
> 
> In lib/coresight.sh line 13:
> PERFRECOPT="$PERFRECMEM -e cs_etm//u"
> ^--------^ SC2034 (warning): PERFRECOPT appears unused. Verify use (or export if used externally).
> 
> Fixed the warnings by:
> - Adding shell directive
> - Using export for PERFRECOPT variable
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  tools/perf/tests/shell/lib/coresight.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/lib/coresight.sh b/tools/perf/tests/shell/lib/coresight.sh
> index 6c3d34ec64d8..c7d97a0186c7 100644
> --- a/tools/perf/tests/shell/lib/coresight.sh
> +++ b/tools/perf/tests/shell/lib/coresight.sh
> @@ -1,3 +1,4 @@
> +#!/bin/bash

There is a comment a couple of lines below this that says the shebang
was excluded for a reason. It's probably worth leaving it excluded or
updating the comment.

>  # SPDX-License-Identifier: GPL-2.0
>  # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
>  
> @@ -10,7 +11,7 @@
>  
>  # perf record options for the perf tests to use
>  PERFRECMEM="-m ,16M"
> -PERFRECOPT="$PERFRECMEM -e cs_etm//u"
> +export PERFRECOPT="$PERFRECMEM -e cs_etm//u"

This might silence the warning, but there are other variables like DATD
that are used in the sub-test scripts in the same way. They just don't
trigger the warning because they're also used in the top level one.

I think this change makes the code more misleading than solving any
problems. The coresight.sh script is sourced in the same process as the
sub tests so exporting variables isn't needed which is why it already
works without this change.

>  
>  TOOLS=$(dirname $0)
>  DIR="$TOOLS/$TEST"

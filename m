Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78355E73F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYhwN4yPTz3cf0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AZ3QT04C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AZ3QT04C;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYhvl3cvqz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:24:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663914291; x=1695450291;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lUrHTRbLjHyO625/uRuGloyeUzUC3gHCDg6hl2k92Ww=;
  b=AZ3QT04C/29DV7K6jlVSPvxAKrAm3jTUVxzS0eRIEEwxbjhAgXiqxFlS
   SCCg/m0ydNJpMsjqDD9U+UPS+8Rdxj/rXX3eoqBTMuyZNEv0uNyBvsa5P
   WnSDwVNRVsFkoM+Zc2ldWTefWvaqaU3MM17PpHDFCTAXLS1fjH3wiozuj
   EiXQcae2nz2urgXlSrg1IQl6aT8r8XqDPTX6RxLc1lm4LtFxFqiLwzj4j
   UfXha9LgB4Z9D5KSs6LnewcynG+E/oc37A8JaSZFHZdn4K5m9IycGwp3P
   qQYa4pIHzFmzvcSZxUUbQEI3sCwNCdTzxTS3ZYCcuHosTKA0pujtZkQgn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283617766"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="283617766"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 23:24:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="682546459"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.60.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 23:24:42 -0700
Message-ID: <444a5a64-7bc6-d5fd-2880-611c5cbca587@intel.com>
Date: Fri, 23 Sep 2022 09:24:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
Content-Language: en-US
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
 <Yyy0W6CnPk7BkkCU@kernel.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <Yyy0W6CnPk7BkkCU@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/22 22:15, Arnaldo Carvalho de Melo wrote:
> Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
>> The perf test named “build id cache operations” skips with below
>> error on some distros:
> 
> I wonder if we shouldn't instead state that bash is needed?
> 
> ⬢[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell/*.sh | grep ^#
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
> ⬢[acme@toolbox perf-urgent]$
> 
> Opinions?
> 

Please don't change tools/perf/tests/shell/test_intel_pt.sh

I started using shellcheck on that with the "perf test: 
test_intel_pt.sh: Add per-thread test" patch set that I sent.

FYI, if you use shellcheck on buildid.sh, it shows up issues even
after changing to bash:

*** Before ***

$ shellcheck -S warning tools/perf/tests/shell/buildid.sh 

In tools/perf/tests/shell/buildid.sh line 69:
        link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
                                       ^-------^ SC2039: In POSIX sh, string indexing is undefined.
                                                 ^-----^ SC2039: In POSIX sh, string indexing is undefined.


In tools/perf/tests/shell/buildid.sh line 77:
        file=${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
                                       ^-------^ SC2039: In POSIX sh, string indexing is undefined.


In tools/perf/tests/shell/buildid.sh line 123:
        echo "running: perf record $@"
                                   ^-- SC2145: Argument mixes string and array. Use * or separate argument.


In tools/perf/tests/shell/buildid.sh line 124:
        ${perf} record --buildid-all -o ${data} $@ &> ${log}
                                                ^-- SC2068: Double quote array expansions to avoid re-splitting elements.
                                                   ^-------^ SC2039: In POSIX sh, &> is undefined.


In tools/perf/tests/shell/buildid.sh line 126:
                echo "failed: record $@"
                                     ^-- SC2145: Argument mixes string and array. Use * or separate argument.


In tools/perf/tests/shell/buildid.sh line 131:
        check ${@: -1}
              ^------^ SC2068: Double quote array expansions to avoid re-splitting elements.
              ^------^ SC2039: In POSIX sh, string indexing is undefined.


In tools/perf/tests/shell/buildid.sh line 158:
exit ${err}
     ^----^ SC2154: err is referenced but not assigned.

For more information:
  https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions to ...
  https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and array. ...
  https://www.shellcheck.net/wiki/SC2039 -- In POSIX sh, &> is undefined.

*** After ***

$ shellcheck -S warning tools/perf/tests/shell/buildid.sh 

In tools/perf/tests/shell/buildid.sh line 123:
        echo "running: perf record $@"
                                   ^-- SC2145: Argument mixes string and array. Use * or separate argument.


In tools/perf/tests/shell/buildid.sh line 124:
        ${perf} record --buildid-all -o ${data} $@ &> ${log}
                                                ^-- SC2068: Double quote array expansions to avoid re-splitting elements.


In tools/perf/tests/shell/buildid.sh line 126:
                echo "failed: record $@"
                                     ^-- SC2145: Argument mixes string and array. Use * or separate argument.


In tools/perf/tests/shell/buildid.sh line 131:
        check ${@: -1}
              ^------^ SC2068: Double quote array expansions to avoid re-splitting elements.


In tools/perf/tests/shell/buildid.sh line 158:
exit ${err}
     ^----^ SC2154: err is referenced but not assigned.

For more information:
  https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions to ...
  https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and array. ...
  https://www.shellcheck.net/wiki/SC2154 -- err is referenced but not assigned.

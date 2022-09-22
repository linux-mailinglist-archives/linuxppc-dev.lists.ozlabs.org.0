Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586015E6B98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 21:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYQ4Q1Hdgz3cFN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:16:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pVVKccNB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pVVKccNB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYQ3l3Z65z3bqv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 05:15:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEF1263779;
	Thu, 22 Sep 2022 19:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11CDC433D6;
	Thu, 22 Sep 2022 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663874142;
	bh=JgJGQpDDZsyxeVgT7WB9JRy9J8IQDarTU3rm4wlJv1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVVKccNBXS/kaetzvZDmd0Kte1GFJLmH+q/HhuhnZESnsxZQQsWaMK3yTrTcfSMHD
	 Tq37iI23hvluPNtIvOznlZ2NEBRzaIceTNSqsXZmiY5ejhvvhAI1xB/Rj08qE9HKv8
	 n3lbdd6xvcktTuTP6+ZW1OXYCiFD20pK6wT+ZzdVL0H9cBLF2/gUydkG80AhQ6ReJj
	 BaqE3fwCnD8UuCMVzrcwpE6XnAAtgY0u2vfFXzmGdpqUEoIfvLEeQ+fFcFHA1I1lrD
	 wXuOc4J6B2d4iMyScK5rsSRDggOWxsv486WVWuepHfM9nqoI3l0CMCGeZNX3cji/9i
	 MwZicfhW6A1iw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 78C7F403B0; Thu, 22 Sep 2022 20:15:39 +0100 (IST)
Date: Thu, 22 Sep 2022 20:15:39 +0100
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
Message-ID: <Yyy0W6CnPk7BkkCU@kernel.org>
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
> The perf test named “build id cache operations” skips with below
> error on some distros:

I wonder if we shouldn't instead state that bash is needed?

⬢[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell/*.sh | grep ^#
#!/bin/sh
#!/bin/bash
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/bash
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/bash
#!/bin/sh
#!/bin/bash
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
#!/bin/sh
⬢[acme@toolbox perf-urgent]$

Opinions?

- Arnaldo
 
> <<>>
>  78: build id cache operations                                       :
> test child forked, pid 111101
> WARNING: wine not found. PE binaries will not be run.
> test binaries: /tmp/perf.ex.SHA1.PKz /tmp/perf.ex.MD5.Gt3 ./tests/shell/../pe-file.exe
> DEBUGINFOD_URLS=
> Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.PKz: Ok
> build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
> ./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitution
> test child finished with -2
> build id cache operations: Skip
> <<>>
> 
> The test script "tests/shell/buildid.sh" uses some of the
> string substitution ways which are supported in bash, but not in
> "sh" or other shells. Above error on line number 69 that reports
> "Bad substitution" is:
> 
> <<>>
> link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
> <<>>
> 
> Here the way of getting first two characters from id ie,
> ${id:0:2} and similarly expressions like ${id:2} is not
> recognised in "sh". So the line errors and instead of
> hitting failure, the test gets skipped as shown in logs.
> So the syntax issue causes test not to be executed in
> such cases. Similarly usage : "${@: -1}" [ to pick last
> argument passed to a function] in “test_record” doesn’t
> work in all distros.
> 
> Fix this by using alternative way with "cut" command
> to pick "n" characters from the string. Also fix the usage
> of “${@: -1}” to work in all cases.
> 
> Another usage in “test_record” is:
> <<>>
> ${perf} record --buildid-all -o ${data} $@ &> ${log}
> <<>>
> 
> This causes the perf record to start in background and
> Results in the data file not being created by the time
> "check" function is invoked. Below log shows perf record
> result getting displayed after the call to "check" function.
> 
> <<>>
> running: perf record /tmp/perf.ex.SHA1.EAU
> build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
> link: /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb
> failed: link /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb does not exist
> test child finished with -1
> build id cache operations: FAILED!
> root@machine:~/athira/linux/tools/perf# Couldn't synthesize bpf events.
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.010 MB /tmp/perf.data.bFF ]
> <<>>
> 
> Fix this by redirecting output instead of using “&” which
> starts the command in background.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/buildid.sh | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
> index f05670d1e39e..3512c4423d48 100755
> --- a/tools/perf/tests/shell/buildid.sh
> +++ b/tools/perf/tests/shell/buildid.sh
> @@ -66,7 +66,7 @@ check()
>  	esac
>  	echo "build id: ${id}"
>  
> -	link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
> +	link=${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/$(echo ${id}|cut -c 3-)
>  	echo "link: ${link}"
>  
>  	if [ ! -h $link ]; then
> @@ -74,7 +74,7 @@ check()
>  		exit 1
>  	fi
>  
> -	file=${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
> +	file=${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/`readlink ${link}`/elf
>  	echo "file: ${file}"
>  
>  	if [ ! -x $file ]; then
> @@ -117,20 +117,22 @@ test_record()
>  {
>  	data=$(mktemp /tmp/perf.data.XXX)
>  	build_id_dir=$(mktemp -d /tmp/perf.debug.XXX)
> -	log=$(mktemp /tmp/perf.log.XXX)
> +	log_out=$(mktemp /tmp/perf.log.out.XXX)
> +	log_err=$(mktemp /tmp/perf.log.err.XXX)
>  	perf="perf --buildid-dir ${build_id_dir}"
> +	eval last=\${$#}
>  
>  	echo "running: perf record $@"
> -	${perf} record --buildid-all -o ${data} $@ &> ${log}
> +	${perf} record --buildid-all -o ${data} $@ 1>${log_out} 2>${log_err}
>  	if [ $? -ne 0 ]; then
>  		echo "failed: record $@"
> -		echo "see log: ${log}"
> +		echo "see log: ${log_err}"
>  		exit 1
>  	fi
>  
> -	check ${@: -1}
> +	check $last
>  
> -	rm -f ${log}
> +	rm -f ${log_out} ${log_err}
>  	rm -rf ${build_id_dir}
>  	rm -rf ${data}
>  }
> -- 
> 2.17.1

-- 

- Arnaldo

Return-Path: <linuxppc-dev+bounces-5457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A27DA18155
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 16:47:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycs5Z72y9z30Kg;
	Wed, 22 Jan 2025 02:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::bb"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737474418;
	cv=none; b=oKEWa16D1OkpPjWrfYi6Nl0ROWOjqyCzx08+t40tUX2nm59JvnJp3uGaDtoATypXWzhN2JNRVqP0sMbQfQkpR+xPHIHqDQ0RO98DRJHA5WN2bLGyN3fHtg1ifr5WNkxQWoEgCAV2F1PVGPt7TiZu7UQP+PoUVKbimv1PYpjeTUWYTxcNjKHtoHYow1tQHfkxWR4baUysmgVuQqpuj+FORf/xW7rZpvG0P2rGm0C5kEQKYVjBVg1xZlfGNLlPY3jxfe5jM/BNevgruTTSwnLsqvM3xOhqht4/ByIvm4iyS3Cl4sEKCsFZBl3nR8Gx53IQHUEut9L1SXIxWt+45nm2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737474418; c=relaxed/relaxed;
	bh=udA8JggagAJP1CCzeg7Vekhu/UmA/lRvh6yXXvJFf1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTRdaYjm3E2qgYAmdOstys58pyKALFEKG/ZkEdQesAFgFPcYF4BggIgLZ0mKdKzHe2bfgV3dorJ/ahKQssAKoq7v9yDbhD3BVKKdRrJ7ya5FEjAUIqc2OhxcSrnmgHc7+D7K36bqUHd3Kj+HTCfhh7gxorQ6JGeFixxoY6kie46oh2xxsKI+9D2vkZzhHoRWliT0TJM1LMbc6m9vtqCRKG+YAJMv9+UkiIZQIv4QHjOzM+8HR45HARRMKJA6KgrfgAOQr2NN6WcZm6AZvPgutWocTQZpGdUdKbVbMzhgh1xHp3GipSOulNs9S5Lj4FxCNq9UNhaWUcI4ekeVH2xfgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::bb; helo=out-187.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::bb; helo=out-187.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bb])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycs5S1d6Qz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 02:46:49 +1100 (AEDT)
Date: Tue, 21 Jan 2025 16:46:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737474387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udA8JggagAJP1CCzeg7Vekhu/UmA/lRvh6yXXvJFf1k=;
	b=wyEI24cwFn/2SwnlrYJNsedCvXcu1OErKkpuVcynU6RgbSJLXlGwdYlCavdBXZgGUQjG7v
	7nJ7yr9z5NxYNO9Oh6Xcq6ZgaYL4DDkiGbXw9w+UDPiGpwdVz1H4QfuenjOVrwsfae4IhX
	volbSCuXEznlwkkvWfCPgEfeJbira3U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 04/18] run_tests: Introduce unittest
 parameter 'qemu_params'
Message-ID: <20250121-82874afe4e52c828d21e7da2@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-5-alexandru.elisei@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-5-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:02PM +0000, Alexandru Elisei wrote:
> Tests for the arm and arm64 architectures can also be run with kvmtool, and
> work is under way to have it supported by the run_tests.sh test runner. Not
> suprisingly, kvmtool has a different syntax than qemu when configuring and
> running a virtual machine.
> 
> Add a new unittest parameter, 'qemu_params', with the goal to add a similar
> parameter for each virtual machine manager that run_tests.sh supports.
> 
> 'qemu_params' and 'extra_params' are interchangeable, but it is expected
> that going forward new tests will use 'qemu_params'. A test should have
> only one of the two parameters.
> 
> While we're at it, rename the variable opts to qemu_opts to match the new
> unit configuration name, and to make it easier to distinguish from the
> kvmtool parameters when they'll be added.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  docs/unittests.txt   | 17 +++++++++-----
>  scripts/common.bash  | 53 ++++++++++++++++++++++++++------------------
>  scripts/runtime.bash | 10 ++++-----
>  3 files changed, 47 insertions(+), 33 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index dbc2c11e3b59..3e1a9e563016 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -24,9 +24,9 @@ param = value format.
>  
>  Available parameters
>  ====================
> -Note! Some parameters like smp and extra_params modify how a test is run,
> -while others like arch and accel restrict the configurations in which the
> -test is run.
> +Note! Some parameters like smp and qemu_params/extra_params modify how a
> +test is run, while others like arch and accel restrict the configurations
> +in which the test is run.
>  
>  file
>  ----
> @@ -56,13 +56,18 @@ smp = <number>
>  Optional, the number of processors created in the machine to run the test.
>  Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
>  
> -extra_params
> -------------
> +qemu_params
> +-----------
>  These are extra parameters supplied to the QEMU process. -append '...' can
>  be used to pass arguments into the test case argv. Multiple parameters can
>  be added, for example:
>  
> -extra_params = -m 256 -append 'smp=2'
> +qemu_params = -m 256 -append 'smp=2'
> +
> +extra_params
> +------------
> +Alias for 'qemu_params', supported for compatibility purposes. Use
> +'qemu_params' for new tests.
>  
>  groups
>  ------
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 3aa557c8c03d..a40c28121b6a 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -1,5 +1,28 @@
>  source config.mak
>  
> +function parse_opts()
> +{
> +	local opts="$1"
> +	local fd="$2"
> +
> +	while read -r -u $fd; do
> +		#escape backslash newline, but not double backslash
> +		if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> +			if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> +				opts=${opts%\\$'\n'}
> +			fi
> +		fi
> +		if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> +			opts+=${BASH_REMATCH[1]}
> +			break
> +		else
> +			opts+=$REPLY$'\n'
> +		fi
> +	done
> +
> +	echo "$opts"
> +}
> +
>  function for_each_unittest()
>  {
>  	local unittests="$1"
> @@ -7,7 +30,7 @@ function for_each_unittest()
>  	local testname
>  	local smp
>  	local kernel
> -	local opts
> +	local qemu_opts
>  	local groups
>  	local arch
>  	local machine
> @@ -22,12 +45,12 @@ function for_each_unittest()
>  		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>  			rematch=${BASH_REMATCH[1]}
>  			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>  			fi
>  			testname=$rematch
>  			smp=1
>  			kernel=""
> -			opts=""
> +			qemu_opts=""
>  			groups=""
>  			arch=""
>  			machine=""
> @@ -38,24 +61,10 @@ function for_each_unittest()
>  			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
>  			smp=${BASH_REMATCH[1]}
> -		elif [[ $line =~ ^extra_params\ *=\ *'"""'(.*)$ ]]; then
> -			opts=${BASH_REMATCH[1]}$'\n'
> -			while read -r -u $fd; do
> -				#escape backslash newline, but not double backslash
> -				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> -					if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> -						opts=${opts%\\$'\n'}
> -					fi
> -				fi
> -				if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> -					opts+=${BASH_REMATCH[1]}
> -					break
> -				else
> -					opts+=$REPLY$'\n'
> -				fi
> -			done
> -		elif [[ $line =~ ^extra_params\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[1]}
> +		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> +			qemu_opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> +		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> +			qemu_opts=${BASH_REMATCH[2]}
>  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>  			groups=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> @@ -71,7 +80,7 @@ function for_each_unittest()
>  		fi
>  	done
>  	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>  	fi
>  	exec {fd}<&-
>  }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 4b9c7d6b7c39..e5d661684ceb 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,7 @@ premature_failure()
>  get_cmdline()
>  {
>      local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $qemu_opts"
>  }
>  
>  skip_nodefault()
> @@ -80,7 +80,7 @@ function run()
>      local groups="$2"
>      local smp="$3"
>      local kernel="$4"
> -    local opts="$5"
> +    local qemu_opts="$5"
>      local arch="$6"
>      local machine="$7"
>      local check="${CHECK:-$8}"
> @@ -179,9 +179,9 @@ function run()
>          echo $cmdline
>      fi
>  
> -    # extra_params in the config file may contain backticks that need to be
> -    # expanded, so use eval to start qemu.  Use "> >(foo)" instead of a pipe to
> -    # preserve the exit status.
> +    # qemu_params/extra_params in the config file may contain backticks that
> +    # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
> +    # a pipe to preserve the exit status.
>      summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
>                               > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
>      ret=$?
> -- 
> 2.47.1
>

Hmm, I'll keep reading the series, but it seems like we should be choosing
generic names like 'extra_params' and 'opts' that we plan to use for both
QEMU and kvmtool since they both have the concepts of "options" and "extra
params".

Thanks,
drew


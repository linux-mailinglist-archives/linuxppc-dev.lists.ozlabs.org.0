Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF18217320
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 17:59:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Rv32HgKzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 01:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=hi1xixph; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1RTl379YzDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 01:40:20 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 18so34603005otv.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oj28Kot+IsEAp6H+o6ZsPIep4haJkGspP9htMzUfwSk=;
 b=hi1xixpho5Xzu/KOaIXQgfv0+qDphSriYbhEQVcYmBZ6QGZhb3zHY9CqieJXJxnz0k
 WnxLhggH6rtmdYvZ6kWENsKI606/1Sb+AYo1F9I+7lrYklExCXDl0n1Mc+gZduj4mdB7
 P5RfgBi0WiexzrNkoYNAliORli/uLLxOOUtqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oj28Kot+IsEAp6H+o6ZsPIep4haJkGspP9htMzUfwSk=;
 b=G681TUnwmj6QjTYCAA964su0rB9bBaX/wO0ge7joUxMMxC6M6PEBzZxz8X+pOLXAjx
 1KQ0DUJGznwPIH80353ei3+GY0OZU97FWtdmSP5yapHNOmWf+DmyNDBtBmjyPMtlw/VG
 QcahA2kzGyF5NnzZ3jbbJ9i1x/zD/fuM0LoX7AaRgyDVNChlnygn2fR2iaOtTrIagveP
 I17ZmlGFBPbVj/aGBweai27yyfgThzu6s9PMeBdgU4wHDQ3IxyOFDMfmE98NNkNL9x5L
 +1dbhzSktiWceZ01ey7U0QVK17YmTnNyxL8aRpAOmwbeMM4xvdrgQr0CGmaHryn5NkCe
 aBng==
X-Gm-Message-State: AOAM532DBuL0xRHBM/O6bVBWi1Mg5icokV7nzZ+52gisxp2Rhr0mjWRh
 biNQ83Z46hF34kqi9XD8VQXDfw==
X-Google-Smtp-Source: ABdhPJwN/tcqJoUigJ8V1/q3fPHim8u1aRx+TBlHEbAi22JSTrg1zA0Zw4/v2sxh7ZKtAnIv/Rx3Wg==
X-Received: by 2002:a9d:7cc8:: with SMTP id r8mr17263974otn.209.1594136416384; 
 Tue, 07 Jul 2020 08:40:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y7sm204499oov.26.2020.07.07.08.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 08:40:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] selftest/cpuidle: Add support for cpuidle latency
 measurement
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, rjw@rjwysocki.net,
 daniel.lezcano@linaro.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, srivatsa@csail.mit.edu, shuah@kernel.org,
 ego@linux.vnet.ibm.com, svaidy@linux.ibm.com, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20200707152917.10652-1-psampat@linux.ibm.com>
 <20200707152917.10652-3-psampat@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bf016b30-18e6-69fd-afc5-5319ebd6a890@linuxfoundation.org>
Date: Tue, 7 Jul 2020 09:40:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707152917.10652-3-psampat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/7/20 9:29 AM, Pratik Rajesh Sampat wrote:
> This patch adds support to trace IPI based and timer based wakeup
> latency from idle states
> 
> Latches onto the test-cpuidle_latency kernel module using the debugfs
> interface to send IPIs or schedule a timer based event, which in-turn
> populates the debugfs with the latency measurements.
> 
> Currently for the IPI and timer tests; first disable all idle states
> and then test for latency measurements incrementally enabling each state
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>   tools/testing/selftests/Makefile           |   1 +
>   tools/testing/selftests/cpuidle/Makefile   |   6 +
>   tools/testing/selftests/cpuidle/cpuidle.sh | 240 +++++++++++++++++++++
>   tools/testing/selftests/cpuidle/settings   |   1 +
>   4 files changed, 248 insertions(+)
>   create mode 100644 tools/testing/selftests/cpuidle/Makefile
>   create mode 100755 tools/testing/selftests/cpuidle/cpuidle.sh
>   create mode 100644 tools/testing/selftests/cpuidle/settings
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 1195bd85af38..ab6cf51f3518 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -7,6 +7,7 @@ TARGETS += capabilities
>   TARGETS += cgroup
>   TARGETS += clone3
>   TARGETS += cpufreq
> +TARGETS += cpuidle
>   TARGETS += cpu-hotplug
>   TARGETS += drivers/dma-buf
>   TARGETS += efivarfs
> diff --git a/tools/testing/selftests/cpuidle/Makefile b/tools/testing/selftests/cpuidle/Makefile
> new file mode 100644
> index 000000000000..72fd5d2e974d
> --- /dev/null
> +++ b/tools/testing/selftests/cpuidle/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +all:
> +
> +TEST_PROGS := cpuidle.sh
> +
> +include ../lib.mk
> diff --git a/tools/testing/selftests/cpuidle/cpuidle.sh b/tools/testing/selftests/cpuidle/cpuidle.sh
> new file mode 100755
> index 000000000000..11666fe47c34
> --- /dev/null
> +++ b/tools/testing/selftests/cpuidle/cpuidle.sh
> @@ -0,0 +1,240 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +LOG=cpuidle.log
> +MODULE=/lib/modules/$(uname -r)/kernel/drivers/cpuidle/test-cpuidle_latency.ko
> +
> +helpme()
> +{
> +	printf "Usage: $0 [-h] [-todg args]
> +	[-h <help>]
> +	[-m <location of the module>]
> +	[-o <location of the output>]
> +	\n"
> +	exit 2
> +}
> +
> +parse_arguments()
> +{
> +	while getopts ht:m:o: arg
> +	do
> +		case $arg in
> +			h) # --help
> +				helpme
> +				;;
> +			m) # --mod-file
> +				MODULE=$OPTARG
> +				;;
> +			o) # output log files
> +				LOG=$OPTARG
> +				;;
> +			\?)
> +				helpme
> +				;;
> +		esac
> +	done
> +}
> +
> +ins_mod()
> +{
> +	if [ ! -f "$MODULE" ]; then
> +		printf "$MODULE module does not exist. Exitting\n"
> +		exit 2

Please use ksft_skip code to indicate the test is being skipped.

> +	fi
> +	printf "Inserting $MODULE module\n\n"
> +	insmod $MODULE
> +	if [ $? != 0 ]; then
> +		printf "Insmod $MODULE failed\n"
> +		exit 2

This is fine since you expect to be able to load the module.

> +	fi
> +}
> +
> +compute_average()
> +{
> +	arr=("$@")
> +	sum=0
> +	size=${#arr[@]}
> +	for i in "${arr[@]}"
> +	do
> +		sum=$((sum + i))
> +	done
> +	avg=$((sum/size))
> +}
> +
> +# Disable all stop states
> +disable_idle()
> +{
> +	for ((cpu=0; cpu<NUM_CPUS; cpu++))
> +	do
> +		for ((state=0; state<NUM_STATES; state++))
> +		do
> +			echo 1 > /sys/devices/system/cpu/cpu$cpu/cpuidle/state$state/disable
> +		done
> +	done
> +}
> +
> +# Enable the idle state supplied
> +# $1: State to enable
> +enable_state()
> +{
> +	for ((cpu=0; cpu<NUM_CPUS; cpu++))
> +	do
> +		echo 0 > /sys/devices/system/cpu/cpu$cpu/cpuidle/state$1/disable
> +	done
> +}
> +
> +# Extract latency in microseconds and convert to nanoseconds
> +extract_latency()
> +{
> +	for ((state=0; state<NUM_STATES; state++))
> +	do
> +		latency=$(($(cat /sys/devices/system/cpu/cpu0/cpuidle/state$state/latency) * 1000))
> +		latency_arr+=($latency)
> +	done
> +}
> +
> +# Run the IPI test
> +# $1 run for baseline - busy cpu or regular environment
> +# $2 destination cpu
> +ipi_test_once()
> +{
> +        dest_cpu=$2
> +        if [ "$1" = "baseline" ]; then
> +			# Keep the CPU busy
> +			taskset -c $dest_cpu yes "" > /dev/null &
> +			yes_pid=$!
> +        fi
> +        taskset 0x1 echo $dest_cpu > /sys/kernel/debug/latency_test/ipi_cpu_dest
> +        ipi_latency=$(cat /sys/kernel/debug/latency_test/ipi_latency_ns)
> +        src_cpu=$(cat /sys/kernel/debug/latency_test/ipi_cpu_src)
> +        if [ "$1" = "baseline" ]; then
> +			kill $yes_pid
> +			wait $yes_pid 2>/dev/null
> +        fi
> +}
> +
> +# Incrementally Enable idle states one by one and compute the latency
> +run_ipi_tests()
> +{
> +        extract_latency
> +        disable_idle
> +        declare -a avg_arr
> +        declare -a baseline_avg_array
> +
> +        echo -e "--IPI Latency Test---" >> $LOG
> +        for ((state=0; state<NUM_STATES; state++))
> +        do
> +			echo -e "---Enabling state: $state---" >> $LOG
> +			enable_state $state
> +			printf "%s %10s %12s %12s\n" "SRC_CPU" "DEST_CPU" "Base_IPI_Latency(ns)" "IPI_Latency(ns)" >> $LOG
> +			unset avg_arr
> +			unset baseline_avg_arr
> +			for ((cpu=0; cpu<NUM_CPUS; cpu++))
> +			do
> +				# Running IPI test and logging results
> +				ipi_test_once "baseline" $cpu
> +				baseline_ipi_latency=$ipi_latency
> +				ipi_test_once "test" $cpu
> +				printf "%-3s %10s %12s %18s\n" $src_cpu $cpu $baseline_ipi_latency $ipi_latency >> $LOG
> +				avg_arr+=($ipi_latency)
> +				baseline_avg_arr+=($baseline_ipi_latency)
> +			done
> +			compute_average "${avg_arr[@]}"
> +			local avg_latency=$avg
> +			compute_average "${baseline_avg_arr[@]}"
> +			local baseline_avg_latency=$avg
> +			echo -e "Expected IPI latency(ns): ${latency_arr[$state]}" >> $LOG
> +			echo -e "Baseline Average IPI latency(ns): $baseline_avg_latency" >> $LOG
> +			echo -e "Observed Average IPI latency(ns): $avg_latency" >> $LOG
> +        done
> +}
> +
> +# Extract the residency in microseconds and convert to nanoseconds.
> +# Add 100 ns so that the timer stays for a little longer than the residency
> +extract_residency()
> +{
> +	for ((state=0; state<NUM_STATES; state++))
> +	do
> +		residency=$(($(cat /sys/devices/system/cpu/cpu0/cpuidle/state$state/residency) * 1000 + 200))
> +		residency_arr+=($residency)
> +	done
> +}
> +
> +# Run the Timeout test
> +# $1 run for baseline - busy cpu or regular environment
> +# $2 destination cpu
> +# $3 timeout
> +timeout_test_once()
> +{
> +	dest_cpu=$2
> +	if [ "$1" = "baseline" ]; then
> +		# Keep the CPU busy
> +		taskset -c $dest_cpu yes "" > /dev/null &
> +		yes_pid=$!
> +	fi
> +	taskset -c $dest_cpu echo $3 > /sys/kernel/debug/latency_test/timeout_expected_ns
> +	sleep 0.1
> +	timeout_diff=$(cat /sys/kernel/debug/latency_test/timeout_diff_ns)
> +	src_cpu=$(cat /sys/kernel/debug/latency_test/timeout_cpu_src)
> +	if [ "$1" = "baseline" ]; then
> +		kill $yes_pid
> +		wait $yes_pid 2>/dev/null
> +	fi
> +}
> +
> +run_timeout_tests()
> +{
> +	extract_residency
> +	disable_idle
> +	declare -a avg_arr
> +	declare -a baseline_avg_arr
> +	echo -e "\n--Timeout Latency Test--" >> $LOG
> +
> +	for ((state=0; state<NUM_STATES; state++))
> +	do
> +		echo -e "---Enabling state: $state---" >> $LOG
> +		enable_state $state
> +		printf "%s %10s %10s\n" "Wakeup_src" "Baseline_delay(ns)" "Delay(ns)" >> $LOG
> +		unset avg_arr
> +		unset baseline_avg_arr
> +		for ((cpu=0; cpu<NUM_CPUS; cpu++))
> +		do
> +			timeout_test_once "baseline" $cpu ${residency_arr[$state]}
> +			local baseline_timeout_diff=$timeout_diff
> +			timeout_test_once "test" $cpu ${residency_arr[$state]}
> +			printf "%-3s %13s %18s\n" $src_cpu $baseline_timeout_diff $timeout_diff >> $LOG
> +			avg_arr+=($timeout_diff)
> +			baseline_avg_arr+=($baseline_timeout_diff)
> +		done
> +		compute_average "${baseline_avg_arr[@]}"
> +		local baseline_avg=$avg
> +		compute_average "${avg_arr[@]}"
> +		echo -e "Expected timeout(ns): ${residency_arr[$state]}" >> $LOG
> +		echo -e "Baseline Average timeout diff(ns): $baseline_avg" >> $LOG
> +		echo -e "Observed Average timeout diff(ns): $avg" >> $LOG
> +	done
> +}
> +
> +declare -a residency_arr
> +declare -a latency_arr
> +
> +# Parse arguments
> +parse_arguments $@
> +
> +rm -f $LOG
> +touch $LOG
> +NUM_CPUS=$(nproc --all)
> +NUM_STATES=$(ls -1 /sys/devices/system/cpu/cpu0/cpuidle/ | wc -l)
> +
> +# Insert the module
> +ins_mod $MODULE
> +
> +printf "Started IPI latency tests\n"
> +run_ipi_tests
> +
> +printf "Started Timer latency tests\n"
> +run_timeout_tests
> +
> +printf "Removing $MODULE module\n"
> +printf "Output logged at: $LOG\n"
> +rmmod $MODULE
> diff --git a/tools/testing/selftests/cpuidle/settings b/tools/testing/selftests/cpuidle/settings
> new file mode 100644
> index 000000000000..e7b9417537fb
> --- /dev/null
> +++ b/tools/testing/selftests/cpuidle/settings
> @@ -0,0 +1 @@
> +timeout=0
> 

thanks,
-- Shuah

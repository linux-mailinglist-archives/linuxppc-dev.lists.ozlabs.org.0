Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A9190B32E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 17:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2tPF6mFcz3g4p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:01:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=james.clark@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2tNs0Fbxz3g1j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 01:00:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F7CEDA7;
	Mon, 17 Jun 2024 08:00:35 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A9E03F6A8;
	Mon, 17 Jun 2024 08:00:08 -0700 (PDT)
Message-ID: <588beeaf-2015-40f4-a34b-e36556e20707@arm.com>
Date: Mon, 17 Jun 2024 16:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/perf: Handle perftool-testsuite_probe testcases
 fail when kernel debuginfo is not present
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, adrian.hunter@intel.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/06/2024 13:21, Athira Rajeev wrote:
> Running "perftool-testsuite_probe" fails as below:
> 
> 	./perf test -v "perftool-testsuite_probe"
> 	83: perftool-testsuite_probe  : FAILED
> 
> There are three fails:
> 
> 1. Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
>    -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added probe :: perf probe -l (output regexp parsing)
> 

On a machine where NO_DEBUGINFO gets set, this one skips for me. But on
a machine where there _is_ debug info this test still fails.

But in both cases the probe looks like it was added successfully. So I'm
wondering if this one does need to be skipped, or it's just always
failing? Do you have this test passing anywhere where there is debug info?

The list command looks like it successfully lists the probe for me in
both cases, it just doesn't have an address on the end:

 perf list 'probe:*'

   probe:inode_permission (on inode_permission)

Does the missing address mean anything or is it just not handled
properly by the test?

Ironically the machine that _does_ pass the debug info test also prints
this, but it looks like it still adds and lists the probe correctly:

  perf probe -l probe:*

  Failed to find debug information for address 0xffff80008047ac30
    probe:inode_permission (on inode_permission)


> 2. Regexp not found: "probe:vfs_mknod"
>    Regexp not found: "probe:vfs_create"
>    Regexp not found: "probe:vfs_rmdir"
>    Regexp not found: "probe:vfs_link"
>    Regexp not found: "probe:vfs_write"
>    -- [ FAIL ] -- perf_probe :: test_adding_kernel :: wildcard adding support (command exitcode + output regexp parsing)
> 
> 3. Regexp not found: "Failed to find"
>    Regexp not found: "somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
>    Regexp not found: "in this function|at this address"
>    Line did not match any pattern: "The /boot/vmlinux file has no debug information."
>    Line did not match any pattern: "Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo package."
> 
> These three tests depends on kernel debug info.
> 1. Fail 1 expects file name along with probe which needs debuginfo
> 2. Fail 2 :
>     perf probe -nf --max-probes=512 -a 'vfs_* $params'
>     Debuginfo-analysis is not supported.
>      Error: Failed to add events.
> 
> 3. Fail 3 :
>    perf probe 'vfs_read somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64'
>    Debuginfo-analysis is not supported.
>    Error: Failed to add events.
> 
> There is already helper function skip_if_no_debuginfo in
> lib/probe_vfs_getname.sh which does perf probe and returns
> "2" if debug info is not present. Use the skip_if_no_debuginfo
> function and skip only the three tests which needs debuginfo
> based on the result.
> 
> With the patch:
> 
>     83: perftool-testsuite_probe:
>    --- start ---
>    test child forked, pid 3927
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_permission ::
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_permission :: -a
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_permission :: --add
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added probe :: perf list
>    Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
>    -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due to missing debuginfo :: testcase skipped
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added probe
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added probe
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing removed probe (should NOT be listed)
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: adding probe
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes :: first probe adding
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes :: second probe adding (without force)
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes :: second probe adding (with force)
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled probe
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing multiple probes
>    Regexp not found: "probe:vfs_mknod"
>    Regexp not found: "probe:vfs_create"
>    Regexp not found: "probe:vfs_rmdir"
>    Regexp not found: "probe:vfs_link"
>    Regexp not found: "probe:vfs_write"
>    -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due to missing debuginfo :: testcase skipped
>    Regexp not found: "Failed to find"
>    Regexp not found: "somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
>    Regexp not found: "in this function|at this address"
>    Line did not match any pattern: "The /boot/vmlinux file has no debug information."
>    Line did not match any pattern: "Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo package."
>    -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due to missing debuginfo :: testcase skipped
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with retval :: add
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with retval :: record
>    -- [ PASS ] -- perf_probe :: test_adding_kernel :: function argument probing :: script
>    ## [ PASS ] ## perf_probe :: test_adding_kernel SUMMARY
>    ---- end(0) ----
>    83: perftool-testsuite_probe                                        : Ok
> 
> Only the three specific tests are skipped and remaining
> ran successfully.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  .../shell/base_probe/test_adding_kernel.sh    | 31 +++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> index 63bb8974b38e..187dc8d4b163 100755
> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> @@ -21,8 +21,18 @@
>  THIS_TEST_NAME=`basename $0 .sh`
>  TEST_RESULT=0
>  
> +# shellcheck source=lib/probe_vfs_getname.sh
> +. "$(dirname "$0")/../lib/probe_vfs_getname.sh"
> +
>  TEST_PROBE=${TEST_PROBE:-"inode_permission"}
>  
> +# set NO_DEBUGINFO to skip testcase if debuginfo is not present
> +# skip_if_no_debuginfo returns 2 if debuginfo is not present
> +skip_if_no_debuginfo
> +if [ $? -eq 2 ]; then
> +	NO_DEBUGINFO=1
> +fi
> +
>  check_kprobes_available
>  if [ $? -ne 0 ]; then
>  	print_overall_skipped
> @@ -67,7 +77,12 @@ PERF_EXIT_CODE=$?
>  ../common/check_all_patterns_found.pl "\s*probe:${TEST_PROBE}(?:_\d+)?\s+\(on ${TEST_PROBE}(?:[:\+]$RE_NUMBER_HEX)?@.+\)" < $LOGS_DIR/adding_kernel_list-l.log
>  CHECK_EXIT_CODE=$?
>  
> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added probe :: perf probe -l"
> +if [ $NO_DEBUGINFO ] ; then
> +	print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to missing debuginfo"
> +else
> +	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added probe :: perf probe -l"
> +fi
> +
>  (( TEST_RESULT += $? ))
>  
>  
> @@ -208,7 +223,12 @@ PERF_EXIT_CODE=$?
>  ../common/check_all_patterns_found.pl "probe:vfs_mknod" "probe:vfs_create" "probe:vfs_rmdir" "probe:vfs_link" "probe:vfs_write" < $LOGS_DIR/adding_kernel_adding_wildcard.err
>  CHECK_EXIT_CODE=$?
>  
> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding support"
> +if [ $NO_DEBUGINFO ] ; then
> +	print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to missing debuginfo"
> +else
> +	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding support"
> +fi
> +
>  (( TEST_RESULT += $? ))
>  
>  
> @@ -232,7 +252,12 @@ CHECK_EXIT_CODE=$?
>  ../common/check_no_patterns_found.pl "$RE_SEGFAULT" < $LOGS_DIR/adding_kernel_nonexisting.err
>  (( CHECK_EXIT_CODE += $? ))
>  
> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing variable"
> +if [ $NO_DEBUGINFO ]; then
> +	print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to missing debuginfo"
> +else
> +	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing variable"
> +fi
> +
>  (( TEST_RESULT += $? ))
>  
>  

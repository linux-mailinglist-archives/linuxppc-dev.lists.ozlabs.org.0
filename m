Return-Path: <linuxppc-dev+bounces-2343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400D9A207C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 13:03:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTlMH12Rhz3bfS;
	Thu, 17 Oct 2024 22:03:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729160096;
	cv=none; b=cmevefBMos9FV4hD23JQ2CE1qwhz9nTMXJeIDJ0qnYRlTygY5cjzi7z8MS7ErBFGGiAKCxVhZqcIlvOANkCH3vceZ4nz/Eqq8+2jdzXcRDg+p0plIexhgozcxVUNddTpB7vJubXGx454bgx5BNTcTuVe4xb84K435GmQAAya8b6z4vyf/BQSz9lbHYdQIiW1ZpSYp77gtpycYYQ2ozFZ/PCRhIZBbFLdYwba+geHjvyl5962ssfjsewFpmYnbu6h3pmFkdOtsOEtL3TAFfy7gIgAqdqCl95chByYy/nM8gyigBKUz4/eO7wDoSAhFuRiOqWaKd1HPLFUn6j5n6sdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729160096; c=relaxed/relaxed;
	bh=I2BVGxp4811cavk/DhWjzQDx3j5CmnbN69dvL/+Ga1Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Jixvl5+J+qDrgEBbpRqpyTv5+PBHuCy7+MMEk07H8upR0wsjpOCkGyqk+jOMMSJJ6mcarovOvyXvmdZTqOK/yyHyx5TCyzKxDZVyrxRln0UkxJxKBE9wyUF/lzKU1NTBpxb2CLiQ7pkoAWVPEC8hZQB97eE6WbZ0vB2PbUNA1X7xjzRMPAJnR4lEuXt4vJxDq44M0Q33NumdZrkh8SgfRSogRSRIRcK/IXTLARutX73PUF/Jh/xWBmXdHCa+17eEcgijwdtzvSsOLJe+KCnHA3hUQmYBmixtYzgd8iL5zYNaYNaKEUqKUlvZwG7Nqy6zEcnSv3XiT9snn34AuzwsjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YCTD7fRx; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcnDCdgx; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YCTD7fRx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcnDCdgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTkGl0hyfz2xfq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 21:14:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729160088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2BVGxp4811cavk/DhWjzQDx3j5CmnbN69dvL/+Ga1Q=;
	b=YCTD7fRxL5H6TJN6PGROmi+9S8DnAVjbUfykiz2zr6GsSvxt3GKmvYyWndROL2cLvgwg3q
	9h4Cxftn+zAbJ8/aozH/fYrx47FN8s0MH5tVpSNNJCMgUc+VizuHKFzRuOgx35fndqVdzw
	3Xydw3WezDJsZZuPQTXQdysTjeUFRAI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729160089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2BVGxp4811cavk/DhWjzQDx3j5CmnbN69dvL/+Ga1Q=;
	b=CcnDCdgxybRA3Qy7udxmp1Cyz436tP63dcSSDTM7j0LNvHAWFHfnnm0YlvL2Me28xH8hU+
	bZ9brl2mcFvuXsvWgsK/BdgS1EqlBtN33HOBTRjTwJ+KpLvwRnSrfCM2pO/4RjE4Qxfnuf
	7QCcv1PU7NRVYDZsXNc3v9NLdZFNpHU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-ze9r9s_-MBCj1am54BUe-w-1; Thu,
 17 Oct 2024 06:14:43 -0400
X-MC-Unique: ze9r9s_-MBCj1am54BUe-w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8F1E1956088;
	Thu, 17 Oct 2024 10:14:40 +0000 (UTC)
Received: from Carbon (unknown [10.60.6.32])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 427C819560A3;
	Thu, 17 Oct 2024 10:14:35 +0000 (UTC)
Date: Thu, 17 Oct 2024 12:14:33 +0200 (CEST)
From: Michael Petlan <mpetlan@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
    irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
    kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests/base_probe: Fix check for the count of
 existing probes in test_adding_kernel
In-Reply-To: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
Message-ID: <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463776256-121464021-1729160080=:5192"
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463776256-121464021-1729160080=:5192
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 14 Oct 2024, Athira Rajeev wrote:
> perftool-testsuite_probe fails in test_adding_kernel as below:
> 	Regexp not found: "probe:inode_permission_11"
> 	-- [ FAIL ] -- perf_probe :: test_adding_kernel :: force-adding probes ::
> 	second probe adding (with force) (output regexp parsing)
> 	event syntax error: 'probe:inode_permission_11'
> 	  \___ unknown tracepoint
> 
> 	Error:  File /sys/kernel/tracing//events/probe/inode_permission_11
> 	not found.
> 	Hint:   Perhaps this kernel misses some CONFIG_ setting to
> 	enable this feature?.
> 
> The test does the following:
> 1) Adds a probe point first using :
>     $CMD_PERF probe --add $TEST_PROBE
> 2) Then tries to add same probe again without —force
> and expects it to fail. Next tries to add same probe again
> with —force. In this case, perf probe succeeds and adds
> the probe with a suffix number. Example:
> 
>  ./perf probe --add inode_permission
>  Added new event:
>   probe:inode_permission (on inode_permission)
> 
>  ./perf probe --add inode_permission --force
>  Added new event:
>   probe:inode_permission_1 (on inode_permission)
> 
>   ./perf probe --add inode_permission --force
>  Added new event:
>   probe:inode_permission_2 (on inode_permission)
> 
> Each time, suffix is added to existing probe name.
> To get the suffix number, test cases uses :
> NO_OF_PROBES=`$CMD_PERF probe -l | wc -l`
> 
> This will work if there is no other probe existing
> in the system. If there are any other probes other than
> kernel probes or inode_permission, ( example: any probe),
> "perf probe -l" will include count for other probes too.

Hello.

When designing this test, I was relying on the fact that
there are no existing probes, because all should have been
removed at line 43 of the same test:

	40 ### basic probe adding
	41
	42 for opt in "" "-a" "--add"; do
-->	43 	   clear_all_probes
	44 	   $CMD_PERF probe $opt $TEST_PROBE 2> $LOGS_DIR/adding_kernel_add$opt.err
	45 	   PERF_EXIT_CODE=$?
	46
	47	../common/check_all_patterns_found.pl "Added new events?:" "probe:$TEST_PROBE" "on $TEST_PROBE" < $LOGS_DIR/adding_kernel_add$opt.err
	48 	CHECK_EXIT_CODE=$?
	49
	50	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "adding probe $TEST_PROBE :: $opt"
	51 	(( TEST_RESULT += $? ))
	52 done
	53

I am wondering how it could happen that there were other
probes in the system?

Cheers,

Michael

> 
> Example, in the system where this failed, already some
> probes were default added. So count became 10
>   ./perf probe -l | wc -l
>   10
> 
> So to be specific for "inode_permission", restrict the
> probe count check to that probe point alone using :
> NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`
> 
> Similarly while removing the probe using "probe --del *",
> ( removing all probes ), check uses:
> 
>  ../common/check_all_lines_matched.pl "Removed event: probe:$TEST_PROBE"
> 
> But if there are other probes in the system, the log will
> contain reference to other existing probe too. Hence change
> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
> This will make sure expecting string comes in the result
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> index d541ffd44a93..f8b5f096d0d7 100755
> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "force-adding probes :: second pr
>  (( TEST_RESULT += $? ))
>  
>  # adding existing probe with '--force' should pass
> -NO_OF_PROBES=`$CMD_PERF probe -l | wc -l`
> +NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>  $CMD_PERF probe --force --add $TEST_PROBE 2> $LOGS_DIR/adding_kernel_forceadd_03.err
>  PERF_EXIT_CODE=$?
>  
> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "using doubled probe"
>  $CMD_PERF probe --del \* 2> $LOGS_DIR/adding_kernel_removing_wildcard.err
>  PERF_EXIT_CODE=$?
>  
> -../common/check_all_lines_matched.pl "Removed event: probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < $LOGS_DIR/adding_kernel_removing_wildcard.err
> +../common/check_all_patterns_found.pl "Removed event: probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < $LOGS_DIR/adding_kernel_removing_wildcard.err
>  CHECK_EXIT_CODE=$?
>  
>  print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple probes"
> -- 
> 2.43.5
> 
> 
> 
---1463776256-121464021-1729160080=:5192--



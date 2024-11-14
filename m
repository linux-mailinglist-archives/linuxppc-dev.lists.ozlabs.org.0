Return-Path: <linuxppc-dev+bounces-3174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0219C86ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 11:09:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpwqK5qvTz2yqB;
	Thu, 14 Nov 2024 21:09:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731578957;
	cv=none; b=bR/T1tNVgCwQBH3A8OZSfp1MLSIkvrqjGPnSQnBvbttUHiyCXlO4yr+TCt4VxxcHYfIbIM25UjqBwDJt+px4WO9cJXkQy2S2V0zkq7YEV8qw2D2yMz9JHPDgyDfZf0Bp5PGM4Iw8ymldQXyB8G1NpOzdpfQPgq3rMFCY149K2Nml/H7qJqisDV68RBMDsI3FPsQml+CuLwcPjQiV1fj/JI7ptoz3k3nHeRf6HLlgKs1LVuDGdI3DoO0LUNGOInFWbXENZT6Aofr1iWZ2KCxxOGf9mMkyDCvd8KL3Y7m4tphmGyT/1LCOUSN+FKcnE+g0NfUsqMCeDVrzCGyqBBdYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731578957; c=relaxed/relaxed;
	bh=dYGCgLagMjZTMswLBxrAVu/PHrXp21KJtUV66BQOBLo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Xsbkr3HA3C8gewq/Si3PF+Ie2ksbsppp08xZAVM7IMkix2Ls6umZDpQG7vK5D9B4X7B7YcDZrkhudg/XeWldouF48mqS+1kppH1y5P50uWZ/8IUF6krHGq22TvC/g8wwYGQm5OWr/4bV/JtW4zSW669cOMMIrxXcJucRZmv8ovhltqfSb+gClzNq1lLdr9SyJewE4vC59mDr+kyTjgwAp/gA3BBDLU0mO48xRDWzmwEXtroFOo1R0wS6DHlcMKtnw9h0kIpofyFEXv2tA4PvUf1S6/Nk42uTcuOAIKUizYBQEmBrfswKflllxW35gxfxCjK3/e5AUQ++PWB7EUyVWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZNHrFlA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZNHrFlA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZNHrFlA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZNHrFlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpwqJ4Zycz2ygB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 21:09:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731578952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYGCgLagMjZTMswLBxrAVu/PHrXp21KJtUV66BQOBLo=;
	b=aZNHrFlAZZm9i5kfZFF7g/XJjLbJZaxFJ2+NaUVnWynmawK0l2cMlVn67R2qqUEgcCsDdb
	L/WLOSSOtd+t86PsULXBXDUuBWUlbDAmhtn0qfdLRO62VwOEsErH0Fgw6KFNWQg8pXpKei
	+OxnPEkZcnDJ5vkFzzJuIw1JVqDwRkA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731578952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYGCgLagMjZTMswLBxrAVu/PHrXp21KJtUV66BQOBLo=;
	b=aZNHrFlAZZm9i5kfZFF7g/XJjLbJZaxFJ2+NaUVnWynmawK0l2cMlVn67R2qqUEgcCsDdb
	L/WLOSSOtd+t86PsULXBXDUuBWUlbDAmhtn0qfdLRO62VwOEsErH0Fgw6KFNWQg8pXpKei
	+OxnPEkZcnDJ5vkFzzJuIw1JVqDwRkA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-UfQoZvrRNNWA7HrjDoeDZw-1; Thu,
 14 Nov 2024 05:09:06 -0500
X-MC-Unique: UfQoZvrRNNWA7HrjDoeDZw-1
X-Mimecast-MFC-AGG-ID: UfQoZvrRNNWA7HrjDoeDZw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A362019560B0;
	Thu, 14 Nov 2024 10:09:04 +0000 (UTC)
Received: from Carbon (unknown [10.39.208.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB8A019560A3;
	Thu, 14 Nov 2024 10:08:59 +0000 (UTC)
Date: Thu, 14 Nov 2024 11:08:56 +0100 (CET)
From: Michael Petlan <mpetlan@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
    irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
    kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com, 
    vmolnaro@redhat.com
Subject: Re: [PATCH V2] tools/perf/tests/shell/base_probe: Enhance
 print_overall_results to print summary information
In-Reply-To: <20241104072914.15196-1-atrajeev@linux.vnet.ibm.com>
Message-ID: <b28382d-486b-5b21-884-26cc223e452@redhat.com>
References: <20241104072914.15196-1-atrajeev@linux.vnet.ibm.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 4 Nov 2024, Athira Rajeev wrote:
> Currently print_overall_results prints the number of
> fails in the summary, example from base_probe tests in
> testsuite_probe:
> 
>  ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
> 	11 failures found
> 
> test_invalid_options contains multiple tests and out
> of that 11 failed. Sometimes it could happen that it
> is due to missing dependency in the build or environment
> dependency.
> 
> Example, perf probe -L requires DWARF enabled. otherwise
> it fails as below:
>  ./perf probe -L
>   Error: switch `L' is not available because NO_DWARF=1
> 
> "-L" is tested as one of the option in :
>    for opt in '-a' '-d' '-L' '-V'; do
>    <<perf probe test>>
>    print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "missing argument
> 	for $opt"
> 
> Here -a and -d doesn't require DWARF. Similarly there
> are few other tests requiring DWARF. To hint the user that
> missing dwarf could be one issue, update print_overall_results
> to print a comment string along with summary hinting the possible
> cause. Update test_invalid_options.sh and test_line_semantics.sh
> to pass the info about dwarf requirement since these tests
> failed when perf is built without DWARF. Use the check for
> presence of dwarf with "perf check feature" and append the
> hint message based on the result.
> 
> With the change:
>  ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
>  11 failures found :: Some of the tests need DWARF to run
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>  v1 -> v2:
>  Check presence of dwarf using "perf check feature". Add
>  failure hint message for dwarf based on this check
> 
>  tools/perf/tests/shell/base_probe/test_invalid_options.sh | 5 ++++-
>  tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 5 ++++-
>  tools/perf/tests/shell/common/init.sh                     | 3 ++-
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/base_probe/test_invalid_options.sh b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> index 1fedfd8b0d0d..c51d8d9bfdb7 100755
> --- a/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> +++ b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> @@ -22,6 +22,9 @@ if ! check_kprobes_available; then
>  	exit 0
>  fi
>  
> +# Check for presence of dwarf
> +$CMD_PERF check feature -q dwarf
> +[ $? -ne 0 ] && HINT_FAIL="Some of the tests need DWARF to run"
>  
>  ### missing argument
>  
> @@ -75,5 +78,5 @@ done
>  
>  
>  # print overall results
> -print_overall_results "$TEST_RESULT"
> +print_overall_results "$TEST_RESULT" $HINT_FAIL
>  exit $?
> diff --git a/tools/perf/tests/shell/base_probe/test_line_semantics.sh b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> index d8f4bde0f585..f5d3b6e8d0d6 100755
> --- a/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> +++ b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> @@ -23,6 +23,9 @@ if ! check_kprobes_available; then
>  	exit 0
>  fi
>  
> +# Check for presence of dwarf
> +$CMD_PERF check feature -q dwarf
> +[ $? -ne 0 ] && HINT_FAIL="Some of the tests need DWARF to run"
>  
>  ### acceptable --line descriptions
>  
> @@ -51,5 +54,5 @@ done
>  
>  
>  # print overall results
> -print_overall_results "$TEST_RESULT"
> +print_overall_results "$TEST_RESULT" $HINT_FAIL
>  exit $?
> diff --git a/tools/perf/tests/shell/common/init.sh b/tools/perf/tests/shell/common/init.sh
> index 075f17623c8e..0862cbc1c6f7 100644
> --- a/tools/perf/tests/shell/common/init.sh
> +++ b/tools/perf/tests/shell/common/init.sh
> @@ -46,10 +46,11 @@ print_results()
>  print_overall_results()
>  {
>  	RETVAL="$1"; shift
> +	TASK_COMMENT="$*"
>  	if [ $RETVAL -eq 0 ]; then
>  		_echo "$MALLPASS## [ PASS ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY"
>  	else
> -		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found"
> +		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found :: $TASK_COMMENT"
>  	fi

Just a little change, in case $TASK_COMMENT is empty, the :: will be trailing at the end.

So maybe...

  print_overall_results()
  {
  	RETVAL="$1"; shift
 +	TASK_COMMENT="$*"
 +  test -n "$TASK_COMMENT" && TASK_COMMENT=":: $TASK_COMMENT"
  	if [ $RETVAL -eq 0 ]; then
  		_echo "$MALLPASS## [ PASS ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY"
  	else
 -		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found"
 +		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found $TASK_COMMENT"
  	fi

Thanks.
Michael

>  	return $RETVAL
>  }
> -- 
> 2.43.5
> 
> 



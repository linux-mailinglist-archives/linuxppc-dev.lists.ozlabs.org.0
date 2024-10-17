Return-Path: <linuxppc-dev+bounces-2344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99FE9A2088
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 13:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTlNB5jQPz3bgV;
	Thu, 17 Oct 2024 22:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729160560;
	cv=none; b=LvjgK6hAvGvF+IGpUSaqGTp1YlMojg12YP6dr2uTAmtxPzIM3bDmgyoOjWHJmwC79mwJFJ+ZUiqwzfwKlbY2R76m7yLDoZzuTJMaEcdgBF1Vhy94ZpoRQ2rLo6msvM07w2dL/gaOTcZOhnynrK7oEaVAzQ3+43ZES5QmHBLTrfi/Q4RGt4I/cCyRNDalWJusf241TFhAoJIJiYFLC6Or2xS82nBVWJWSunvIv14688e5G6JAovffP2NH917FR0kbFDR4rO0ut26GGMnDhWREBs6C2Fq4OT4yOTwaWgGFr0bYsbomXzIwGpdj2OpeC8se768xoLoxZgz971mIkgWMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729160560; c=relaxed/relaxed;
	bh=jeCnWl19vc+4E0BG770O0FIIXbyDF4QWNdeyt9jEPmQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=My8GPJ2Aou82z56ygzSeyEByhrwP4ZlYThEhdBhs2JksFRJ3cwr0FlvU86jnzNhQSX9J0vFPHFfL2tcLgs2dNKgGQutV+Uv3uoou3jn3ANeJ66MNVreCke5rrPYXy4E9DkeC2lQHI38vBz+G5AweDKUknz4Hy7Me/pt6iGGv9+Rk9f5bmVtEQPoKSSfYG7DqKYW63KUMAvBolrtoq3uSMEiFbihGTUIh/NlQ/7CMJ3joyxiyzo/+R2hAdZyiJTlGYCROojQo3Xcr9gzgdHdXQGySHf6lJqwrxk+QKBG72gK5WzLlvvLMDW+GI3Yw5hyosMOAEuCO0//XUQiyh/P41g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BoCcaf0y; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BoCcaf0y; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BoCcaf0y;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BoCcaf0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTkRg1XbLz2xfq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 21:22:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729160554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeCnWl19vc+4E0BG770O0FIIXbyDF4QWNdeyt9jEPmQ=;
	b=BoCcaf0yFcHILOGKOqJPon4BpBnrvpni0n2racl3V+UGYtzdkv1cTLstopUj1vlUYR3kD9
	HGaXKuP29KgFRscADTFBCa3O1Z8zzKAk5tNtNY5hnGG0EA3Oegra/ca3dorRjf9UwoWQEG
	fqx6r2gZXpp5UU6hnLjy75nw6+AW93s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729160554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeCnWl19vc+4E0BG770O0FIIXbyDF4QWNdeyt9jEPmQ=;
	b=BoCcaf0yFcHILOGKOqJPon4BpBnrvpni0n2racl3V+UGYtzdkv1cTLstopUj1vlUYR3kD9
	HGaXKuP29KgFRscADTFBCa3O1Z8zzKAk5tNtNY5hnGG0EA3Oegra/ca3dorRjf9UwoWQEG
	fqx6r2gZXpp5UU6hnLjy75nw6+AW93s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-50-tUDJYfdmNweuPub9n2KkFw-1; Thu,
 17 Oct 2024 06:22:29 -0400
X-MC-Unique: tUDJYfdmNweuPub9n2KkFw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D5421955F07;
	Thu, 17 Oct 2024 10:22:27 +0000 (UTC)
Received: from Carbon (unknown [10.60.6.32])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CAC219560A3;
	Thu, 17 Oct 2024 10:22:22 +0000 (UTC)
Date: Thu, 17 Oct 2024 12:22:19 +0200 (CEST)
From: Michael Petlan <mpetlan@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
    irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
    kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests/shell/base_probe: Enhance print_overall_results
 to print summary information
In-Reply-To: <20241014154025.85564-1-atrajeev@linux.vnet.ibm.com>
Message-ID: <d7c34f4f-692e-4c1b-c268-582c645a6c33@redhat.com>
References: <20241014154025.85564-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 14 Oct 2024, Athira Rajeev wrote:
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
> failed when perf is built without DWARF.
> 
> With the change:
>  ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
>  11 failures found :: Some of the tests need DWARF to run

Hello Athira,

I admit that the idea of some hint why the test failed
might be useful, however a static hint that might or
might not be related to the particular failure seems to
be rather misleading to me. If the test fails for any
other reason, the user is still told about DWARF which
might not be true.

I think that such hints would need some test result post-
processing to determine the actual reason.

Michael

> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/base_probe/test_invalid_options.sh | 2 +-
>  tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 2 +-
>  tools/perf/tests/shell/common/init.sh                     | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/base_probe/test_invalid_options.sh b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> index 1fedfd8b0d0d..e133bb0aa949 100755
> --- a/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> +++ b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> @@ -75,5 +75,5 @@ done
>  
>  
>  # print overall results
> -print_overall_results "$TEST_RESULT"
> +print_overall_results "$TEST_RESULT" "Some of the tests need DWARF to run"
>  exit $?
> diff --git a/tools/perf/tests/shell/base_probe/test_line_semantics.sh b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> index d8f4bde0f585..99f4f56a3292 100755
> --- a/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> +++ b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> @@ -51,5 +51,5 @@ done
>  
>  
>  # print overall results
> -print_overall_results "$TEST_RESULT"
> +print_overall_results "$TEST_RESULT" "Some of the tests need DWARF to run"
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
>  	return $RETVAL
>  }
> -- 
> 2.43.5
> 
> 
> 



Return-Path: <linuxppc-dev+bounces-5146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2320A0B507
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 12:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWqCD2FS2z30Pp;
	Mon, 13 Jan 2025 22:04:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736763696;
	cv=none; b=QUPxiUbH+YeE/ohHr7/kf/4WOvrjwRMMKh867B+vFNOR49a8HmwT7nz06ZAfWdFYwFlI9aIapg14/5Prs/N5QDe+k75bVHtmz+kvri7rlwGTrW+jcvjWOWkxyhxvG69sKmeP84TPCVmDRf5z6ZmhbiEeYCknfLXuy8jFbuQ29nF5b85Ar2YWgvGv2iIEQHPx6CD47n4eRy4LJSLJ7cc0LqM/YypY26nZBAUWJuvLx2pW0QrMkglM7LXuIt+rioCJ8PjNeTDdFJs/XAjx7y1jXYhLTK8DYhYRes/fVkhgpEzvS2hGY1UGotLUu5R2OTWzTOSNmxCDm0CHAib0VyRSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736763696; c=relaxed/relaxed;
	bh=Xt4e1f0wj8UzOdabGlkr3Uco4bHMbyif3w6wfY2dKJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loyBB0IA4raumMZqAkZT4qy2bEahM/FMae3FoYY6b2NbgpOITGQHT2PQ9eUBtTstEAKtvOQ5TNqR2T/WSyskpTcZpIwzEi3rI9HwXtLo3jkIga1v5FoF5gR5tJivh8SwKGGbszv5kMaFmFEO9WQH9IZ9ZdofhcVnmrcN+I7O8gN7I9hZnI+a19y22TQ95dXTJAn5NT0O3d5N05vQr44DK6aXpEUfpa0xxA3D3qC2ldfbf4ymiEYUOzYI182YSSZNJRsotYX7SxUW2c3gAcGkk2O4gX0HndenKKnVOwokAG63gp+9BEuzHJtD75AheiKgbY7D+6nHr1Fu5m+pl8GcTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7MxmY4d; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7MxmY4d; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmolnaro@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7MxmY4d;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7MxmY4d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmolnaro@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWpFq34RLz304x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:21:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736763689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xt4e1f0wj8UzOdabGlkr3Uco4bHMbyif3w6wfY2dKJw=;
	b=a7MxmY4dGnh2Zi0ddv8X0Gpo7/a+GV5kV1iSUj3PkBgQQGPHi1Zn/8uK5+SzdaA59HOgXZ
	0udoOKa3MMWkEZyYwSYlMAiEqxvxJn1cNnW5SzGi8bbUyZCJODKTgw6drIsgZhMHXqVtsF
	XMwAFOxkPveIRjKVfkH3HcrFljRWiCM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736763689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xt4e1f0wj8UzOdabGlkr3Uco4bHMbyif3w6wfY2dKJw=;
	b=a7MxmY4dGnh2Zi0ddv8X0Gpo7/a+GV5kV1iSUj3PkBgQQGPHi1Zn/8uK5+SzdaA59HOgXZ
	0udoOKa3MMWkEZyYwSYlMAiEqxvxJn1cNnW5SzGi8bbUyZCJODKTgw6drIsgZhMHXqVtsF
	XMwAFOxkPveIRjKVfkH3HcrFljRWiCM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-2ZcWLHZ_MDaHTxrkroBrtQ-1; Mon, 13 Jan 2025 05:21:27 -0500
X-MC-Unique: 2ZcWLHZ_MDaHTxrkroBrtQ-1
X-Mimecast-MFC-AGG-ID: 2ZcWLHZ_MDaHTxrkroBrtQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38a684a096eso1490641f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 02:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763686; x=1737368486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt4e1f0wj8UzOdabGlkr3Uco4bHMbyif3w6wfY2dKJw=;
        b=G/wgpOb6CMchCBomcCjIzp+NfDbJwae5hL9zvmdFDDLtwgalNt2wTBM9AsAoosx109
         HTBj7KErLDvq9EyL9Adi0LfvBd1EaFsVX6k3WWCVKhc7/AoV0OGy/KeSxZaTLOs/QgwH
         zBX93PcqtKFkKIvb/G7gaIUWKXmcB10hKlbIQAaA0ecvkM72BJIHFqPw6k7vFhaPNTrf
         E5BcaSdHIS7zXjBv/bPeVbnN9e7LxPZqYsIYc9nKAVQL9GtJ90BE13M9vifIkN46P/I3
         52Lc2zknkjh+LFYM7ygpvzYdHW2owRo5YFsPX55ug2dmy+k4UDmhpd9cOcUrQq/PSUgx
         6WNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWR6jGdoyU8PbOjuwqWt6JiRsSuwy8DwPMd2rwQkrkFf4u8byeJQegvna4w2ekkn7nVugRCq60lM2Juck=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBFhwmQl5lF2euTzMJ4vURZ9sgiYLePwjkaxYIK2eXhPBkcldb
	ykdIFTP1jC2DVKdEp8oZvehX2E0IDNZ3MSgDRQedka4tjhsyLpvOPye05BHI8neI/C+9V/w13sx
	yRec9HS+qdpL+ZYFr++/rKDeLJvqP1HDKclSxRap2QVB1nCuVAFZY65RY2JNQEfY=
X-Gm-Gg: ASbGncsBEnAYqhQYKvbDZ1BKQmFNZz1VznLUFpi5bzAThuh5cpv8pam2KvIAQNjMK5b
	fymfyJGAXRNclyAem7jJb/E7S24r6SqLFdQq7ju/Ens/2iCiC80xKkGEKg22/EQhfmZqmu2hzZ5
	vwNKh4ZOIdTuPTHRv/6DiGPMdexaTRNENq5+ouZ4bnSXopGnkTTxX9vXDLQ7/JUvAFg+pcrVB0w
	r9mk6AaW0nf1jGUdaKxY+ncm84TLP7OTBRqtNc35LFNT8vYZ9KLJLlHm1Jrc5wwkqI9Xd4MjTt2
	gpNlQOtSmKg=
X-Received: by 2002:a5d:6da4:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38a8730e04amr16461643f8f.36.1736763686053;
        Mon, 13 Jan 2025 02:21:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbHzwMbQ6/3Fwsroyn0DZ7WCCmNBX7Lhvb0zjmXDUxgqVCaF4BgckjwfprSsRiJLDqnwAntQ==
X-Received: by 2002:a5d:6da4:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38a8730e04amr16461612f8f.36.1736763685695;
        Mon, 13 Jan 2025 02:21:25 -0800 (PST)
Received: from [10.202.147.124] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b81e4sm11963222f8f.64.2025.01.13.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 02:21:25 -0800 (PST)
Message-ID: <07be4391-4a28-4761-9171-26580aea6312@redhat.com>
Date: Mon, 13 Jan 2025 11:21:24 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] tools/perf/tests/base_probe: Fix check for the count
 of existing probes in test_adding_kernel
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
 namhyung@kernel.org, mpetlan@redhat.com
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
 hbathini@linux.ibm.com
References: <20250110094324.94604-1-atrajeev@linux.vnet.ibm.com>
From: Veronika Molnarova <vmolnaro@redhat.com>
In-Reply-To: <20250110094324.94604-1-atrajeev@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7uPXSrFeb-M63RDF_HNcudPG5uoIOKdHW_pok9uegEc_1736763686
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/10/25 10:43, Athira Rajeev wrote:
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

Acked-by: Veronika Molnarova <vmolnaro@redhat.com>

Thanks,
Veronika

> ---
> Changelog:
>  v1 -> v2:
>  No code changes. After being reviewed by Michael Petlan, since
>  initial patch was posted in 2024-10-14, rebased on top of latest
>  perf-tools-next
> 
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



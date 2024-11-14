Return-Path: <linuxppc-dev+bounces-3173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40079C86D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 11:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpwlV27SLz2ydW;
	Thu, 14 Nov 2024 21:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731578758;
	cv=none; b=PtWJzMJBfyVTadB6qoL9z0WTNqY8WF1F3CmX/M513WutT2Tz3fHm5ZgyHcrZ8I7wbMntCbgupPJrHyJhYdCXIbfOnQp2Ox4m69tWwQG6ei+qiV6JGtm3ASs1Adc35hXZkHQ0ObMY21zMqAXJoi0c2DYmgJaTNTOPWSvTczKPWNQ4IuDiWgFoN9rpZNax37e5FkLswi/O11qFap4ctduzMSiF9MDSEsFLBwxpcpsW6QHEJCx0NBMzTgwBHdSYGPrVZERQY9zQhcprBcqE7J+31xcBJHH3I1B74IUP3SFkkJcTNDcOBP/hcT3SuC/eVZWpAYHgEx+oxN+WpRJIukEl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731578758; c=relaxed/relaxed;
	bh=2Aczb8xlsdyYMxnrkmwTQQ3EUumWpfFrMZHGUDqIlVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cboRPpgiU2Vi8BRlYvZ74XWZJczD/Jt3BcmVSWx8V/BJbt6M5eRxgIDbbkFEM1vvm3QxUaaJdD2i5mXXWOGoncKC7EESXfQH772DKJbrKBRwxRySZIFu0im6bSJLb26YROVMPV4xO510r5QfJbaAWlqtF+oQ+By6Ouedt1GD87/u+xQUVPSVe+r9DLCFAJNvr72XPeKXYF/j0JRaV2wZi7JJX1EM7C00U7GXKSp9dIlIMbGElLeGeJbnOmG/JtuYOd6oZfcBQG/TsgzJLPgTjwT6NMbGXs1Sly5JW61RI+naO7YmJ5BGVYPvot1/pnf7whgtQUTn3oWif6r/aiEyyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XDpIPUPR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VCtTj11e; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XDpIPUPR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VCtTj11e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpetlan@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpwlS50xPz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 21:05:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731578750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Aczb8xlsdyYMxnrkmwTQQ3EUumWpfFrMZHGUDqIlVk=;
	b=XDpIPUPR0NZ1scQIa80A4igVksXdQpv2igp+KYUQl6KeMv7TigCr/Rlz9zJjEguD6f7qyQ
	B4f4csXpgK7eMSqnidUNNe4e3DrLyvp/MOGsspSumyiiKKDWrBUhY7Xr1u6x50kntzOhoh
	KaRZ+PRkZBn0dbEQu9+QSjDjUK2Oxmo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731578751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Aczb8xlsdyYMxnrkmwTQQ3EUumWpfFrMZHGUDqIlVk=;
	b=VCtTj11eCYbUXmc4ihUxo7u5NW9kn3u+FM4y8IsERMN3K8LCARianLjHSKK+8ij/SqSing
	VCNBJmzWT0JgB8bSl2hViYu6c7DklEJ8DNNfzywK6sFBPRPPzqrJzJrcMxJSPelBfaGWuM
	vVdwzFn+0Ivf090I2KLU9+2TtHbExQQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-WNfiqp02OVqwPwjSVYwiGg-1; Thu,
 14 Nov 2024 05:05:45 -0500
X-MC-Unique: WNfiqp02OVqwPwjSVYwiGg-1
X-Mimecast-MFC-AGG-ID: WNfiqp02OVqwPwjSVYwiGg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6F49195395A;
	Thu, 14 Nov 2024 10:05:43 +0000 (UTC)
Received: from Carbon (unknown [10.39.208.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6CE6019560A3;
	Thu, 14 Nov 2024 10:05:38 +0000 (UTC)
Date: Thu, 14 Nov 2024 11:05:34 +0100 (CET)
From: Michael Petlan <mpetlan@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
    irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
    kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests/base_probe: Fix check for the count of
 existing probes in test_adding_kernel
In-Reply-To: <0FEA83FD-BBC9-4E83-82D6-044141E86F76@linux.vnet.ibm.com>
Message-ID: <1da9544-1e17-3830-49f9-6a6d78439e71@redhat.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com> <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com> <0FEA83FD-BBC9-4E83-82D6-044141E86F76@linux.vnet.ibm.com>
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
Content-Type: multipart/mixed; boundary="-1463776256-1326094925-1731578743=:9263"
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463776256-1326094925-1731578743=:9263
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 3 Nov 2024, Athira Rajeev wrote:
> > On 17 Oct 2024, at 3:44 PM, Michael Petlan <mpetlan@redhat.com> wrote:
> > 
> > On Mon, 14 Oct 2024, Athira Rajeev wrote:
[...]
> > 
> > I am wondering how it could happen that there were other
> > probes in the system?
> 
> Hi Michael,
>
Hello Athira.

> Sorry for the late response.
> 
> Yes, there are uprobes listed as part of “perf probe” in the environment where I saw the test needing this change. Sharing the result below from perf probe: 
> 
> # ./perf probe -l
>   uprobes:p_uprobe_dns_events_osquery4026531841 (on getaddrinfo in XX)
>   uprobes:p_uprobe_dns_events_osquery4026532336 (on 0x129a60 in XX)
>   uprobes:p_uprobe_dns_events_osquery4026532344 (on 0x129a60 in XX)
>   uprobes:p_uprobe_ebpf_compat_check_osquery (on __GI___backtrace in XX)
>   uprobes:p_uprobe_sys_hook_osquery (on backtrace_symbols in XX)
> 
> These can’t be removed.
> 
> # ./perf probe -d uprobes:p_uprobe_dns_events_osquery4026531841
> Removed event: uprobes:p_uprobe_dns_events_osquery4026531841
> Failed to delete event: Device or resource busy
>   Error: Failed to delete events.
>

Ah, this is interesting, I have never hit that. However, it makes sense,
if the resource is busy.

However, in that case it comes to my mind that in general, these tests
should not be run in any production environment, where one could rely on
some probes will exist, etc. In case some of the probes above was not
busy, it'd be probably cleaned up by the testcase, which might be unexpected
by the creator/user of the uprobes... Maybe we should get rid of the
probe cleaning for that cases, but I'd prefer to keep it.

> Considering above scenario, patch here takes the probe count using:
> NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`
> 
> Also similarly looks for TEST_PROBE in result log in case of probe —del as well
> 
> Any comments Michael ?
>
Yes, we probably should tweak it as you suggest.

Thanks,
Michael


> Thanks
> Athira
> 
> > 
> > Cheers,
> > 
> > Michael
> > 
> >> 
> >> Example, in the system where this failed, already some
> >> probes were default added. So count became 10
> >>  ./perf probe -l | wc -l
> >>  10
> >> 
> >> So to be specific for "inode_permission", restrict the
> >> probe count check to that probe point alone using :
> >> NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`
> >> 
> >> Similarly while removing the probe using "probe --del *",
> >> ( removing all probes ), check uses:
> >> 
> >> ../common/check_all_lines_matched.pl "Removed event: probe:$TEST_PROBE"
> >> 
> >> But if there are other probes in the system, the log will
> >> contain reference to other existing probe too. Hence change
> >> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
> >> This will make sure expecting string comes in the result
> >> 
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> >> index d541ffd44a93..f8b5f096d0d7 100755
> >> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> >> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> >> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "force-adding probes :: second pr
> >> (( TEST_RESULT += $? ))
> >> 
> >> # adding existing probe with '--force' should pass
> >> -NO_OF_PROBES=`$CMD_PERF probe -l | wc -l`
> >> +NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`
> >> $CMD_PERF probe --force --add $TEST_PROBE 2> $LOGS_DIR/adding_kernel_forceadd_03.err
> >> PERF_EXIT_CODE=$?
> >> 
> >> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "using doubled probe"
> >> $CMD_PERF probe --del \* 2> $LOGS_DIR/adding_kernel_removing_wildcard.err
> >> PERF_EXIT_CODE=$?
> >> 
> >> -../common/check_all_lines_matched.pl "Removed event: probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < $LOGS_DIR/adding_kernel_removing_wildcard.err
> >> +../common/check_all_patterns_found.pl "Removed event: probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < $LOGS_DIR/adding_kernel_removing_wildcard.err
> >> CHECK_EXIT_CODE=$?
> >> 
> >> print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple probes"
> >> -- 
> >> 2.43.5
> 
> 
> 
---1463776256-1326094925-1731578743=:9263--



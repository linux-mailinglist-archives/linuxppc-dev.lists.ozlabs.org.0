Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2F8BC8F6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 10:02:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GgKG6xSa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXv5y4M0Mz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GgKG6xSa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b8; helo=out-184.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXv586Y4mz30TJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 18:02:01 +1000 (AEST)
Date: Mon, 6 May 2024 10:01:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714982494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7/dKDnsWOprmuXZHAB4ViI0IKkujsH7xFR49QJKEfrY=;
	b=GgKG6xSaM7zIPZp/d4hkvStj4BG1loLavwOoHyC+9paiNGEcUkx5Wv3w2PxMRby37Y/zr6
	2QOUGkhJEnxbR4037Vm6eKLFod8DSjxsm7RtxKXs9S0porK+fZ9u88BXv17FYBkEqA4Wos
	A3ymP1L2DCaetDX4dhpiZ7b256djpWE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v9 02/31] report: Add known failure
 reporting option
Message-ID: <20240506-c712c1cc4467cd154bbc7ee8@orel>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-3-npiggin@gmail.com>
 <aed85321-7e8e-4202-9f91-791229ef9455@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aed85321-7e8e-4202-9f91-791229ef9455@redhat.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 06, 2024 at 09:25:37AM GMT, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > There are times we would like to test a function that is known to fail
> > in some conditions due to a bug in implementation (QEMU, KVM, or even
> > hardware). It would be nice to count these as known failures and not
> > report a summary failure.
> > 
> > xfail is not the same thing, xfail means failure is required and a pass
> > causes the test to fail. So add kfail for known failures.
> 
> Actually, I wonder whether that's not rather a bug in report_xfail()
> instead. Currently, when you call report_xfail(true, ...), the result is
> *always* counted as a failure, either as an expected failure (if the test
> really failed), or as a normal failure (if the test succeeded). What's the
> point of counting a successful test as a failure??
> 
> Andrew, you've originally introduced report_xfail in commit a5af7b8a67e,
> could you please comment on this?
> 

An expected failure passes when the test fails and fails when the test
passes, i.e.

  XFAIL == PASS (but separately accounted with 'xfailures')
  XPASS == FAIL

If we expect something to fail and it passes then this may be due to the
thing being fixed, so we should change the test to expect success, or
due to the test being written incorrectly for our expectations. Either
way, when an expected failure doesn't fail, it means our expectations are
wrong and we need to be alerted to that, hence a FAIL is reported.

Thanks,
drew

> IMHO we should rather do something like this instead:
> 
> diff --git a/lib/report.c b/lib/report.c
> --- a/lib/report.c
> +++ b/lib/report.c
> @@ -98,7 +98,7 @@ static void va_report(const char *msg_fmt,
>                 skipped++;
>         else if (xfail && !pass)
>                 xfailures++;
> -       else if (xfail || !pass)
> +       else if (!xfail && !pass)
>                 failures++;
> 
>         spin_unlock(&lock);
> 
>  Thomas
> 

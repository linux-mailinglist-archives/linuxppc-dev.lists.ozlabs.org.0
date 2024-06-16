Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05B909E0A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2024 17:05:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ioXX9/Vm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2GXf237lz30W1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 01:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ioXX9/Vm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 17 Jun 2024 01:04:43 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2GWv6N0yz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 01:04:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718550285; x=1750086285;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RWheu7VAcDlHrib9HA+6p1vteQzNNj1dxDCy688RrHk=;
  b=ioXX9/Vm10ukBYApoz3K1/nhokWNNk+iLH3rYx4ISx26aZLUTN856gIX
   jHAwCFvA2xb6oG3gnNvygZ+YbG8jJX4ISxNLh0u5MhtD+42xR3E6C35Yf
   nlDzqBiPX3sLVox7EtvPkFD+I0xqWLTSTbpxbtBjeml2cBlYxiOd6rLWy
   KEgxMCrexVVhmTY/DcBKStbsnTHtJJ2xhcyzaSkFEGnza952uBZsDsGFn
   7xmWjk4VG2T4B7bNHPvDV9/5R+oFd8J0FplVDGiEHx3zZtSD7bJjfmvuv
   Sh8gWtWBU2ATcAlULkMTy5NpDa5c3AdDL+U6yWW8aXU133+ORKVzyr+8n
   g==;
X-CSE-ConnectionGUID: TJL8ppMJS3CKKWorJAM6uQ==
X-CSE-MsgGUID: YZA6YHi/RXO7K/Stt3iC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26502455"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="26502455"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 08:03:33 -0700
X-CSE-ConnectionGUID: M4u5m4CsTUadu4ql+ZHPdg==
X-CSE-MsgGUID: VWZ21rksQNyma9+/+fwpIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="46083612"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.94.249.84])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 08:03:30 -0700
Message-ID: <802a5260-8d74-4a5e-85fc-c9b86460d4c5@intel.com>
Date: Sun, 16 Jun 2024 18:03:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/perf: Fix parallel-perf python script to
 replace new python syntax ":=" usage
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240614172742.56976-1-atrajeev@linux.vnet.ibm.com>
 <20240614172742.56976-2-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240614172742.56976-2-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/06/24 20:27, Athira Rajeev wrote:
> perf test "perf script tests" fails as below in systems
> with python 3.6
> 
> 	File "/home/athira/linux/tools/perf/tests/shell/../../scripts/python/parallel-perf.py", line 442
> 	if line := p.stdout.readline():
>              ^
> 	SyntaxError: invalid syntax
> 	--- Cleaning up ---
> 	---- end(-1) ----
> 	92: perf script tests: FAILED!
> 
> This happens because ":=" is a new syntax that assigns values
> to variables as part of a larger expression. This is introduced
> from python 3.8 and hence fails in setup with python 3.6

According to below python 3.6 is end-of-life

	https://devguide.python.org/versions/

What was still using python 3.6?

> Address this by splitting the large expression and check the
> value in two steps:
> Previous line: if line := p.stdout.readline():
> Current change:
> 	line = p.stdout.readline()
> 	if line:
> 
> With patch
> 
> 	./perf test "perf script tests"
> 	 93: perf script tests:  Ok
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/scripts/python/parallel-perf.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/scripts/python/parallel-perf.py b/tools/perf/scripts/python/parallel-perf.py
> index 21f32ec5ed46..be85fd7f6632 100755
> --- a/tools/perf/scripts/python/parallel-perf.py
> +++ b/tools/perf/scripts/python/parallel-perf.py
> @@ -439,7 +439,8 @@ def ProcessCommandOutputLines(cmd, per_cpu, fn, *x):
>  	pat = re.compile(r"\s*\[[0-9]+\]")
>  	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
>  	while True:
> -		if line := p.stdout.readline():
> +		line = p.stdout.readline()
> +		if line:
>  			line = line.decode("utf-8")
>  			if pat.match(line):
>  				line = line.split()


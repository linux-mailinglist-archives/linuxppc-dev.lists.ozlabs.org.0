Return-Path: <linuxppc-dev+bounces-9329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59298AD820D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 06:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJQtB2xvzz2xKN;
	Fri, 13 Jun 2025 14:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749784617;
	cv=none; b=UbjekWPLWCPhTk2QjEoAQo7nmpthet56pDxk+yJQJLRuhluxtnBURpMPOW4O8ZjMhVajxlRFmzB6ThC0tEBN+28Nmw8vH1q0uphUqAgTMbVSXR+KZG6yTCtqKZUwM7N/WnCb0mnKVE+6h9H37r83/M5zGCeYJJTLhMjWGh8c2cEqURz1BICV6+OtrtOWVw1qqtodIs4Rq85k8UonGQynHQfWQyLWFmCog32IkqU2c0jexzVLCIz3XoPQ3CCmarKq4XY0BFgfUjV0ZmGiSXsE2XyJ4ARy1uuM/fqDIXRvllWWtKPsV1MQvRTkxCNKItpICqd9qvxEy3csW0ZniCtN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749784617; c=relaxed/relaxed;
	bh=Ap98I+eDUm9/OncRY5L40akvtMUL2MyqVOzfhknq874=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONAenyyUp02SvkU+5EMtX/tOWVfArgX4rLwz7TPT0a2cJ6ZMUbRE5UANTWsbMC1JNXUwDGugWh8Nb/7CBU/oM0FEcaiiMRBLsVYzapAsIAVoy0u8lscsj5zYPyAjd/5GHn3aNaGRB/GLslCBXs90gCRqSQ4CdA7F/OlN3AuAGioiRtlvnq4L8yktIhsCqzFU7Fv1SVaRC6IR4t75g/e9Z16nsovpg2XNcBHVOdZEm9UcsWLFEJvXUgTWLROU6klhDU+ovm+695zMnJN1BY/3QL0deYxNNuUPd2CKnrx5N0ZOCvPbZNLisOE5syRO9DZ428XLmZIt6JL+3wl3df4/sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y91AD+IM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y91AD+IM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJPh831qNz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 13:16:54 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2363616a1a6so14277525ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 20:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749784612; x=1750389412; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap98I+eDUm9/OncRY5L40akvtMUL2MyqVOzfhknq874=;
        b=Y91AD+IMlk2gE+qWsC5QkRv+7Azt7/J4dHixFfO+O6rsDL3vJfyRLzR0kWyk4Vc3Us
         iIbcAe2o/XMPNjy1VcLogVE79GhlUJTcF5BF2/3BuXEERHSR1rz66iwGagbbZuieTwoT
         aigqmP1HY7hcns7vK9MfOPD8aaH9mi60JxRQN0rruHtdcTU9aS1pvWsBOJ5yoImx0DwA
         KIpo4PaJa36IxibOZUZYFQuO4uJNmMwk22uAyB6So95iz5gx3aTqyWkk98KT3efZaihJ
         OR/RrAE57SPmp3H2+TfxkdPnszWn981ueArQ1r5P/70eORn1i+dRAwDC1QsdGsm+9Edu
         b3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749784612; x=1750389412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap98I+eDUm9/OncRY5L40akvtMUL2MyqVOzfhknq874=;
        b=vtzoDjhs9rBQ6vXM+KL2nmwuvK5dM6OOOlDXl6bo5h6eLfuPiZA5qpCkv0xKdHTzcg
         26oJUoIaEhkpT4MfgTjxCY1CzImSYOTEQSLQF3Nhb7LS0aAOZtt67e29pprfHR7i/gVJ
         5rrGbBJ9D5on9Qb3W8whayp+jJoWq8UP7tE0L7/Ii3WiUf16drTBEwajn3TWNxSZdDsN
         H0K/cYY+DiV72n91gDUWJqk+gJHNJcahxDUJRQFoaAPRrp/xBDb2euSN79oZJuqmHb4B
         AAIo49nwEFQJSxRACDsW6sya78xlo0uSqSNlAE47FEmJ+mEG4I6CKJC06Oc+9nHqP7HT
         sTDw==
X-Forwarded-Encrypted: i=1; AJvYcCX3r96jeEcHJyGMnCq7HT2cR1XTzi/SVcud8BZHXikHSq+69qvVm2YjCa89qzX7i44ZGpV6w8HPxZpFC88=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBEMvS9+C98KaFBFCLkVMrBB97Ix+5Ck1oksrmYB/RJ83wpTd3
	dF/RAlgWwGT8NjvtwXl2lTY+qf78UmkKMaMDelO1mUdTY5Fwfs01nWwkzOAkRrpw/TQ=
X-Gm-Gg: ASbGncuImeB6+T5OUHBmCxJeJ5PmLXljaAEyVC6k73R2aj0ohWGpxL8CYG8BhnZP9kd
	tl1AJmQUPqke8jyVih0Z2dPBHLy0Cy0x0r1k+ZNswjNWvlY+tKOU2FmvXPnJilX8JQnjOSQNRYg
	4IkGxu/hWlmnK8ocS2YFKv2/oV3HAuh5DF5VjVnuiyeKmSKrGWg9MAqevkFPauKGTapK4XhLNpA
	qAuytyrmJ5XNeQYLEvOKnIoJi5LBfcRB21Vnvutn2/pvEunjRPhH7xzBBxK1NyC5EjB0oZJnqG6
	AOZuT7caEfNoH9OVtj8MgnHnj6MrMjsst6spitMko/vYqvVNCaUAjyngWTPy3i4=
X-Google-Smtp-Source: AGHT+IHNXC3txXNOUer9QYDOQjxZSJ6IgCaYAHTJUBWcCsiS3vra7fop+grtC6B10VdAfwH4GdqnXA==
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id d9443c01a7336-2365d8bf339mr21709775ad.21.1749784612494;
        Thu, 12 Jun 2025 20:16:52 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8fe6sm4650285ad.164.2025.06.12.20.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:16:51 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:46:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/4] PM: cpufreq: powernv/tracing: Move powernv_throttle
 trace event
Message-ID: <20250613031649.lj5zdvw3wl6dtfft@vireshk-i7>
References: <20250612145310.563358597@goodmis.org>
 <20250612145407.906308844@goodmis.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612145407.906308844@goodmis.org>
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2607:f8b0:4864:20:0:0:0:62d listed in]
	[list.dnswl.org]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [122.172.81.72 listed in zen.spamhaus.org]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12-06-25, 10:53, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> As the trace event powernv_throttle is only used by the powernv code, move
> it to a separate include file and have that code directly enable it.
> 
> Trace events can take up around 5K of memory when they are defined
> regardless if they are used or not. It wastes memory to have them defined
> in configurations where the tracepoint is not used.
> 
> Fixes: 0306e481d479a ("cpufreq: powernv/tracing: Add powernv_throttle tracepoint")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  drivers/cpufreq/Makefile          |  1 +
>  drivers/cpufreq/powernv-cpufreq.c |  4 ++-
>  drivers/cpufreq/powernv-trace.h   | 44 +++++++++++++++++++++++++++++++
>  include/trace/events/power.h      | 22 ----------------
>  kernel/trace/power-traces.c       |  1 -
>  5 files changed, 48 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/cpufreq/powernv-trace.h

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh


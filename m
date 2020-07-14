Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5821E869
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:40:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5W9K0dk4zDqNW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5W7Z28cRzDqNV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:38:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Xts+McWZ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B5W7Y6XTPz8tY5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:38:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B5W7Y5xCfz9sT6; Tue, 14 Jul 2020 16:38:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Xts+McWZ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B5W7Y4K6Bz9sQt
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 16:38:48 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k4so6597155pld.12
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jul 2020 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=a1VxGILEG42+H8L6GoViFzWZFZSKw5Ols1wGUf0gdqo=;
 b=Xts+McWZovvImnzKPR+kJgv321ta/+h+TY/aye5u1KOB2hnbQ34iDFo+AZuD1vvRx2
 pFG/PH9yf5hkE7tE9sw1zr8PEmXxMms68RIYOdjI41nx7/RZxGplxkUHqzONT0PK2apj
 1wVUjOeXgsAKDDEZeKAaj3HauILJ/hYAfv6ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=a1VxGILEG42+H8L6GoViFzWZFZSKw5Ols1wGUf0gdqo=;
 b=sSJOXjLRBYCIAoK6NKhVH4CqT/pWYl5+aWrkcROLYKdm0Kyg5Ek7D3yzo6LDjSnXgn
 kORTXOo3CF+dT9MSIfsMuDUV4BpTpKB18dGrP9HqErGfgDa6PFaqBtvm9Df9m/x4iwtM
 8O33siGa6u4Edz06DhpEQzqJN05iWMkqxagOQkPQsXGY+H4fLFaybEaUU1txmHk/WeE8
 3+c3IAjN8Vhg8OxPO6GI0a1tp1to0BHpRYpMOEAQfFAq3qMJF+sUjn6NAmRa5SHtyS/i
 EyU5ESvlri1Q1fDHMD68b04hrY8GNF5Ydb9G6WYFk5eMGvcfkj/SSUq3oQaNCXE2gJaW
 O9Cg==
X-Gm-Message-State: AOAM530h1/19oI0fV4y2lP08sPMmRpyyFNEN1NWynPIoPAtDX1bMADfj
 gG0+9w/HWktvh9fhGei9h4JVBg==
X-Google-Smtp-Source: ABdhPJyONPZ3um3fwUzwJ1uRRYNCRh7Wl6QNk16NHZgya2eaSlYdiNMNO4v4tQ2yfRJXmBLelUoxXw==
X-Received: by 2002:a17:90a:1acc:: with SMTP id
 p70mr3216700pjp.210.1594708725751; 
 Mon, 13 Jul 2020 23:38:45 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-0c99-1211-d258-b704.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:c99:1211:d258:b704])
 by smtp.gmail.com with ESMTPSA id p12sm1322396pjz.44.2020.07.13.23.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 23:38:45 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries: detect secure and trusted boot state
 of the system.
In-Reply-To: <1594434329-31219-1-git-send-email-nayna@linux.ibm.com>
References: <1594434329-31219-1-git-send-email-nayna@linux.ibm.com>
Date: Tue, 14 Jul 2020 16:38:41 +1000
Message-ID: <87y2nmtxce.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nayna,

Thanks! Would you be able to fold in some of the information from my
reply to v1 into the changelog? Until we have public PAPR release with
it, that information is the extent of the public documentation. It would
be good to get it into the git log rather than just floating around in
the mail archives!

A couple of small nits:

> +	if (enabled)
> +		goto out;
> +
> +	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot)) {
> +		if (secureboot)
> +			enabled = (secureboot > 1) ? true : false;

Your tests double up here - you don't need both the 'if' statement and
the 'secureboot > 1' ternary operator.

Just

+	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot)) {
+		enabled = (secureboot > 1) ? true : false;

or even

+	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot)) {
+		enabled = (secureboot > 1);

would work.

> +	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot)) {
> +		if (trustedboot)
> +			enabled = (trustedboot > 0) ? true : false;

Likewise for trusted boot.

Regards,
Daniel

P.S. please could you add me to the cc: list for future revisions?

> +	}
> +
> +out:
>  	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
>  
>  	return enabled;
> -- 
> 2.26.2

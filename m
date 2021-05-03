Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7F371F19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 20:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYrQz1XF2z2yx3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 04:02:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=Zfc3rxRR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.88; helo=alln-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=Zfc3rxRR; dkim-atps=neutral
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYrQR42sQz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 04:01:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=921; q=dns/txt; s=iport;
 t=1620064911; x=1621274511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=11OIbKeLQbrAmtYBHBv7IUPUzo44ctCWght7Qdc/mM4=;
 b=Zfc3rxRRjf2lPjssubfSWfMS6FfIZM4sGAn5ZUzbv4/llk8gCBMB3/a+
 oA5NEYX1WSNn7b9V3cyiZArkVd+wB31wmkMAy8NamxX18BnUdnH94Av5i
 DbyG6q/nkHwGVQEeP0Ne1lHqFwPZVvnXPpi3XW23jcfZ8Q5LnqRRctj7S k=;
X-IPAS-Result: =?us-ascii?q?A0ABAABeOZBgmIENJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAgUMEAQEBAQELAYMhVgE5MYxoiVGQG4pkgXwLAQEBD?=
 =?us-ascii?q?QEBKAwEAQGBFgGCdT8DAgKBewIlNAkOAgQBAQEDAgMBAQEBAQUBAQECAQYEF?=
 =?us-ascii?q?AEBAQEBAQEBaIVQDYZEAQEBAwEyAUYFCwsYLjwbBoMEAYJmIQ+oEniBNIEBg?=
 =?us-ascii?q?1xBhA6BPgYUD4EXAY1fJxyBSUKENz6CYAECAYdWBIFlghoCgUySRI03nD6DG?=
 =?us-ascii?q?oEom3Y3EKUSLbhiAgQGBQIWgVQ4gVszGggbFYMkUBkOjjiIa4VpIQMvAjYCB?=
 =?us-ascii?q?goBAQMJjQ8BAQ?=
IronPort-HdrOrdr: A9a23:yK4s+KrHpEuia7oOGiAk4nMaV5tRL9V00zAX/kB9WHVpW+aT/v
 rAoN0w0xjohDENHFwhg8mHIqmcQXXanKQFhLU5F7GkQQXgpS+UN4lk94Tv2HnNHCf5++5b28
 5bAsxDIff3CkV3itu/3RmgH78bsbu62Y2hmOu29R1QZC5wbaUI1WpEIyadVnZ7XQxXQac+fa
 DsgfZvgxqFVTApYt+gBn8DNtKzxOHjsJ79exYJC1oGxWC17A+A07LxHxiG0hp2aVomqosKym
 TLnxf04a+uqZiAqiP07XPZ7JhdhbLapOdrOcrksKQoAwSpohq0YsBbV6eaujcurKWU9E8yi9
 XXuX4bTqJOwkKUWH2pqh3w3ASl9zAi5xbZuCelqEqmh9DlTzQnDMcEv6ZlS1/y7kotu8wU6t
 Mz416k
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,270,1613433600"; d="scan'208";a="686368801"
Received: from alln-core-9.cisco.com ([173.36.13.129])
 by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 03 May 2021 18:01:44 +0000
Received: from zorba ([10.24.21.191])
 by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 143I1fkQ017898
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 May 2021 18:01:43 GMT
Date: Mon, 3 May 2021 11:01:41 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] lib: early_string: allow early usage of some string
 functions
Message-ID: <20210503180141.GO3844417@zorba>
References: <20210430042217.1198052-1-danielwa@cisco.com>
 <dc26a67e-dba0-1b8c-3718-3c75415c61f1@csgroup.eu>
 <1929b3a8-f882-c930-4b99-10c6a8f127c7@csgroup.eu>
 <e355ecc9-574a-dbcb-7864-5aa4974e1971@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e355ecc9-574a-dbcb-7864-5aa4974e1971@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.21.191, [10.24.21.191]
X-Outbound-Node: alln-core-9.cisco.com
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
Cc: Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 01, 2021 at 09:31:47AM +0200, Christophe Leroy wrote:
> 
> > In fact, should be like in prom_init today:
> > 
> > #ifdef __EARLY_STRING_ENABLED
> >      if (dsize >= count)
> >          return count;
> > #else
> >      BUG_ON(dsize >= count);
> > #endif
> 
> Thinking about it once more, this BUG_ON() is overkill and should be
> avoided, see https://www.kernel.org/doc/html/latest/process/deprecated.html
> 
> Therefore, something like the following would make it:
> 
> 	if (dsize >= count) {
> 		WARN_ON(!__is_defined(__EARLY_STRING_ENABLED));
> 
> 		return count;
> 	}

I agree, it's overkill it stop the system for this condition.

how about I do something more like this for my changes,


> 	if (WARN_ON(dsize >= count && !__is_defined(__EARLY_STRING_ENABLED)))
> 		return count;

and for generic kernel,

> 	if (WARN_ON(dsize >= count))
> 		return count;



Daniel

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FDE34EF74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 19:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xGr689bz3bxJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 04:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=II5NU/e0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.77; helo=rcdn-iport-6.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=II5NU/e0; dkim-atps=neutral
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xGN4bYxz3bcq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:27:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1640; q=dns/txt; s=iport;
 t=1617125245; x=1618334845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DLlq6Eg2HUUvE9Fdg0Ebob6Tw5pX5R4uRXQoNV4sDwc=;
 b=II5NU/e0omr/fcsPCXcBYrO3Foi1Ywy5VY9dCEAGHfqavRMhFuXE2rkh
 mWTvCx+ny3zuihpnczcoN8hmD24SfD9GDXSupCirwN45nRVxVP+Q+XKn7
 QDB0uJkyOfw6MBfmWbZ+TiZzis+VO1r8FOHMh8/P59dU/VYByduXcYzA4 g=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AoTmckqE8NgKcaaN3pLqEVceALOonbusQ8z?=
 =?us-ascii?q?AX/mp6ICY7TuWzkceykPMHkTL1ki8WQnE8mdaGUZPwJE/035hz/IUXIPOeTB?=
 =?us-ascii?q?Dr0VHYTr1KwIP+z1TbcRHW2fVa0c5bHpRWKNq1NlRiiNa/3Q/QKadF/PCi0I?=
 =?us-ascii?q?SFwdjT1G1sSwYCUdAC0y5cBhyAGkN7AClqbKBZKLOm6sBKpyWtdB0sB6zROl?=
 =?us-ascii?q?A/U+fOvNHNnp79CCRnOzcc9AKMgTm0gYSVLzGk2H4lPw9n8PMF7XXPlRD/6+?=
 =?us-ascii?q?GFtfy2oyWssVP73tBxhMbrzMdFCYi3rvUtbh/oigquee1aKtq/gAw=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BhAABKXmNg/4UNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTwHAQELAYIqgUwBOTGMZYkukAgWikWBfAsBAQENAQE0BAE?=
 =?us-ascii?q?BhFACgXoCJTQJDgIDAQEMAQEFAQEBAgEGBHGFboZFAQU6PxALGC48GwYThXi?=
 =?us-ascii?q?rInWBNIkLgUQigRcBjUkmHIFJQoESgm4uPoo2BIJHgQ6CMCyeTZwigxGBI5s?=
 =?us-ascii?q?2MRCkQrgSAgQGBQIWgVQ6gVkzGggbFYMkUBkNnQchAy84AgYKAQEDCYkfAQE?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="880406225"
Received: from alln-core-11.cisco.com ([173.36.13.133])
 by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:27:19 +0000
Received: from zorba ([10.24.8.123])
 by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHREPN013894
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 17:27:16 GMT
Date: Tue, 30 Mar 2021 10:27:14 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
Message-ID: <20210330172714.GR109100@zorba>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: alln-core-11.cisco.com
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, will@kernel.org, linux-xtensa@linux-xtensa.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 01:44:48PM +0000, Christophe Leroy wrote:
> This code provides architectures with a way to build command line
> based on what is built in the kernel and what is handed over by the
> bootloader, based on selected compile-time options.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3:
> - Addressed comments from Will
> - Added capability to have src == dst
> ---
>  include/linux/cmdline.h | 57 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 include/linux/cmdline.h
> 
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..dea87edd41be
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_CMDLINE_H
> +#define _LINUX_CMDLINE_H
> +
> +#include <linux/string.h>
> +
> +/* Allow architectures to override strlcat, powerpc can't use strings so early */
> +#ifndef cmdline_strlcat
> +#define cmdline_strlcat strlcat
> +#endif
> +
> +/*
> + * This function will append or prepend a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dst: The destination of the final appended/prepended string.
> + * @src: The starting string or NULL if there isn't one.
> + * @len: the length of dest buffer.
> + */

Append or prepend ? Cisco requires both at the same time. This is why my
implementation provides both. I can't use this with both at once.

Daniel

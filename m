Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC70F18DD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 18:16:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450JNs6VglzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 02:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450JMG14XrzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 02:14:34 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54AE3307D910;
 Thu,  9 May 2019 16:14:30 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.159])
 by smtp.corp.redhat.com (Postfix) with SMTP id 6B4A060BF3;
 Thu,  9 May 2019 16:14:22 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu,  9 May 2019 18:14:29 +0200 (CEST)
Date: Thu, 9 May 2019 18:14:20 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: "Dmitry V. Levin" <ldv@altlinux.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH linux-next v10 0/7] ptrace: add PTRACE_GET_SYSCALL_INFO
 request
Message-ID: <20190509161420.GD24526@redhat.com>
References: <20190415234307.GA9364@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415234307.GA9364@altlinux.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 09 May 2019 16:14:32 +0000 (UTC)
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
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Helge Deller <deller@gmx.de>, Eugene Syromyatnikov <esyr@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>, James Hogan <jhogan@kernel.org>,
 strace-devel@lists.strace.io, Kees Cook <keescook@chromium.org>,
 Greentime Hu <greentime@andestech.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Richard Kuo <rkuo@codeaurora.org>,
 Paul Burton <paul.burton@mips.com>, linux-hexagon@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/16, Dmitry V. Levin wrote:
>
> [Andrew, could you take this patchset into your tree, please?]

Just in case...

I have already acked 6/7.

Other patches look good to me too, just I don't think I can actually review
these non-x86 changes.

Oleg.


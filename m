Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ADA1E5B99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 11:16:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XhrZ0xY3zDqXV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 19:15:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XhpH1kjczDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 19:13:57 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C186EAA7C;
 Thu, 28 May 2020 09:13:52 +0000 (UTC)
Date: Thu, 28 May 2020 11:13:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/bpf: Enable bpf_probe_read{, str}() on powerpc
 again
Message-ID: <20200528091351.GE3529@linux-b0ei>
References: <20200527122844.19524-1-pmladek@suse.com>
 <87ftbkkh00.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftbkkh00.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Brendan Gregg <brendan.d.gregg@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2020-05-28 11:03:43, Michael Ellerman wrote:
> Petr Mladek <pmladek@suse.com> writes:
> > The commit 0ebeea8ca8a4d1d453a ("bpf: Restrict bpf_probe_read{, str}() only
> > to archs where they work") caused that bpf_probe_read{, str}() functions
> > were not longer available on architectures where the same logical address
> > might have different content in kernel and user memory mapping. These
> > architectures should use probe_read_{user,kernel}_str helpers.
> >
> > For backward compatibility, the problematic functions are still available
> > on architectures where the user and kernel address spaces are not
> > overlapping. This is defined CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE.
> >
> > At the moment, these backward compatible functions are enabled only
> > on x86_64, arm, and arm64. Let's do it also on powerpc that has
> > the non overlapping address space as well.
> >
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> 
> This seems like it should have a Fixes: tag and go into v5.7?

Good point:

Fixes: commit 0ebeea8ca8a4d1d4 ("bpf: Restrict bpf_probe_read{, str}() only to archs where they work")

And yes, it should ideally go into v5.7 either directly or via stable.

Should I resend the patch with Fixes and
Cc: stable@vger.kernel.org #v45.7 lines, please?

Best Regards,
Petr

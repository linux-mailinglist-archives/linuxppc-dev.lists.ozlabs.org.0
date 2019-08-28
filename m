Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A18ACA055C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 16:52:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JTHc3v1TzDqkm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 00:52:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JT273Wm1zDrC9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 00:41:03 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D959CADFE;
 Wed, 28 Aug 2019 14:40:59 +0000 (UTC)
Date: Wed, 28 Aug 2019 16:40:58 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] Disable compat cruft on ppc64le v2
Message-ID: <20190828164058.76a395b8@naga>
In-Reply-To: <1566988993.aiyajovdx0.astroid@bobo.none>
References: <cover.1566987936.git.msuchanek@suse.de>
 <1566988993.aiyajovdx0.astroid@bobo.none>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Michael Neuling <mikey@neuling.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Aug 2019 20:57:48 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> Michal Suchanek's on August 28, 2019 8:30 pm:
> > With endian switch disabled by default the ppc64le compat supports
> > ppc32le only which is something next to nobody has binaries for.
> > 
> > Less code means less bugs so drop the compat stuff.  
> 
> Interesting patches, thanks for looking into it. I don't know much
> about compat and wrong endian userspaces. I think sys_switch_endian
> is enabled though, it's just a strange fast endian swap thing that
> has been disabled by default.
> 
> The first patches look pretty good. Maybe for the last one it could
> become a selectable option?

That sounds good.

> 
> 
> > I am not particularly sure about the best way to resolve the llseek
> > situation. I don't see anything in the syscal tables making it
> > 32bit-only so I suppose it should be available on 64bit as well.  
> 
> It's for 32-bit userspace only. Can we just get rid of it, or is
> there some old broken 64-bit BE userspace that tries to call it?

That sounds like a bug in creating these unified syscall tables then.
On architectures that have split tables the 64bit ones do not have
llseek. On architectures with one table the syscall is marked as common.

Thanks

Michal

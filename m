Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78A37280D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 11:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZDs41vmCz2yy4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 19:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZDrl0Kqgz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 19:22:30 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CA8CAC1A;
 Tue,  4 May 2021 09:22:27 +0000 (UTC)
Date: Tue, 4 May 2021 11:22:25 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210504092225.GS6564@kitsune.suse.cz>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 10:38:32AM +0200, Miguel Ojeda wrote:
> On Tue, May 4, 2021 at 9:57 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >
> > Some of us are a bit stuck as either customer refuses to upgrade
> > their build infrastructure or has paid for some old but safety
> > blessed version of gcc. These often lag years behind the recent
> > gcc releases :(
> 
> In those scenarios, why do you need to build mainline? Aren't your
> customers using longterm or frozen kernels? If they are paying for
> certified GCC images, aren't they already paying for supported kernel
> images from some vendor too?
> 
> I understand where you are coming from -- I have also dealt with
> projects/machines running ancient, unsupported software/toolchains for
> various reasons; but nobody expected upstream (and in particular the
> mainline kernel source) to support them. In the cases I experienced,
> those use cases require not touching anything at all, and when the
> time came of doing so, everything would be updated at once,
> re-certified/validated as needed and frozen again.

Except it makes answering the question "Is this bug we see on this
ancient system still present in upstream?" needlessly more difficult to
answer.

Sure, throwing out old compiler versions that are known to cause
problems makes sense. Updating to latest just because much less so.

One of the selling point of C in general and gcc in particular is
stability. If we need the latest compiler we can as well rewrite the
kernel in Rust which has a required update cycle of a few months.

Because some mainline kernel features rely on bleeding edge tools I end
up building mainline with current tools anyway but if you do not need
BTF or whatever other latest gimmick older toolchains should do.

Thanks

Michal

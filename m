Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3320FA156D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 12:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JyxK18RLzDrRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 20:08:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JyvT6KHRzDrP9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 20:07:01 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90B1DABD0;
 Thu, 29 Aug 2019 10:06:58 +0000 (UTC)
Date: Thu, 29 Aug 2019 12:06:57 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/4] fs: always build llseek.
Message-ID: <20190829120657.400ee915@naga>
In-Reply-To: <20190829062200.GA3047@infradead.org>
References: <cover.1566936688.git.msuchanek@suse.de>
 <80b1955b86fb81e4642881d498068b5a540ef029.1566936688.git.msuchanek@suse.de>
 <20190828151552.GA16855@infradead.org>
 <20190828181540.21fa33a4@naga>
 <20190829062200.GA3047@infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Michael Neuling <mikey@neuling.org>, David Hildenbrand <david@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Aug 2019 23:22:00 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Aug 28, 2019 at 06:15:40PM +0200, Michal Such=C3=A1nek wrote:
> > On Wed, 28 Aug 2019 08:15:52 -0700
> > Christoph Hellwig <hch@infradead.org> wrote:
> >  =20
> > > On Tue, Aug 27, 2019 at 10:21:06PM +0200, Michal Suchanek wrote: =20
> > > > 64bit !COMPAT does not build because the llseek syscall is in the t=
ables.   =20
> > >=20
> > > Well, this will bloat thinkgs like 64-bit RISC-V for no good reason.
> > > Please introduce a WANT_LSEEK like symbol that ppc64 can select inste=
ad. =20
> >=20
> > It also builds when llseek is marked as 32bit only in syscall.tbl
> >=20
> > It seems it was handled specially in some way before syscall.tbl was
> > added, though (removed in ab66dcc76d6ab8fae9d69d149ae38c42605e7fc5) =20
>=20
> Independ of if you need it on a purely 64-bit build on powerpc (which
> I'll let the experts figure out) it is not needed on a purely 64-bit
> build on other platforms.  So please make sure it is still built
> conditional, just possibly with an opt-in for powerpc.

AFAICT it is needed for all 64bit platforms with unified syscall.tbl.

I modified the syscall.tbl for powerpc to not need the syscall with
64bit only build but other platforms are still broken. There are a few
platforms that use multiple tables and on those the 64bit one indeed
does not contain llseek.

Thanks

Michal

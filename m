Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADF111BAF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:03:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y4Yc0yrVzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:03:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aurel32.net (client-ip=2001:bc8:30d7:100::1;
 helo=hall.aurel32.net; envelope-from=aurelien@aurel32.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aurel32.net
Received: from hall.aurel32.net (hall.aurel32.net [IPv6:2001:bc8:30d7:100::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y1r06CZrzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:01:02 +1100 (AEDT)
Received: from aurel32 by hall.aurel32.net with local (Exim 4.92)
 (envelope-from <aurelien@aurel32.net>)
 id 1if4Pk-0008An-F6; Wed, 11 Dec 2019 17:00:36 +0100
Date: Wed, 11 Dec 2019 17:00:36 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Justin Forbes <jmforbes@linuxtx.org>
Subject: Re: [PATCH] libbpf: fix readelf output parsing on powerpc with
 recent binutils
Message-ID: <20191211160036.GV2974@aurel32.net>
Mail-Followup-To: Justin Forbes <jmforbes@linuxtx.org>,
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:BPF (Safe dynamic programs and tools)" <netdev@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>,
 "open list:BPF (Safe dynamic programs and tools)" <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
 debian-kernel@lists.debian.org
References: <20191201195728.4161537-1-aurelien@aurel32.net>
 <87zhgbe0ix.fsf@mpe.ellerman.id.au>
 <20191202093752.GA1535@localhost.localdomain>
 <CAFxkdAqg6RaGbRrNN3e_nHfHFR-xxzZgjhi5AnppTxxwdg0VyQ@mail.gmail.com>
 <20191210222553.GA4580@calabresa>
 <CAFxkdAp6Up0qSyp0sH0O1yD+5W3LvY-+-iniBrorcz2pMV+y-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFxkdAp6Up0qSyp0sH0O1yD+5W3LvY-+-iniBrorcz2pMV+y-g@mail.gmail.com>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 "open list:BPF \(Safe dynamic programs and tools\)" <netdev@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 debian-kernel@lists.debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-12-11 09:33, Justin Forbes wrote:
> On Tue, Dec 10, 2019 at 4:26 PM Thadeu Lima de Souza Cascardo
> <cascardo@canonical.com> wrote:
> >
> > On Tue, Dec 10, 2019 at 12:58:33PM -0600, Justin Forbes wrote:
> > > On Mon, Dec 2, 2019 at 3:37 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > >
> > > > On Mon, Dec 02, 2019 at 04:53:26PM +1100, Michael Ellerman wrote:
> > > > > Aurelien Jarno <aurelien@aurel32.net> writes:
> > > > > > On powerpc with recent versions of binutils, readelf outputs an extra
> > > > > > field when dumping the symbols of an object file. For example:
> > > > > >
> > > > > >     35: 0000000000000838    96 FUNC    LOCAL  DEFAULT [<localentry>: 8]     1 btf_is_struct
> > > > > >
> > > > > > The extra "[<localentry>: 8]" prevents the GLOBAL_SYM_COUNT variable to
> > > > > > be computed correctly and causes the checkabi target to fail.
> > > > > >
> > > > > > Fix that by looking for the symbol name in the last field instead of the
> > > > > > 8th one. This way it should also cope with future extra fields.
> > > > > >
> > > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > > > ---
> > > > > >  tools/lib/bpf/Makefile | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > Thanks for fixing that, it's been on my very long list of test failures
> > > > > for a while.
> > > > >
> > > > > Tested-by: Michael Ellerman <mpe@ellerman.id.au>
> > > >
> > > > Looks good & also continues to work on x86. Applied, thanks!
> > >
> > > This actually seems to break horribly on PPC64le with binutils 2.33.1
> > > resulting in:
> > > Warning: Num of global symbols in sharedobjs/libbpf-in.o (32) does NOT
> > > match with num of versioned symbols in libbpf.so (184). Please make
> > > sure all LIBBPF_API symbols are versioned in libbpf.map.
> > >
> > > This is the only arch that fails, with x86/arm/aarch64/s390 all
> > > building fine.  Reverting this patch allows successful build across
> > > all arches.
> > >
> > > Justin
> >
> > Well, I ended up debugging this same issue and had the same fix as Jarno's when
> > I noticed his fix was already applied.
> >
> > I just installed a system with the latest binutils, 2.33.1, and it still breaks
> > without such fix. Can you tell what is the output of the following command on
> > your system?
> >
> > readelf -s --wide tools/lib/bpf/sharedobjs/libbpf-in.o | cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $0}'
> >
> 
> readelf -s --wide tools/lib/bpf/sharedobjs/libbpf-in.o | cut -d "@"
> -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | awk '/GLOBAL/ && /DEFAULT/ &&
> !/UND/ {print $0}'
>    373: 00000000000141bc  1376 FUNC    GLOBAL DEFAULT    1 libbpf_num_possible_cpus [<localentry>: 8]
>    375: 000000000001869c   176 FUNC    GLOBAL DEFAULT    1 btf__free [<localentry>: 8]

It seems that in your case the localentry part is added after the symbol
name. That doesn't match what is done in upstream binutils:

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=binutils/readelf.c;hb=refs/heads/master#l11485

Which version of binutils are you using? It looks like your version has
been modified to workaround this exact issue.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

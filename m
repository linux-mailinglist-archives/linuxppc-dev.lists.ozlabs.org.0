Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C110E801
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 10:55:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RL7v3G4MzDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 20:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iogearbox.net
X-Greylist: delayed 924 seconds by postgrey-1.36 at bilbo;
 Mon, 02 Dec 2019 20:53:31 AEDT
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RL634pjBzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 20:53:31 +1100 (AEDT)
Received: from [194.230.159.159] (helo=localhost)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1ibi9Q-0004d3-Nt; Mon, 02 Dec 2019 10:37:52 +0100
Date: Mon, 2 Dec 2019 10:37:52 +0100
From: Daniel Borkmann <daniel@iogearbox.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] libbpf: fix readelf output parsing on powerpc with
 recent binutils
Message-ID: <20191202093752.GA1535@localhost.localdomain>
References: <20191201195728.4161537-1-aurelien@aurel32.net>
 <87zhgbe0ix.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhgbe0ix.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25650/Sun Dec  1 11:04:04 2019)
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 "open list:BPF \(Safe dynamic programs and tools\)" <netdev@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>,
 "open list:BPF \(Safe dynamic programs and tools\)" <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
 Aurelien Jarno <aurelien@aurel32.net>, debian-kernel@lists.debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 02, 2019 at 04:53:26PM +1100, Michael Ellerman wrote:
> Aurelien Jarno <aurelien@aurel32.net> writes:
> > On powerpc with recent versions of binutils, readelf outputs an extra
> > field when dumping the symbols of an object file. For example:
> >
> >     35: 0000000000000838    96 FUNC    LOCAL  DEFAULT [<localentry>: 8]     1 btf_is_struct
> >
> > The extra "[<localentry>: 8]" prevents the GLOBAL_SYM_COUNT variable to
> > be computed correctly and causes the checkabi target to fail.
> >
> > Fix that by looking for the symbol name in the last field instead of the
> > 8th one. This way it should also cope with future extra fields.
> >
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  tools/lib/bpf/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Thanks for fixing that, it's been on my very long list of test failures
> for a while.
> 
> Tested-by: Michael Ellerman <mpe@ellerman.id.au>

Looks good & also continues to work on x86. Applied, thanks!

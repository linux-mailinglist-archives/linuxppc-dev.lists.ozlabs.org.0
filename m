Return-Path: <linuxppc-dev+bounces-11605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E547B3F680
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 09:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGHH34yRWz30NP;
	Tue,  2 Sep 2025 17:21:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756797695;
	cv=none; b=lscEuRIS2nJlhlqu8bjCrMciOQq3vRgs5Chs47XILu4NDqYSBIOlxrpgM6gf1ve8zycS/I9LSrMmveuYrFFM2YsnrTZftcU3E1QZEhmbVIAiY38hYgt7w99bJlxHY5cdq3s9j8tuAOBmNeaNnbSn2e7789orS8GxYmuLP9Bqrf/jLFKlJOx+ljJxBfNol1hL88Dn9i4m/zgbGHsG1zME9h8gzW6Ydh4OrOYOLihGPUF2uBPFvpWqsS5fouOaclxLikjYJ+P/mtcNQUHDJtChSfcjLgGpG3cTlhxIsxbjgnegWaM2RhPxXVHgQkMNtl8GjFg8tAMI0USEVVZ3Eu7/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756797695; c=relaxed/relaxed;
	bh=75QsosR73EP7Bhx5dXwnnBiSrQlTSAdKIHehZonw/2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oOYs/zS0AX9aPxzxApU/R2e1Iq9s77RW1apR7NBzuRf5YqaLAPFgQM5HRn8kSINjGC3NUsDcnB6Tw6RIoY3r7beJXimxxi+OPdbpzhNVcaALHczl8hnwQtEJ0ICrJHQPkFm1cDQFHw0Y5ukOc/3W5QrWDmAoC5cNoXvtu3R+r044MuncJfxMCBdsO2cKL1/BP8WkuK09ncDg4sm8H7/dR7WvQQiZDD0hStjrgpl/NacMzeBLaqxGFiHfJXvBm5sNdc85G5J9ZwsZx+XOWaj81lB2qyER/ECU++A75g3gE5WrnHAFVm7ToieLveJW9N9gEKcXzBTaP1b7CJomZ6QiIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=GfvnxzXC; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=GfvnxzXC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Tue, 02 Sep 2025 17:21:32 AEST
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGHH05S3Sz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 17:21:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=75QsosR73EP7Bhx5dXwnnBiSrQlTSAdKIHehZonw/2s=; t=1756797692;
	x=1757402492; b=GfvnxzXCbya9/zVY6LJxmAexDUCm70xfqm6F2aZyIRHOrVRLAJ/p/N4OVLwIQ
	LAnQsNc4pDRvLKRjpBVb+34T3VZiOLFUYUOS0GIctIR9T7XA7YNTlRxbU8h3lU83XSmxLpKDNTF4B
	sndVsi2oTnqZhbEMdMKVUw+3oeIDA+BAtzvajArP3tAHHUYxS6tEPHqWUwMZPG5dM2Ka2huqLFEQv
	FuTUW6cZGv1pYiCLMUyi2hh9WzwnpQ8aEVjh/i/nEzDzdblPfSf6ejEUKRTDRsjwRBbI95ZZ7mkJ4
	MVnqehw2oz7B8qzv1BG59BhMkBDlAbJNsoKue9bGxGerwQ3qGA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1utLEY-00000000Jm5-12co; Tue, 02 Sep 2025 09:15:14 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1utLEX-00000002jxi-2pMt; Tue, 02 Sep 2025 09:15:13 +0200
Message-ID: <11a4d0a953e3a9405177d67f287c69379a2b2f8f.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Larsson <andreas@gaisler.com>,
 schuster.simon@siemens-energy.com,  Dinh Nguyen <dinguyen@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
 <david@redhat.com>, Lorenzo Stoakes	 <lorenzo.stoakes@oracle.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka	 <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan	 <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Ingo Molnar	 <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli	 <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,  Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>,  Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, Kees Cook <kees@kernel.org>,  Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti	 <alex@ghiti.fr>, Guo
 Ren <guoren@kernel.org>, Oleg Nesterov <oleg@redhat.com>,  Jens Axboe
 <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara
 <jack@suse.cz>, Tejun Heo <tj@kernel.org>, Johannes Weiner
 <hannes@cmpxchg.org>, Michal =?ISO-8859-1?Q?Koutn=FD?=	 <mkoutny@suse.com>,
 Paul Moore <paul@paul-moore.com>, Serge Hallyn	 <sergeh@kernel.org>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn"	 <serge@hallyn.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Masami
 Hiramatsu	 <mhiramat@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni	 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Mathieu
 Desnoyers	 <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>,  Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin	
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers	 <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, John
 Johansen	 <john.johansen@canonical.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>,  Ondrej Mosnacek <omosnace@redhat.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa	
 <penguin-kernel@I-love.SAKURA.ne.jp>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta	 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian
 Cain	 <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui	
 <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 Simek	 <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonas Bonn	 <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>,  Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller	 <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger	
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Richard
 Weinberger	 <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>,  Chris Zankel <chris@zankel.net>, Max Filippov
 <jcmvbkbc@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com, 
	selinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Date: Tue, 02 Sep 2025 09:15:08 +0200
In-Reply-To: <f2371539-cd4e-4d70-9576-4bb1c677104c@gaisler.com>
References: 
	<20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
	 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
	 <f2371539-cd4e-4d70-9576-4bb1c677104c@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andreas,

On Tue, 2025-09-02 at 09:02 +0200, Andreas Larsson wrote:
> On 2025-09-01 15:09, Simon Schuster via B4 Relay wrote:
> > From: Simon Schuster <schuster.simon@siemens-energy.com>
> >=20
> > With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> > clone3") the effective bit width of clone_flags on all architectures wa=
s
> > increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> > However, for most consumers of clone_flags the interface was not
> > changed from the previous type of unsigned long.
> >=20
> > While this works fine as long as none of the new 64-bit flag bits
> > (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is stil=
l
> > undesirable in terms of the principle of least surprise.
> >=20
> > Thus, this commit fixes all relevant interfaces of the copy_thread
> > function that is called from copy_process to consistently pass
> > clone_flags as u64, so that no truncation to 32-bit integers occurs on
> > 32-bit architectures.
> >=20
> > Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> > ---
>=20
> Thanks for this and for the whole series! Needed foundation for a
> sparc32 clone3 implementation as well.

Can you implement clone3 for sparc64 as well?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


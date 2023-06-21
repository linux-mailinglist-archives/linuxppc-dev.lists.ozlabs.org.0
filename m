Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F525738EFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:41:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uei1MveJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXQt06dwz3c6v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uei1MveJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 21 Jun 2023 21:19:32 AEST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmLch3sltz30gj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 21:19:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687346371; x=1718882371;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bNOOeYVCQ7poh+/POpUoy8h5Fc7oKKTV5NlBm31y8T8=;
  b=Uei1MveJMp2Vc4hvl3dMT9qrG90Odr4K+g0mrXZu3dL8AXgC+wmUTqIr
   LGyS6KjpPhpq+g7joMOihT1PUYG7DzlNXfOA5rhLjExMwtme9vzHx7wNP
   WgSYVuVsaErT/nF/O8gxKANXs4wyONn64QJygHrgFw8+kwAQU2my7CE/9
   J+vVN6UGOB2t+67YCJfynsQ/mjAXD2O+eu+qm8+ayJfTJQnsugCQK2WmU
   ANZnRW3jvNBo0z8BVeUPSeS2istw+RMOKWMwf2hzrIu6L/Xb7c2pYMVwt
   YLMNCocZA0dLZO2vXq5RxVtVwKmtwINcn9hTeLaRckqIhacvs2d7NH/Fw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339757998"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339757998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 04:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="664623042"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="664623042"
Received: from unknown (HELO localhost) ([10.237.66.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 04:16:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joel Granados <j.granados@samsung.com>, mcgrof@kernel.org, Russell King
 <linux@armlinux.org.uk>, Catalin
	Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Russ
	Weight <russell.h.weight@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>,
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Corey
	Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei
	Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Song Liu <song@kernel.org>, Robin Holt
 <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, David Ahern
 <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Doug Gilbert <dgilbert@interlog.com>, Jiri
	Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Benjamin
	LaHaise <bcrl@kvack.org>, David Howells <dhowells@redhat.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
	Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Jan Kara
 <jack@suse.cz>, Anton Altaparmakov <anton@tuxera.com>, Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Kees Cook <keescook@chromium.org>, Iurii
	Zaikin <yzaikin@google.com>, Eric Biggers <ebiggers@kernel.org>, "Darrick
 J.
 Wong" <djwong@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
	Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Balbir
	Singh <bsingharora@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 John
	Stultz <jstultz@google.com>, Steven Rostedt <rostedt@goodmis.org>, Andrew
	Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, Naoya Horiguchi
 <naoya.horiguchi@nec.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle
 <ralf@linux-mips.org>, Pablo
	Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>, Nikolay
	Aleksandrov <razor@blackwall.org>, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Steffen Klassert
 <steffen.klassert@secunet.com>, Matthieu Baerts
 <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>,
 Simon
	Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>, Remi
	Denis-Courmont <courmisch@gmail.com>, Santosh Shilimkar
 <santosh.shilimkar@oracle.com>, Marc Dionne <marc.dionne@auristor.com>,
 Neil
	Horman <nhorman@tuxdriver.com>, Marcelo Ricardo Leitner
 <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Karsten
 Graul <kgraul@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>, Jan
 Karcher <jaka@linux.ibm.com>, Jon Maloy <jmaloy@redhat.com>, Ying Xue
 <ying.xue@windriver.com>, Martin Schiller <ms@dev.tdt.de>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
	Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jarkko
	Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH 09/11] sysctl: Remove the end element in sysctl table
 arrays
In-Reply-To: <20230621094817.433842-1-j.granados@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3@eucas1p2.samsung.com>
 <20230621094817.433842-1-j.granados@samsung.com>
Date: Wed, 21 Jun 2023 14:16:55 +0300
Message-ID: <87o7l92hg8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Cc: Joel Granados <j.granados@samsung.com>, Miaohe Lin <linmiaohe@huawei.com>, linux-hyperv@vger.kernel.org, linux-ia64@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-aio@kvack.org, Amir Goldstein <amir73il@gmail.com>, mptcp@lists.linux.dev, KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>, linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org, Stanislav Fomichev <sdf@google.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-afs@lists.infradead.org, linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org, bridge@lists.linux-foundation.org, John Fastabend <john.fastabend@gmail.com>, linux-ntfs-dev@lists.sourceforge.net, codalist@coda.cs.cmu.edu, lvs-devel@vger.kernel.org, Matthew Bobrowski <repnop@google.com>, linux-cachefs@redhat.com, Mel Gorman <mgorman@suse.de>, tipc-discussion@lists.sourceforge.net, Yonghong Song <yhs@fb.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, intel-gfx@lists.freedesktop.org, linux-crypto@vger.kernel.org, linux-wpan@vger.kernel.org, coreteam@netfilter.org, John Ogness <john.ogness@linutronix.de>, Mike Travis <mike.travis@hpe.com>, Boqun Feng <boqun.feng@gmail.com>, apparmor@lists.ubuntu.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, rds-devel@oss.oracle.com, linux-raid@vger.kernel.org, Waiman Long <longman@redhat.com>, linux-hams@vger.kernel.org, openipmi-developer@lists.sourceforge.net, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, fsverity@lists.linux.dev, Hao Luo <haoluo@google.com>, linux-nfs@vger.kernel.org, Will Drewry <wad@chromium.org>, linux-x25@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, linux-xfs@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>
 , netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Jun 2023, Joel Granados <j.granados@samsung.com> wrote:
> Remove the empty end element from all the arrays that are passed to the
> register sysctl calls. In some files this means reducing the explicit
> array size by one. Also make sure that we are using the size in
> ctl_table_header instead of evaluating the .procname element.

Where's the harm in removing the end elements driver by driver? This is
an unwieldy patch to handle.

> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index f43950219ffc..e4d7372afb10 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4884,24 +4884,23 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>  
>  static struct ctl_table oa_table[] = {
>  	{
> -	 .procname = "perf_stream_paranoid",
> -	 .data = &i915_perf_stream_paranoid,
> -	 .maxlen = sizeof(i915_perf_stream_paranoid),
> -	 .mode = 0644,
> -	 .proc_handler = proc_dointvec_minmax,
> -	 .extra1 = SYSCTL_ZERO,
> -	 .extra2 = SYSCTL_ONE,
> -	 },
> +		.procname = "perf_stream_paranoid",
> +		.data = &i915_perf_stream_paranoid,
> +		.maxlen = sizeof(i915_perf_stream_paranoid),
> +		.mode = 0644,
> +		.proc_handler = proc_dointvec_minmax,
> +		.extra1 = SYSCTL_ZERO,
> +		.extra2 = SYSCTL_ONE,
> +	},
>  	{
> -	 .procname = "oa_max_sample_rate",
> -	 .data = &i915_oa_max_sample_rate,
> -	 .maxlen = sizeof(i915_oa_max_sample_rate),
> -	 .mode = 0644,
> -	 .proc_handler = proc_dointvec_minmax,
> -	 .extra1 = SYSCTL_ZERO,
> -	 .extra2 = &oa_sample_rate_hard_limit,
> -	 },
> -	{}
> +		.procname = "oa_max_sample_rate",
> +		.data = &i915_oa_max_sample_rate,
> +		.maxlen = sizeof(i915_oa_max_sample_rate),
> +		.mode = 0644,
> +		.proc_handler = proc_dointvec_minmax,
> +		.extra1 = SYSCTL_ZERO,
> +		.extra2 = &oa_sample_rate_hard_limit,
> +	}
>  };

The existing indentation is off, but fixing it doesn't really belong in
this patch.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
